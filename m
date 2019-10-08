Return-Path: <ycnakajsph@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id E7AEC7F260
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 11:42:29 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id z19so35855104ior.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=EABZM7aQKyVYbf+kjj8gXXzD8DRYNhOi6RtsPYa1MnI=;
	b=XjnByhm9CzMAROUkB0MxeKBjecH7JQsslkxYcfeJ/os/P/I51Ufcin8XAkT+6HZAs9
	9LUay0TqdV1csZzHNsDBlf0OVglpYeNGURJny/uw3NaBD7eXecgk5P3vePSPJheShehW
	fwL53gqb/tvaTXlPqBE5Q2yKTEzTS7h4Qtvich5fvtV4m4N62TI94tOyzrcVWeHNolmI
	ZIChV9FzEp+6vzJmpeqyXMKeqWrvqRnEuWZUcm7agjwLZi62Qd1Pgb3RWp/lXJPAOzUI
	WIpDu+GMvCpJWzTA0R653KMDCFirwECbeL2jX3zhuDIabLRegnlw2NNxcmCSvDgA/YfX
	7cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=EABZM7aQKyVYbf+kjj8gXXzD8DRYNhOi6RtsPYa1MnI=;
	b=iVT8sOHb2HKR1nTVtEe9XgcYRP2IazniJYgfmo5nYCJ5T5cr20nmQP+SpdSi9T3EKD
	NN4RnfxziuwMRWqsUEG9xjiHeJMojWdJwchHO+RdscN3LaZZmujuhSYmSt/cP4gVY4wt
	D0YqamONvjfQbkAW0Y2fEy/dp4kq9B24cN9yHKTfWQpnohivSJC95YNTCSwqIrSTSZN0
	ldZn+U97lS9usSIEkibhqj3adJjyTaDCwWcmaN4WbhPYj3lPwL3fZkT3OIVbgTsHmvj7
	xxg6zAnf0WbxgSS7bs9xuL09qQAm/6/hy4eqqxyj9qzsreZi/D33fwa37xdTXNwK+bsR
	KJgA==
X-Gm-Message-State: APjAAAXLaQ67LXaCrFUyuLdjztv3LRsqg5I34shyFTR6UZZHwujT0RcT
	CacY81qlyj59TTl5x7poiRFIInHm+PSlxI+xYVzJQE5fJcU=
X-Google-Smtp-Source: APXvYqzDBTf9GKmpgmBAEk1uLQ5UBZdp9rmrlqlZSP27/NkZbpQcnLyHWA3//R7UydPUsDb3Nuy8UrVtcwr6m4fvMWo=
X-Received: by 2002:a6b:b643:: with SMTP id g64mr28139657iof.149.1570534950427;
	Tue, 08 Oct 2019 04:42:30 -0700 (PDT)
MIME-Version: 1.0
From: Ycn aKaJoseph <ycnakajsph@gmail.com>
Date: Tue, 8 Oct 2019 13:42:18 +0200
Message-ID: <CAC3TgAJwEr9HVkz+mNHu6WBNouV+qc4AsXcT3dpXt8w4PkYrmw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster@mvista.com
Subject: [release-tools][PATCH]Bug 13524 - Add SPDX license headers to all source files for release-tools
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
X-List-Received-Date: Tue, 08 Oct 2019 11:42:30 -0000
X-Groupsio-MsgNum: 129917
Content-Type: multipart/mixed; boundary="000000000000d44927059464a94e"

--000000000000d44927059464a94e
Content-Type: multipart/alternative; boundary="000000000000d44925059464a94c"

--000000000000d44925059464a94c
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been working on bug 13524 :

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13524

Here's the patch.

Basically I've been adding :

# SPDX-License-Identifier: GPL-2.0-or-later

to all .py files.

Regards,

Yann CARDAILLAC

--000000000000d44925059464a94c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;ve been working on=
 bug 13524 :</div><div><br></div><div><a href=3D"https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D13524">https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D13524</a></div><div><br></div><div>Here&#39;s the patch. <br></di=
v><div><br></div><div>Basically I&#39;ve been adding :<br></div><div><br></=
div><div># SPDX-License-Identifier: GPL-2.0-or-later</div><div><br></div><d=
iv>to all .py files.<br></div><div><br></div><div>Regards,</div><div><br></=
div><div>Yann CARDAILLAC<br></div></div>

--000000000000d44925059464a94c--

--000000000000d44927059464a94e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-add-License-SPDX-identifier-to-scripts.patch"
Content-Disposition: attachment; 
	filename="0001-add-License-SPDX-identifier-to-scripts.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k1hrv6rz0>
X-Attachment-Id: f_k1hrv6rz0

RnJvbSBkODliZWY2ZTdiMjMwYTYyN2FlZGQ2NzM2ODY1MDk0OTVlYTNlZDUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5uIENBUkRBSUxMQUMgPHljbmFrYWpzcGhAZ21haWwuY29t
PgpEYXRlOiBUdWUsIDggT2N0IDIwMTkgMTM6MzM6MzkgKzAyMDAKU3ViamVjdDogW1BBVENIXSBh
ZGQgTGljZW5zZSBTUERYIGlkZW50aWZpZXIgdG8gc2NyaXB0cwoKU2lnbmVkLW9mZi1ieTogWWFu
biBDQVJEQUlMTEFDIDx5Y25ha2Fqc3BoQGdtYWlsLmNvbT4KLS0tCiBhbm5vdW5jZS5weSAgICB8
IDEgKwogZ2V0X2N2ZXMucHkgICAgfCAxICsKIGdldF9oYXNoZXMucHkgIHwgMSArCiByZWxfdHlw
ZS5weSAgICB8IDEgKwogcmVsZWFzZS5weSAgICAgfCAxICsKIHJlbG5vdGVzLnB5ICAgIHwgMSAr
CiB0ZXN0cmVzdWx0cy5weSB8IDEgKwogdW5paGFzaC5weSAgICAgfCAxICsKIHVuaW5hdGl2ZS5w
eSAgIHwgMSArCiB1dGlscy5weSAgICAgICB8IDEgKwogd2hlcmVfYW1faS5weSAgfCAxICsKIDEx
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hbm5vdW5jZS5w
eSBiL2Fubm91bmNlLnB5CmluZGV4IDFkYzAyNmIuLjVlZDhjZTkgMTAwNzU1Ci0tLSBhL2Fubm91
bmNlLnB5CisrKyBiL2Fubm91bmNlLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogJycnCiBDcmVhdGVkIG9uIEp1bmUgMTksIDIw
MTkKIApkaWZmIC0tZ2l0IGEvZ2V0X2N2ZXMucHkgYi9nZXRfY3Zlcy5weQppbmRleCA5OTQ2YWY1
Li4wODFhOTQwIDEwMDc1NQotLS0gYS9nZXRfY3Zlcy5weQorKysgYi9nZXRfY3Zlcy5weQpAQCAt
MSwzICsxLDQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIK
ICcnJwogQ3JlYXRlZCBvbiBOb3YgNywgMjAxOAogCmRpZmYgLS1naXQgYS9nZXRfaGFzaGVzLnB5
IGIvZ2V0X2hhc2hlcy5weQppbmRleCBkODNiNjRkLi42ZTEzYjMzIDEwMDc1NQotLS0gYS9nZXRf
aGFzaGVzLnB5CisrKyBiL2dldF9oYXNoZXMucHkKQEAgLTEsMyArMSw0IEBACisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCiAnJycKIENyZWF0ZWQgb24gT2N0IDE2
LCAyMDE4CiAKZGlmZiAtLWdpdCBhL3JlbF90eXBlLnB5IGIvcmVsX3R5cGUucHkKaW5kZXggZGEx
ZGZkMS4uZDg1YzU5NiAxMDA3NTUKLS0tIGEvcmVsX3R5cGUucHkKKysrIGIvcmVsX3R5cGUucHkK
QEAgLTEsMyArMSw0IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxh
dGVyCiAnJycKIENyZWF0ZWQgb24gT2N0IDE2LCAyMDE4CiAKZGlmZiAtLWdpdCBhL3JlbGVhc2Uu
cHkgYi9yZWxlYXNlLnB5CmluZGV4IGJmOGNkM2UuLmFkMWM3MGQgMTAwNzU1Ci0tLSBhL3JlbGVh
c2UucHkKKysrIGIvcmVsZWFzZS5weQpAQCAtMSwzICsxLDQgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKICcnJwogQ3JlYXRlZCBvbiBKYW4gNywgMjAxNgog
CmRpZmYgLS1naXQgYS9yZWxub3Rlcy5weSBiL3JlbG5vdGVzLnB5CmluZGV4IDQ5NTRmZjEuLmM2
MDRhOTggMTAwNzU1Ci0tLSBhL3JlbG5vdGVzLnB5CisrKyBiL3JlbG5vdGVzLnB5CkBAIC0xLDMg
KzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogJycn
CiBDcmVhdGVkIG9uIEZlYiAyMiwgMjAxNgogCmRpZmYgLS1naXQgYS90ZXN0cmVzdWx0cy5weSBi
L3Rlc3RyZXN1bHRzLnB5CmluZGV4IDY1ZjhhN2MuLjQwZThjOTcgMTAwNzU1Ci0tLSBhL3Rlc3Ry
ZXN1bHRzLnB5CisrKyBiL3Rlc3RyZXN1bHRzLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogJycnCiBDcmVhdGVkIG9uIEp1bmUg
MjAsIDIwMTkKIApkaWZmIC0tZ2l0IGEvdW5paGFzaC5weSBiL3VuaWhhc2gucHkKaW5kZXggNTA1
NGI5MC4uMzgxZTIwYyAxMDA2NDQKLS0tIGEvdW5paGFzaC5weQorKysgYi91bmloYXNoLnB5CkBA
IC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRl
cgogJycnCiBDcmVhdGVkIG9uIEF1Z3VzdCA3LCAyMDE4CiAKZGlmZiAtLWdpdCBhL3VuaW5hdGl2
ZS5weSBiL3VuaW5hdGl2ZS5weQppbmRleCAxNDRhMjYwLi5mNTI3MWFlIDEwMDY0NAotLS0gYS91
bmluYXRpdmUucHkKKysrIGIvdW5pbmF0aXZlLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogJycnCiBDcmVhdGVkIG9uIEp1bHkg
MzEsIDIwMTcKIApkaWZmIC0tZ2l0IGEvdXRpbHMucHkgYi91dGlscy5weQppbmRleCA2Y2I4ZTIw
Li5iYWE3Y2U3IDEwMDY0NAotLS0gYS91dGlscy5weQorKysgYi91dGlscy5weQpAQCAtMSwzICsx
LDQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKICcnJwog
Q3JlYXRlZCBvbiBPY3QgMTYsIDIwMTgKIApkaWZmIC0tZ2l0IGEvd2hlcmVfYW1faS5weSBiL3do
ZXJlX2FtX2kucHkKaW5kZXggOTg1NGQ5Yi4uNjYyMDk1ZCAxMDA2NDQKLS0tIGEvd2hlcmVfYW1f
aS5weQorKysgYi93aGVyZV9hbV9pLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgogJycnCiBDcmVhdGVkIG9uIEF1ZyAyMSwgMjAx
OAogCi0tIAoyLjcuNAoK

--000000000000d44927059464a94e--
