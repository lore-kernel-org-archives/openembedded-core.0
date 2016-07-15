Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E474460722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:35:57 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so3573424qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B3EZKC4RoQF4U7FWCffwuhBQ3wg95DE9NDoOP5GXYFQ=;
	b=XY92J1B6FOC7R5JA9w2VclJmlNFB1JeUB7d6f9gfs3Qx/ElM/EVem15VqpnvOP3YzQ
	AJZQITJoO6SgQVQbzjIjftNvr8/LDF4+csG0RwqSEp47WZAsmkC3sSD9tsOYa6nnopo/
	o17hmzNTXxK+aDIGTJcP+kxrQzV4UAuaNdvAbYxj7Hp1lAoH1c4ICxHLrEUoeO0Jp5SC
	eJlkehvxC2vc0o+opdp5OFuMlW/dAIEjPpDMcqpleTb593BaTXxIPeBGSeqDuhH6NIli
	m8nPq921XgZ29zf/p9nQsAcfy8UL3icWH4cTE1vnCsLCgZAsq6neGl7tWtgsT4uJwygc
	ssNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B3EZKC4RoQF4U7FWCffwuhBQ3wg95DE9NDoOP5GXYFQ=;
	b=GWZbLN5NPtfhMfN3uL+Sq9wRa4PQdaXWZw0UMGanuSrLztF/qrLWNZuhrFbg1LqGsX
	Q/Ih/CvH8/rO4ics53jhpS/WvNglgX4WJR3ZGfp8eXznxhbPHGbf1wnd9yitSNSgyeOA
	rU1SrcoO9xqrqP9lWSfRuLuyu9SEoIPGo/+TXp3HdjWspulg82BGkgYzSygO875rPNpe
	iRyxm4GfmXjQwj9DTLt5eWEoeknqc770ZH1JlH9P/A5gonaHEwox1RMi3ubQPnBo3wlj
	Tqf8kahKxfUwp+Dq8UA3oP7LH0vPxzyBm1XZjFTKoAdJ1w2gYr+F3igi6A+hbBxEgv2G
	KF/g==
X-Gm-Message-State: ALyK8tJePb/0YXE7eXj+rdhC4ZVF63yoJ8Z/6pRP61tRnDuKUAkHfDpAcl+rtHFcYTjMtKq9xqgBAoK8GTtKMw==
X-Received: by 10.200.48.141 with SMTP id v13mr27305344qta.76.1468568157779;
	Fri, 15 Jul 2016 00:35:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 15 Jul 2016 00:35:28 -0700 (PDT)
In-Reply-To: <DB3PR04MB068453822CFC44651DA07C02EE3A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
	<CAMKF1soJ0_8FcopQ4ipqLv+Bgi9qFyvTOUKVshdxvcEphRi6sw@mail.gmail.com>
	<DB3PR04MB068453822CFC44651DA07C02EE3A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2016 00:35:28 -0700
Message-ID: <CAMKF1sokj_1Fs=MEQi-bOAMr8nG1ttLROd8i8tOb-CSfgDdpZA@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Fri, 15 Jul 2016 07:35:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 5, 2016 at 9:08 PM, Zhenhua Luo <zhenhua.luo@nxp.com> wrote:
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Tuesday, July 05, 2016 11:16 PM
>> To: Zhenhua Luo <zhenhua.luo@nxp.com>
>> Cc: Patches and discussions about the oe-core layer <openembedded-
>> core@lists.openembedded.org>
>> Subject: Re: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and LIB_SP=
EC
>>
>> On Mon, Jul 4, 2016 at 11:20 PM, Zhenhua Luo <zhenhua.luo@nxp.com> wrote=
:
>> > TCL_INCLUDE_SPEC -I+<includedir> and TCL_LIB_SPEC -L+${libdir} break
>> > the cross-compile of packages which require tcl headers and libraries.
>> >
>> > One example is that postgresql configure failed at the following error=
:
>> > | checking for tcl.h... no
>> > | configure: error: header file <tcl.h> is required for Tcl
>> >
>> > Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
>> > ---
>> >  meta/recipes-devtools/tcltk/tcl_8.6.5.bb | 2 --
>> >  1 file changed, 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>> > b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>> > index 46fc8a7..d75232b 100644
>> > --- a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>> > +++ b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
>> > @@ -56,8 +56,6 @@ do_install() {
>> >         ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
>> >         sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
>> >         sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
>> > -       sed -i "s,-L${libdir},-L=3D${libdir},g" tclConfig.sh
>> > -       sed -i "s,-I${includedir},-I=3D${includedir},g" tclConfig.sh
>>
>> does this now include some of your host headers in build then ?
> [Luo Zhenhua-B19537] The patch does the following changes for tclConfig.s=
h. Without the change, tcl.h can't be found when cross building packages(e.=
g. postgresql) which depend on tcl. I have cross-compiled several packages(=
postgresql, expect, ruby, tk) that have tcl dependency and see no issue.
>         1. tmp/sysroots/qemuarm64/usr/bin/crossscripts/tclConfig.sh
>         # String to pass to linker to pick up the Tcl library from its
>          # installed directory.
>         -TCL_LIB_SPEC=3D'-L=3D/home/bjsimics/workspace/poky-os/qemuppc/tm=
p/sysroots/qemuarm64/usr/lib -ltcl8.6'
>         +TCL_LIB_SPEC=3D'-L/home/bjsimics/workspace/poky-os/qemuppc/tmp/s=
ysroots/qemuarm64/usr/lib -ltcl8.6'
>
>          # String to pass to the compiler so that an extension can
>          # find installed Tcl headers.
>         -TCL_INCLUDE_SPEC=3D'-I=3D/home/bjsimics/workspace/poky-os/qemupp=
c/tmp/sysroots/qemuarm64/usr/include/tcl8.6'
>         +TCL_INCLUDE_SPEC=3D'-I/home/bjsimics/workspace/poky-os/qemuppc/t=
mp/sysroots/qemuarm64/usr/include/tcl8.6'
>
>         # String to pass to linker to pick up the Tcl stub library from i=
ts
>          # installed directory.
>         -TCL_STUB_LIB_SPEC=3D'-L=3D/home/bjsimics/workspace/poky-os/qemup=
pc/tmp/sysroots/qemuarm64/usr/lib -ltclstub8.6'
>         +TCL_STUB_LIB_SPEC=3D'-L/home/bjsimics/workspace/poky-os/qemuppc/=
tmp/sysroots/qemuarm64/usr/lib -ltclstub8.6'
>
>         2. tmp/sysroots/qemuarm64/usr/lib/tclConfig.sh
>         # String to pass to linker to pick up the Tcl library from its
>          # installed directory.
>         -TCL_LIB_SPEC=3D'-L=3D/usr/lib -ltcl8.6'
>         +TCL_LIB_SPEC=3D'-L/usr/lib -ltcl8.6'
>
>          # String to pass to the compiler so that an extension can
>          # find installed Tcl headers.
>         -TCL_INCLUDE_SPEC=3D'-I=3D/usr/include/tcl8.6'
>         +TCL_INCLUDE_SPEC=3D'-I/usr/include/tcl8.6'
>
>         # String to pass to linker to pick up the Tcl stub library from i=
ts
>          # installed directory.
>         -TCL_STUB_LIB_SPEC=3D'-L=3D/usr/lib -ltclstub8.6'
>         +TCL_STUB_LIB_SPEC=3D'-L/usr/lib -ltclstub8.6'
>
>
> Best Regards,

Thanks for verifying, this looks OK to me.

