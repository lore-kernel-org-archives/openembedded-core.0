Return-Path: <winiston@futuraautomation.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id D527065CBF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 05:45:35 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj10so46681348pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 21:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:importance:disposition-notification-to;
	bh=yq+kXBpmgGOA2IgWwsAh61qRFq4W1g8I+Zt1oc1XeHc=;
	b=y+DHdzJXf/M2WflrJFLfXDsrpsqvXCyzNWZpPXuOT5DacMBLMbZ1kUUU7YV4ojUkf1
	JZ1arFfbGsicKK+qSrWRrfFtP+EiS9XYU7FU2e/j5YefnpqirUs6axxBr0e7Vpz1dLMT
	SDBEdbIjiZTrwkV6DHL4P+vdehNblvlxVN+LGJp9N4LvQAEq1ejS6bTnBrk0duOybywY
	rDVF6M1d56aalBXhPAiyFZGkYV+wIAqLs+1rD07hQ135gmMaUrPLBJ09vIUBcvWxMnbc
	i9hYIZWoAAYsHfwlAMtCTDxzFmwGYneZCpt6wXumYgbLOeQvFxosr46JGuqYZASXe6RA
	SaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:importance:disposition-notification-to;
	bh=yq+kXBpmgGOA2IgWwsAh61qRFq4W1g8I+Zt1oc1XeHc=;
	b=WvbFnIwnWwjgfZVvzfaR7abx6OTV6bfOeXVd2b7vv8ED3rkzdZbngDxz/2+Eq2elSo
	gAodhci9Kl7u1+eb+CntqFzOkrBHxO+3Pzfff4gwZE4tW/zSZRmm+Nzw1pj96BqRJQBp
	BODNPNo16LAY7psUpxjZVo11OIgsf671AxERtjZD8XB7LG6wsVKALDtreCr3uf2snZSc
	i7dlwa0C1NVklipFLIv63Nn1OH5+ZMmy9jZMhu/MUzZQZ5mFYZqTj+yqgvXMYMoGI3cZ
	/4FER5I9h6zIdCJszXsXxpqTV+NekwIsObjjYmvpMHswBSeunPlKZB/k9ljqjnjAwdng
	T7/Q==
X-Gm-Message-State: AD7BkJLu9AGD7CjnX25BiVJGD3MCC5yZ6V0ubNt0gwCnUbFUBJFiZ3ePdsOK6UQBy72Qgg==
X-Received: by 10.66.124.226 with SMTP id ml2mr17655435pab.90.1457156736792;
	Fri, 04 Mar 2016 21:45:36 -0800 (PST)
Received: from RD3 ([59.99.236.185])
	by smtp.gmail.com with ESMTPSA id 67sm9367907pfi.2.2016.03.04.21.45.31
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 21:45:34 -0800 (PST)
Message-ID: <7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
From: <winiston@futuraautomation.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
	<CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
	<25A507B472054F9B9002D68314A7C388@RD3>
	<CAJTo0LYqPQDVoKdFPP4onF-V+0fJ3fZU5CAk_ao3QdbgN05RRA@mail.gmail.com>
In-Reply-To: <CAJTo0LYqPQDVoKdFPP4onF-V+0fJ3fZU5CAk_ao3QdbgN05RRA@mail.gmail.com>
Date: Sat, 5 Mar 2016 11:19:06 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Anders Darander <anders@chargestorm.se>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [linux-yocto] How to integrate third party application software to yocto image
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
X-List-Received-Date: Sat, 05 Mar 2016 05:45:37 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0167_01D176D0.D49896A0"

------=_NextPart_000_0167_01D176D0.D49896A0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ross,

Thanks for your valuable time...As you said, I added =
=E2=80=9Cmeta-oe=E2=80=9D layer in  =E2=80=9Cbblayers.conf=E2=80=9D . =
Now that Error got disappeared. Now it spits out the following error..

winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
Loading cache: 100% |##########################| ETA:  00:00:00
Loaded 2176 entries from dependency cache.
ERROR: ParseError at =
/home/winiston/poky/meta-oe/recipes-connectivity/networkmanager/networkma=
nager_1.0.10.bb:12: Could not inherit file =
classes/bash-completion.bbclass

Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

Then  for the time being, I have removed =
=E2=80=9Cnetworkmanager_1.0.10.bb =E2=80=9C . After that it started =
building more than 3350 package out of 3659. Now it spits out the =
following error. Please see below log files.

winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
Loading cache: 100% |##########################| ETA:  00:00:00
Loaded 2218 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "am437x-evm"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.0.1"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon callconvention-hard =
cortexa9"
TARGET_FPU        =3D "vfp-neon"
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"
meta-ti           =3D "master:963c35fc490a733a533c0c30471f9974eed451d6"
meta-oe           =3D "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665)
ERROR: Logfile of failure stored in: =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', =
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', =
'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 1
| make  all-recursive
| make[1]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build'
| Making all in intl
| make[2]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/intl'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/intl'
| Making all in po
| make[2]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/po'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/po'
| Making all in man
| make[2]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/man'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/man'
| Making all in navit
| make[2]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'
| echo "#include \"config.h\"" >version.h.tmp
| echo "#define SVN_VERSION \"$(LANG=3DC svnversion =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit 2>/dev/null)\"" >>version.h.tmp
| echo "#define NAVIT_VARIANT \"\"" >>version.h.tmp
| if ! diff version.h.tmp version.h >/dev/null 2>/dev/null; \
|     then \
|         mv -f version.h.tmp version.h; \
|     fi
| make  all-recursive
| make[3]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'
| Making all in fib-1.1
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/fib-1.1'
| make[4]: Nothing to be done for `all'.
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/fib-1.1'
| Making all in support
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'
| Making all in shapefile
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support/shapefile'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support/shapefile'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'
| Making all in .
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'
| echo "no Android support"
| no Android support
| cp =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/navit_shipped.xml =
navit.xml.new
| if [ ! -f navit.dtd ]; then cp -f =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/navit.dtd .; fi
| for i in =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/navit_shipped.xml =
navit_android_xml; do if [ "${i%.xslt}" !=3D "$i" ]; then echo "Applying =
$i" ; saxon -snone navit.xml.new $i >navit.xml.tmp || exit ; mv -f =
navit.xml.tmp navit.xml.new || exit ; fi ; done
| mv -f navit.xml.new navit.xml
| rm -f navit.xml.tmp
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'
| Making all in autoload
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'
| Making all in binding
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'
| Making all in dbus
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding/dbus'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding/dbus'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'
| Making all in map
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'
| Making all in binfile
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/binfile'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/binfile'
| Making all in filter
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/filter'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/filter'
| Making all in mg
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/mg'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/mg'
| Making all in shapefile
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/shapefile'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/shapefile'
| Making all in textfile
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/textfile'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/textfile'
| Making all in csv
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/csv'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/csv'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'
| Making all in font
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'
| Making all in freetype
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font/freetype'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font/freetype'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'
| Making all in gui
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'
| Making all in internal
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui/internal'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui/internal'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'
| Making all in graphics
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'
| Making all in null
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics/null'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics/null'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'
| Making all in osd
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'
| Making all in core
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd/core'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd/core'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'
| Making all in plugin
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'
| Making all in speech
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'
| Making all in cmdline
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/cmdline'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/cmdline'
| Making all in dbus
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/dbus'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/dbus'
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'
| make[5]: Nothing to be done for `all-am'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'
| make[4]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'
| Making all in vehicle
| make[4]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle'
| Making all in demo
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/demo'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/demo'
| Making all in file
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/file'
| make[5]: Nothing to be done for `all'.
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/file'
| Making all in gpsd
| make[5]: Entering directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/gpsd'
| ../../../arm-poky-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompile =
arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a -marm  -mthumb-interwork =
-mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 =
--sysroot=3D/home/winiston/poky/build/tmp/sysroots/am437x-evm =
-DHAVE_CONFIG_H -I. =
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd -I../../..  =
-pthread =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude -pthread =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude  =
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit -DMODULE=3Dvehicle_gpsd   =
-O2 -pipe -g -feliminate-unused-debug-types -Wall -Wcast-align =
-Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes =
-Wpointer-arith -Wreturn-type -D_GNU_SOURCE -ffast-math -c -o =
vehicle_gpsd.lo =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c
| arm-poky-linux-gnueabi-libtool: compile:  arm-poky-linux-gnueabi-gcc =
-march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon =
-mtune=3Dcortex-a9 =
--sysroot=3D/home/winiston/poky/build/tmp/sysroots/am437x-evm =
-DHAVE_CONFIG_H -I. =
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd -I../../.. =
-pthread =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude -pthread =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude =
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit -DMODULE=3Dvehicle_gpsd -O2 =
-pipe -g -feliminate-unused-debug-types -Wall -Wcast-align =
-Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes =
-Wpointer-arith -Wreturn-type -D_GNU_SOURCE -ffast-math -c =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c  =
-fPIC -DPIC -o .libs/vehicle_gpsd.o
| =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c: =
In function 'vehicle_gpsd_callback':
| =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:130=
:40: error: 'struct gps_data_t' has no member named 'ss'
|                                 if (data->ss[i] > 0)
|                                         ^
| =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c: =
In function 'vehicle_gpsd_io':
| =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:321=
:23: warning: assignment discards 'const' qualifier from pointer target =
type [-Wdiscarded-qualifiers]
|                    buf =3D gps_data(priv->gps);
|                        ^
| make[5]: *** [vehicle_gpsd.lo] Error 1
| make[5]: Leaving directory =
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/gpsd'
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at =
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665)
ERROR: Task 268 =
(/home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb, =
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3468 tasks of which 3467 didn't need to =
be rerun and 1 failed.
No currently running tasks (3467 of 3645)

Summary: 1 task failed:
  /home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb, =
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

I can not justify what is the error? Does =
=E2=80=9Cnetworkmanager_1.0.10.bb=E2=80=9D require for building =
=E2=80=9CNavit=E2=80=9D ?
I would be very thankful, if you resolve the above problem.

Thanking you...


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291


From: Burton, Ross=20
Sent: Friday, March 04, 2016 2:25 PM
To: winiston@futuraautomation.com=20
Cc: Anders Darander ; OE-core ; yocto texas ; Yocto layer=20
Subject: Re: [linux-yocto] [OE-core] How to integrate third party =
application software to yocto image


On 4 March 2016 at 04:23, <winiston@futuraautomation.com> wrote:

  ERROR: Nothing PROVIDES 'gd' (but =
/home/winiston/poky/meta/recipes-qt/navit/navit_svn.bb DEPENDS on or =
otherwise requires it). Close matches:

gd is part of meta-oe.  Instead of copying a few files and assuming that =
you know what you're doing, add the entire layer to BBLAYERS.

Ross

------=_NextPart_000_0167_01D176D0.D49896A0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear Ross,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks for your valuable time...As you said, I added =
=E2=80=9Cmeta-oe=E2=80=9D layer=20
in&nbsp; =E2=80=9Cbblayers.conf=E2=80=9D . Now that Error got =
disappeared. Now it spits out the=20
following error..</DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
qt4e-demo-image</DIV>
<DIV>Loading cache: 100% |##########################| ETA:&nbsp; =
00:00:00</DIV>
<DIV>Loaded 2176 entries from dependency cache.</DIV>
<DIV>ERROR: ParseError at=20
/home/winiston/poky/meta-oe/recipes-connectivity/networkmanager/networkma=
nager_1.0.10.bb:12:=20
Could not inherit file classes/bash-completion.bbclass</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: There was 1 ERROR message shown, returning a non-zero exit =

code.</DIV>
<DIV><A=20
href=3D"mailto:winiston@winiston-VirtualBox:~/poky/build$">winiston@winis=
ton-VirtualBox:~/poky/build$</A>=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG><FONT color=3D#9b00d3>Then&nbsp; for the time being, I have =
removed=20
=E2=80=9Cnetworkmanager_1.0.10.bb =E2=80=9C . After that it started =
building more than 3350=20
package out of 3659. Now it spits out the following error. Please see =
below log=20
files.</FONT></STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
qt4e-demo-image</DIV>
<DIV>Loading cache: 100% |##########################| ETA:&nbsp; =
00:00:00</DIV>
<DIV>Loaded 2218 entries from dependency cache.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>&nbsp;</DIV>
<DIV>Build Configuration:</DIV>
<DIV>BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"1.28.0"</DIV>
<DIV>BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"i686-linux"</DIV>
<DIV>NATIVELSBSTRING&nbsp;&nbsp; =3D "Ubuntu-14.04"</DIV>
<DIV>TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=20
"arm-poky-linux-gnueabi"</DIV>
<DIV>MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"am437x-evm"</DIV>
<DIV>DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; =3D=20
"poky"</DIV>
<DIV>DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "2.0.1"</DIV>
<DIV>TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp thumb =
neon=20
callconvention-hard cortexa9"</DIV>
<DIV>TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"vfp-neon"</DIV>
<DIV>meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
</DIV>
<DIV>meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV>
<DIV>meta-yocto-bsp&nbsp;&nbsp;&nbsp; =3D=20
"jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"</DIV>
<DIV>meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"master:963c35fc490a733a533c0c30471f9974eed451d6"</DIV>
<DIV>meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D=20
"jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"</DIV>
<DIV>&nbsp;</DIV>
<DIV>NOTE: Preparing RunQueue</DIV>
<DIV>NOTE: Executing SetScene Tasks</DIV>
<DIV>NOTE: Executing RunQueue Tasks</DIV>
<DIV>ERROR: oe_runmake failed</DIV>
<DIV>ERROR: Function failed: do_compile (log file is located at=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665)</DIV>
<DIV>ERROR: Logfile of failure stored in:=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665</DIV>
<DIV>Log data follows:</DIV>
<DIV>| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', =
'arm-32',=20
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',=20
'common']</DIV>
<DIV>| DEBUG: Executing shell function do_compile</DIV>
<DIV>| NOTE: make -j 1</DIV>
<DIV>| make&nbsp; all-recursive</DIV>
<DIV>| make[1]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build'</DIV>
<DIV>| Making all in intl</DIV>
<DIV>| make[2]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/intl'</DIV>
<DIV>| make[2]: Nothing to be done for `all'.</DIV>
<DIV>| make[2]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/intl'</DIV>
<DIV>| Making all in po</DIV>
<DIV>| make[2]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/po'</DIV>
<DIV>| make[2]: Nothing to be done for `all'.</DIV>
<DIV>| make[2]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/po'</DIV>
<DIV>| Making all in man</DIV>
<DIV>| make[2]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/man'</DIV>
<DIV>| make[2]: Nothing to be done for `all'.</DIV>
<DIV>| make[2]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/man'</DIV>
<DIV>| Making all in navit</DIV>
<DIV>| make[2]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'</DIV>
<DIV>| echo "#include \"config.h\"" &gt;version.h.tmp</DIV>
<DIV>| echo "#define SVN_VERSION \"$(LANG=3DC svnversion=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit=20
2&gt;/dev/null)\"" &gt;&gt;version.h.tmp</DIV>
<DIV>| echo "#define NAVIT_VARIANT \"\"" &gt;&gt;version.h.tmp</DIV>
<DIV>| if ! diff version.h.tmp version.h &gt;/dev/null 2&gt;/dev/null; =
\</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp; then \</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv -f =
version.h.tmp=20
version.h; \</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp; fi</DIV>
<DIV>| make&nbsp; all-recursive</DIV>
<DIV>| make[3]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'</DIV>
<DIV>| Making all in fib-1.1</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/fib-1.1'</DIV>
<DIV>| make[4]: Nothing to be done for `all'.</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/fib-1.1'</DIV>
<DIV>| Making all in support</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'</DIV>
<DIV>| Making all in shapefile</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support/shapefile'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support/shapefile'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/support'</DIV>
<DIV>| Making all in .</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'</DIV>
<DIV>| echo "no Android support"</DIV>
<DIV>| no Android support</DIV>
<DIV>| cp=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/navit_shipped.xml=20
navit.xml.new</DIV>
<DIV>| if [ ! -f navit.dtd ]; then cp -f=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/navit.dtd=20
.; fi</DIV>
<DIV>| for i in=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/navit_shipped.xml=20
navit_android_xml; do if [ "${i%.xslt}" !=3D "$i" ]; then echo "Applying =
$i" ;=20
saxon -snone navit.xml.new $i &gt;navit.xml.tmp || exit ; mv -f =
navit.xml.tmp=20
navit.xml.new || exit ; fi ; done</DIV>
<DIV>| mv -f navit.xml.new navit.xml</DIV>
<DIV>| rm -f navit.xml.tmp</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit'</DIV>
<DIV>| Making all in autoload</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/autoload'</DIV>
<DIV>| Making all in binding</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'</DIV>
<DIV>| Making all in dbus</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding/dbus'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding/dbus'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/binding'</DIV>
<DIV>| Making all in map</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'</DIV>
<DIV>| Making all in binfile</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/binfile'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/binfile'</DIV>
<DIV>| Making all in filter</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/filter'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/filter'</DIV>
<DIV>| Making all in mg</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/mg'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/mg'</DIV>
<DIV>| Making all in shapefile</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/shapefile'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/shapefile'</DIV>
<DIV>| Making all in textfile</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/textfile'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/textfile'</DIV>
<DIV>| Making all in csv</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/csv'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map/csv'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/map'</DIV>
<DIV>| Making all in font</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'</DIV>
<DIV>| Making all in freetype</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font/freetype'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font/freetype'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/font'</DIV>
<DIV>| Making all in gui</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'</DIV>
<DIV>| Making all in internal</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui/internal'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui/internal'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/gui'</DIV>
<DIV>| Making all in graphics</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'</DIV>
<DIV>| Making all in null</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics/null'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics/null'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/graphics'</DIV>
<DIV>| Making all in osd</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'</DIV>
<DIV>| Making all in core</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd/core'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd/core'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/osd'</DIV>
<DIV>| Making all in plugin</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/plugin'</DIV>
<DIV>| Making all in speech</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'</DIV>
<DIV>| Making all in cmdline</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/cmdline'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/cmdline'</DIV>
<DIV>| Making all in dbus</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/dbus'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech/dbus'</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'</DIV>
<DIV>| make[5]: Nothing to be done for `all-am'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'</DIV>
<DIV>| make[4]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/speech'</DIV>
<DIV>| Making all in vehicle</DIV>
<DIV>| make[4]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle'</DIV>
<DIV>| Making all in demo</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/demo'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/demo'</DIV>
<DIV>| Making all in file</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/file'</DIV>
<DIV>| make[5]: Nothing to be done for `all'.</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/file'</DIV>
<DIV>| Making all in gpsd</DIV>
<DIV>| make[5]: Entering directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/gpsd'</DIV>
<DIV>| ../../../arm-poky-linux-gnueabi-libtool&nbsp; =
--tag=3DCC&nbsp;&nbsp;=20
--mode=3Dcompile arm-poky-linux-gnueabi-gcc&nbsp; -march=3Darmv7-a =
-marm&nbsp;=20
-mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9=20
--sysroot=3D/home/winiston/poky/build/tmp/sysroots/am437x-evm =
-DHAVE_CONFIG_H -I.=20
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd=20
-I../../..&nbsp; -pthread=20
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =

-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude=20
-pthread=20
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =

-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude&nbsp;=20
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit=20
-DMODULE=3Dvehicle_gpsd&nbsp;&nbsp; -O2 -pipe -g =
-feliminate-unused-debug-types=20
-Wall -Wcast-align -Wmissing-declarations -Wmissing-prototypes=20
-Wstrict-prototypes -Wpointer-arith -Wreturn-type -D_GNU_SOURCE =
-ffast-math -c=20
-o vehicle_gpsd.lo=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c</DI=
V>
<DIV>| arm-poky-linux-gnueabi-libtool: compile:&nbsp; =
arm-poky-linux-gnueabi-gcc=20
-march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon =

-mtune=3Dcortex-a9 =
--sysroot=3D/home/winiston/poky/build/tmp/sysroots/am437x-evm=20
-DHAVE_CONFIG_H -I.=20
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd=20
-I../../.. -pthread=20
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =

-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude=20
-pthread=20
-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/include/glib-2.0 =

-I/home/winiston/poky/build/tmp/sysroots/am437x-evm/usr/lib/glib-2.0/incl=
ude=20
-I/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/navit/1_0.2.0+svnr5310-r11.3/navit/navit=20
-DMODULE=3Dvehicle_gpsd -O2 -pipe -g -feliminate-unused-debug-types =
-Wall=20
-Wcast-align -Wmissing-declarations -Wmissing-prototypes =
-Wstrict-prototypes=20
-Wpointer-arith -Wreturn-type -D_GNU_SOURCE -ffast-math -c=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c&nbs=
p;=20
-fPIC -DPIC -o .libs/vehicle_gpsd.o</DIV>
<DIV>|=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:=20
In function 'vehicle_gpsd_callback':</DIV>
<DIV>|=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:130=
:40:=20
error: 'struct gps_data_t' has no member named 'ss'</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
if (data-&gt;ss[i] &gt; 0)</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
^</DIV>
<DIV>|=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:=20
In function 'vehicle_gpsd_io':</DIV>
<DIV>|=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/navit/navit/vehicle/gpsd/vehicle_gpsd.c:321=
:23:=20
warning: assignment discards 'const' qualifier from pointer target type=20
[-Wdiscarded-qualifiers]</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
buf =3D gps_data(priv-&gt;gps);</DIV>
<DIV>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
^</DIV>
<DIV>| make[5]: *** [vehicle_gpsd.lo] Error 1</DIV>
<DIV>| make[5]: Leaving directory=20
`/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueab=
i/navit/1_0.2.0+svnr5310-r11.3/build/navit/vehicle/gpsd'</DIV>
<DIV>| ERROR: oe_runmake failed</DIV>
<DIV>| ERROR: Function failed: do_compile (log file is located at=20
/home/winiston/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi=
/navit/1_0.2.0+svnr5310-r11.3/temp/log.do_compile.3665)</DIV>
<DIV>ERROR: Task 268=20
(/home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb, =
do_compile)=20
failed with exit code '1'</DIV>
<DIV>NOTE: Tasks Summary: Attempted 3468 tasks of which 3467 didn't need =
to be=20
rerun and 1 failed.</DIV>
<DIV>No currently running tasks (3467 of 3645)</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: 1 task failed:</DIV>
<DIV>&nbsp; =
/home/winiston/poky/meta-oe/recipes-navigation/navit/navit_svn.bb,=20
do_compile</DIV>
<DIV>Summary: There were 2 ERROR messages shown, returning a non-zero =
exit=20
code.</DIV>
<DIV><A=20
href=3D"mailto:winiston@winiston-VirtualBox:~/poky/build$">winiston@winis=
ton-VirtualBox:~/poky/build$</A>=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#9b00d3><STRONG>I can not justify what is the error? =
Does=20
=E2=80=9Cnetworkmanager_1.0.10.bb=E2=80=9D require for building =
=E2=80=9CNavit=E2=80=9D ?</STRONG></FONT></DIV>
<DIV><FONT color=3D#9b00d3><STRONG>I would be very thankful, if you =
resolve the=20
above problem.</STRONG></FONT></DIV>
<DIV><STRONG><FONT color=3D#9b00d3></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT color=3D#9b00d3>Thanking you...</FONT></STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV style=3D"FONT: 10pt tahoma">
<DIV>&nbsp;</DIV>
<DIV style=3D"BACKGROUND: #f5f5f5">
<DIV style=3D"font-color: black"><B>From:</B> <A =
title=3Dross.burton@intel.com=20
href=3D"mailto:ross.burton@intel.com">Burton, Ross</A> </DIV>
<DIV><B>Sent:</B> Friday, March 04, 2016 2:25 PM</DIV>
<DIV><B>To:</B> <A title=3Dwiniston@futuraautomation.com=20
href=3D"mailto:winiston@futuraautomation.com">winiston@futuraautomation.c=
om</A>=20
</DIV>
<DIV><B>Cc:</B> <A title=3Danders@chargestorm.se=20
href=3D"mailto:anders@chargestorm.se">Anders Darander</A> ; <A=20
title=3Dopenembedded-core@lists.openembedded.org=20
href=3D"mailto:openembedded-core@lists.openembedded.org">OE-core</A> ; =
<A=20
title=3Dmeta-ti@yoctoproject.org =
href=3D"mailto:meta-ti@yoctoproject.org">yocto=20
texas</A> ; <A title=3Dlinux-yocto@yoctoproject.org=20
href=3D"mailto:linux-yocto@yoctoproject.org">Yocto layer</A> </DIV>
<DIV><B>Subject:</B> Re: [linux-yocto] [OE-core] How to integrate third =
party=20
application software to yocto image</DIV></DIV></DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV dir=3Dltr>
<DIV class=3Dgmail_extra>
<DIV>&nbsp;</DIV>
<DIV class=3Dgmail_quote>On 4 March 2016 at 04:23, <SPAN =
dir=3Dltr>&lt;<A=20
href=3D"mailto:winiston@futuraautomation.com"=20
target=3D_blank>winiston@futuraautomation.com</A>&gt;</SPAN> wrote:<BR>
<BLOCKQUOTE class=3Dgmail_quote=20
style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc =
1px solid">
  <DIV>ERROR: Nothing PROVIDES 'gd' (but=20
  /home/winiston/poky/meta/recipes-qt/navit/<A =
href=3D"http://navit_svn.bb"=20
  target=3D_blank>navit_svn.bb</A> DEPENDS on or otherwise requires it). =
Close=20
  matches:</DIV>
  <DIV></DIV></BLOCKQUOTE></DIV><BR>gd is part of meta-oe.&nbsp; Instead =
of=20
copying a few files and assuming that you know what you're doing, add =
the entire=20
layer to BBLAYERS.</DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV=20
class=3Dgmail_extra>Ross</DIV></DIV></DIV></DIV></DIV></DIV></DIV></DIV><=
/BODY></HTML>

------=_NextPart_000_0167_01D176D0.D49896A0--
