Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D7BCA9ED8
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.7630.1685693432250511000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MGcj1IWH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101887b2882d8-c55063ad-b8bc-4ce5-89ec-4c4c97f63072-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sESRKxr8JcaRaXxxuInq0Ewmm1HG+jI27svo58R8F7w=;
	b=MGcj1IWHP5f0RPrysGgalnKDIrI1YmQtsXieZyRG+kbVj4iIPega+EaI8RtIYSLm
	WT8H6W724eqIVs+TbeUo2BPJ5RUwjilHTZlAOjfxpXP8IapjKACOCggeohC1gYVf56p
	SQGNHMpKbwFHgBWyytscq05wHucIqHYL4XJJlVl0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sESRKxr8JcaRaXxxuInq0Ewmm1HG+jI27svo58R8F7w=;
	b=ozbumEubKCYg5T2/U13Pf6jbnQBLF+0ZYW38gGxFBNsoMHJ8JNh5hkbX7j2afKNY
	uNdMay5foxvpuVUGBv3jrs9cTgOSG8gQWe5DsQDcN22Xa669XVMu9WraEExtWf7iloC
	6GXpM9Uk4IvbsV6OR6BkH/zQDodEo1OHr8BPJKEQ=
Content-Type: multipart/mixed; boundary="===============2313988154864090759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.5.0 SUCCEEDED
Message-ID: <010101887b2882d8-c55063ad-b8bc-4ce5-89ec-4c4c97f63072-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182191

--===============2313988154864090759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyasn1* to *0.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.4.8-0.5.0.patch
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
--===============2313988154864090759==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.4.8-0.5.0.patch"

RnJvbSBhYmU4Y2U4OGI4ZTM5NzE2NGE2YTg1OTc2ZjhjODhiOWUwNWYyNjVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjowNzoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlhc24xOiB1cGdyYWRlIDAuNC44IC0+IDAuNS4wCgotLS0KIC4uLi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24tcHlhc24xLmluYyB8IDEyICsrKystLS0tCiAuLi5hcm5pbmct
X19pbnRfXy1yZXR1cm5lZC1ub24taW50LW9uLVAucGF0Y2ggfCAyOCAtLS0tLS0tLS0tLS0tLS0t
LS0tCiAuLi4vcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNC44LmJiICAgICAgICAgICAgfCAgMiAt
LQogLi4uL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjUuMC5iYiAgICAgICAgICAgIHwgMjIgKysr
KysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDM3IGRlbGV0
aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWFzbjEvMDAwMS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18tcmV0dXJu
ZWQtbm9uLWludC1vbi1QLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC41LjAuYmIKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1weWFzbjEuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHlhc24xLmluYwppbmRleCAx
MjZkMDM4OGVmLi4wOTMxZTc3MzQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1weWFzbjEuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXB5YXNuMS5pbmMKQEAgLTEsMTAgKzEsOSBAQAogU1VNTUFSWSA9ICJQeXRob24g
bGlicmFyeSBpbXBsZW1lbnRpbmcgQVNOLjEgdHlwZXMuIgogSE9NRVBBR0UgPSAiaHR0cDovL3B5
YXNuMS5zb3VyY2Vmb3JnZS5uZXQvIgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9YTE0NDgyZDE1YzIyNDlkZTNiNmYw
ZThhNDdlMDIxZmQiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9
MTkwZjc5MjUzOTA4Yzk4NmU2Y2FjZjM4MGMzYTVmNmQiCiAKLVNSQ19VUklbbWQ1c3VtXSA9ICJk
ZmZhZTRmZjlmOTk3YTgzMzI0YjNmMzNmZTYyYmU1NCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJh
ZWY3N2M5ZmI5NGEzYWM1ODhlODc4NDEyMDhiZGVjNDY0NDcxZDk4NzFiZDUwNTBhMjg3Y2M5YTQ3
NWNkMGJhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk3YjcyOTBjYTY4ZTYyYTgzMjU1OGVjMzk3
NmYxNWNiZjkxMWJmNWQ3YzcwMzlkOGI4NjFjMmEwZWNlNjlmZGUiCiAKIFJERVBFTkRTOiR7UE59
OmNsYXNzLXRhcmdldCArPSAiIFwKICAgICAke1BZVEhPTl9QTn0tY29kZWNzIFwKQEAgLTE3LDEw
ICsxNiw5IEBAIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAogaW5oZXJpdCBw
dGVzdAogCi1TUkNfVVJJICs9ICIgXAotCWZpbGU6Ly9ydW4tcHRlc3QgXAotCWZpbGU6Ly8wMDAx
LUZpeC1EZXByZWNhdGlvbldhcm5pbmctX19pbnRfXy1yZXR1cm5lZC1ub24taW50LW9uLVAucGF0
Y2ggXAotIgorU1JDX1VSSSA9ICIke1BZUElfU1JDX1VSSX0gXAorICAgICAgICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKKyAgICAgICAgICAgIgogCiBSREVQRU5EUzoke1BOfS1wdGVzdCArPSAiIFwK
IAkke1BZVEhPTl9QTn0tcHl0ZXN0IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weWFzbjEvMDAwMS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50
X18tcmV0dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5YXNuMS8wMDAxLUZpeC1EZXByZWNhdGlvbldhcm5pbmctX19pbnRfXy1y
ZXR1cm5lZC1ub24taW50LW9uLVAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDMwYWM5YTY2ODQuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5YXNuMS8wMDAxLUZpeC1EZXByZWNhdGlvbldhcm5pbmctX19pbnRfXy1yZXR1
cm5lZC1ub24taW50LW9uLVAucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyOCArMCwwIEBACi1G
cm9tIGRiOGYxYTc5MzBjNmI1ODI2MzU3NjQ2NzQ2MzM3ZGFmYzk4M2Y5NTMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBJbHlhIEV0aW5nb2YgPGV0aW5nb2ZAZ21haWwuY29tPgotRGF0
ZTogU2F0LCAyMSBNYXIgMjAyMCAxOTowNTowMyArMDEwMAotU3ViamVjdDogW1BBVENIXSBGaXgg
YERlcHJlY2F0aW9uV2FybmluZzogX19pbnRfXyByZXR1cm5lZCBub24taW50YCBvbiBQeTMKLQot
SW4gYEJpdFN0cmluZy5fX2ludF9fKClgCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWdu
ZWQtb2ZmLWJ5OiBZdWxvbmcgTGl1IDx5dWxvbmcubGl1QHdpbmRyaXZlci5jb20+Ci0tLS0KLSBw
eWFzbjEvdHlwZS91bml2LnB5IHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvcHlhc24xL3R5cGUvdW5pdi5weSBiL3B5
YXNuMS90eXBlL3VuaXYucHkKLWluZGV4IDEwOTI0YzMuLjQ4ODI0MWYgMTAwNjQ0Ci0tLS0gYS9w
eWFzbjEvdHlwZS91bml2LnB5Ci0rKysgYi9weWFzbjEvdHlwZS91bml2LnB5Ci1AQCAtNTUxLDcg
KzU1MSw3IEBAIGNsYXNzIEJpdFN0cmluZyhiYXNlLlNpbXBsZUFzbjFUeXBlKToKLSAgICAgICAg
IHJldHVybiBzZWxmLmNsb25lKFNpemVkSW50ZWdlcihzZWxmLl92YWx1ZSA+PiBjb3VudCkuc2V0
Qml0TGVuZ3RoKG1heCgwLCBsZW4oc2VsZi5fdmFsdWUpIC0gY291bnQpKSkKLSAKLSAgICAgZGVm
IF9faW50X18oc2VsZik6Ci0tICAgICAgICByZXR1cm4gc2VsZi5fdmFsdWUKLSsgICAgICAgIHJl
dHVybiBpbnQoc2VsZi5fdmFsdWUpCi0gCi0gICAgIGRlZiBfX2Zsb2F0X18oc2VsZik6Ci0gICAg
ICAgICByZXR1cm4gZmxvYXQoc2VsZi5fdmFsdWUpCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNC44LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYgpkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTVlMmE3MTM2Mi4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNC44LmJiCisrKyAv
ZGV2L251bGwKQEAgLTEsMiArMCwwIEBACi1pbmhlcml0IHB5cGkgc2V0dXB0b29sczMKLXJlcXVp
cmUgcHl0aG9uLXB5YXNuMS5pbmMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWFzbjFfMC41LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4wLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLjUxY2U0MzIyNjEKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4wLmJiCkBAIC0wLDAgKzEsMjIgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLnJzdAorIyArKysgTElDRU5TRS5yc3QKKyMgQEAg
LTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMDUtMjAxOSwgSWx5YSBFdGluZ29mIDxl
dGluZ29mQGdtYWlsLmNvbT4KKyMgK0NvcHlyaWdodCAoYykgMjAwNS0yMDIwLCBJbHlhIEV0aW5n
b2YgPGV0aW5nb2ZAZ21haWwuY29tPgorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAg
UmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBv
ciB3aXRob3V0CisjIAorIworCitpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKK3JlcXVpcmUgcHl0
aG9uLXB5YXNuMS5pbmMKKwotLSAKMi4zOS4yCgo=

--===============2313988154864090759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_binary.py", added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info -> /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info, removed "/usr/lib/python3.11/site-packages/pyasn1/compat/calling.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py /usr/lib/python3.11/site-packages/pyasn1/compat/string.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py"
Changes to packages/core2-32-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info moved to /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info
  /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py was added
  /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/string.py was removed

--===============2313988154864090759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyasn1: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.4.8.tar.gz;downloadfilename=pyasn1-0.4.8.tar.gz file://run-ptest file://0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.0.tar.gz;downloadfilename=pyasn1-0.5.0.tar.gz https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.0.tar.gz;downloadfilename=pyasn1-0.5.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pyasn1: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_binary.py", added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 311524 to 319281 (+2%)
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info -> /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info, removed "/usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py /usr/lib/python3.11/site-packages/pyasn1/compat/string.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py", added "/usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 786820 to 841150 (+7%)
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.4.8" to "0.5.0"
Changes to packages/core2-32-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info moved to /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info
  /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py was added
  /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/string.py was removed

--===============2313988154864090759==--

