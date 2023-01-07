Return-Path: <tyrocjl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB83DC54EBC
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 10:53:33 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.17927.1673088813003186172
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 02:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYapJO0P;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: tyrocjl@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id fy8so8755449ejc.13
        for <Openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 02:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7K9YYqxIP55BNaXzdQI9STNi7Cs9HZQCQxYRnJP2awI=;
        b=gYapJO0PVXzVcTbJ/K7VDH/eiLYpwDAlFN20YZ8FM6jJFEIvGzqbZDp7mjAuAqmBxz
         yzXij+QXlflXBfeS6lBoynQ8k01OnCAI+WU77kdBh/58HTCh0RJ3lebehvmIUxsObSmj
         uFpGjeXGr9fG05g5nE+LyO3yzEOqvHq3ff3KWrqb5esPaIdRm0/kybQoAw6M1YO1f3b2
         sFedo97Eb8Cib88DMmZqxhDzzbNeH8anYmjSYd4n5CFUZJqTHcFvq+np/88ipbOooIhV
         C1VGagz2LLc7Gul5xX4dx74l6yMvLLzV6yzuF5SaYNHGN9ohPYW7ZikOu62NvVK3rsTX
         RPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7K9YYqxIP55BNaXzdQI9STNi7Cs9HZQCQxYRnJP2awI=;
        b=yJh+L9ne0xf2jbCeveh19EVnfYeI3AS2HH63B6wuhxBBVlZvaqCE1pO4/PFSfLliKS
         B6k9GQsaoTcqAYVZyDc+h5aWIcwisMutm/wVUIAmYEV7x/w+s85lKV416AlpKs6MklSn
         1qUp110/k5m36gztOjy+DzOTu+dxYd2vp/11Y5m5vkmZb2vyuMVrx8A0njKm5loeDmzG
         rhujFaPOpGU6qz5KGAttywb5dwEc33JO/gWmOKbnvKhtUQ0N3pqjzZH+sh5x8a3MVIEZ
         Wv6ZUMq47fjI2NwPel0tDK16wuv9Veyf7YYHf+KmntuUF9HDObv/GhFgvFl2b31+wo4w
         Sxsg==
X-Gm-Message-State: AFqh2kpswi3/nVe0WkK325jE/bnSkKPr/Lt3d3i4C0N3RDVVRGQ6m/i4
	Zl2luMLvigOd1jqLGUqdmEarp8piFtRtU/gPKGuukxMVWqoczw==
X-Google-Smtp-Source: AMrXdXuP1B9QeEWbSBPd6afDAxRm7RkMf8YeBbli4t+ZguJ/KZWRxfwfR348+hkeoNjZ6jlGA8ysYTUlCGTAiAuGObw=
X-Received: by 2002:a17:906:2297:b0:7c0:eafd:9ad5 with SMTP id
 p23-20020a170906229700b007c0eafd9ad5mr4744053eja.532.1673088811126; Sat, 07
 Jan 2023 02:53:31 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?6JSh57qq6Imv?= <tyrocjl@gmail.com>
Date: Sat, 7 Jan 2023 18:54:09 +0800
Message-ID: <CANzPQ-CLqpi4ML7kLOmWq4+3QLWx-CH8FrEg8QJD7ZGC_4iRXQ@mail.gmail.com>
Subject: [kirkstone][PATCH] Let the KCONFIG_MODE alldefconfig mode take effect
To: Openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, randy.macleod@windriver.com
Content-Type: multipart/mixed; boundary="00000000000044242505f1aa583f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 10:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175618

--00000000000044242505f1aa583f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When building kernel using in-tree defconfig, set KBUILD_DEFCONFIG, but the
KCONFIG_MODE is not what the documentation says set to alldefconfig.

The documentation says:
    An =E2=80=9Cin-tree=E2=80=9D defconfig file will be handled in alldefco=
nfig mode, a
defconfig file placed in ${WORKDIR} through a meta-layer will be handled
in allnoconfig mode"

    https://docs.yoctoproject.org/4.0.6/ref-manual/variables.html#term-KCON=
FIG_MODE

So I made a patch fix it.
Thanks.

--00000000000044242505f1aa583f
Content-Type: application/octet-stream; 
	name="0001-Let-the-KCONFIG_MODE-alldefconfig-mode-take-effect.patch"
Content-Disposition: attachment; 
	filename="0001-Let-the-KCONFIG_MODE-alldefconfig-mode-take-effect.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lcltkgbg0>
X-Attachment-Id: f_lcltkgbg0

RnJvbSBkYTlkM2E0ODMyZTIzNjEyZGY3ODBkNzViYjVjMDNhNzk5ZWU1N2Q1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiamlsaWFuZy5jYWkiIDx0eXJvY2psQGdtYWlsLmNvbT4KRGF0
ZTogU2F0LCA3IEphbiAyMDIzIDE3OjUxOjMyICswODAwClN1YmplY3Q6IFtraXJrc3RvbmVdW1BB
VENIXSBMZXQgdGhlIEtDT05GSUdfTU9ERSBhbGxkZWZjb25maWcgbW9kZSB0YWtlIGVmZmVjdApN
SU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKV2hlbiBidWlsZCBrZXJuZWwgdXNpbmcg
aW4tdHJlZSBkZWZjb25maWcsIHNldCBLQlVJTERfREVGQ09ORklHLCBidXQgdGhlCktDT05GSUdf
TU9ERSBpcyBub3Qgd2hhdCB0aGUgZG9jdW1lbnRhdGlvbiBzYXlzIHNldCB0byBhbGxkZWZjb25m
aWcuCgpUaGUgZG9jdW1lbnRhdGlvbiBzYXlzOgogICAgQW4g4oCcaW4tdHJlZeKAnSBkZWZjb25m
aWcgZmlsZSB3aWxsIGJlIGhhbmRsZWQgaW4gYWxsZGVmY29uZmlnIG1vZGUsIGEKZGVmY29uZmln
IGZpbGUgcGxhY2VkIGluICR7V09SS0RJUn0gdGhyb3VnaCBhIG1ldGEtbGF5ZXIgd2lsbCBiZSBo
YW5kbGVkCmluIGFsbG5vY29uZmlnIG1vZGUiCgogICAgaHR0cHM6Ly9kb2NzLnlvY3RvcHJvamVj
dC5vcmcvNC4wLjYvcmVmLW1hbnVhbC92YXJpYWJsZXMuaHRtbCN0ZXJtLUtDT05GSUdfTU9ERQoK
U2lnbmVkLW9mZi1ieTogamlsaWFuZy5jYWkgPHR5cm9jamxAZ21haWwuY29tPgotLS0KIG1ldGEv
Y2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJi
Y2xhc3MgYi9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3MKaW5kZXggODJlNzkyMzUx
Zi4uMmM2ZjgxOWQ3OCAxMDA2NDQKLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNs
YXNzCisrKyBiL21ldGEvY2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcwpAQCAtNzE4LDYgKzcx
OCwxMSBAQCBweXRob24gKCkgewogICAgICAgICAjIElmIHdlIGRlbHRhc2sgZG9fcGF0Y2gsIGRv
X2tlcm5lbF9jb25maWdtZSBpcyBsZWZ0IHdpdGhvdXQKICAgICAgICAgIyBkZXBlbmRlbmNpZXMg
YW5kIHJ1bnMgdG9vIGVhcmx5CiAgICAgICAgIGQuc2V0VmFyRmxhZygnZG9fa2VybmVsX2NvbmZp
Z21lJywgJ2RlcHMnLCAoZC5nZXRWYXJGbGFnKCdkb19rZXJuZWxfY29uZmlnbWUnLCAnZGVwcycs
IEZhbHNlKSBvciBbXSkgKyBbJ2RvX3VucGFjayddKQorCisgICAgIyBBbiDigJxpbi10cmVl4oCd
IGRlZmNvbmZpZyBmaWxlIHdpbGwgYmUgaGFuZGxlZCBpbiBhbGxkZWZjb25maWcgbW9kZQorICAg
IGtidWlsZF9kZWZjb25maWcgPSBkLmdldFZhcigiS0JVSUxEX0RFRkNPTkZJRyIpIG9yICIiCisg
ICAgaWYga2J1aWxkX2RlZmNvbmZpZzoKKyAgICAgICAgZC5zZXRWYXIoIktDT05GSUdfTU9ERSIs
ICJhbGxkZWZjb25maWciKQogfQogCiAjIGV4dHJhIHRhc2tzCi0tIAoyLjI1LjEKCg==
--00000000000044242505f1aa583f--

