Return-Path: <ycnakajsph@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0046779CC0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 13:02:03 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id w12so36129778iol.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1NmChWV8ZdiRzFH3k4pnJr3zsYfT5DYBuWZWmtLqVUE=;
	b=uz/WfbSQmWJfma3vlhVMJ2LKMdReSYq4PjK9st0+b5RpYI6h6Oi08W/MCN6vgxsbIr
	van4G8YihszDAhTJV6Ssn5M1EX0Z9sj1dE6aJte9+B12/mQgF18ta4Y4IIx3mrsrJL4u
	EtAzCWk/tH6GgsC2dYQdlqmVOMwE+KkHDG41c2Isra14Fq6+4LyB2GqzHn94R8AeUURN
	qiT9/8KfdxD+WcQATnaxLnEtP+9feGcr/u6EfXnroucs/bjF17Amvr8vK3r5t9hYm/Dn
	eV5R3ATNPs3Z2xHSQCPsNId4JtUOmsnfOPaDwTBZMCThpmKVzXBPxg9/eVXr800wNRJL
	ydwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1NmChWV8ZdiRzFH3k4pnJr3zsYfT5DYBuWZWmtLqVUE=;
	b=H2br2ahEl/Qp/uluIMlFZ5DaydPrqHH/ELLl9oPyGA/CQwZyM9mGrDGb29tITHkttv
	2Ax0VU9scr31YEJFnVbJ08WALM/fxyULKMJinDOzIdipYBF+ZXCIxhM5HMldDrtEeOA0
	93t8CDrVDAtzM2Q2wY1n7Pru2jp76sv5qeDoUC9mP5BBqjQOj7MiB1McESQJdSR+SS+6
	fHJACKGxHT5fVTWNl/X1XJSfnIYh7fOqJMMz0krUDo7LmxykVNH3QRYC8eARQsmokdMK
	8A+h+btdM4AHmb2666uycAwJNTDPTunjjO/Uub0CpS6BI46MD5FWV1hrLp0m95+ozvPy
	oogg==
X-Gm-Message-State: APjAAAWpq1U+EfuPKEXPz1/scy0ChrdnNcOazRF318uB2E7WrrPb1arr
	NA28cRJavIrrTJc7epcyaRruakBsukUwzQ4xGZyXFPre40dbBQ==
X-Google-Smtp-Source: APXvYqwFl7qhQZF5aX5OEEug9Bk1aLc5QxokscfGau6I2kc2b7+Sn7z/diLxQxvBwY2JvnQ+v4zeovshIGD7FE1zURw=
X-Received: by 2002:a02:9443:: with SMTP id a61mr30971667jai.35.1570539723659; 
	Tue, 08 Oct 2019 06:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAC3TgAJwEr9HVkz+mNHu6WBNouV+qc4AsXcT3dpXt8w4PkYrmw@mail.gmail.com>
In-Reply-To: <CAC3TgAJwEr9HVkz+mNHu6WBNouV+qc4AsXcT3dpXt8w4PkYrmw@mail.gmail.com>
From: Ycn aKaJoseph <ycnakajsph@gmail.com>
Date: Tue, 8 Oct 2019 15:01:51 +0200
Message-ID: <CAC3TgALPsUvXpRJ7=k_LhKfMu--EkYkWVO=n+_p+t4_Kz11oWw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster@mvista.com
Subject: Re: [release-tools][PATCH]Bug 13524 - Add SPDX license headers to all source files for release-tools
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
X-List-Received-Date: Tue, 08 Oct 2019 13:02:04 -0000
X-Groupsio-MsgNum: 129921
Content-Type: multipart/mixed; boundary="00000000000055ec2c059465c6bd"

--00000000000055ec2c059465c6bd
Content-Type: multipart/alternative; boundary="00000000000055ec28059465c6bb"

--00000000000055ec28059465c6bb
Content-Type: text/plain; charset="UTF-8"

From Ross Burton comment here's the patch v2.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13524#c4

regards,

Yann CARDAILLAC

On Tue, Oct 8, 2019 at 1:42 PM Ycn aKaJoseph <ycnakajsph@gmail.com> wrote:

> Hi,
>
> I've been working on bug 13524 :
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13524
>
> Here's the patch.
>
> Basically I've been adding :
>
> # SPDX-License-Identifier: GPL-2.0-or-later
>
> to all .py files.
>
> Regards,
>
> Yann CARDAILLAC
>

--00000000000055ec28059465c6bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>From Ross Burton comment here&#39;s the patch v2.</di=
v><div><br></div><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D13524#c4">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D135=
24#c4</a></div><div><br></div><div>regards,</div><div><br></div><div>Yann C=
ARDAILLAC<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Oct 8, 2019 at 1:42 PM Ycn aKaJoseph &lt;<a href=3D"ma=
ilto:ycnakajsph@gmail.com" target=3D"_blank">ycnakajsph@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;ve been working on bug 135=
24 :</div><div><br></div><div><a href=3D"https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D13524" target=3D"_blank">https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D13524</a></div><div><br></div><div>Here&#39;s the patch=
. <br></div><div><br></div><div>Basically I&#39;ve been adding :<br></div><=
div><br></div><div># SPDX-License-Identifier: GPL-2.0-or-later</div><div><b=
r></div><div>to all .py files.<br></div><div><br></div><div>Regards,</div><=
div><br></div><div>Yann CARDAILLAC<br></div></div>
</blockquote></div>
</div>

--00000000000055ec28059465c6bb--

--00000000000055ec2c059465c6bd
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-add-License-SPDX-identifier-to-scripts.patch"
Content-Disposition: attachment; 
	filename="0001-add-License-SPDX-identifier-to-scripts.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k1husdw60>
X-Attachment-Id: f_k1husdw60

RnJvbSA1OTRiYmM0ZTk5YjdjNzY4NTYzNDM5MDY0OTk5ZWI3Njc5ZDcwZmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5uIENBUkRBSUxMQUMgPHljbmFrYWpzcGhAZ21haWwuY29t
PgpEYXRlOiBUdWUsIDggT2N0IDIwMTkgMTQ6NTk6NTUgKzAyMDAKU3ViamVjdDogW1BBVENIXSBh
ZGQgTGljZW5zZSBTUERYIGlkZW50aWZpZXIgdG8gc2NyaXB0cwoKU2lnbmVkLW9mZi1ieTogWWFu
biBDQVJEQUlMTEFDIDx5Y25ha2Fqc3BoQGdtYWlsLmNvbT4KLS0tCiBhbm5vdW5jZS5weSAgICB8
IDEgKwogZ2V0X2N2ZXMucHkgICAgfCAxICsKIGdldF9oYXNoZXMucHkgIHwgMSArCiByZWxfdHlw
ZS5weSAgICB8IDEgKwogcmVsZWFzZS5weSAgICAgfCAxICsKIHJlbG5vdGVzLnB5ICAgIHwgMSAr
CiB0ZXN0cmVzdWx0cy5weSB8IDEgKwogdW5paGFzaC5weSAgICAgfCAxICsKIHVuaW5hdGl2ZS5w
eSAgIHwgMSArCiB1dGlscy5weSAgICAgICB8IDEgKwogd2hlcmVfYW1faS5weSAgfCAxICsKIDEx
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hbm5vdW5jZS5w
eSBiL2Fubm91bmNlLnB5CmluZGV4IDFkYzAyNmIuLmMyYzg2MGIgMTAwNzU1Ci0tLSBhL2Fubm91
bmNlLnB5CisrKyBiL2Fubm91bmNlLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAnJycKIENyZWF0ZWQgb24gSnVuZSAxOSwgMjAxOQog
CmRpZmYgLS1naXQgYS9nZXRfY3Zlcy5weSBiL2dldF9jdmVzLnB5CmluZGV4IDk5NDZhZjUuLjEz
ZGQ4MjUgMTAwNzU1Ci0tLSBhL2dldF9jdmVzLnB5CisrKyBiL2dldF9jdmVzLnB5CkBAIC0xLDMg
KzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAnJycKIENy
ZWF0ZWQgb24gTm92IDcsIDIwMTgKIApkaWZmIC0tZ2l0IGEvZ2V0X2hhc2hlcy5weSBiL2dldF9o
YXNoZXMucHkKaW5kZXggZDgzYjY0ZC4uM2Q2OWFhMiAxMDA3NTUKLS0tIGEvZ2V0X2hhc2hlcy5w
eQorKysgYi9nZXRfaGFzaGVzLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5CiAnJycKIENyZWF0ZWQgb24gT2N0IDE2LCAyMDE4CiAKZGlm
ZiAtLWdpdCBhL3JlbF90eXBlLnB5IGIvcmVsX3R5cGUucHkKaW5kZXggZGExZGZkMS4uNzcyMTQx
OSAxMDA3NTUKLS0tIGEvcmVsX3R5cGUucHkKKysrIGIvcmVsX3R5cGUucHkKQEAgLTEsMyArMSw0
IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICcnJwogQ3JlYXRl
ZCBvbiBPY3QgMTYsIDIwMTgKIApkaWZmIC0tZ2l0IGEvcmVsZWFzZS5weSBiL3JlbGVhc2UucHkK
aW5kZXggYmY4Y2QzZS4uYTRlNWZkZSAxMDA3NTUKLS0tIGEvcmVsZWFzZS5weQorKysgYi9yZWxl
YXNlLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5CiAnJycKIENyZWF0ZWQgb24gSmFuIDcsIDIwMTYKIApkaWZmIC0tZ2l0IGEvcmVsbm90
ZXMucHkgYi9yZWxub3Rlcy5weQppbmRleCA0OTU0ZmYxLi5mNTViODY2IDEwMDc1NQotLS0gYS9y
ZWxub3Rlcy5weQorKysgYi9yZWxub3Rlcy5weQpAQCAtMSwzICsxLDQgQEAKKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogJycnCiBDcmVhdGVkIG9uIEZlYiAyMiwgMjAx
NgogCmRpZmYgLS1naXQgYS90ZXN0cmVzdWx0cy5weSBiL3Rlc3RyZXN1bHRzLnB5CmluZGV4IDY1
ZjhhN2MuLjFhM2RjOTUgMTAwNzU1Ci0tLSBhL3Rlc3RyZXN1bHRzLnB5CisrKyBiL3Rlc3RyZXN1
bHRzLnB5CkBAIC0xLDMgKzEsNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5CiAnJycKIENyZWF0ZWQgb24gSnVuZSAyMCwgMjAxOQogCmRpZmYgLS1naXQgYS91bmlo
YXNoLnB5IGIvdW5paGFzaC5weQppbmRleCA1MDU0YjkwLi5iZjJjYmIzIDEwMDY0NAotLS0gYS91
bmloYXNoLnB5CisrKyBiL3VuaWhhc2gucHkKQEAgLTEsMyArMSw0IEBACisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICcnJwogQ3JlYXRlZCBvbiBBdWd1c3QgNywgMjAx
OAogCmRpZmYgLS1naXQgYS91bmluYXRpdmUucHkgYi91bmluYXRpdmUucHkKaW5kZXggMTQ0YTI2
MC4uYmVlZWZmMSAxMDA2NDQKLS0tIGEvdW5pbmF0aXZlLnB5CisrKyBiL3VuaW5hdGl2ZS5weQpA
QCAtMSwzICsxLDQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQog
JycnCiBDcmVhdGVkIG9uIEp1bHkgMzEsIDIwMTcKIApkaWZmIC0tZ2l0IGEvdXRpbHMucHkgYi91
dGlscy5weQppbmRleCA2Y2I4ZTIwLi5iNDEzOTU3IDEwMDY0NAotLS0gYS91dGlscy5weQorKysg
Yi91dGlscy5weQpAQCAtMSwzICsxLDQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQogJycnCiBDcmVhdGVkIG9uIE9jdCAxNiwgMjAxOAogCmRpZmYgLS1naXQgYS93
aGVyZV9hbV9pLnB5IGIvd2hlcmVfYW1faS5weQppbmRleCA5ODU0ZDliLi5jM2IwNWJkIDEwMDY0
NAotLS0gYS93aGVyZV9hbV9pLnB5CisrKyBiL3doZXJlX2FtX2kucHkKQEAgLTEsMyArMSw0IEBA
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKICcnJwogQ3JlYXRlZCBv
biBBdWcgMjEsIDIwMTgKIAotLSAKMi43LjQKCg==

--00000000000055ec2c059465c6bd--
