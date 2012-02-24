Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0qLa-0002dF-Pd
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 09:17:46 +0100
Received: by pbbrp12 with SMTP id rp12so390115pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.132.170 as permitted sender) client-ip=10.68.132.170; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.132.170 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.132.170])
	by 10.68.132.170 with SMTP id ov10mr4479947pbb.53.1330070963862
	(num_hops = 1); Fri, 24 Feb 2012 00:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ltOTatD+9VLk1ALlssLXVy2MZSk2gzF7lnK4g1k/e0Y=;
	b=xeMWjn3hmv4xQKghs6DUt665FhCg6icZf4QaoPeejVDD5VTnqHkANFE59NU4W8BaZM
	HWs2GNFM6u2hMxHmM0JCSyqoSGCwLckxEiFF6+P20f6UGPrg3j7OX3jUX9CUlmRbzji0
	wfmIQ2GFJWOW5DgCZRZSOyVpDJnA71B+P4REU=
Received: by 10.68.132.170 with SMTP id ov10mr3703377pbb.53.1330070963827;
	Fri, 24 Feb 2012 00:09:23 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id y3sm3732980pbr.46.2012.02.24.00.09.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 00:09:22 -0800 (PST)
Date: Fri, 24 Feb 2012 00:10:06 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224081006.GA2519@sakrah.homelinux.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329910007-8441-2-git-send-email-obi@opendreambox.org>
	<CFE738D1-7A44-4F57-BB18-818DD5474E01@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <CFE738D1-7A44-4F57-BB18-818DD5474E01@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/5] libsoup-2.4: don't depend on libgnome-keyring unless x11 is defined
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 08:17:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/02/12 13:56), Koen Kooi wrote:
> 
> Op 22 feb. 2012, om 12:26 heeft Andreas Oberritter het volgende geschreven:
> 
> > * Drop dependency on GNOME if x11 is disabled.
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> > meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    4 ++--
> > 1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> > index 8e6ef26..861a1aa 100644
> > --- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> > +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
> > @@ -6,9 +6,9 @@ LICENSE = "LGPLv2"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> > 
> > SECTION = "x11/gnome/libs"
> > -PR = "r1"
> > +PR = "r2"
> > 
> > -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
> > +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 ${@base_contains('DISTRO_FEATURES', 'x11', 'libgnome-keyring', '', d)}"
> 
> that one likely needs a --disable-something to be deterministic.

may be --without-gnome or --disable-gnome-keyring ?


