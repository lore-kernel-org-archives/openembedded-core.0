Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37210CA9ECF
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.7637.1685693433430557927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JzvYHqgl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101887b288441-7596aedc-25bf-4cc4-9420-4dfa6ee6771c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HdwSAZZ2yEDdjl15UrdSl67iuifvMo1GTNNwT03UXEw=;
	b=JzvYHqgldI5YriVSFW0CPjapRAXac3zKNtxsloukJYkrW2nG0VhD0K4/NkpihrxD
	guC8dRbw2kDrkqsXzHxXXT2Pmq6dX401TXIadK9sUZCGDPAYgJtgArRgC0DpONr5QgC
	YMxyvpDhS1k+NHujz4jqz42UCi9IsMJoBwP7Y2ck=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HdwSAZZ2yEDdjl15UrdSl67iuifvMo1GTNNwT03UXEw=;
	b=AHlTZWmfLDryEK1fgQjiqUktBf+Jb4NtSsakyTVo8xK1FGYDQWBk6UsIlFYEkHA0
	nye8WhZpRZvscWV1mtCwiCJfG5YvxAribgDm+9sU5mDrQLCVKTUDpdlw7Gg676joys/
	vgmeblhWEZsI6QuLUUATUVrJKq9QmO/8BrC58Ki8=
Content-Type: multipart/mixed; boundary="===============6050983795844892142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.17.31 SUCCEEDED
Message-ID: <010101887b288441-7596aedc-25bf-4cc4-9420-4dfa6ee6771c-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182199

--===============6050983795844892142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ruamel-yaml* to *0.17.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.17.21-0.17.31.patch
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
--===============6050983795844892142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: removed "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/WHEEL /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/METADATA", added "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel/yaml/__pycache__/tag.cpython-311.pyc /usr/lib/python3.11/site-packages/ruamel/yaml/tag.py /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/RECORD /usr/lib/python3.11/site-p
 ackages/ruamel.yaml-0.17.31.dist-info/WHEEL /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/METADATA"
Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info
  /usr/lib/python3.11/site-packages/ruamel/yaml/__pycache__/tag.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/ruamel/yaml/tag.py was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth was removed

--===============6050983795844892142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.17.21-0.17.31.patch"

RnJvbSBjNjQ0MjIzNmJjNjRkODMyNWI1NWUyNTZiYzgwMzZlM2QzZGZkNTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjozOTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xNy4yMSAtPiAwLjE3LjMxCgotLS0KIC4uLjcu
MjEuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3LjMxLmJifSB8IDI1ICsrKysrKysrKysr
KysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnVhbWVsLXlh
bWxfMC4xNy4yMS5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTcuMzEuYmJ9ICgzNSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15
YW1sXzAuMTcuMjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVh
bWVsLXlhbWxfMC4xNy4zMS5iYgpzaW1pbGFyaXR5IGluZGV4IDM1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4yMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1s
XzAuMTcuMzEuYmIKaW5kZXggN2Q2NWM0YzJkOC4uNDllNmZhMTQzZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTcuMjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAu
MTcuMzEuYmIKQEAgLTEsMTUgKzEsMzYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNF
CisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDYgKzEsNiBAQAorIyAgIFRoZSBNSVQgTGljZW5zZSAo
TUlUKQorIyAgCisjIC0gQ29weXJpZ2h0IChjKSAyMDE0LTIwMjIgQW50aG9uIHZhbiBkZXIgTmV1
dCwgUnVhbWVsIGJ2YmEKKyMgKyBDb3B5cmlnaHQgKGMpIDIwMTQtMjAyMyBBbnRob24gdmFuIGRl
ciBOZXV0LCBSdWFtZWwgYnZiYQorIyAgCisjICAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRl
ZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgIG9m
IHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJT
b2Z0d2FyZSIpLCB0byBkZWFsCisjIAorIworCiBTVU1NQVJZID0gIllBTUwgcGFyc2VyL2VtaXR0
ZXIgdGhhdCBzdXBwb3J0cyByb3VuZHRyaXAgcHJlc2VydmF0aW9uIG9mIGNvbW1lbnRzLCBzZXEv
bWFwIGZsb3cgc3R5bGUsIGFuZCBtYXAga2V5IG9yZGVyLiIKIEhPTUVQQUdFID0gImh0dHBzOi8v
cHlwaS5vcmcvcHJvamVjdC9ydWFtZWwueWFtbC8iCiBBVVRIT1IgPSAiQW50aG9uIHZhbiBkZXIg
TmV1dCIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT0wMzQxNTRiNzM0NGQxNTQzOGJjNWVkNWVlOWNjMDc1ZiIKK0xJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTBlNWY0MWRiNTdjM2E4ZDM1ODRiNDUwZDM1OTg1YWQx
IgogCiBQWVBJX1BBQ0tBR0UgPSAicnVhbWVsLnlhbWwiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRv
b2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGI3Y2U2OTdhMmYyMTI3NTJhMzVjMWFjNDE0
NDcxZGMxNmM0MjRjOTU3M2JlNDkyNmI1NmZmM2Y1ZDIzYjdhZiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIwOThlZDFlYjZkMzM4YTY4NDg5MWE3MjM4MDI3N2MxZTZmYzRkNGFlMGUxMjBkZTlhNDQ3
Mjc1MDU2ZGRhMzM1IgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgICR7UFlUSE9OX1BOfS1z
aGVsbCBcCi0tIAoyLjM5LjIKCg==

--===============6050983795844892142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.21.tar.gz;downloadfilename=ruamel.yaml-0.17.21.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.31.tar.gz;downloadfilename=ruamel.yaml-0.17.31.tar.gz"
packages/core2-32-poky-linux/python3-ruamel-yaml: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1173286 to 1227447 (+5%)
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.17.21" to "0.17.31"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.17.21 [default] to 0.17.31 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: removed "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/METADATA /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/WHEEL", added "/usr/lib/python3.11/site-packages/ruamel/yaml/tag.py /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel/yaml/__pycache__/tag.cpython-311.pyc /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/METADATA /usr/lib/python3.11/site
 -packages/ruamel.yaml-0.17.31.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info/WHEEL"
Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.31.dist-info
  /usr/lib/python3.11/site-packages/ruamel/yaml/__pycache__/tag.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/ruamel/yaml/tag.py was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth was removed

--===============6050983795844892142==--

