Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw2Pn-00033x-83
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 03:10:15 +0100
Received: by daln34 with SMTP id n34so2372750dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 18:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=HhhwrRD3TNgdVyY1YUMiiBV+SM+V18w714IbIiAZUM4=;
	b=jjsGNQRbOMXc/5smjBxhYD+ZOJcYgl14+sXyujWM5gqNGDl60NxhsbM3LH2m43qKEI
	NC8zXnmEiutz/FXL56zQjkbrajLNlxKq6vzb0PaK2Ns3Utqh1UQBn7iNNO945uaTovvV
	p+RNv10gJaCEL9RnikPWTSFv0i4PXZ+rJ1Kqo=
Received: by 10.68.222.72 with SMTP id qk8mr21979483pbc.1.1328925726259;
	Fri, 10 Feb 2012 18:02:06 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id x8sm17934125pbr.11.2012.02.10.18.02.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 18:02:04 -0800 (PST)
Date: Fri, 10 Feb 2012 18:02:01 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120211020201.GC2095@sakrah.homelinux.org>
References: <4F34D48B.3040007@ts.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <4F34D48B.3040007@ts.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Problems with recipe for openmotif-2.3.0
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
X-List-Received-Date: Sat, 11 Feb 2012 02:10:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (10/02/12 09:25), Rainer Koenig wrote:
> Hi,
> 
> I'm trying to build a recipe for openmotif-2.3.0, but so far i get
> errors from "do_conigure" like:
> 
> -----------------8<-snip--------------------------------
> ac:6: warning: cannot check for file existence when cross compiling
> ../../lib/autoconf/general.m4:2772: AC_CHECK_FILE is expanded from...
> configure.ac:6: the top level
> configure:14954: error: possibly undefined macro: LT_HAVE_FREETYPE
> -----------------8<-snip--------------------------------



this seems to be an issue with libtool macros how does your do_configure
look like. usually when you have problems with recipes that are not in
repo its good to post them along so folks can see whats going on

> 
> I'm not very familiar with the autotools, but the first line makes me
> think that the setup of openmotif is not suitable for cross-compiling.
> How can I solve those issues?
> 
> Regards
> Rainer
> -- 
> Dipl.-Inf. (FH) Rainer Koenig
> Project Manager Linux Clients
> Dept. PDG WPS R&D SW OSE
> 
> Fujitsu Technology Solutions
> Bürgermeister-Ullrich-Str. 100
> 86199 Augsburg
> Germany
> 
> Telephone: +49-821-804-3321
> Telefax:   +49-821-804-2131
> Mail:      mailto:Rainer.Koenig@ts.fujitsu.com
> 
> Internet         ts.fujtsu.com
> Company Details  ts.fujitsu.com/imprint.html
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


