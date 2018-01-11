Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB2C2787B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 17:26:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0BHQ40W006348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 Jan 2018 17:26:05 GMT
Message-ID: <1515691564.29722.120.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 11 Jan 2018 17:26:04 +0000
In-Reply-To: <20180111150207.GJ9657@denix.org>
References: <1515640552-54778-1-git-send-email-denis@denix.org>
	<1515681675.29722.118.camel@linuxfoundation.org>
	<20180111150207.GJ9657@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: add flex-native explicit dependency
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
X-List-Received-Date: Thu, 11 Jan 2018 17:26:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-11 at 10:02 -0500, Denys Dmytriyenko wrote:
> On Thu, Jan 11, 2018 at 02:41:15PM +0000, Richard Purdie wrote:
> > and test results so far imply that we need:
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-
> > devtools/gcc/gcc-7.2.inc
> > index 1d40cba7317..90e4a990cb3 100644
> > --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> > @@ -11,7 +11,7 @@ BINV = "7.2.0"
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-
> > 7.2/backport:"
> >  
> >  DEPENDS =+ "mpfr gmp libmpc zlib"
> > -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native
> > flex-native"
> >  
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> >  
> > 
> > probably in addition to your patch. I'll continue to run some test
> > builds and see how much breakage the above change shows up.
> Thanks. I was building native gcc for the target, while using
> external 
> prebuilt cross toolchain. I first tried adding flex-native to
> NATIVEDEPS 
> list, but that didn't help - looks like this list is only used for
> cross and 
> crosssdk builds.

I'll probably take your at and perf patches, my gcc one which covers
the cross and candadian variants and merge a change to the sstate
dependency code which means we'll explicitly see these dependency
issues in future. I'll queue this in -next and test.

Cheers,

Richard

