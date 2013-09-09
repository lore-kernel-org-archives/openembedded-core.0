Return-Path: <anders.roxell@linaro.org>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C305615C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:09:00 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id el20so4772363lab.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 03:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=3Eg5nr2VVUeuyw7e9yl02fSAf/nBoD79bJy25kVPdcE=;
	b=i4HzKklM7mWSAu6WzoKealVBVxTtSUz8tYrL9753znJWA9Y2l/Tl45jBYOj7W6Es8F
	Z0iPny9Q+SsCEB9AwCa8kSqJcYtABUxhMBsWg6K+Zx3JEtnOsSEWqvqP8AYVxHwbtEGP
	jlSi8l/XUvdG5V/j4AzbTXHhz6JfXreVz5yvIQO4TPN2leY3+fUYZOjYwxscOZOtt0Iq
	ibcmwL3o2yDc6fg27mY09aXHHcmQ6QLWi5G/MvdAxjq0ST7pztmiBlFWm1dUhIBqNoA5
	DaGI04eoGGtER0dddxTZILqlQ4PCDzxFCA/QG30vhw2dM1Jvybc4Ne8ugCCxOSBlr5qJ
	HhzQ==
X-Gm-Message-State: ALoCoQkT63W/7IWKZUuB2vYZ8Gf4/2vH0mNIja0yjKp6tAItWy5K179liMYGVGdhYndFQmBMzr2S
X-Received: by 10.112.77.134 with SMTP id s6mr686129lbw.38.1378721342021;
	Mon, 09 Sep 2013 03:09:02 -0700 (PDT)
Received: from nexon.se (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id oc1sm5506464lbb.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 03:09:00 -0700 (PDT)
Date: Mon, 9 Sep 2013 12:14:19 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130909101419.GB11886@nexon.se>
References: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
	<1378586028-6613-1-git-send-email-anders.roxell@linaro.org>
	<522B909E.3070609@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <522B909E.3070609@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: linaro-networking@linaro.org, patches@linaro.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: update to new release 20130904
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
X-List-Received-Date: Mon, 09 Sep 2013 10:09:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 2013-09-07 13:46, Saul Wold wrote:
> On 09/07/2013 01:33 PM, Anders Roxell wrote:
> >Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> >---
> >  .../ltp/{ltp_20130503.bb => ltp_20130904.bb}                | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >  rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (93%)
> >
> >diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
> >similarity index 93%
> >rename from meta/recipes-extended/ltp/ltp_20130503.bb
> >rename to meta/recipes-extended/ltp/ltp_20130904.bb
> >index 387826d..4f2b9e7 100644
> >--- a/meta/recipes-extended/ltp/ltp_20130503.bb
> >+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
> >@@ -21,17 +21,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> >
> >  DEPENDS = "attr libaio libcap acl openssl"
> >
> >-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
> >+SRC_URI = "git://github.com/linux-test-project/ltp.git"
> >
> >-SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
> >-SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
> >+SRC_URI[md5sum] = "c8a5f6f397d2c021a0d21ad28992aa7d"
> >+SRC_URI[sha256sum] = "4c13e00c1bed8f1b85daf934cd7b54a08b7b7e31874085ab9277ee563af87139"
> >+
> >+SRCREV = "${PV}"
> 
> Is the PV really a git hash?  That's a branch or tag which will also
> require and extra lookup.  It needs to be a git hash.
Thanks, didn't know.

> 
> Also as noted in the last email the SRC_URI checksums are not needed
> as you are using git now.
My mistake sorry.

Sending a new patch soon.

Anders
> 
> Sau!
> 
> >+S = "${WORKDIR}/git"
> >
> >  export prefix = "/opt/ltp"
> >  export exec_prefix = "/opt/ltp"
> >
> >  inherit autotools
> >
> >-RDEPENDS_${PN} = "perl"
> >+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
> >
> >  FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
> >  FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
> >@@ -62,7 +65,7 @@ do_extract_tarball() {
> >  do_install(){
> >  	install -d ${D}/opt/ltp/
> >  	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> >-	
> >+
> >  	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
> >  	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
> >
> >

