Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C18C6FA94
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.12621.1662040785772401708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TDEupE/A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182f959c70b-5b8043d8-f449-4d72-bcb7-00319d1bc670-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t638WMxc9W3sp6KR9Nb/7GYtmwAMZIKM/rIzA608JMw=;
	b=TDEupE/Aqm2WZSMWrik2Wf8qR5W7Sqie+x5Ey78RZo+oqTz+TdURhMeY3hZZl7Ex
	XBlzapzTWpsDU2PzbT9J1fp1hP8Os3A9MndMhJKV2xIYg6+kHvInaO0IQ1A8+RumfQ5
	h10WZimF+FlUybEptMU8UhCV0dlipX448kZqsfoU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t638WMxc9W3sp6KR9Nb/7GYtmwAMZIKM/rIzA608JMw=;
	b=L3Gqw7al3BRzkSxjMzfeI8y/E4s2NBKvUrG71v5y+RiuuFmVkX6Yp9pniAkFaCWT
	ZAwhKvlSy4szVi4kdXumt5uJtEqJUJXZyntP7haWjPjVpXsxRxCYLgzBux3cD71gr0b
	zM7yzo2rJmgrrVT9g+JuEV3O6VpgxoCWrYGgXWqY=
Content-Type: multipart/mixed; boundary="===============0815844302928248831=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20220815 SUCCEEDED
Message-ID: 
 <01010182f959c70b-5b8043d8-f449-4d72-bcb7-00319d1bc670-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170198

--===============0815844302928248831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20220815* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220708-20220815.patch
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
--===============0815844302928248831==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220708-20220815.patch"

RnJvbSAxODczN2U5ZGFhZWI2Y2YyMjVlMmU2NDFjOWNhZGI2ZGIwYzliMjcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMTowMDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjIwNzA4IC0+IDIwMjIwODE1CgotLS0KIC4uLjIwMjIw
NzA4LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjIwODE1LmJifSB8IDMwOSArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzMDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIyMDcwOC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIyMDgxNS5iYn0gKDgyJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjIwNzA4LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIyMDgxNS5iYgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIwNzA4LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjIwODE1LmJiCmluZGV4IDkxYzMyZTQ5ZDYuLjAwZDJkMTJhYWYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMjA3
MDguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIyMDgxNS5iYgpAQCAtMSwzICsxLDMwOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC0yNzg1LDcgKzI3ODUsOSBAQAorIyAgCisjICBM
aWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmN5cHJlc3MgZm9yIGRldGFpbHMu
CisjICAKKyMgK0ZpbGU6ICJicmNtL2JyY21mbWFjNDMyNDFiNC1zZGlvLkludGVsIENvcnAuLVZB
TExFWVZJRVcgQzAgUExBVEZPUk0udHh0IgorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzMwLXNk
aW8uUHJvd2lzZS1QVDMwMS50eHQiCisjICtGaWxlOiAiYnJjbS9icmNtZm1hYzQzMzQwLXNkaW8u
QVNVU1RlSyBDT01QVVRFUiBJTkMuLVRGMTAzQ0UudHh0IgorIyAgRmlsZTogImJyY20vYnJjbWZt
YWM0MzM0MC1zZGlvLm1lZWdvcGFkLXQwOC50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQz
MzQwLXNkaW8ucG92LXRhYi1wMTAwNnctZGF0YS50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1h
YzQzMzQwLXNkaW8ucHJlZGlhLWJhc2ljLnR4dCIKKyMgQEAgLTI4MTUsMTUgKzI4MTcsMTYgQEAK
KyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLlJhc3BiZXJyeVwgUGlcIEZvdW5kYXRp
b24tUmFzcGJlcnJ5XCBQaVwgQ29tcHV0ZVwgTW9kdWxlXCA0LnR4dCAtPiBicmNtZm1hYzQzNDU1
LXNkaW8ucmFzcGJlcnJ5cGksNC1tb2RlbC1iLnR4dAorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0
MzQ1NS1zZGlvLk1JTklYLU5FTyBaODMtNC50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQz
NTYtcGNpZS5ncGQtd2luLXBvY2tldC50eHQiCisjICtGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYt
cGNpZS5YaWFvbWkgSW5jLU1pcGFkMi50eHQiCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM1Ni1z
ZGlvLkFQNjM1NlMudHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFjNDM1Ni1zZGlvLmZpcmVmbHks
ZmlyZWZseS1yazMzOTkudHh0IC0+IGJyY21mbWFjNDM1Ni1zZGlvLkFQNjM1NlMudHh0CisjICBM
aW5rOiBicmNtL2JyY21mbWFjNDM1Ni1zZGlvLmtoYWRhcyx2aW0yLnR4dCAtPiBicmNtZm1hYzQz
NTYtc2Rpby5BUDYzNTZTLnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNTYtc2Rpby52YW1y
cyxyb2NrOTYwLnR4dCAtPiBicmNtZm1hYzQzNTYtc2Rpby5BUDYzNTZTLnR4dAorIyAgRmlsZTog
YnJjbS9icmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQKKyMgLUxpbms6IGJyY20vYnJj
bWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5iZWFn
bGUsYW01NzI5LWJlYWdsZWJvbmVhaS50eHQKKyMgLUxpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1z
ZGlvLkFXLUNNMjU2U00udHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscGluZWJvb2st
cHJvLnR4dAorIyAtTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQg
LT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnBpbmU2NCxwaW5lcGhvbmUtcHJvLnR4dAorIyAtTGluazog
YnJjbS9icmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1z
ZGlvLnBpbmU2NCxxdWFydHo2NC1iLnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNk
aW8uYmVhZ2xlLGFtNTcyOS1iZWFnbGVib25lYWkudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5B
Vy1DTTI1NlNNLnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHBp
bmVib29rLXByby50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtM
aW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscGluZXBob25lLXByby50eHQgLT4g
YnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFj
NDM0NTUtc2Rpby5waW5lNjQscXVhcnR6NjQtYi50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFX
LUNNMjU2U00udHh0CisjICAKKyMgIExpY2VuY2U6IEdQTHYyLiBTZWUgR1BMLTIgZm9yIGRldGFp
bHMuCisjICAKKyMgQEAgLTM3MzcsOTIgKzM3NDAsOTIgQEAKKyMgIEZpbGU6IGludGVsL2lidC0x
OC0xLmRkYworIyAgVmVyc2lvbjogQlRfVGh1bmRlclBlYWtfQTBfQjBfUkVMMDIwMQorIyAgRmls
ZTppbnRlbC9pYnQtMjAtMC0zLnNmaQorIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVM
NDQ1NjUKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDQ3MTI0CisjICBGaWxlOmlu
dGVsL2lidC0yMC0wLTMuZGRjCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw0NDU2
NQorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwv
aWJ0LTIwLTEtMy5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDQ0NTY1Cisj
ICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQt
MjAtMS0zLmRkYworIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNDQ1NjUKKyMgK1Zl
cnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0yMC0x
LTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw0NDU2NQorIyArVmVyc2lv
bjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTEtNC5k
ZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBC
VF9DeWNsb25lUGVha19BMF9SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQtMTktMC0wLnNmaQor
IyAtVmVyc2lvbjogQlRfUXVhc2FyX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVM
NDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMC5kZGMKKyMgLVZlcnNpb246IEJUX1F1YXNh
cl9SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfUXVhc2FyX1JFTDQ3MTI0CisjICBGaWxlOmludGVs
L2lidC0xOS0wLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMNDQ1NjUKKyMgK1ZlcnNp
b246IEJUX1F1YXNhcl9SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQtMTktMC0xLmRkYworIyAt
VmVyc2lvbjogQlRfUXVhc2FyX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNDcx
MjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29u
UGVha19SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ3MTI0CisjICBG
aWxlOmludGVsL2lidC0xOS0wLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
NDQ1NjUKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NzEyNAorIyAgRmlsZTppbnRl
bC9pYnQtMTktMTYtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NDU2NQor
IyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0x
OS0xNi00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJz
aW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTEu
c2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJU
X0hhcnJpc29uUGVha19SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQtMTktMzItMS5kZGMKKyMg
LVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0xOS0zMi0wLnNmaQorIyAtVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTAuZGRjCisjIC1WZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NzEy
NAorIyAgRmlsZTppbnRlbC9pYnQtMTktMzItNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29u
UGVha19SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ3MTI0CisjICBG
aWxlOmludGVsL2lidC0xOS0zMi00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JF
TDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50
ZWwvaWJ0LTE5LTI0MC0xLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1
CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0
LTE5LTI0MC0xLmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtW
ZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0
MC00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9u
OiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LmRk
YworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDEtMDA0MS5zZmkKKyMg
LVZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9UeXBob29u
UGVha19SRUw0NzQ4OQorIyAgRmlsZTppbnRlbC9pYnQtMDA0MS0wMDQxLmRkYworIyAtVmVyc2lv
bjogQlRfVHlwaG9vblBlYWtfUkVMNDQ5MTgKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JF
TDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9T
b2xhcl9HZlAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDQ3NDg5Cisj
ICBGaWxlOmludGVsL2lidC0wMDQwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAy
X1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDQ3NDg5CisjICBGaWxlOmlu
dGVsL2lidC0xMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw0NDkx
OAorIyArVmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNDc0ODkKKyMgIEZpbGU6aW50ZWwvaWJ0
LTEwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDQ0OTE4CisjICtW
ZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw0NzQ4OQorIyAgCisjICBGaWxlOmludGVsL2lidC0w
MDQwLTEwMjAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDQ0OTE4CisjICtWZXJz
aW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0wMDQwLTEwMjAu
ZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9T
b2xhcl9KZlAxX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0xMDQwLTEwMjAuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9Tb2xhckZfSmZQMV9SRUw0NDkxOAorIyArVmVyc2lvbjogQlRfU29sYXJGX0pm
UDFfUkVMNDc0ODkKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMTAyMC5kZGMKKyMgLVZlcnNpb246
IEJUX1NvbGFyRl9KZlAxX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSmZQMV9SRUw0
NzQ4OQorIyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTIxMjAuc2ZpCisjIC1WZXJzaW9uOiBC
VF9Tb2xhcl9KZlAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KZlAyX1JFTDQ3NDg5
CisjICBGaWxlOmludGVsL2lidC0wMDQwLTIxMjAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9K
ZlAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KZlAyX1JFTDQ3NDg5CisjICBGaWxl
OmludGVsL2lidC0xMDQwLTIxMjAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSmZQMl9SRUw0
NDkxOAorIyArVmVyc2lvbjogQlRfU29sYXJGX0pmUDJfUkVMNDc0ODkKKyMgIEZpbGU6aW50ZWwv
aWJ0LTEwNDAtMjEyMC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KZlAyX1JFTDQ0OTE4Cisj
ICtWZXJzaW9uOiBCVF9Tb2xhckZfSmZQMl9SRUw0NzQ4OQorIyAgCisjICBGaWxlOmludGVsL2li
dC0wMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9IclAyX1JFTDQ0OTE4CisjICtW
ZXJzaW9uOiBCVF9Tb2xhcl9IclAyX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0wMDQwLTQx
NTAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9IclAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBC
VF9Tb2xhcl9IclAyX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0xMDQwLTQxNTAuc2ZpCisj
IC1WZXJzaW9uOiBCVF9Tb2xhckZfSHJQMl9SRUw0NDkxOAorIyArVmVyc2lvbjogQlRfU29sYXJG
X0hyUDJfUkVMNDc0ODkKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtNDE1MC5kZGMKKyMgLVZlcnNp
b246IEJUX1NvbGFyRl9IclAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSHJQMl9S
RUw0NzQ4OQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmli
dF9maXJtd2FyZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC0zOTU3LDYgKzM5NjAsNyBAQAorIyAg
VmVyc2lvbjogMjAyMi0wNC0wOAorIyAgRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFt
MTloLmJpbgorIyAgVmVyc2lvbjogMjAyMi0wNC0wOAorIyArRmlsZTogYW1kLXVjb2RlL1JFQURN
RQorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC11Y29k
ZSBmb3IgZGV0YWlscworIyAgCisjIEBAIC00NjgyLDggKzQ2ODYsMTQgQEAKKyMgIEZpbGU6IGk5
MTUvZGcyX2d1Y183MC4xLjIuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4y
IGZvciBERzIKKyMgIAorIyArRmlsZTogaTkxNS9kZzJfZ3VjXzcwLjQuMS5iaW4KKyMgK1ZlcnNp
b246IEd1QyBBUEkvQVBCIHZlciA3MC40LjEgZm9yIERHMgorIyArCisjICBGaWxlOiBpOTE1L2Rn
Ml9kbWNfdmVyMl8wNi5iaW4KKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2Ug
NiBmb3IgREcyCisjICsKKyMgK0ZpbGU6IGk5MTUvZGcyX2RtY192ZXIyXzA3LmJpbgorIyArVmVy
c2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSA3IGZvciBERzIKKyMgIAorIyAgTGljZW5z
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pOTE1IGZvciBkZXRhaWxzCisjICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorIyBAQCAtNTE3OCwxMyArNTE4OCwxMyBAQAorIyAgRHJpdmVyOiBtdGtf
c2NwIC0gTWVkaWF0ZWsgU0NQIFN5c3RlbSBDb250cm9sIFByb2Nlc3NpbmcgRHJpdmVyCisjICAK
KyMgIEZpbGU6IG1lZGlhdGVrL210ODE4My9zY3AuaW1nCisjIC1WZXJzaW9uOiB2Mi4wLjI3NDUK
KyMgK1ZlcnNpb246IHYyLjAuMTMzMjQKKyMgIEZpbGU6IG1lZGlhdGVrL210ODE4Ni9zY3AuaW1n
CisjICBWZXJzaW9uOiB2MC4wLjYKKyMgIEZpbGU6IG1lZGlhdGVrL210ODE5Mi9zY3AuaW1nCisj
IC1WZXJzaW9uOiB2Mi4wLjg1MzcKKyMgK1ZlcnNpb246IHYyLjAuODU0OAorIyAgRmlsZTogbWVk
aWF0ZWsvbXQ4MTk1L3NjcC5pbWcKKyMgLVZlcnNpb246IHYxNDQ1NC44LjAKKyMgK1ZlcnNpb246
IHYyLjAuMTMzMjQKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLgorIyAgCisjIEBA
IC01NjA1LDYgKzU2MTUsNyBAQAorIyAgRmlsZTogcWNvbS9hNjYwX3NxZS5mdworIyAgRmlsZTog
cWNvbS9sZWlhX3BmcF80NzAuZncKKyMgIEZpbGU6IHFjb20vbGVpYV9wbTRfNDcwLmZ3CisjICtG
aWxlOiBxY29tL0xFTk9WTy8yMUJYL3FjZHhrbXN1YzgyODAubWJuCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UucWNvbSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZv
ciBkZXRhaWxzCisjICAKKyMgQEAgLTU2MzEsNiArNTY0MiwxMyBAQAorIyAgRmlsZTogcWNvbS9z
bTgyNTAvYWRzcHVhLmpzbgorIyAgRmlsZTogcWNvbS9zbTgyNTAvY2RzcC5tYm4KKyMgIEZpbGU6
IHFjb20vc204MjUwL2Nkc3ByLmpzbgorIyArRmlsZTogcWNvbS9MRU5PVk8vMjFCWC9hZHNwci5q
c24KKyMgK0ZpbGU6IHFjb20vTEVOT1ZPLzIxQlgvYWRzcHVhLmpzbgorIyArRmlsZTogcWNvbS9M
RU5PVk8vMjFCWC9iYXR0bWdyLmpzbgorIyArRmlsZTogcWNvbS9MRU5PVk8vMjFCWC9jZHNwci5q
c24KKyMgK0ZpbGU6IHFjb20vTEVOT1ZPLzIxQlgvcWNhZHNwODI4MC5tYm4KKyMgK0ZpbGU6IHFj
b20vTEVOT1ZPLzIxQlgvcWNjZHNwODI4MC5tYm4KKyMgK0ZpbGU6IHFjb20vTEVOT1ZPLzIxQlgv
cWNzbHBpODI4MC5tYm4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5TRS5xY29tIGFuZCBxY29tL05PVElDRS50eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNTcy
MCw2ICs1NzM4LDEwIEBACisjICBGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bTItMjkuMjAx
MC4xNTAyLm1mYTIKKyMgIEZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtMy0zMC4yMDEwLjE1
MDIubWZhMgorIyAgRmlsZTogbWVsbGFub3gvbGNfaW5pX2J1bmRsZV8yMDEwXzE1MDIuYmluCisj
ICtGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bS0xMy4yMDEwLjMwMjAubWZhMgorIyArRmls
ZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW0yLTI5LjIwMTAuMzAyMC5tZmEyCisjICtGaWxlOiBt
ZWxsYW5veC9tbHhzd19zcGVjdHJ1bTMtMzAuMjAxMC4zMDIwLm1mYTIKKyMgK0ZpbGU6IG1lbGxh
bm94L2xjX2luaV9idW5kbGVfMjAxMF8zMDIwLmJpbgorIyAgCisjICBMaWNlbmNlOgorIyAgIENv
cHlyaWdodCAoYykgMjAxNy0yMDIwIE1lbGxhbm94IFRlY2hub2xvZ2llcywgTHRkLiBBbGwgcmln
aHRzIHJlc2VydmVkLgorIyBAQCAtNTgxOCw4ICs1ODQwLDggQEAKKyMgIAorIyAgRHJpdmVyOiBp
Y2UgLSBJbnRlbChSKSBFdGhlcm5ldCBDb25uZWN0aW9uIEU4MDAgU2VyaWVzCisjICAKKyMgLUZp
bGU6IGludGVsL2ljZS9kZHAvaWNlLTEuMy4yOC4wLnBrZworIyAtTGluazogaW50ZWwvaWNlL2Rk
cC9pY2UucGtnIC0+IGljZS0xLjMuMjguMC5wa2cKKyMgK0ZpbGU6IGludGVsL2ljZS9kZHAvaWNl
LTEuMy4zMC4wLnBrZworIyArTGluazogaW50ZWwvaWNlL2RkcC9pY2UucGtnIC0+IGljZS0xLjMu
MzAuMC5wa2cKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5p
Y2UgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNTkxOSwzICs1OTQxLDQxIEBACisjICBWZXJzaW9u
OiAxLjMuMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFt
cGhpb25fdnB1IGZvciBkZXRhaWxzCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisj
ICtEcml2ZXI6IGNzMzVsNDFfaGRhIC0gQ1MzNWw0MSBBTFNBIEhEQSBhdWRpbyBkcml2ZXIKKyMg
KworIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC53bWZ3CisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LmJpbgorIyArCisjICtMaWNlbnNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTlNFLmNpcnJ1cyBmb3IgZGV0YWlscy4KKyMgKworIyArVXNlIG9m
IENpcnJ1cyBMb2dpYyBkcml2ZXJzLCBmaXJtd2FyZSBhbmQgb3RoZXIgbWF0ZXJpYWxzIGlzIHBl
cm1pdHRlZAorIyArb25seSBpbiBjb25uZWN0aW9uIHdpdGggQ2lycnVzIExvZ2ljIGhhcmR3YXJl
IHByb2R1Y3RzLgorIyArCisjICtDb3B5cmlnaHQgwqkgMjAyMiBDaXJydXMgTG9naWMsIEluYy4g
YW5kIENpcnJ1cyBMb2dpYyBJbnRlcm5hdGlvbmFsCisjICtTZW1pY29uZHVjdG9yIEx0ZC4gQWxs
IFJpZ2h0cyBSZXNlcnZlZC4KKyMgKworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0Ry
aXZlcjogbXRrLXNvZiAtIE1lZGlhdGVrIFNvdW5kIE9wZW4gRmlybXdhcmUgZHJpdmVyCisjICsK
KyMgK0ZpbGU6IG1lZGlhdGVrL3NvZi9zb2YtbXQ4MTg2LnJpCisjICtGaWxlOiBtZWRpYXRlay9z
b2Yvc29mLW10ODE4Ni1tdDYzNjYtZGE3MjE5LW1heDk4MzU3LnRwbGcKKyMgK0ZpbGU6IG1lZGlh
dGVrL3NvZi9zb2YtbXQ4MTg2LW10NjM2Ni1ydDEwMTktcnQ1Njgycy50cGxnCisjICtWZXJzaW9u
OiB2MC4yLjAKKyMgKworIyArTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLgorIyArCisjICtNZWRp
YVRlayBJbmMuIGdyYW50cyBwZXJtaXNzaW9uIHRvIHVzZSBhbmQgcmVkaXN0cmlidXRlIGFmb3Jl
bWVudGlvbmVkIGZpcm13YXJlCisjICtmaWxlcyBmb3IgdGhlIHVzZSB3aXRoIGRldmljZXMgY29u
dGFpbmluZyBNZWRpYVRlayBjaGlwc2V0cywgYnV0IG5vdCBhcyBwYXJ0IG9mCisjICt0aGUgTGlu
dXgga2VybmVsIG9yIGluIGFueSBvdGhlciBmb3JtIHdoaWNoIHdvdWxkIHJlcXVpcmUgdGhlc2Ug
ZmlsZXMgdGhlbXNlbHZlcworIyArdG8gYmUgY292ZXJlZCBieSB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIG9yIHRoZSBHTlUgTGVzc2VyCisjICtHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlLgorIyArCisjICtUaGVzZSBmaXJtd2FyZSBmaWxlcyBhcmUgZGlzdHJpYnV0
ZWQgaW4gdGhlIGhvcGUgdGhhdCB0aGV5IHdpbGwgYmUgdXNlZnVsLCBidXQKKyMgK2FyZSBwcm92
aWRlZCBXSVRIT1VUIEFOWSBXQVJSQU5UWSwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBJ
TVBMSUVEIFdBUlJBTlRZCisjICtPRiBNRVJDSEFOVEFCSUxJVFkgT1IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIAorIworCiBT
VU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBrZXJuZWwiCiBIT01F
UEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9OID0gIkxpbnV4IGZp
cm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhlIExpbnV4IGtlcm5l
bCBcCkBAIC0xMjgsNyArNDMzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5D
RS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQyZGM0OWZjZTA0ODE0
YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAw
MDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQx
OGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNF
X0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT1mYWU3MjA2
NmE4M2E2Yzk1MTc4OTkzZmQ5MTJmNjMzNyBcCiAgICAgICAgICAgICAgICAgICAgICIKICMgV0hF
TkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRpbmcgaXQg
aWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yMDksNyArNTE0LDcgQEAg
U1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIwNTA5IHJlbGVh
c2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRldnVwc3RyZWFt
ID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMGFiZWM4MjdhMDM1YzgyYmRjYWJkZjgyYWEzN2RlZDI0N2JjNjgyZWYw
NTg2MWJkNDA5ZWE2ZjQ3N2JhYjgxZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNDEwZWY0MTY2
M2E5ZDcxOTU5YWM3MjQxYjZlNDg3MzU5YzI1MmMzYjc4ZGIwYTk3NGY2MWQ0ODA3NDVlMGY5Igog
CiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zMS4xCgo=

--===============0815844302928248831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220708.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220815.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGSIZE changed from 414854 to 416655 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGSIZE changed from 656628 to 658195 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGSIZE changed from 624504 to 627603 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_dmc_ver2_07.bin /lib/firmware/i915/dg2_guc_70.4.1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 22114371 to 22506459 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2388683 to 2392811 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 16383212 to 16433936 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg", added "/lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 2118776 to 2127028 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.cirrus"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 144335 to 155681 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1735900 to 1753268 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 188968 to 191279 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220708 [default] to 20220815 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220708" to "20220815"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/qcom/LENOVO/21BX/qccdsp8280.mbn /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 /lib/firmware/qcom/LENOVO/21BX/qcadsp8280.mbn /lib/firmware/qcom/LENOVO/21BX/adspua.jsn /lib/firmware/amd-ucode/README /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt /lib/firmware/qcom/LENOVO/21BX/adspr.jsn /lib/firmware/qcom/LENOVO/21BX/battmgr.jsn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 /lib/firmware/mediatek/sof/sof-mt8186.ri /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/qcom/LENOVO/21BX/qcslpi8280.mbn /lib/firmware/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn /lib/firmware/qcom/LENOVO/21BX/cdspr.jsn /lib/firmware/cirrus/
 cs35l41-dsp1-spk-prot.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 271439875 to 300249372 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220708 [default] to 20220815 [default]
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed type from symlink to file
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed permissions from rwxrwxrwx to rw-r--r--
  /lib/firmware/intel/ice/ddp/ice.pkg changed symlink target from ice-1.3.28.0.pkg to ice-1.3.30.0.pkg
  /lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg moved to /lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg
  /lib/firmware/amd-ucode/README was added
  /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt was added
  /lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt was added
  /lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt was added
  /lib/firmware/cirrus was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw was added
  /lib/firmware/i915/dg2_dmc_ver2_07.bin was added
  /lib/firmware/i915/dg2_guc_70.4.1.bin was added
  /lib/firmware/LICENSE.cirrus was added
  /lib/firmware/mediatek/sof was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186.ri was added
  /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 was added
  /lib/firmware/qcom/LENOVO was added
  /lib/firmware/qcom/LENOVO/21BX was added
  /lib/firmware/qcom/LENOVO/21BX/adspr.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/adspua.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/battmgr.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/cdspr.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/qcadsp8280.mbn was added
  /lib/firmware/qcom/LENOVO/21BX/qccdsp8280.mbn was added
  /lib/firmware/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn was added
  /lib/firmware/qcom/LENOVO/21BX/qcslpi8280.mbn was added

--===============0815844302928248831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_guc_70.4.1.bin /lib/firmware/i915/dg2_dmc_ver2_07.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg", added "/lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.cirrus"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 271439875 to 300249372 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/qcom/LENOVO/21BX/qcslpi8280.mbn /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 /lib/firmware/qcom/LENOVO/21BX/cdspr.jsn /lib/firmware/amd-ucode/README /lib/firmware/qcom/LENOVO/21BX/adspr.jsn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/mediatek/sof/sof-mt8186.ri /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt /lib/firmware/qcom/LENOVO/21BX/battmgr.jsn /lib/firmware/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg /lib/firmware/qcom/LENOVO/21BX/adspua.jsn /lib/firmware/qcom/LENOVO/21BX/qcadsp8280.mbn /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 /lib/firmware/qcom/L
 ENOVO/21BX/qccdsp8280.mbn"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed type from symlink to file
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed permissions from rwxrwxrwx to rw-r--r--
  /lib/firmware/intel/ice/ddp/ice.pkg changed symlink target from ice-1.3.28.0.pkg to ice-1.3.30.0.pkg
  /lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg moved to /lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg
  /lib/firmware/amd-ucode/README was added
  /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt was added
  /lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt was added
  /lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt was added
  /lib/firmware/cirrus was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw was added
  /lib/firmware/i915/dg2_dmc_ver2_07.bin was added
  /lib/firmware/i915/dg2_guc_70.4.1.bin was added
  /lib/firmware/LICENSE.cirrus was added
  /lib/firmware/mediatek/sof was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186.ri was added
  /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 was added
  /lib/firmware/qcom/LENOVO was added
  /lib/firmware/qcom/LENOVO/21BX was added
  /lib/firmware/qcom/LENOVO/21BX/adspr.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/adspua.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/battmgr.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/cdspr.jsn was added
  /lib/firmware/qcom/LENOVO/21BX/qcadsp8280.mbn was added
  /lib/firmware/qcom/LENOVO/21BX/qccdsp8280.mbn was added
  /lib/firmware/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn was added
  /lib/firmware/qcom/LENOVO/21BX/qcslpi8280.mbn was added

--===============0815844302928248831==--

