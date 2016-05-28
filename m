Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 026ED75CF1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 13:41:41 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id k1so11491942vka.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 06:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=8WTFuWaF5I/zr06C/zwgCrOSguzDpy2gYaIEBLR/tsI=;
	b=UotQRm3dw9vJdmkofpaEDsDs2R1jcml3df8m9GJsF4IZgpVcTFOF7lQ2Awwrg+nGpP
	pNveBA0k9ONcqNhh4wfLiKgs46QZl0W2eD8PorRoB18F1TuGwN3yiruB0HdHrsbxslMw
	IY8691sRh84gzmDNYXwcxeRHfCkAE9GYETcBUlEHKzMetRJWab6hqf6Mt1S8yuO+2x0v
	SST3PNFfXB6zMBeI7GE9LVQBPPDAE15jvB5xAdTiXbXDCwozYCjz3p+FXhThGcDVPi2v
	3eeRnmzOCeozWpqfb5fSqNCE2rsV2tMzepq8TUTUi6vyZAui2qGX4e1BUmddxgomHAkA
	pI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=8WTFuWaF5I/zr06C/zwgCrOSguzDpy2gYaIEBLR/tsI=;
	b=KV1kgqjJwtFDQ9N3cLIyAKXKv6DJzRX+Ke6ebJw35gboLcGDeLJfU9U7I1P7KmRpQE
	Pnc8jVoqxqjhY3RAwFCyTdxZ9cMsvHbnkKVSiUPQTGmVb4DHl/6WH925vvN6eCqJnn0g
	U3tFMa1D/U8LIJtgrsmLtdX57Vu9ZEwVMXmCJFpVKouKPbeBH83Argd605q1XCbcySxg
	qKOfO9ELpGZBdeNOSWZtqdxW0Gsi/SFAyP9loiJXnEle5DQMRrzxj7mUMHNo4/sVG9Oi
	gG7PC84ex0hAAjlfetQbNZJQweIasUwuS/EsNTd9sN8P0DbAmzq1BopF4s50IQZPff3W
	k5aQ==
X-Gm-Message-State: ALyK8tLx1LOMm42Ohd3LPR23JG4wiTUS42mhv7gxWAxxPtkWgbEbnCXOLl7dpy5Z3+6Esk9OMFdiVK2ek776Mg==
MIME-Version: 1.0
X-Received: by 10.31.94.18 with SMTP id s18mr10965305vkb.89.1464442901659;
	Sat, 28 May 2016 06:41:41 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Sat, 28 May 2016 06:41:41 -0700 (PDT)
In-Reply-To: <CALbNGRTiZicGG7u=YDPpc2k6OsqgDq8v6t7k1S7BXS+5HWMwoQ@mail.gmail.com>
References: <cover.1463042237.git.pkj@axis.com>
	<c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
	<CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
	<86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
	<CALbNGRTiZicGG7u=YDPpc2k6OsqgDq8v6t7k1S7BXS+5HWMwoQ@mail.gmail.com>
Date: Sat, 28 May 2016 15:41:41 +0200
Message-ID: <CALbNGRRLrmzAwpOtzcNjmTYzw0A6Ay1k_S0C-1wjSvHrgTJWkA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Sat, 28 May 2016 13:41:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2016 at 10:14 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, May 26, 2016 at 3:41 PM, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>> -----Original Message-----
>>> From: Andreas M=C3=BCller [mailto:schnitzeltony@googlemail.com]
>>> Sent: den 26 maj 2016 14:00
>>> To: Peter Kjellerstedt
>>> Cc: Patches and discussions about the oe-core layer
>>> Subject: Re: [OE-core] [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add
>>> dirs to stage in sysroot
>>>
>>> On Thu, May 12, 2016 at 10:37 AM, Peter Kjellerstedt
>>> <peter.kjellerstedt@axis.com> wrote:
>>> > ---
>>> >  meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 5 +----
>>> >  1 file changed, 1 insertion(+), 4 deletions(-)
>>> >
>>> > diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-
>>> devtools/tcltk/tcl_8.6.4.bb
>>> > index 8e92b3e..61be81d 100644
>>> > --- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
>>> > +++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
>>> > @@ -68,10 +68,7 @@ do_install() {
>>> >         done
>>> >  }
>>> >
>>> > -SYSROOT_PREPROCESS_FUNCS +=3D "tcl_sysroot_preprocess"
>>> > -tcl_sysroot_preprocess () {
>>> > -       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDI=
R}${bindir_crossscripts}
>>> > -}
>>> > +SYSROOT_DIRS +=3D "${bindir_crossscripts}"
>>> >
>>> >  PACKAGES =3D+ "tcl-lib"
>>> >  FILES_tcl-lib =3D "${libdir}/libtcl8.6.so.*"
>>> > --
>>> > 2.1.0
>>> >
>>> This one breaks meta-oe's postgresql.
>>>
>>> Andreas
>>
>> Breaks it how?
>>
>> //Peter
>>
> Yes I agree I cannot see what's wrong with this patch - together with
> modifications of staging.bbclass it should do same as before. For test
> I reverted this patch and postgresql builds fine again. Have no idea
> what's causing postgresql failure
>
> Some typo I don't see?
>
To get more infomation I

* build with patch reverted
* put  sysroot under git control
* remove revert again

Don't know why but now we see absolute paths in tclConfig.sh:

--- a/usr/bin/crossscripts/tclConfig.sh
+++ b/usr/bin/crossscripts/tclConfig.sh
@@ -57,7 +57,7 @@ TCL_SHLIB_CFLAGS=3D'-fPIC'
 TCL_CFLAGS_WARNING=3D'-Wall'

 # Extra flags to pass to cc:
-TCL_EXTRA_CFLAGS=3D' -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi=
2/usr/include=3D/usr/src/debug/tcl/8.6.4-r0
-fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linu=
x=3D
-fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi=
2=3D
 -pipe '
+TCL_EXTRA_CFLAGS=3D' -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi=
2/usr/include=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2/usr=
/src/debug/tcl/8.6.4-r0
-fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linu=
x=3D
-fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi=
2=3D
 -pipe '

 # Base command to use for combining object files into a shared library:
 TCL_SHLIB_LD=3D'${CC} -shared ${CFLAGS} ${LDFLAGS}'
@@ -104,11 +104,11 @@
TCL_BUILD_LIB_SPEC=3D'-L/home/superandy/tmp/oe-core-glibc/sysroots/raspberr=
ypi2/us

 # String to pass to linker to pick up the Tcl library from its
 # installed directory.
-TCL_LIB_SPEC=3D'-L=3D/usr/lib -ltcl8.6'
+TCL_LIB_SPEC=3D'-L=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberryp=
i2/usr/lib
-ltcl8.6'

 # String to pass to the compiler so that an extension can
 # find installed Tcl headers.
-TCL_INCLUDE_SPEC=3D'-I=3D/usr/include/tcl8.6'
+TCL_INCLUDE_SPEC=3D'-I=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspbe=
rrypi2/usr/include/tcl8.6'

 # Indicates whether a version numbers should be used in -l switches
 # ("ok" means it's safe to use switches like -ltcl7.5;  "nodots" means
@@ -157,7 +157,7 @@
TCL_BUILD_STUB_LIB_SPEC=3D'-L/home/superandy/tmp/oe-core-glibc/sysroots/ras=
pberryp

 # String to pass to linker to pick up the Tcl stub library from its
 # installed directory.
-TCL_STUB_LIB_SPEC=3D'-L=3D/usr/lib -ltclstub8.6'
+TCL_STUB_LIB_SPEC=3D'-L=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspb=
errypi2/usr/lib
-ltclstub8.6'

 # Path to the Tcl stub library in the build directory.
 TCL_BUILD_STUB_LIB_PATH=3D'/home/superandy/tmp/oe-core-glibc/sysroots/rasp=
berrypi2/usr/include/build/libtclstub8.6.a'

This is the symptom but what is it caused by?

Andreas

