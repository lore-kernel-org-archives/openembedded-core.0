Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id C4D777490D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 14:15:14 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id k5-v6so4706102oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Dc/1/fPkgwEqOL7bbEsPgssmwyByWBQrYSxJDgRgArU=;
	b=vedNMvwYMOza2ppm2r1imJ6d/6vg6ejH9IYvjsmir/At1QfgZzJkQ6cRLVYvRAH7rF
	k95FWoUgv6XXiy1f2j2n9A9KXMn19Pt2KJFogQvucAI8Bc0v/TgyyDvz1M/WeSiHyXP7
	Ga6dTeXzRaSlym3E43nf1HcplVXMvC/K4R3dA+fjQI0a567+jxxv34O3FPafPEZgyW0F
	6OrgAyicFnXrJkFQ04SPQaW3uoS6Ehbhcecgx/JSHBfgdIGk7+belReGjC5K7o3oyjjz
	xI402Dl4pcAkf3ateyn3ENl304kjgmJpoa04fgP9tvtymWyGgjao+mhLwdFdD+jixQ31
	ma1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Dc/1/fPkgwEqOL7bbEsPgssmwyByWBQrYSxJDgRgArU=;
	b=IMpDTOssRcCoYdYpQh6ggdNng0wK3m/ZOS5xDU3HuZ5GLQox9zTYXKkNVNvOuXjTSL
	sDXXsAXx00jbRyeG8iLmCfqN6iJ4Tz2QlQN7eBSB8bHe7FNOU+1oPsqhkf1I9mD0aJcQ
	3kz14Gu1kTFDtuvYlka1hYCdDAwph/0xZEfMR4bydNdk6xsVwzep/bC5XOaGn8gf8OHt
	P8nYYiqvnGdXDEvTGZ4fzpTz2R43+9ZVZqQVGTR+48U47iL4877ixwogsDbV49v7xK4c
	wiOl80/j/RVrcXWHe72n4s7CStreSv8YA8Zzgr6is5EjwrF0jlVsOXfOlGlZTlo75lmD
	gi2g==
X-Gm-Message-State: ALKqPwcqQWHnYUQzFJdoPn+/rrbREsK//pyOjWsTN/iaeLEWVD9nrIjV
	Qcd2QFoOM2lnzCPc+nWrYuE28cbxzVdsfNxvDffyQA==
X-Google-Smtp-Source: ADUXVKJAld7hWFQsSCP8ezbnhoiH2s8VSQVkwBK/AXR/mO68PTaxMq5dg6iGreLv+crzS4ERA95QAoEbpIRppmXVTo4=
X-Received: by 2002:aca:ea55:: with SMTP id
	i82-v6mr1505266oih.260.1527257715355; 
	Fri, 25 May 2018 07:15:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2927:0:0:0:0:0 with HTTP; Fri, 25 May 2018 07:14:54
	-0700 (PDT)
From: nick83ola <nick83ola@gmail.com>
Date: Fri, 25 May 2018 15:14:54 +0100
Message-ID: <CABPh3UPoC9VF-6iTMykf8Ohj5SmTBAD7FYUdbd-abTBrWju_=w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/3] Mosquitto add a mosquitto conf and logging to the default mosquitto recipe
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
X-List-Received-Date: Fri, 25 May 2018 14:15:14 -0000
X-Groupsio-MsgNum: 111759
Content-Type: multipart/mixed; boundary="0000000000009ad1a7056d0865f3"

--0000000000009ad1a7056d0865f3
Content-Type: multipart/alternative; boundary="0000000000009ad1a3056d0865f1"

--0000000000009ad1a3056d0865f1
Content-Type: text/plain; charset="UTF-8"

The openembedded recipe for mosquitto doesn't provide a default
configuration file.

Also it install a bunch of examples.

This series of patches provide a "default" configuration file and setup
logging.


Cheers

Nicola Lunghi

--0000000000009ad1a3056d0865f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin-top:0px;margin-bottom:0px">The openembe=
dded recipe for mosquitto doesn&#39;t provide a default configuration file.=
</p><p style=3D"margin-top:0px;margin-bottom:0px">Also it install a bunch o=
f examples.<br></p><p style=3D"margin-top:0px;margin-bottom:0px">This serie=
s of patches provide a &quot;default&quot; configuration file and setup log=
ging.</p><p style=3D"margin-top:0px;margin-bottom:0px"><br></p><p style=3D"=
margin-top:0px;margin-bottom:0px">Cheers</p><p style=3D"margin-top:0px;marg=
in-bottom:0px">Nicola Lunghi</p><br></div>

--0000000000009ad1a3056d0865f1--

--0000000000009ad1a7056d0865f3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mosquitto-remove-example-files-from-installation.patch"
Content-Disposition: attachment; 
	filename="0001-mosquitto-remove-example-files-from-installation.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jhm1spvl0

RnJvbSAxZTYyYjcwNmNlMzM1MTk0NjgwNzgyYjRlNWYyMDBhMDEyMzcxOGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNvbGEgTHVuZ2hpIDxuaWNvbGEubHVuZ2hpQGpjaS5jb20+
CkRhdGU6IEZyaSwgMjUgTWF5IDIwMTggMTQ6MjA6MDggKzAxMDAKU3ViamVjdDogW1BBVENIIDEv
M10gbW9zcXVpdHRvOiByZW1vdmUgZXhhbXBsZSBmaWxlcyBmcm9tIGluc3RhbGxhdGlvbgoKVGhl
IG1vc3F1aXR0byBtYWtlZmlsZSBpbnN0YWxsIGEgbG90IG9mIGV4YW1wbGUgY29uZmlndXJhdGlv
biBmaWxlcwpvbiB0aGUgaW1hZ2U6IHJlbW92ZSB0aG9zZQoKQ2hhbmdlLUlkOiBJNGQ4YWY4NjRm
OTU1ZWE1ZGMzNGEzNGZmMTFhN2QzMDEzYWVmYmVkYQpTaWduZWQtb2ZmLWJ5OiBOaWNvbGEgTHVu
Z2hpIDxuaWNvbGEubHVuZ2hpQGpjaS5jb20+Ci0tLQogLi4uL2ZpbGVzLzAwMDMtcmVtb3ZlLWV4
YW1wbGUtZmlsZXMucGF0Y2ggICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKwogLi4uL21vc3F1
aXR0by9tb3NxdWl0dG9fMS40LjE0LmJiICAgICAgICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCAzNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmlsZXMvMDAwMy1yZW1vdmUtZXhhbXBsZS1maWxlcy5w
YXRjaAoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRv
L2ZpbGVzLzAwMDMtcmVtb3ZlLWV4YW1wbGUtZmlsZXMucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L21vc3F1aXR0by9maWxlcy8wMDAzLXJlbW92ZS1leGFtcGxlLWZpbGVzLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uYTU1NjZhMDc0Ci0tLSAv
ZGV2L251bGwKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb3NxdWl0dG8vZmls
ZXMvMDAwMy1yZW1vdmUtZXhhbXBsZS1maWxlcy5wYXRjaApAQCAtMCwwICsxLDM1IEBACitGcm9t
IGYwZTk3YzE2ZmUwZDQ5ZjYxZTVkYTBhYTg4NGY0ZjdkNWE5MTFlOTAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBOaWNvbGEgTHVuZ2hpIDxuaWNvbGEubHVuZ2hpQGpjaS5jb20+CitE
YXRlOiBNb24sIDI2IE1hciAyMDE4IDEyOjIxOjQzICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIHJl
bW92ZWQgZXhhbXBsZSBmaWxlcworCistLS0KKyBNYWtlZmlsZSB8IDkgLS0tLS0tLS0tCisgMSBm
aWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01h
a2VmaWxlCitpbmRleCAxZmMwODA1Li43NmY4MWIxIDEwMDY0NAorLS0tIGEvTWFrZWZpbGUKKysr
KyBiL01ha2VmaWxlCitAQCAtMzksMTggKzM5LDkgQEAgaW5zdGFsbCA6IG1vc3F1aXR0bworIGlm
ZXEgKCQoV0lUSF9ET0NTKSx5ZXMpCisgCXNldCAtZTsgZm9yIGQgaW4gJHtET0NESVJTfTsgZG8g
JChNQUtFKSAtQyAkJHtkfSBpbnN0YWxsOyBkb25lCisgZW5kaWYKKy0JJChJTlNUQUxMKSAtZCAk
e0RFU1RESVJ9L2V0Yy9tb3NxdWl0dG8KKy0JJChJTlNUQUxMKSAtbSA2NDQgbW9zcXVpdHRvLmNv
bmYgJHtERVNURElSfS9ldGMvbW9zcXVpdHRvL21vc3F1aXR0by5jb25mLmV4YW1wbGUKKy0JJChJ
TlNUQUxMKSAtbSA2NDQgYWNsZmlsZS5leGFtcGxlICR7REVTVERJUn0vZXRjL21vc3F1aXR0by9h
Y2xmaWxlLmV4YW1wbGUKKy0JJChJTlNUQUxMKSAtbSA2NDQgcHdmaWxlLmV4YW1wbGUgJHtERVNU
RElSfS9ldGMvbW9zcXVpdHRvL3B3ZmlsZS5leGFtcGxlCistCSQoSU5TVEFMTCkgLW0gNjQ0IHBz
a2ZpbGUuZXhhbXBsZSAke0RFU1RESVJ9L2V0Yy9tb3NxdWl0dG8vcHNrZmlsZS5leGFtcGxlCisg
CisgdW5pbnN0YWxsIDoKKyAJc2V0IC1lOyBmb3IgZCBpbiAke0RJUlN9OyBkbyAkKE1BS0UpIC1D
ICQke2R9IHVuaW5zdGFsbDsgZG9uZQorLQlybSAtZiAke0RFU1RESVJ9L2V0Yy9tb3NxdWl0dG8v
bW9zcXVpdHRvLmNvbmYKKy0Jcm0gLWYgJHtERVNURElSfS9ldGMvbW9zcXVpdHRvL2FjbGZpbGUu
ZXhhbXBsZQorLQlybSAtZiAke0RFU1RESVJ9L2V0Yy9tb3NxdWl0dG8vcHdmaWxlLmV4YW1wbGUK
Ky0Jcm0gLWYgJHtERVNURElSfS9ldGMvbW9zcXVpdHRvL3Bza2ZpbGUuZXhhbXBsZQorIAorIGRp
c3QgOiByZWFsbHljbGVhbgorIAlzZXQgLWU7IGZvciBkIGluICR7RElTVERJUlN9OyBkbyAkKE1B
S0UpIC1DICQke2R9IGRpc3Q7IGRvbmUKKy0tIAorMi4xNC4xCisKZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRvL21vc3F1aXR0b18xLjQuMTQuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vc3F1aXR0by9tb3NxdWl0dG9fMS40LjE0LmJi
CmluZGV4IDEzY2UzODExZC4uNzZlYjc5YjlmIDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L21vc3F1aXR0by9tb3NxdWl0dG9fMS40LjE0LmJiCisrKyBiL21ldGEtb2Uv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbW9zcXVpdHRvL21vc3F1aXR0b18xLjQuMTQuYmIKQEAgLTEz
LDYgKzEzLDcgQEAgREVQRU5EUyA9ICJ1dGhhc2giCiBTUkNfVVJJID0gImh0dHA6Ly9tb3NxdWl0
dG8ub3JnL2ZpbGVzL3NvdXJjZS9tb3NxdWl0dG8tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtY29uZmlnLm1rLWFsbG93LXByZWZpeC1tYW5kaXItbG9jYWxlZGlyLWZyb20t
ZW52aXJvbi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXV0aGFzaC1yZW1vdmUtaW4t
dHJlZS12ZXJzaW9uLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDMtcmVtb3ZlLWV4YW1w
bGUtZmlsZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vbW9zcXVpdHRvLnNlcnZpY2UgXAog
ICAgICAgICAgICBmaWxlOi8vbW9zcXVpdHRvLmluaXQgXAogIgotLSAKMi4xNy4wCgo=

--0000000000009ad1a7056d0865f3--
