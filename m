Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 84D9D6B3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 16:05:31 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V4CQV-0004Os-BY; Tue, 30 Jul 2013 18:05:31 +0200
Message-ID: <1375200330.8017.26.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 30 Jul 2013 17:05:30 +0100
In-Reply-To: <51F7DF2C.9030207@windriver.com>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com>
	<1375197551.8017.6.camel@phil-desktop.brightsign>
	<51F7DF2C.9030207@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2013 16:05:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 10:43 -0500, Mark Hatle wrote:
> That only filters out recommendations though.  A good example is some x86 
> packagegroups have a requirement of 'vte'.  It turns out a class of end users 
> don't want 'vte'.  And they have no easy way to remove it.  Telling them to 
> generate a new image, with a custom IMAGE_INSTALL value that includes everything 
> except 'vte' doesn't make sense to them.

I'm not familiar with the particular example that you mentioned, but it
sounds as though the packagegroups in question ought to be recommending
vte rather than depending on it.  I think this is probably true for
packagegroup dependencies in general in fact.

The intended semantics of RDEPENDS are that anything named in that list
is absolutely required for correct operation and can't be removed
without breaking the functionality of the package that's doing the
depending.  Things that are desirable but not absolutely necessary
should be in RRECOMMENDS (and can be suppressed with
BAD_RECOMMENDATIONS), and things which are entirely optional but might
be "nice to have" should be in RSUGGESTS.

p.



