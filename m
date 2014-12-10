Return-Path: <lh_post@yahoo.com>
Received: from nm3-vm5.bullet.mail.ne1.yahoo.com
	(nm3-vm5.bullet.mail.ne1.yahoo.com [98.138.91.225])
	by mail.openembedded.org (Postfix) with ESMTP id E1B0D722AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 08:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1418199057; bh=2NET8hiLaa6LTzbaZqEbyTgVXzbur1Y8JQ1omVS3Ln0=;
	h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
	b=q/SpRtS552yud/agAvzBHS+MHSWsengr2wSkBdHMdO4fhnuycX2/kBZPEPR8OUjbmbMFNQLrYBY4JZmTONORvRxTk1nBSktpB6f28+0ys8ropX7idC5tDbAVwKg+pd74X3hoaFIlqhuBdPyNKe7sBBkyzKusYJ3lszrEHUA11gcHt/zONJLN9tEuxruxxaI9KUhHet+4A7P0yBCYtHFiSG1OS0eW1d7qPOP6/vidhMHxXmMAufW6cUN3PPO7MdiU4STn7XVm/mdi3xavfPOj3NMTfuBLkdmyZ2rVDPfKWADUQJvvw3uOFXOPb0Opzoual6bc1ZlqYYeFL2014JnvWQ==
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s2048; d=yahoo.com;
	b=Xb36G3CDct+JL67wWOe5RlVnUGMurQGznOaHYvH+mHJwq7TneyIKc9Drt1EfKr2cfcPIwjWKNCvCWm4o72uZCU5sKQIJcDT2zghUlHoExZ8kiyt2auIWUj5Xdc8mRQRW0Evm01x1xJrky4pVr2pTz/GowKF8djYBSClF73BuplB1YEGGrjx+iRqgmNnTH3r0iX140ptbNdgRCNYZAsg/jhqsx9MaVhQCIEtlplYHETdbO/pOHPzZh96P1UtIa5aC0nQZ1iqMonvrgPQrqeZv4ZE1JeGF/pb/9OhrbbTRb9E7okEw4Gbmy147Q9VcJr2ZW5bSTM92FbkxIZ+isU7DwA==;
Received: from [98.138.100.116] by nm3.bullet.mail.ne1.yahoo.com with NNFMP;
	10 Dec 2014 08:10:57 -0000
Received: from [98.138.89.163] by tm107.bullet.mail.ne1.yahoo.com with NNFMP;
	10 Dec 2014 08:10:57 -0000
Received: from [127.0.0.1] by omp1019.mail.ne1.yahoo.com with NNFMP;
	10 Dec 2014 08:10:57 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 192915.93001.bm@omp1019.mail.ne1.yahoo.com
X-YMail-OSG: FbKzhakVM1n6cyEAD_W2tzvwlZHqXh.8tISdH74tL9nYblTnoc_MRw9k9EzfBRu
	Vf5g5zi6KZofiIFgbMXpNJ70QiIetthep0Av.dHntEGHO5rotw2iTtihXNuXlq0NLd0Sk341fO0j
	6vzCKBIIw9rlOOeI8yO1HqyQzucsrR1tgHAbRk44X07VdYAOB8UKJbc4G0PuMk4HRCuMy46BuTkV
	iqiFQNBEO6JUt0L81icaQBO_Z7w7G5NGdcMZIySkoAwo2bleY5_lkm51WiYNQwLLBJGGKlbPPmfB
	wAdNQEzaR0iUfuSMnBoGnkzCyc2I94P6UDW7F8kxxrTV22esB3Gc.gAQMaKKi5r9CKxRhcrZt1U_
	dYcRNhErtfasWNIFn0b_.61oGqShuANDahksylJfPOlzEvk41PN2mJoVa5qS99w_c0GDd_ngpl23
	H9F3xKnkpgFOSwB_iuISk2TD3z7iOyXPgHywK7oSAE2wfIrR4OIEgJSGIR50hWnMD9osfHoJ2Htk
	Otv_2HZUNv9PIIpcQZEnmVcZZlZIyn7dweXvI
Received: by 98.138.101.181; Wed, 10 Dec 2014 08:10:56 +0000 
Date: Wed, 10 Dec 2014 08:10:56 +0000 (UTC)
From: Lars Michael <lh_post@yahoo.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <1018146195.4734038.1418199056251.JavaMail.yahoo@jws10083.mail.ne1.yahoo.com>
In-Reply-To: <mailman.1581.1418174979.1406.openembedded-core@lists.openembedded.org>
References: <mailman.1581.1418174979.1406.openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
Subject: Problem building image with opkg and gpg support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: Lars Michael <lh_post@yahoo.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Dec 2014 08:11:00 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_4734037_1966222192.1418199056246"

------=_Part_4734037_1966222192.1418199056246
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,
I hope this post hits the right list..=C2=A0
On daisy I have switched to opkg, this works fine (target wandboard).
To support signed packages I have added gpg to the PACKAGECONFIG for opkg. =
I have done this by creating an opkg_0.2.1.bbappend file with the line:=C2=
=A0PACKAGECONFIG +=3D "gpg"
In my image recipe I added:IMAGE_INSTALL_append =3D " opkg"IMAGE_INSTALL_ap=
pend =3D " gpgme"
'bitbake opkg' seems to run ok and builds libgpgme and opkg ipk's. But when=
 I run 'bitbake myimage' I get:
ERROR: Nothing PROVIDES 'gpgme-native' (but virtual:native:/media/datadisk/=
arm/fsl-community-bsp-daisy/sources/poky/meta/recipes-devtools/opkg/opkg_0.=
2.1.bb DEPENDS on or otherwise requires it). Close matches:=C2=A0 gperf-nat=
ive=C2=A0 rpm-native=C2=A0 gmp-nativeERROR: Required build target 'myimage'=
 has no buildable providers.Missing or unbuildable dependency chain was: ['=
myimage', 'opkg-native', 'gpgme-native']
Any ideas on what the problem might be?
ThanksLars

------=_Part_4734037_1966222192.1418199056246
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:He=
lveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;fo=
nt-size:16px"><div id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" di=
r=3D"ltr" class=3D"" style=3D"">Hi all,</div><div id=3D"yiv6155668665yui_3_=
16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D""><br></div><d=
iv id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=
=3D"" style=3D"">I hope this post hits the right list..&nbsp;</div><div id=
=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" =
style=3D""><br></div><div id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513=
861" dir=3D"ltr" class=3D"" style=3D"">On daisy I have switched to opkg, th=
is works fine (target wandboard).</div><div id=3D"yiv6155668665yui_3_16_0_1=
_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D""><br class=3D"" sty=
le=3D""></div><div id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" di=
r=3D"ltr" class=3D"" style=3D"">To support signed packages I have added gpg=
 to the PACKAGECONFIG for opkg. I have done this by creating an opkg_0.2.1.=
bbappend file with the line:&nbsp;</div><div id=3D"yiv6155668665yui_3_16_0_=
1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"">PACKAGECONFIG +=
=3D "gpg"</div><div id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" d=
ir=3D"ltr" class=3D"" style=3D""><br class=3D"" style=3D""></div><div id=3D=
"yiv6155668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" sty=
le=3D"">In my image recipe I added:</div><div id=3D"yiv6155668665yui_3_16_0=
_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D""><div id=3D"yiv61=
55668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"=
">IMAGE_INSTALL_append =3D " opkg"</div><div id=3D"yiv6155668665yui_3_16_0_=
1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"">IMAGE_INSTALL_app=
end =3D " gpgme"</div></div><div id=3D"yiv6155668665yui_3_16_0_1_1417703927=
302_513861" dir=3D"ltr" class=3D"" style=3D""><br class=3D"" style=3D""></d=
iv><div id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" c=
lass=3D"" style=3D"">'bitbake opkg' seems to run ok and builds libgpgme and=
 opkg ipk's. But when I run 'bitbake myimage' I get:</div><div id=3D"yiv615=
5668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D""=
><br class=3D"" style=3D""></div><div id=3D"yiv6155668665yui_3_16_0_1_14177=
03927302_513861" dir=3D"ltr" class=3D"" style=3D""><div id=3D"yiv6155668665=
yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"">ERROR:=
 Nothing PROVIDES 'gpgme-native' (but virtual:native:/media/datadisk/arm/fs=
l-community-bsp-daisy/sources/poky/meta/recipes-devtools/opkg/opkg_0.2.1.bb=
 DEPENDS on or otherwise requires it). Close matches:</div><div id=3D"yiv61=
55668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"=
">&nbsp; gperf-native</div><div id=3D"yiv6155668665yui_3_16_0_1_14177039273=
02_513861" dir=3D"ltr" class=3D"" style=3D"">&nbsp; rpm-native</div><div id=
=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" =
style=3D"">&nbsp; gmp-native</div><div id=3D"yiv6155668665yui_3_16_0_1_1417=
703927302_513861" dir=3D"ltr" class=3D"" style=3D"">ERROR: Required build t=
arget 'myimage' has no buildable providers.</div><div id=3D"yiv6155668665yu=
i_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"">Missing =
or unbuildable dependency chain was: ['myimage', 'opkg-native', 'gpgme-nati=
ve']</div><div class=3D"" id=3D"yiv6155668665yui_3_16_0_1_1418032794617_297=
8" style=3D""><br class=3D"" style=3D""></div></div><div id=3D"yiv615566866=
5yui_3_16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"">Any i=
deas on what the problem might be?</div><div id=3D"yiv6155668665yui_3_16_0_=
1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D""><br class=3D"" st=
yle=3D""></div><div id=3D"yiv6155668665yui_3_16_0_1_1417703927302_513861" d=
ir=3D"ltr" class=3D"" style=3D"">Thanks</div><div id=3D"yiv6155668665yui_3_=
16_0_1_1417703927302_513861" dir=3D"ltr" class=3D"" style=3D"">Lars</div>  =
</div></body></html>

------=_Part_4734037_1966222192.1418199056246--
