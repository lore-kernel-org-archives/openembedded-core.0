Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5667A783A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AC73B2E6B8;
	Thu, 15 Jun 2017 17:33:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id QRjT1pxB0NEq; Thu, 15 Jun 2017 17:33:26 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E688F2E68F;
	Thu, 15 Jun 2017 17:33:25 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB4F41A069;
	Thu, 15 Jun 2017 17:33:25 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFA631A064;
	Thu, 15 Jun 2017 17:33:25 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Jun 2017 17:33:25 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id B33B8BD;
	Thu, 15 Jun 2017 17:33:25 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 17:33:25 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 17:33:25 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 01/11] gtk+3: Update the patches to work
	without PATCHTOOL = "git"
Thread-Index: AQHS5d9kOhG4vKZAUEeSdO8XWjJMgKIl83VQ///gMwCAACGcYP//4geAgAAhxPD//9/JAAAGQkHg
Date: Thu, 15 Jun 2017 15:33:25 +0000
Message-ID: <1efb5ad739604a94872885a72ec9b4b8@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
	<CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
	<c1d410c6cb3d4e66bef8b80a78a07267@XBOX02.axis.com>
	<febb07f5-af96-82ba-69c1-46f9c7294b00@linux.intel.com>
	<8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
	<55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
	<e5fb0af1b0b3455b93562ef4ecc15f12@XBOX02.axis.com>
	<3d43fd13-b3c2-48cd-b8bf-e16ff8f7c9a8@linux.intel.com>
In-Reply-To: <3d43fd13-b3c2-48cd-b8bf-e16ff8f7c9a8@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Thu, 15 Jun 2017 15:33:28 -0000
X-Groupsio-MsgNum: 98871
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_1efb5ad739604a94872885a72ec9b4b8XBOX02axiscom_"

--_002_1efb5ad739604a94872885a72ec9b4b8XBOX02axiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 15 juni 2017 16:24
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Burton, Ross
> <ross.burton@intel.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 01/11] gtk+3: Update the patches to work
> without PATCHTOOL =3D "git"
>=20
> On 06/15/2017 05:22 PM, Peter Kjellerstedt wrote:
>=20
> >>> Well, I am pretty sure Git patches that rename files are not
> supposed
> >>> to be used, since quilt does not support this AFAIK. So the change
> in
> >>> this patch should be correct.
> >>>
> >>> However, I would be more than happy if anyone can explain why
> others
> >>> are not seeing this (or does everyone have PATCHTOOL =3D "git" in
> their
> >>> configurations somehow?)
> >>
> >> This is unlikely; I certainly don't. Perhaps if you provide the
> exact
> >> command that is being executed, and what is the error it prints, I
> >> could try to do the same?
> >
> > Well, I was running "bitbake core-image-sato", but "bitbake gtk+3"
> should
> > do...
>=20
> What I wanted to see is the failing command (quilt, or patch, or what
> is it specifically), and the error you get. gtk+3 is patched and built
> herewith no issues at all.
>=20
> Alex

It turns out the problem is only seen if opengl is enabled in=20
DISTRO_FEATURES. However, since that is the default for poky, that still=20
does not explain why others do not see the problem

I have included the log.do_compile file where one can see that the=20
file gdkx-with-gl-context.h is missing (that is the file that was=20
supposed to be renamed from gdkx.h by the patch). When I look in=20
tmp/work/i586-poky-linux/gtk+3/3.22.15-r0/gtk+-3.22.15/gdk/x11 I see=20
gdkx.h and gdkx-without-gl-context.h, instead of the expected=20
gdkx-with-gl-context.h and gdkx-without-gl-context.h...

//Peter


--_002_1efb5ad739604a94872885a72ec9b4b8XBOX02axiscom_
Content-Type: application/octet-stream; name="gtk+3.log"
Content-Description: gtk+3.log
Content-Disposition: attachment; filename="gtk+3.log"; size=6560;
	creation-date="Thu, 15 Jun 2017 15:24:12 GMT";
	modification-date="Thu, 15 Jun 2017 15:23:11 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IFNJVEUgZmlsZXMgWydlbmRpYW4tbGl0dGxlJywgJ2JpdC0zMicsICdpeDg2LWNvbW1v
bicsICdjb21tb24tbGludXgnLCAnY29tbW9uLWdsaWJjJywgJ2k1ODYtbGludXgnLCAnY29tbW9u
J10KREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlCisgY2QgL2hvbWUv
cGtqL2Rpc3RzL3Bva3ktbWFzdGVyL2J1aWxkcy9xZW11eDg2L3RtcC93b3JrL2k1ODYtcG9reS1s
aW51eC9ndGsrMy8zLjIyLjE1LXIwL2J1aWxkCisgZG9fY29tcGlsZQorIGV4cG9ydCBHSVJfRVhU
UkFfTElCU19QQVRIPS9ob21lL3Brai9kaXN0cy9wb2t5LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90
bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3RrKzMvMy4yMi4xNS1yMC9idWlsZC9nZGsvLmxpYnMK
KyBHSVJfRVhUUkFfTElCU19QQVRIPS9ob21lL3Brai9kaXN0cy9wb2t5LW1hc3Rlci9idWlsZHMv
cWVtdXg4Ni90bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3RrKzMvMy4yMi4xNS1yMC9idWlsZC9n
ZGsvLmxpYnMKKyBxZW11X2JpbmFyeT0nUFNFVURPX1VOTE9BRD0xIHFlbXUtaTM4NiAtciAzLjIu
MCAgLUwgL2hvbWUvcGtqL2Rpc3RzL3Bva3ktbWFzdGVyL2J1aWxkcy9xZW11eDg2L3RtcC93b3Jr
L2k1ODYtcG9reS1saW51eC9ndGsrMy8zLjIyLjE1LXIwL3JlY2lwZS1zeXNyb290IC1FIExEX0xJ
QlJBUllfUEFUSD0kR0lSX0VYVFJBX0xJQlNfUEFUSDovaG9tZS9wa2ovZGlzdHMvcG9reS1tYXN0
ZXIvYnVpbGRzL3FlbXV4ODYvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L2d0ayszLzMuMjIuMTUt
cjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9saWI6L2hvbWUvcGtqL2Rpc3RzL3Bva3ktbWFzdGVyL2J1
aWxkcy9xZW11eDg2L3RtcC93b3JrL2k1ODYtcG9reS1saW51eC9ndGsrMy8zLjIyLjE1LXIwL3Jl
Y2lwZS1zeXNyb290Ly9saWIgJworIGNhdAorIGNobW9kICt4IC9ob21lL3Brai9kaXN0cy9wb2t5
LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3RrKzMvMy4y
Mi4xNS1yMC9idWlsZC9ndGtkb2MtcWVtdXdyYXBwZXIKKyBhdXRvdG9vbHNfZG9fY29tcGlsZQor
IG9lX3J1bm1ha2UKKyBvZV9ydW5tYWtlX2NhbGwKKyBiYm5vdGUgbWFrZSAtaiA4CisgJ1snIC1w
IC9ob21lL3Brai9kaXN0cy9wb2t5LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90bXAvd29yay9pNTg2
LXBva3ktbGludXgvZ3RrKzMvMy4yMi4xNS1yMC90ZW1wL2ZpZm8uMTAyNjIgJ10nCk5PVEU6IG1h
a2UgLWogOAorIHByaW50ZiAnJWJcMCcgJ2Jibm90ZSBtYWtlIC1qIDgnCisgbWFrZSAtaiA4Cm1h
a2UgIGFsbC1yZWN1cnNpdmUKbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvaG9tZS9wa2ov
ZGlzdHMvcG9reS1tYXN0ZXIvYnVpbGRzL3FlbXV4ODYvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4
L2d0ayszLzMuMjIuMTUtcjAvYnVpbGQnCk1ha2luZyBhbGwgaW4gcG8KbWFrZVsyXTogRW50ZXJp
bmcgZGlyZWN0b3J5IGAvaG9tZS9wa2ovZGlzdHMvcG9reS1tYXN0ZXIvYnVpbGRzL3FlbXV4ODYv
dG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L2d0ayszLzMuMjIuMTUtcjAvYnVpbGQvcG8nCm1ha2Vb
Ml06IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgYGFsbCcuCm1ha2VbMl06IExlYXZpbmcgZGlyZWN0
b3J5IGAvaG9tZS9wa2ovZGlzdHMvcG9reS1tYXN0ZXIvYnVpbGRzL3FlbXV4ODYvdG1wL3dvcmsv
aTU4Ni1wb2t5LWxpbnV4L2d0ayszLzMuMjIuMTUtcjAvYnVpbGQvcG8nCk1ha2luZyBhbGwgaW4g
cG8tcHJvcGVydGllcwptYWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9ob21lL3Brai9kaXN0
cy9wb2t5LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3Rr
KzMvMy4yMi4xNS1yMC9idWlsZC9wby1wcm9wZXJ0aWVzJwptYWtlWzJdOiBOb3RoaW5nIHRvIGJl
IGRvbmUgZm9yIGBhbGwnLgptYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL2hvbWUvcGtqL2Rp
c3RzL3Bva3ktbWFzdGVyL2J1aWxkcy9xZW11eDg2L3RtcC93b3JrL2k1ODYtcG9reS1saW51eC9n
dGsrMy8zLjIyLjE1LXIwL2J1aWxkL3BvLXByb3BlcnRpZXMnCk1ha2luZyBhbGwgaW4gZ2RrCkZh
aWxlZCB0byBvcGVuIGZpbGUg4oCcLi9nZGsuZ3Jlc291cmNlLnhtbOKAnTogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQptYWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9ob21lL3Brai9kaXN0
cy9wb2t5LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3Rr
KzMvMy4yMi4xNS1yMC9idWlsZC9nZGsnCiggY2QgLi4vLi4vZ3RrKy0zLjIyLjE1L2dkayAmJiBn
bGliLW1rZW51bXMgLS10ZW1wbGF0ZSBnZGtlbnVtdHlwZXMuaC50ZW1wbGF0ZSBcCglnZGsuaCBn
ZGstYXV0b2NsZWFudXAuaCBnZGthcHBsYXVuY2hjb250ZXh0LmggZ2RrY2Fpcm8uaCBnZGtjdXJz
b3IuaCBnZGtkZXZpY2UuaCBnZGtkZXZpY2VwYWQuaCBnZGtkZXZpY2V0b29sLmggZ2RrZGV2aWNl
bWFuYWdlci5oIGdka2Rpc3BsYXkuaCBnZGtkaXNwbGF5bWFuYWdlci5oIGdka2RuZC5oIGdka2Ry
YXdpbmdjb250ZXh0LmggZ2RrZXZlbnRzLmggZ2RrZnJhbWV0aW1pbmdzLmggZ2RrZ2xjb250ZXh0
LmggZ2Rra2V5cy5oIGdka2tleXN5bXMuaCBnZGtrZXlzeW1zLWNvbXBhdC5oIGdka21haW4uaCBn
ZGttb25pdG9yLmggZ2RrcGFuZ28uaCBnZGtmcmFtZWNsb2NrLmggZ2RrcGl4YnVmLmggZ2RrcHJp
dmF0ZS5oIGdka3Byb3BlcnR5LmggZ2RrcmVjdGFuZ2xlLmggZ2RrcmdiYS5oIGdka3NjcmVlbi5o
IGdka3NlYXQuaCBnZGtzZWxlY3Rpb24uaCBnZGt0ZXN0dXRpbHMuaCBnZGt0aHJlYWRzLmggZ2Rr
dHlwZXMuaCBnZGt2aXN1YWwuaCBnZGt3aW5kb3cuaCBkZXByZWNhdGVkL2dka2NvbG9yLmggKSA+
PiB4Z2VuLWdldGggXAomJiAoY21wIC1zIHhnZW4tZ2V0aCBnZGtlbnVtdHlwZXMuaCB8fCBjcCB4
Z2VuLWdldGggZ2RrZW51bXR5cGVzLmggKSBcCiYmIHJtIC1mIHhnZW4tZ2V0aCBcCiYmIGVjaG8g
dGltZXN0YW1wID4gc3RhbXAtZ2RrZW51bXR5cGVzLmgKZWNobyAiPD94bWwgdmVyc2lvbj0nMS4w
JyBlbmNvZGluZz0nVVRGLTgnPz4iID4gZ2RrLmdyZXNvdXJjZS54bWw7IFwKZWNobyAiPGdyZXNv
dXJjZXM+IiA+PiBnZGsuZ3Jlc291cmNlLnhtbDsgXAplY2hvICIgIDxncmVzb3VyY2UgcHJlZml4
PScvb3JnL2d0ay9saWJnZGsnPiIgPj4gZ2RrLmdyZXNvdXJjZS54bWw7IFwKZm9yIGYgaW4gLi4v
Li4vZ3RrKy0zLjIyLjE1L2dkay9yZXNvdXJjZXMvZ2xzbC9nbGVzMi10ZXh0dXJlLmZzLmdsc2wg
Li4vLi4vZ3RrKy0zLjIyLjE1L2dkay9yZXNvdXJjZXMvZ2xzbC9nbDItdGV4dHVyZS0yZC5mcy5n
bHNsIC4uLy4uL2d0aystMy4yMi4xNS9nZGsvcmVzb3VyY2VzL2dsc2wvZ2wyLXRleHR1cmUtMmQu
dnMuZ2xzbCAuLi8uLi9ndGsrLTMuMjIuMTUvZ2RrL3Jlc291cmNlcy9nbHNsL2dsMi10ZXh0dXJl
LXJlY3QuZnMuZ2xzbCAuLi8uLi9ndGsrLTMuMjIuMTUvZ2RrL3Jlc291cmNlcy9nbHNsL2dsZXMy
LXRleHR1cmUudnMuZ2xzbCAuLi8uLi9ndGsrLTMuMjIuMTUvZ2RrL3Jlc291cmNlcy9nbHNsL2ds
My10ZXh0dXJlLXJlY3QuZnMuZ2xzbCAuLi8uLi9ndGsrLTMuMjIuMTUvZ2RrL3Jlc291cmNlcy9n
bHNsL2dsMi10ZXh0dXJlLXJlY3QudnMuZ2xzbCAuLi8uLi9ndGsrLTMuMjIuMTUvZ2RrL3Jlc291
cmNlcy9nbHNsL2dsMy10ZXh0dXJlLTJkLnZzLmdsc2wgLi4vLi4vZ3RrKy0zLjIyLjE1L2dkay9y
ZXNvdXJjZXMvZ2xzbC9nbDMtdGV4dHVyZS0yZC5mcy5nbHNsIC4uLy4uL2d0aystMy4yMi4xNS9n
ZGsvcmVzb3VyY2VzL2dsc2wvZ2wzLXRleHR1cmUtcmVjdC52cy5nbHNsOyBkbyBcCiAgbj1gYmFz
ZW5hbWUgJGZgOyBcCiAgZWNobyAiICAgIDxmaWxlIGFsaWFzPSdnbHNsLyRuJz5yZXNvdXJjZXMv
Z2xzbC8kbjwvZmlsZT4iID4+IGdkay5ncmVzb3VyY2UueG1sOyBcCmRvbmU7IFwKZWNobyAiICA8
L2dyZXNvdXJjZT4iID4+IGdkay5ncmVzb3VyY2UueG1sOyBcCmVjaG8gIjwvZ3Jlc291cmNlcz4i
ID4+IGdkay5ncmVzb3VyY2UueG1sOwpjZCAuLiAmJiAvYmluL3NoIC4vY29uZmlnLnN0YXR1cyBn
ZGsvZ2RrY29uZmlnLmggXAomJiBlY2hvIHRpbWVzdGFtcCA+IGdkay9zdGFtcC1nYy1oCmdsaWIt
Y29tcGlsZS1yZXNvdXJjZXMgZ2RrLmdyZXNvdXJjZS54bWwgLS10YXJnZXQ9Z2RrcmVzb3VyY2Vz
LmggXAoJLS1zb3VyY2VkaXI9Li4vLi4vZ3RrKy0zLjIyLjE1L2dkayAtLWMtbmFtZSBfZ2RrIC0t
Z2VuZXJhdGUtaGVhZGVyIC0tbWFudWFsLXJlZ2lzdGVyCmdsaWItY29tcGlsZS1yZXNvdXJjZXMg
Z2RrLmdyZXNvdXJjZS54bWwgLS10YXJnZXQ9Z2RrcmVzb3VyY2VzLmMgXAoJLS1zb3VyY2VkaXI9
Li4vLi4vZ3RrKy0zLjIyLjE1L2dkayAtLWMtbmFtZSBfZ2RrIC0tZ2VuZXJhdGUtc291cmNlIC0t
bWFudWFsLXJlZ2lzdGVyCmNvbmZpZy5zdGF0dXM6IGV4ZWN1dGluZyBnZGsvZ2RrY29uZmlnLmgg
Y29tbWFuZHMKY29uZmlnLnN0YXR1czogZ2RrL2dka2NvbmZpZy5oIGlzIHVuY2hhbmdlZAppZiB0
ZXN0IC1mIGdka2NvbmZpZy5oOyB0aGVuIDo7IFwKZWxzZSBybSAtZiBzdGFtcC1nYy1oOyBtYWtl
IHN0YW1wLWdjLWg7IGZpCm1ha2UgIGFsbC1yZWN1cnNpdmUKbWFrZVszXTogRW50ZXJpbmcgZGly
ZWN0b3J5IGAvaG9tZS9wa2ovZGlzdHMvcG9reS1tYXN0ZXIvYnVpbGRzL3FlbXV4ODYvdG1wL3dv
cmsvaTU4Ni1wb2t5LWxpbnV4L2d0ayszLzMuMjIuMTUtcjAvYnVpbGQvZ2RrJwpNYWtpbmcgYWxs
IGluIHgxMQptYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9ob21lL3Brai9kaXN0cy9wb2t5
LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3RrKzMvMy4y
Mi4xNS1yMC9idWlsZC9nZGsveDExJwpjZCAuLi8uLi8uLi9ndGsrLTMuMjIuMTUvZ2RrL3gxMSBc
CiYmIChjbXAgLXMgZ2RreC13aXRoLWdsLWNvbnRleHQuaCBnZGt4LmggfHwgY3AgZ2RreC13aXRo
LWdsLWNvbnRleHQuaCBnZGt4LmggKQpjcDogY2Fubm90IHN0YXQgYGdka3gtd2l0aC1nbC1jb250
ZXh0LmgnOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cm1ha2VbNF06ICoqKiBbZ2RreC5oXSBF
cnJvciAxCm1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5IGAvaG9tZS9wa2ovZGlzdHMvcG9reS1t
YXN0ZXIvYnVpbGRzL3FlbXV4ODYvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L2d0ayszLzMuMjIu
MTUtcjAvYnVpbGQvZ2RrL3gxMScKbWFrZVszXTogKioqIFthbGwtcmVjdXJzaXZlXSBFcnJvciAx
Cm1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5IGAvaG9tZS9wa2ovZGlzdHMvcG9reS1tYXN0ZXIv
YnVpbGRzL3FlbXV4ODYvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L2d0ayszLzMuMjIuMTUtcjAv
YnVpbGQvZ2RrJwptYWtlWzJdOiAqKiogW2FsbF0gRXJyb3IgMgptYWtlWzJdOiBMZWF2aW5nIGRp
cmVjdG9yeSBgL2hvbWUvcGtqL2Rpc3RzL3Bva3ktbWFzdGVyL2J1aWxkcy9xZW11eDg2L3RtcC93
b3JrL2k1ODYtcG9reS1saW51eC9ndGsrMy8zLjIyLjE1LXIwL2J1aWxkL2dkaycKbWFrZVsxXTog
KioqIFthbGwtcmVjdXJzaXZlXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAv
aG9tZS9wa2ovZGlzdHMvcG9reS1tYXN0ZXIvYnVpbGRzL3FlbXV4ODYvdG1wL3dvcmsvaTU4Ni1w
b2t5LWxpbnV4L2d0ayszLzMuMjIuMTUtcjAvYnVpbGQnCm1ha2U6ICoqKiBbYWxsXSBFcnJvciAy
CisgZGllICdvZV9ydW5tYWtlIGZhaWxlZCcKKyBiYmZhdGFsX2xvZyAnb2VfcnVubWFrZSBmYWls
ZWQnCisgJ1snIC1wIC9ob21lL3Brai9kaXN0cy9wb2t5LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90
bXAvd29yay9pNTg2LXBva3ktbGludXgvZ3RrKzMvMy4yMi4xNS1yMC90ZW1wL2ZpZm8uMTAyNjIg
J10nCkVSUk9SOiBvZV9ydW5tYWtlIGZhaWxlZAorIHByaW50ZiAnJWJcMCcgJ2JiZmF0YWxfbG9n
IG9lX3J1bm1ha2UgZmFpbGVkJworIGV4aXQgMQorIGJiX2V4aXRfaGFuZGxlcgorIHJldD0xCisg
Y2FzZSAkcmV0IGluCisgY2FzZSAkQkFTSF9WRVJTSU9OIGluCisgZWNobyAnV0FSTklORzogL2hv
bWUvcGtqL2Rpc3RzL3Bva3ktbWFzdGVyL2J1aWxkcy9xZW11eDg2L3RtcC93b3JrL2k1ODYtcG9r
eS1saW51eC9ndGsrMy8zLjIyLjE1LXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuMTAyNjI6MSBleGl0
IDEgZnJvbSAnXCcnZXhpdCAxJ1wnJycKV0FSTklORzogL2hvbWUvcGtqL2Rpc3RzL3Bva3ktbWFz
dGVyL2J1aWxkcy9xZW11eDg2L3RtcC93b3JrL2k1ODYtcG9reS1saW51eC9ndGsrMy8zLjIyLjE1
LXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuMTAyNjI6MSBleGl0IDEgZnJvbSAnZXhpdCAxJworIGV4
aXQgMQpFUlJPUjogRnVuY3Rpb24gZmFpbGVkOiBkb19jb21waWxlIChsb2cgZmlsZSBpcyBsb2Nh
dGVkIGF0IC9ob21lL3Brai9kaXN0cy9wb2t5LW1hc3Rlci9idWlsZHMvcWVtdXg4Ni90bXAvd29y
ay9pNTg2LXBva3ktbGludXgvZ3RrKzMvMy4yMi4xNS1yMC90ZW1wL2xvZy5kb19jb21waWxlLjEw
MjYyKQo=

--_002_1efb5ad739604a94872885a72ec9b4b8XBOX02axiscom_--
