Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B4ACA9ECA
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.3701.1684186746187279668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TgFe0Sck;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a5212-9da5fc44-fbee-4014-9230-865e23b80e2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xMx0DijT0eAc1vwQ32xPsvI/WbhBw+lw9f3gKfbIF6A=;
	b=TgFe0Sck0WfGhew6zSpkLTk3GkB64/z2LACGwQuchUaBv4SZMWGrzTYETqpPoL5V
	1/d+x2Qq+RIlQhwMXNsmLFodnk8U0xvjU3N50M7WCPsT8nyvvs/LghAp/A1ZZNimmeu
	R8K0DVN5bcuBZi1sr8HSRe4YbotJroo0pfHtc1Hs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xMx0DijT0eAc1vwQ32xPsvI/WbhBw+lw9f3gKfbIF6A=;
	b=N0hBOWx3KHo6IrlQLvENXA/XFfDs8b2MTmb6ht265NOYTfBYANrmUdOPr6jLPCih
	O4+pR7zE8EMnVYF5Ogl+GgLHu6wVnsBfRJcJvwZt5tT6qj/8Dd/YemiWn8bI3YjZSrh
	Lxt06nMS/NCEGnQpWOtdwKg0NHw2OvDyz57Yo2VA=
Content-Type: multipart/mixed; boundary="===============7956664380599035340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 23.1.2 SUCCEEDED
Message-ID: <01010188215a5212-9da5fc44-fbee-4014-9230-865e23b80e2b-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181303

--===============7956664380599035340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *23.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-23.0.1-23.1.2.patch
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
--===============7956664380599035340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-23.0.1-23.1.2.patch"

RnJvbSAyZjYyMDdlYmMzZDUwNGM4NjNmMDEzNDZhMjYxZDJkODU5YmI1NDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTE6MzY6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyMy4wLjEgLT4gMjMuMS4yCgotLS0KIC4uLm4zLXBpcF8yMy4w
LjEuYmIgPT4gcHl0aG9uMy1waXBfMjMuMS4yLmJifSB8IDQ5ICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGlwXzIzLjAuMS5iYiA9PiBw
eXRob24zLXBpcF8yMy4xLjIuYmJ9ICg1NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yMy4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDU3JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjAuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yMy4x
LjIuYmIKaW5kZXggZDliOTkwNmZmOS4uMmVlZGIwOWE0ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yMy4wLjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yMy4xLjIuYmIKQEAgLTEsMyArMSw0OCBA
QAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVk
IGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRh
dGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2Vz
IGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAo
ZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIwor
IyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHNyYy9waXAvX3ZlbmRvci9wa2dfcmVzb3VyY2VzL0xJ
Q0VOU0UKKyMgKysrIHNyYy9waXAvX3ZlbmRvci9wa2dfcmVzb3VyY2VzL0xJQ0VOU0UKKyMgQEAg
LTEsMTkgKzEsMTkgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAxNiBKYXNvbiBSIENvb21icyA8amFy
YWNvQGphcmFjby5jb20+CisjICtDb3B5cmlnaHQgSmFzb24gUi4gQ29vbWJzCisjICAKKyMgLVBl
cm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29u
IG9idGFpbmluZyBhIGNvcHkgb2YKKyMgLXRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluCisjIC10aGUgU29m
dHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0
aGUgcmlnaHRzIHRvCisjIC11c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3Ry
aWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcworIyAtb2YgdGhlIFNvZnR3YXJl
LCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMgZnVybmlzaGVk
IHRvIGRvCisjIC1zbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICtQ
ZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYSBjb3B5CisjICtvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRv
Y3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8KKyMgK2RlYWwgaW4gdGhlIFNv
ZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24g
dGhlCisjICtyaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0
cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3IKKyMgK3NlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2Fy
ZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjICtmdXJu
aXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAg
CisjIC1UaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGlj
ZSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwKKyMgLWNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0
aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICtUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQg
dGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorIyArYWxsIGNvcGll
cyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICAKKyMgIFRIRSBT
T0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5E
LCBFWFBSRVNTIE9SCisjICBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRI
RSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgIEZJVE5FU1MgRk9SIEEgUEFSVElD
VUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQor
IyAgQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwg
REFNQUdFUyBPUiBPVEhFUgorIyAtTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBD
T05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgLU9VVCBPRiBPUiBJ
TiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElO
R1MgSU4gVEhFCisjIC1TT0ZUV0FSRS4KKyMgK0xJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJ
T04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HCisjICtGUk9NLCBPVVQg
T0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVS
IERFQUxJTkdTCisjICtJTiBUSEUgU09GVFdBUkUuCisjIAorIworCiBTVU1NQVJZID0gIlRoZSBQ
eVBBIHJlY29tbWVuZGVkIHRvb2wgZm9yIGluc3RhbGxpbmcgUHl0aG9uIHBhY2thZ2VzIgogSE9N
RVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BpcCIKIFNFQ1RJT04gPSAiZGV2ZWwv
cHl0aG9uIgpAQCAtMTMsNyArNTgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9NjNlYzUyYmFmOTUxNjNiNTk3MDA4YmI0NmRiNjgwMzAgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL21zZ3BhY2svQ09QWUlORzttZDU9Y2Q5
NTIzMTgxZDlkNGZiZjdmZmNhNTJlYWEyYTU3NTEgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vc3JjL3BpcC9fdmVuZG9yL3BhY2thZ2luZy9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUxYTkw
YjIwNWM5MTY3NTc4Y2U5MSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192
ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0UuQVBBQ0hFO21kNT0yZWU0MTExMmE0NGZlNzAxNGRjZTMz
ZTI2NDY4YmE5MyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3Iv
cGtnX3Jlc291cmNlcy9MSUNFTlNFO21kNT05YTMzODk3ZjFiY2ExMTYwZDdhYWQzODM1MTUyZTE1
OCBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvcGtnX3Jlc291
cmNlcy9MSUNFTlNFO21kNT03YTcxMjZlMDY4MjA2MjkwZjNmZTlmOGQ2YzcxM2VhNiBcCiAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvcGxhdGZvcm1kaXJzL0xJQ0VO
U0U7bWQ1PWVhNGY1YTQxNDU0NzQ2YTllZDExMWUzZDg3MjNkMTdhIFwKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9weWdtZW50cy9MSUNFTlNFO21kNT0zNmExM2M5
MDUxNGUyODk5ZjFlYmE3ZjQxYzNlZTU5MiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
cmMvcGlwL192ZW5kb3IvcHlwYXJzaW5nL0xJQ0VOU0U7bWQ1PTY1N2E1NjYyMzM4ODg1MTNlMWYw
N2JhMTNlMmY0N2YxIFwKQEAgLTMzLDcgKzc4LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEKIAogU1JDX1VSSSArPSAiZmlsZTovL25vX3NoZWJhbmdfbWFuZ2xp
bmcucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDAxNWVhMWJmYjBmY2VmNTlkOGEy
ODZjMWY4YmViY2I5ODNmNjMxNzcxOWQ0MTVkYzUzNTFlZmI3Y2Q3MDI0IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjBlN2M4NmY0ODY5MzU4OTNjNzA4Mjg3YjMwYmQwNTBhMzZhYzgyN2VjN2ZlNWU0
M2ZlN2NiMTk4ZGQ4MzVmYmEiCiAKIGRvX2luc3RhbGw6YXBwZW5kKCkgewogICAgIHJtIC1mICR7
RH0vJHtiaW5kaXJ9L3BpcAotLSAKMi4zOS4yCgo=

--===============7956664380599035340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pip: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-23.0.1.tar.gz;downloadfilename=pip-23.0.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-23.1.2.tar.gz;downloadfilename=pip-23.1.2.tar.gz file://no_shebang_mangling.patch"
packages/core2-32-poky-linux/python3-pip: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 14034474 to 14089996 (+0%)
packages/core2-32-poky-linux/python3-pip/python3-pip: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: removed "/usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/RECORD /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/METADATA /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc", added "
 /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/RECORD /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/METADATA /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info moved to /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info
  /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc was removed

--===============7956664380599035340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: removed "/usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/RECORD /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/METADATA /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc", added "
 /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/RECORD /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/METADATA"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info moved to /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info
  /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc was removed

--===============7956664380599035340==--

