Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B32C43217
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.24352.1665871393102585204
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=B96H2ghx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010183ddac3cad-f2c53c7c-8a9f-45e3-950a-729d7d6e1a3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pa9O1jCFmZ4+2Svbtpm4qghLHlPIICs5PQbATiWnSus=;
	b=B96H2ghxCnuF5Yy5VWBeV/zG0BosPPKR9GAGbB0ih/bNgxfSLB+nyQYoWbjiN4L+
	UoyMiNJ7x63FMmInH5BXSSGkaPz0VT3TfWeypC7Rlh0FPmTQTpkZ3TXhcQM+TAEo2gr
	CnG+bc9S/ODhSKtVdWjqoRm75wt+gmyH1iNQ8O20=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pa9O1jCFmZ4+2Svbtpm4qghLHlPIICs5PQbATiWnSus=;
	b=Hq6gJ7KE6BRSvTEC2wKehR48j/9T5UsHc4WZDPHp0cIFvSu25X19aBbI1GznWprx
	bDmWru+vlGQHDg3+dBjlF50ipwE12WHQkF3jypnsMEifku3yVAHwj1L9Yvn+x0pCLji
	nhfPH91p1rWsJwtRjRYhSPSZGHrLniKdv2az71yU=
Content-Type: multipart/mixed; boundary="===============1958715505690067450=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20221012 SUCCEEDED
Message-ID: <01010183ddac3cad-f2c53c7c-8a9f-45e3-950a-729d7d6e1a3d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171849

--===============1958715505690067450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20221012* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220913-20221012.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1958715505690067450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 22506459 to 24912219 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/adlp_guc_70.bin /lib/firmware/i915/tgl_huc.bin /lib/firmware/i915/dg1_guc_70.bin /lib/firmware/i915/dg1_huc.bin /lib/firmware/i915/tgl_guc_70.bin /lib/firmware/i915/dg2_guc_70.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t5fw-1.26.6.0.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg /lib/firmware/cxgb4/t4fw-1.26.6.0.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/cxgb4/t6fw-1.26.6.0.bin", added "/lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg /lib/firmware/mediatek/sof/sof-mt8195.ldc /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg /lib/firmware/mediatek/sof/sof-mt8186.ldc /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg /lib/firmware/mediatek/sof/sof-mt8195.ri /lib/firmware/cxgb4/t5fw-1.27.0.0.bin /lib/firmware/cxgb4/t6fw-1.27.0.0.bin /lib/firmware/cxgb4/t4fw-1.27.0.0.bin /lib/firmware/qcom/apq8096/a530_zap.mbn"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/cxgb4/t4fw.bin changed symlink target from t4fw-1.26.6.0.bin to t4fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t5fw.bin changed symlink target from t5fw-1.26.6.0.bin to t5fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t6fw.bin changed symlink target from t6fw-1.26.6.0.bin to t6fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t4fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t5fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t6fw-1.27.0.0.bin was added
  /lib/firmware/i915/adlp_guc_70.bin was added
  /lib/firmware/i915/dg1_guc_70.bin was added
  /lib/firmware/i915/dg1_huc.bin was added
  /lib/firmware/i915/dg2_guc_70.bin was added
  /lib/firmware/i915/tgl_guc_70.bin was added
  /lib/firmware/i915/tgl_huc.bin was added
  /lib/firmware/mediatek/sof/sof-mt8186.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ri was added
  /lib/firmware/mediatek/sof-tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg was added
  /lib/firmware/qcom/apq8096/a530_zap.mbn was added
  /lib/firmware/cxgb4/t4fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t5fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t6fw-1.26.6.0.bin was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was removed

--===============1958715505690067450==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220913-20221012.patch"

RnJvbSAwZTE3NzRiMWEyMjc1MGI4ZTk2NTg1MTYyZTQzMDlmNzc4NGRkOWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTc6MTA6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIyMDkxMyAtPiAyMDIyMTAxMgoKLS0tCiAuLi4yMDIy
MDkxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIyMTAxMi5iYn0gfCAxOTcgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTk0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMjA5MTMuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMjEwMTIuYmJ9ICg4OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIyMDkxMy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMjEwMTIuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIyMDkxMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIyMTAxMi5iYgppbmRleCA0NWM5ZDBlODYxLi5kMjI1NTk4YTZmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIw
OTEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMjEwMTIuYmIKQEAgLTEsMyArMSwxOTQgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTlNFLmFtZC11Y29kZQorIyArKysgTElDRU5TRS5hbWQtdWNvZGUKKyMgQEAgLTEsNCAr
MSw0IEBACisjIC1Db3B5cmlnaHQgKEMpIDIwMTAtMjAxOCBBZHZhbmNlZCBNaWNybyBEZXZpY2Vz
LCBJbmMuLCBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyArQ29weXJpZ2h0IChDKSAyMDEwLTIwMjIg
QWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiwgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAor
IyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCBieSBBZHZhbmNlZCBNaWNybyBEZXZpY2Vz
LCBJbmMuICgiQU1EIiksCisjICBmcmVlIG9mIGFueSBsaWNlbnNlIGZlZXMsIHRvIGFueSBwZXJz
b24gb2J0YWluaW5nIGEgY29weSBvZiB0aGlzCisjIC0tLSBXSEVOQ0UKKyMgKysrIFdIRU5DRQor
IyBAQCAtNTM2LDE0ICs1MzYsMTQgQEAKKyMgIAorIyAgRmlsZTogY3hnYjQvdDRmdy0xLjE0LjQu
MC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q0ZnctMS4xNS4zNy4wLmJpbgorIyAtRmlsZTogY3hnYjQv
dDRmdy0xLjI2LjYuMC5iaW4KKyMgLUxpbms6IGN4Z2I0L3Q0ZncuYmluIC0+IHQ0ZnctMS4yNi42
LjAuYmluCisjICtGaWxlOiBjeGdiNC90NGZ3LTEuMjcuMC4wLmJpbgorIyArTGluazogY3hnYjQv
dDRmdy5iaW4gLT4gdDRmdy0xLjI3LjAuMC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNC40
LjAuYmluCisjICBGaWxlOiBjeGdiNC90NWZ3LTEuMTUuMzcuMC5iaW4KKyMgLUZpbGU6IGN4Z2I0
L3Q1ZnctMS4yNi42LjAuYmluCisjIC1MaW5rOiBjeGdiNC90NWZ3LmJpbiAtPiB0NWZ3LTEuMjYu
Ni4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDZmdy0xLjI2LjYuMC5iaW4KKyMgLUxpbms6IGN4Z2I0
L3Q2ZncuYmluIC0+IHQ2ZnctMS4yNi42LjAuYmluCisjICtGaWxlOiBjeGdiNC90NWZ3LTEuMjcu
MC4wLmJpbgorIyArTGluazogY3hnYjQvdDVmdy5iaW4gLT4gdDVmdy0xLjI3LjAuMC5iaW4KKyMg
K0ZpbGU6IGN4Z2I0L3Q2ZnctMS4yNy4wLjAuYmluCisjICtMaW5rOiBjeGdiNC90NmZ3LmJpbiAt
PiB0NmZ3LTEuMjcuMC4wLmJpbgorIyAgRmlsZTogY3hnYjQvYXExMjAyX2Z3LmNsZAorIyAgRmls
ZTogY3hnYjQvYmNtODQ4My5iaW4KKyMgIEZpbGU6IGN4Z2I0L2NvbmZpZ3MvdDQtY29uZmlnLWRl
ZmF1bHQudHh0CisjIEBAIC0zOTcxLDcgKzM5NzEsNyBAQAorIyAgRmlsZTogYW1kLXVjb2RlL21p
Y3JvY29kZV9hbWRfZmFtMTdoLmJpbgorIyAgVmVyc2lvbjogMjAyMi0wNC0wOAorIyAgRmlsZTog
YW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAtVmVyc2lvbjogMjAyMi0wNC0w
OAorIyArVmVyc2lvbjogMjAyMi0wOS0zMAorIyAgRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyAg
CisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC11Y29kZSBmb3Ig
ZGV0YWlscworIyBAQCAtNDYyOSw2ICs0NjI5LDkgQEAKKyMgIEZpbGU6IGk5MTUvdGdsX2d1Y183
MC4xLjEuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4xIGZvciBUaWdlcmxh
a2UKKyMgIAorIyArRmlsZTogaTkxNS90Z2xfZ3VjXzcwLmJpbgorIyArVmVyc2lvbjogR3VDIEFQ
SS9BUEIgdmVyIDcwLjUuMSBmb3IgVGlnZXJsYWtlCisjICsKKyMgIEZpbGU6IGk5MTUvdGdsX2h1
Y183LjAuMy5iaW4KKyMgIFZlcnNpb246IEh1YyBBUEkvQVBCIHZlciA3IHJlbGVhc2UgMCBmb3Ig
VGlnZXJsYWtlCisjICAKKyMgQEAgLTQ2NDEsNiArNDY0NCw5IEBACisjICBGaWxlOiBpOTE1L3Rn
bF9odWNfNy45LjMuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgNy45LjMgZm9yIFRp
Z2VybGFrZQorIyAgCisjICtGaWxlOiBpOTE1L3RnbF9odWMuYmluCisjICtWZXJzaW9uOiBIdUMg
QVBJL0FQQiB2ZXIgNy45LjMgZm9yIFRpZ2VybGFrZQorIyArCisjICBGaWxlOiBpOTE1L3JrbF9k
bWNfdmVyMl8wMi5iaW4KKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMiBm
b3IgUm9ja2V0bGFrZQorIyAgCisjIEBAIC00NjYyLDEyICs0NjY4LDE4IEBACisjICBGaWxlOiBp
OTE1L2RnMV9ndWNfNzAuMS4xLmJpbgorIyAgVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjEu
MSBmb3IgREcxCisjICAKKyMgK0ZpbGU6IGk5MTUvZGcxX2d1Y183MC5iaW4KKyMgK1ZlcnNpb246
IEd1QyBBUEkvQVBCIHZlciA3MC41LjEgZm9yIERHMQorIyArCisjICBGaWxlOiBpOTE1L2RnMV9o
dWNfNy43LjEuYmluCisjICBWZXJzaW9uOiBIdWMgQVBJL0FQQiB2ZXIgNyByZWxlYXNlIDEgZm9y
IERHMQorIyAgCisjICBGaWxlOiBpOTE1L2RnMV9odWNfNy45LjMuYmluCisjICBWZXJzaW9uOiBI
dUMgQVBJL0FQQiB2ZXIgNy45LjMgZm9yIERHMQorIyAgCisjICtGaWxlOiBpOTE1L2RnMV9odWMu
YmluCisjICtWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgNy45LjMgZm9yIERHMQorIyArCisjICBG
aWxlOiBpOTE1L2FkbHNfZG1jX3ZlcjJfMDEuYmluCisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2
ZXIgMiByZWxlYXNlIDEgZm9yIEFsZGVybGFrZSBTCisjICAKKyMgQEAgLTQ2OTUsMTEgKzQ3MDcs
MTcgQEAKKyMgIEZpbGU6IGk5MTUvYWRscF9ndWNfNzAuMS4xLmJpbgorIyAgVmVyc2lvbjogR3VD
IEFQSS9BUEIgdmVyIDcwLjEuMSBmb3IgQWxkZXJsYWtlIFAKKyMgIAorIyArRmlsZTogaTkxNS9h
ZGxwX2d1Y183MC5iaW4KKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC41LjEgZm9yIEFs
ZGVybGFrZSBQCisjICsKKyMgIEZpbGU6IGk5MTUvZGcyX2d1Y183MC4xLjIuYmluCisjICBWZXJz
aW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4yIGZvciBERzIKKyMgIAorIyAgRmlsZTogaTkxNS9k
ZzJfZ3VjXzcwLjQuMS5iaW4KKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40LjEgZm9y
IERHMgorIyArCisjICtGaWxlOiBpOTE1L2RnMl9ndWNfNzAuYmluCisjICtWZXJzaW9uOiBHdUMg
QVBJL0FQQiB2ZXIgNzAuNS4xIGZvciBERzIKKyMgIAorIyAgRmlsZTogaTkxNS9kZzJfZG1jX3Zl
cjJfMDYuYmluCisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDYgZm9yIERH
MgorIyBAQCAtNTE5MiwxMSArNTIxMCwxMSBAQAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ4MTgzL3Nj
cC5pbWcKKyMgIFZlcnNpb246IHYyLjAuMTMzMjQKKyMgIEZpbGU6IG1lZGlhdGVrL210ODE4Ni9z
Y3AuaW1nCisjIC1WZXJzaW9uOiB2MC4wLjYKKyMgK1ZlcnNpb246IHYwLjAuOQorIyAgRmlsZTog
bWVkaWF0ZWsvbXQ4MTkyL3NjcC5pbWcKKyMgIFZlcnNpb246IHYyLjAuODU0OAorIyAgRmlsZTog
bWVkaWF0ZWsvbXQ4MTk1L3NjcC5pbWcKKyMgLVZlcnNpb246IHYyLjAuMTMzMjQKKyMgK1ZlcnNp
b246IHYyLjAuMTE5NTYKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTM0OCw5ICs1MzY2LDkgQEAK
KyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIFdpcmVsZXNzIE1BQ3MKKyMgIAor
IyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmluCisjIC1W
ZXJzaW9uOiAyMDIyMDYwODIxMDgzOWEKKyMgK1ZlcnNpb246IDIwMjIwOTA4MjEwOTE5YQorIyAg
RmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5NjFfMS5iaW4KKyMgLVZlcnNpb246IDIw
MjIwNjA4MjEwOTIyCisjICtWZXJzaW9uOiAyMDIyMDkwODIxMTAyMQorIyAgCisjICBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAg
CisjIEBAIC01MzU5LDcgKzUzNzcsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBN
VDc5MjEgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NP
REVfTVQ3OTYxXzFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDIyMDYwODIxMTExMQorIyArVmVy
c2lvbjogMjAyMjA5MDgyMTEyMzQKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTM2OCw5ICs1Mzg2
LDkgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIFdpcmVsZXNzIE1BQ3MK
KyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIuYmlu
CisjIC1WZXJzaW9uOiAyMDIyMDUyMzEwMzM0NWEKKyMgK1ZlcnNpb246IDIwMjIwOTA4MjAzMjAz
YQorIyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5MjJfMS5iaW4KKyMgLVZlcnNp
b246IDIwMjIwNTIzMTAzNDQ3CisjICtWZXJzaW9uOiAyMDIyMDkwODIwMzI1MworIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxz
LgorIyAgCisjIEBAIC01Mzc5LDcgKzUzOTcsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjIgLSBNZWRp
YVRlayBNVDc5MjIgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRf
UkFNX0NPREVfTVQ3OTIyXzFfMV9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDIyMDUyMzEwMzgzMgor
IyArVmVyc2lvbjogMjAyMjA5MDgyMTEyMzQKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTU5Nyw2
ICs1NjE1LDcgQEAKKyMgIEZpbGU6IHFjb20vYTUzMF96YXAuYjAxCisjICBGaWxlOiBxY29tL2E1
MzBfemFwLmIwMgorIyAgRmlsZTogcWNvbS9hNTMwX3phcC5tZHQKKyMgK0ZpbGU6IHFjb20vYXBx
ODA5Ni9hNTMwX3phcC5tYm4KKyMgIEZpbGU6IHFjb20vYTYzMF9nbXUuYmluCisjICBGaWxlOiBx
Y29tL2E2MzBfc3FlLmZ3CisjICBGaWxlOiBxY29tL3NkbTg0NS9hNjMwX3phcC5tYm4KKyMgQEAg
LTU5NTksOSArNTk3OCwxNSBAQAorIyAgRHJpdmVyOiBtdGstc29mIC0gTWVkaWFUZWsgU291bmQg
T3BlbiBGaXJtd2FyZSBkcml2ZXIKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvc29mL3NvZi1tdDgx
ODYucmkKKyMgLUZpbGU6IG1lZGlhdGVrL3NvZi9zb2YtbXQ4MTg2LW10NjM2Ni1kYTcyMTktbWF4
OTgzNTcudHBsZworIyAtRmlsZTogbWVkaWF0ZWsvc29mL3NvZi1tdDgxODYtbXQ2MzY2LXJ0MTAx
OS1ydDU2ODJzLnRwbGcKKyMgLVZlcnNpb246IHYwLjIuMAorIyArRmlsZTogbWVkaWF0ZWsvc29m
L3NvZi1tdDgxODYubGRjCisjICtGaWxlOiBtZWRpYXRlay9zb2YtdHBsZy9zb2YtbXQ4MTg2LnRw
bGcKKyMgK1ZlcnNpb246IHYwLjIuMQorIyArCisjICtGaWxlOiBtZWRpYXRlay9zb2Yvc29mLW10
ODE5NS5yaQorIyArRmlsZTogbWVkaWF0ZWsvc29mL3NvZi1tdDgxOTUubGRjCisjICtGaWxlOiBt
ZWRpYXRlay9zb2YtdHBsZy9zb2YtbXQ4MTk1LW10NjM1OS1ydDEwMTktcnQ1NjgyLnRwbGcKKyMg
K0ZpbGU6IG1lZGlhdGVrL3NvZi10cGxnL3NvZi1tdDgxOTUtbXQ2MzU5LXJ0MTAxOS1ydDU2ODIt
ZHRzLnRwbGcKKyMgK1ZlcnNpb246IHYwLjQuMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIAorIworCiBT
VU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJuZWwiCiBIT01F
UEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0gIkxpbnV4IGZp
cm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExpbnV4IGtlcm5l
bCBcCkBAIC03MSw3ICsyNjIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNF
LkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0OGVhZGMyMmI4YmMgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5hZHNwX3NzdDttZDU9NjE1YzQ1YjkxYTVhNGE5ZmUw
NDZkNmFiOWEyZGY3MjggXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5hZ2Vy
ZTttZDU9YWYwMTMzZGU2YjRhOWIyNTIyZGVmZDVmMTg4YWZkMzEgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vTElDRU5TRS5hbWRncHU7bWQ1PTQ0YzExNjZkMDUyMjI2Y2IyZDZjOGQ3NDAw
MDkwMjAzIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0UuYW1kLXVjb2RlO21k
NT0zYzUzOTlkYzkxNDhkN2YwZTFmNDFlMzRiNjljZjE0ZiBcCisgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9MSUNFTlNFLmFtZC11Y29kZTttZDU9NmNhOTBjNTdmN2IyNDhkZTFlMjVjN2Y2OGZm
YzQ2OTggXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5hbWxvZ2ljX3ZkZWM7
bWQ1PWRjNDRmNTliZjY0YTgxNjQzZTUwMGFkM2YzOWE0NjhhIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0xJQ0VOQ0UuYXRoZXJvc19maXJtd2FyZTttZDU9MzBhMTRjNzgyM2JlZWRhYzlm
YTM5YzY0ZmRkMDFhMTMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5hdG1l
bDttZDU9YWE3NGFjMGM2MDU5NWRlZTRkNGUyMzkxMDdlYTc3YTMgXApAQCAtMTI4LDcgKzMxOSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0
MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9M
SUNFTkNFLnhjNDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIz
YzMyYzdmNGQwOTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0Uu
eGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9ZDZkOWQ3NGEzNDRhNzgwMjhlNmIwZjFkZjgw
ZGIxNGIgXAogICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZp
bmVkIHNlcGFyYXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3Ry
ZWFtIGlzIHNlbGVjdGVkLgpAQCAtMjA5LDcgKzQwMCw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBz
dHJlYW0gPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zp
cm13CiAjIFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGlu
IGxvY2FsLmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFk
ZmQyMTBjOTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2ZmQw
MGYyZDhlOTZjNGFmNmY0NDI2OWE2Yjg5M2ViODU3MjUzMDQ0Zjc1YWQyOGVmNjcwNmEyMjUwY2Q4
ZTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTlkMTc0YWY3Mjk1MTFjOGNjY2I2MGVjNGUwYjIy
M2IzYzQ0YjY3ZDgxM2I0MmQxYWI5ODEzYWNmYTY2N2ZhNSIKIAogaW5oZXJpdCBhbGxhcmNoCiAK
LS0gCjIuMzEuMQoK

--===============1958715505690067450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220913.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221012.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg1_huc.bin /lib/firmware/i915/tgl_guc_70.bin /lib/firmware/i915/dg1_guc_70.bin /lib/firmware/i915/dg2_guc_70.bin /lib/firmware/i915/tgl_huc.bin /lib/firmware/i915/adlp_guc_70.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 22506459 to 24912219 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1753268 to 1744896 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 190374 to 190990 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/cxgb4/t6fw-1.26.6.0.bin /lib/firmware/cxgb4/t4fw-1.26.6.0.bin /lib/firmware/cxgb4/t5fw-1.26.6.0.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg", added "/lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg /lib/firmware/cxgb4/t6fw-1.27.0.0.bin /lib/firmware/cxgb4/t5fw-1.27.0.0.bin /lib/firmware/cxgb4/t4fw-1.27.0.0.bin /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg /lib/firmware/mediatek/sof/sof-mt8195.ldc /lib/firmware/mediatek/sof/sof-mt8186.ldc /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg /lib/firmware/qcom/apq8096/a530_zap.mbn /lib/firmware/mediatek/sof/sof-mt8195.ri"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 283308842 to 283788197 (+0%)
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/cxgb4/t4fw.bin changed symlink target from t4fw-1.26.6.0.bin to t4fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t5fw.bin changed symlink target from t5fw-1.26.6.0.bin to t5fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t6fw.bin changed symlink target from t6fw-1.26.6.0.bin to t6fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t4fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t5fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t6fw-1.27.0.0.bin was added
  /lib/firmware/i915/adlp_guc_70.bin was added
  /lib/firmware/i915/dg1_guc_70.bin was added
  /lib/firmware/i915/dg1_huc.bin was added
  /lib/firmware/i915/dg2_guc_70.bin was added
  /lib/firmware/i915/tgl_guc_70.bin was added
  /lib/firmware/i915/tgl_huc.bin was added
  /lib/firmware/mediatek/sof/sof-mt8186.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ri was added
  /lib/firmware/mediatek/sof-tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg was added
  /lib/firmware/qcom/apq8096/a530_zap.mbn was added
  /lib/firmware/cxgb4/t4fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t5fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t6fw-1.26.6.0.bin was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was removed

--===============1958715505690067450==--

