Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC086BD64
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 18:33:59 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id t15-v6so3162904wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 10:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=pE1fi5nu6yt0FmH2HoMrQ5ZSVTv+V5F1vpyVRQg5o1o=;
	b=nGN67XawjU4NRLCrhiHuyQfACowntrgeLaXKU3eHkCVvEWerb3Kmso8+c5/eO+ahv3
	H1dr+09GHld1IBpZYaXe6oP6jCzWHRwxdJOduuyjEK9DJg1kHYPw9y2d1EbxesES0bpM
	AJxzbCeKv5gFAhFPrNafrDkqTiJ9UWIQwalAzjNVlkpMBNu3w4mHZ3/I1yxmXvJoKGm0
	DA2+w2BJfkN8WDV6gj+dHaPqVnETDe4B092p2RKXT2j+tm5bEq2mq7nxD8zsrfc1u/7N
	LX9Ca+f2oKbTRHmpyyqPnvErqWhqddp2wuA/3jif80+GwXHRKjmJTwPkV9APpWS+9YUw
	9fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=pE1fi5nu6yt0FmH2HoMrQ5ZSVTv+V5F1vpyVRQg5o1o=;
	b=mms52jrSKsptZeHit2YrqVA8idB5jpj1f7Kh64c4ue++D8GW0BrOnvK9jEOjqyccU8
	g0TzEdC6teEzjVMuj9727FQCSBibpGMC5B9E25sMSR+YNOMqU7L2NTKlvCXvNz+HS18C
	p8bbF0vjH49qb9sym79BBj0Ag2PlEs1W5kWlAzPR66NtNrAzp/BlVeQLsPWY5V+VXMl6
	rq0vsi4kP07WSq75U72asxpUNyQLxbrTI0w50a1ioABGo5/Y6fbDHmg5RuG68tE5dzlt
	xD3ypLB3V5dUg5bQPG+Ki5Khs5qq5MhVJtVqiXTTi24VOS4C8hbpx9TqHegt499XO8Lr
	ufXw==
X-Gm-Message-State: AA+aEWbAPjwoChYxLtMpYuJ5lGUaFzqP4iwKI03rHBEL6bEuysvzmYfk
	x1afPm3kRTpg5sWOrbhbN+E=
X-Google-Smtp-Source: AFSGD/V5butzhVA7gHZE5TwEhiUKHZFi1OK+c+b1brY6sjrHjn48xfH0BivUGc47TQ8FcElH93CUaw==
X-Received: by 2002:a1c:1383:: with SMTP id
	125-v6mr4957383wmt.71.1542566040552; 
	Sun, 18 Nov 2018 10:34:00 -0800 (PST)
Received: from [10.42.8.217] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	h203-v6sm28927151wma.38.2018.11.18.10.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Nov 2018 10:33:59 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <E1516F7B-C13D-4AF5-87BD-66805C501E79@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Date: Sun, 18 Nov 2018 19:33:55 +0100
In-Reply-To: <F0C31716-B763-4B2C-9B77-A570DCBBC3C9@netbsd.org>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181102172812.12120-1-sno@netbsd.org>
	<CAJTo0LbRiDVcGxuihyGkhDk3ATKb18r7Z5_pfSd3=C=0SHbaWQ@mail.gmail.com>
	<F0C31716-B763-4B2C-9B77-A570DCBBC3C9@netbsd.org>
X-Mailer: Apple Mail (2.3445.101.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3{,-native}: update to 3.7.1
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
X-List-Received-Date: Sun, 18 Nov 2018 18:34:00 -0000
X-Groupsio-MsgNum: 118317
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C721F316-6558-4BB0-BC65-F798127DA980";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_C721F316-6558-4BB0-BC65-F798127DA980
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7532E515-A72F-4DA5-96CE-49AD040A1577"

--Apple-Mail=_7532E515-A72F-4DA5-96CE-49AD040A1577
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 18.11.2018 um 11:36 schrieb Jens Rehsack <sno@NetBSD.org>:
>=20
> That's something I can try to investigate.
>=20
>> Am 14.11.2018 um 11:47 schrieb Burton, Ross <ross.burton@intel.com =
<mailto:ross.burton@intel.com>>:
>>=20
>> Getting reports that this breaks cross builds, for example =
python3-dbus.
>>=20
>> =
tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r=
0/recipe-sysroot-native/usr/lib/libpython3.7m.so =
<http://libpython3.7m.so/>: file not recognized: File format not =
recognized
>> With 3.5.6 the python3-dbus do_configure lokks like =
"-L/home/dev/medusa/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4=
-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot/usr/lib =
-lpython3.5m"
>> With the patch 3.7.1 from the ml, it looks like =
"L/home/dev/medusa-test/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-v=
fpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot-native/usr/lib =
-lpython3.7m"
>>=20
>> Looks like the cross/sysconfig/etc code regressed and it's picking up =
the native sysroot libraries for a cross build.

Indeed.
It's because of =
https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23=
d934159 =
<https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b2=
3d934159> and work based on that.

In Python 3.5 above patch was applied to target version only, =
python3-native used the old method for getting vars relying on Makefile =
and config.h parsing.
The Makefile and config.h were chosen based on STAGING_INCDIR and =
STAGING_LIBDIR - but the method in Python 3.7 is using "import =
_sysconfigdata_{abi}_{platform}_{multiarch}" which might need a =
dedicated wrapper to "tune" some include path variables.

I could hack something like =
meta/recipes-devtools/perl/perl/perl-configpm-switch.patch - but maybe =
someone who is better in Python could do that smoother ;)
Please drop me a note ...

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7532E515-A72F-4DA5-96CE-49AD040A1577
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 18.11.2018 um 11:36 schrieb Jens Rehsack &lt;<a =
href=3D"mailto:sno@NetBSD.org" class=3D"">sno@NetBSD.org</a>&gt;:</div><br=
 class=3D"Apple-interchange-newline"><div class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">That's something I can =
try to investigate.<br class=3D""><div class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Am =
14.11.2018 um 11:47 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Getting reports that this breaks cross builds, for example =
python3-dbus.<br class=3D""><br class=3D""><blockquote style=3D"margin:0 =
0 0 40px;border:none;padding:0px" =
class=3D"">tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/python3-d=
bus/1.2.6-r0/recipe-sysroot-native/usr/lib/<a =
href=3D"http://libpython3.7m.so/" class=3D"">libpython3.7m.so</a>: file =
not recognized: File format not recognized<br class=3D"">With 3.5.6 the =
python3-dbus do_configure lokks like =
"-L/home/dev/medusa/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-vfpv4=
-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot/usr/lib =
-lpython3.5m"<br class=3D"">With the patch 3.7.1 from the ml, it looks =
like =
"L/home/dev/medusa-test/build/yocto/build/tmp-glibc/work/cortexa7hf-neon-v=
fpv4-oe-linux-gnueabi/python3-dbus/1.2.6-r0/recipe-sysroot-native/usr/lib =
-lpython3.7m"</blockquote><div class=3D""><br class=3D""></div>Looks =
like the cross/sysconfig/etc code regressed and it's picking up the =
native sysroot libraries for a cross =
build.</div></div></blockquote></div></div></div></blockquote><div><br =
class=3D""></div>Indeed.&nbsp;<br class=3D""><div>It's because =
of&nbsp;<a =
href=3D"https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85=
ffbb4b23d934159" =
class=3D"">https://github.com/python/cpython/commit/409482251b06fe75c4ee56=
e85ffbb4b23d934159</a>&nbsp;and work based on that.</div><div><br =
class=3D""></div><div>In Python 3.5 above patch was applied to target =
version only, python3-native used the old method for getting vars =
relying on Makefile and config.h parsing.</div><div>The Makefile and =
config.h were chosen based on STAGING_INCDIR and STAGING_LIBDIR - but =
the method in Python 3.7 is using "import =
_sysconfigdata_{abi}_{platform}_{multiarch}" which might need a =
dedicated wrapper to "tune" some include path variables.</div><div><br =
class=3D""></div><div>I could hack something =
like&nbsp;meta/recipes-devtools/perl/perl/perl-configpm-switch.patch - =
but maybe someone who is better in Python could do that smoother =
;)</div><div>Please drop me a note ...</div><div><br =
class=3D""></div></div>Cheers<br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_7532E515-A72F-4DA5-96CE-49AD040A1577--

--Apple-Mail=_C721F316-6558-4BB0-BC65-F798127DA980
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvxsJMACgkQRJmWrtzl
Cp0DkBAAihsVG2/EvkhEXoujJTl7nRDzxYNje5cEJ/AmU06p61EKE1xuMeKxSPjZ
GjG+g9CXYhRnmUAb2gd9h6vcHAB2g33eIMZTv8enQJEBSEODCKkyuK/Hpy32gwXV
nuF+Ww2qGulGuTCsAn/tZx+9mK0ppGjUtqtVifNri5SrBsoaMSzOBJd8y4i7meYG
HvjHS0LOjcg2NUxfkM4olIQ6TKkdTowHY/iXOl0T2aRXoT19EE1tDbWOVYi386bZ
ur5glMKTqFnz4vjtu/AXh5kc7eYOjhTTkak1zfTdatzEhSTOv1JfqY3D51uYzlZ2
39tyM/S8ZsCPxt2s8yitRl3hwYoF7Ka6yOy7Lpiw6rCW2x0MczXmk/En7IXEWjbp
2Cy11khcaPUzVl+13EKdUZcbSW5wh7KMM+szV9PHpOvkxGKiiHc6KKDrEL52UYfw
3VQykFn26iPdGZ8OXd/N9PkGHJhJ6rPBGEOYpFMssZBPFvKomiD1+GgLWm4nslFQ
7wNEkWGqE/JRDbZhNK4rGTdKPj4MmT/lJRTKibkCWz5dOHfsyuwd+NuOG4Tjqw77
ZmAwCVFWHBje0qC9NJRMBuKu1ixb9HyIZVcu7zL4BQ/Pn/YTSO3tugG/I5uIpwFM
gAVd4H5K5pctzRBIhg8uVfTsEFqaIDROxk2FE+vgt1NgAVAjKpQ=
=MqZw
-----END PGP SIGNATURE-----

--Apple-Mail=_C721F316-6558-4BB0-BC65-F798127DA980--
