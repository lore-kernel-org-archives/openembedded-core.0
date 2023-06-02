Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF67C83005
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.7642.1685693435359197134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zr5LtOi4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b289274-0d4f8eea-8671-4c7a-a498-3a592add9890-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aCgLDiEPWi+PZZ7AlOzLD4+JirvZM2x3ONshNvBtlUo=;
	b=Zr5LtOi44wnusYuEupvGOoVcXZhGtsCY6gfEh/AbSVDer219pn8U2EeYmC9icK8t
	4OX8j5BhKFv521X6dH+8cKvRr9BX5asOTdHjoP9C2l022etH6lYuOT2lTFOtsQXOcHm
	/cWlUMmnMnZNK4UvxEi6/tV52pEJsRZ2kjsSLe6E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aCgLDiEPWi+PZZ7AlOzLD4+JirvZM2x3ONshNvBtlUo=;
	b=jZkE5M/FmBkSPqzuFYhmms/fCPWvSH4B8V4/t6G95yTffFgkrJU7CK33350z4a96
	KpMrgE8a3SvxLibcwPyW8qT28+B2Lyo0ohwV/bTtPfNxOExsXBIh2kZ7cy8vEgajXy2
	yTKWLbysV2lWqt+p9pvrV6aNpE0tzqoJOC+Sf1nQ=
Content-Type: multipart/mixed; boundary="===============4569063635471122393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.4.2 SUCCEEDED
Message-ID: <010101887b289274-0d4f8eea-8671-4c7a-a498-3a592add9890-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182278

--===============4569063635471122393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.4.0-2.4.2.patch
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
--===============4569063635471122393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.0-2.4.2.patch"

RnJvbSA1NmU5ZTA0ZDQ2MmEzNDNiMmViNGQ2OWZjN2EyMzBkM2YxZThmZGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNjoyMToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXBnOiB1cGdyYWRlIDIuNC4wIC0+IDIuNC4yCgotLS0KIC4uLmUtYS1jdXN0b20tdmFsdWUtZm9y
LXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggfCAgNiArKystLS0KIC4uLi9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2ggfCAxOCArKysrKysrKystLS0tLS0tLS0KIC4uLi9n
bnVwZy97Z251cGdfMi40LjAuYmIgPT4gZ251cGdfMi40LjIuYmJ9ICAgfCAgMiArLQogMyBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnVwZy97Z251cGdfMi40LjAuYmIgPT4gZ251cGdfMi40LjIuYmJ9
ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAw
MS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMt
dXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCmluZGV4IDBjZDRj
NDU5MDcuLjgxYWVhZjVkM2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0
aW9uLW9mLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAx
LWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM0NmE2YjE3YTA3YjY1ODk1NGRiNjVmODE0NDYxYjU5
ODI0ZDlmY2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhiOWUzZDI4NmU4N2JjOTc4
ZWM2YmI5Y2ZkNzkwZDhkMjUzYjc5YzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjIg
SmFuIDIwMTggMTg6MDA6MjEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiB1
c2UgYSBjdXN0b20gdmFsdWUgZm9yIHRoZSBsb2NhdGlvbiBvZgpAQCAtMTQsMTAgKzE0LDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAwOTljNmE4Li5lOGNm
NDA4IDEwMDY0NAoraW5kZXggYTU0NzQwMS4uNjBiYzJjNSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3Vy
ZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTkzNSw3ICsxOTM1LDcgQEAgQUNfREVGSU5F
X1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCitAQCAtMTkyMiw3ICsxOTIy
LDcgQEAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAiR1BHQ29uZiIsCiAg
CiAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR1RBUl9OQU1FLCAiZ3BndGFyIiwgW1RoZSBuYW1lIG9m
IHRoZSBncGd0YXIgdG9vbF0pCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnL3JlbG9jYXRlLnBhdGNoCmluZGV4IDA3MWRkOTNmZjUuLmY3ZGQxMmZiY2MgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiMTExN2FkZWI0NzYzMDRjZTI3OTI4MTQ1MTZhNWI3Y2Q0NGQwZDM4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNGRkZWE4ZTYwNzBkMWRmNTEwNThhYWMwODA4
OGUyN2MzN2U3ZTczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFdlZCwgMTkgU2VwIDIwMTggMTQ6NDQ6NDAg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWxsb3cgdGhlIGVudmlyb25tZW50IHRvIG92ZXJyaWRl
IHdoZXJlIGdudXBnIGxvb2tzIGZvciBpdHMKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb21t
b24vaG9tZWRpci5jIGIvY29tbW9uL2hvbWVkaXIuYwotaW5kZXggNjdiYmRlOC4uN2YzNjBiYSAx
MDA2NDQKK2luZGV4IDI4NjY4NWYuLjIxMmE5NDUgMTAwNjQ0CiAtLS0gYS9jb21tb24vaG9tZWRp
ci5jCiArKysgYi9jb21tb24vaG9tZWRpci5jCi1AQCAtMTE3MSw3ICsxMTcxLDcgQEAgZ251cGdf
c29ja2V0ZGlyICh2b2lkKQorQEAgLTEyMTMsNyArMTIxMyw3IEBAIGdudXBnX3NvY2tldGRpciAo
dm9pZCkKICAgIGlmICghbmFtZSkKICAgICAgewogICAgICAgIHVuc2lnbmVkIGludCBkdW1teTsK
QEAgLTI2LDcgKzI2LDcgQEAgaW5kZXggNjdiYmRlOC4uN2YzNjBiYSAxMDA2NDQKICAgICAgICBn
cGdydF9hbm5vdGF0ZV9sZWFrZWRfb2JqZWN0IChuYW1lKTsKICAgICAgfQogIAotQEAgLTEyMDMs
NyArMTIwMyw3IEBAIGdudXBnX3N5c2NvbmZkaXIgKHZvaWQpCitAQCAtMTI0NSw3ICsxMjQ1LDcg
QEAgZ251cGdfc3lzY29uZmRpciAodm9pZCkKICAgIGlmIChkaXIpCiAgICAgIHJldHVybiBkaXI7
CiAgICBlbHNlCkBAIC0zNSw3ICszNSw3IEBAIGluZGV4IDY3YmJkZTguLjdmMzYwYmEgMTAwNjQ0
CiAgI2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTEyMzksNyArMTIzOSw3
IEBAIGdudXBnX2JpbmRpciAodm9pZCkKK0BAIC0xMjgxLDcgKzEyODEsNyBAQCBnbnVwZ19iaW5k
aXIgKHZvaWQpCiAgICAgICAgcmV0dXJuIG5hbWU7CiAgICAgIH0KICAgIGVsc2UKQEAgLTQ0LDcg
KzQ0LDcgQEAgaW5kZXggNjdiYmRlOC4uN2YzNjBiYSAxMDA2NDQKICAjZW5kaWYgLyohSEFWRV9X
MzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTI2Niw3ICsxMjY2LDcgQEAgZ251cGdfbGliZXhlY2Rp
ciAodm9pZCkKK0BAIC0xMzA4LDcgKzEzMDgsNyBAQCBnbnVwZ19saWJleGVjZGlyICh2b2lkKQog
ICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNlCkBAIC01Myw3ICs1Myw3IEBAIGlu
ZGV4IDY3YmJkZTguLjdmMzYwYmEgMTAwNjQ0CiAgI2VuZGlmIC8qIUhBVkVfVzMyX1NZU1RFTSov
CiAgfQogIAotQEAgLTEyOTYsNyArMTI5Niw3IEBAIGdudXBnX2xpYmRpciAodm9pZCkKK0BAIC0x
MzM4LDcgKzEzMzgsNyBAQCBnbnVwZ19saWJkaXIgKHZvaWQpCiAgICAgICAgcmV0dXJuIG5hbWU7
CiAgICAgIH0KICAgIGVsc2UKQEAgLTYyLDcgKzYyLDcgQEAgaW5kZXggNjdiYmRlOC4uN2YzNjBi
YSAxMDA2NDQKICAjZW5kaWYgLyohSEFWRV9XMzJfU1lTVEVNKi8KICB9CiAgCi1AQCAtMTMyNyw3
ICsxMzI3LDcgQEAgZ251cGdfZGF0YWRpciAodm9pZCkKK0BAIC0xMzY5LDcgKzEzNjksNyBAQCBn
bnVwZ19kYXRhZGlyICh2b2lkKQogICAgICAgIHJldHVybiBuYW1lOwogICAgICB9CiAgICBlbHNl
CkBAIC03MSw3ICs3MSw3IEBAIGluZGV4IDY3YmJkZTguLjdmMzYwYmEgMTAwNjQ0CiAgI2VuZGlm
IC8qIUhBVkVfVzMyX1NZU1RFTSovCiAgfQogIAotQEAgLTEzNTksNyArMTM1OSw3IEBAIGdudXBn
X2xvY2FsZWRpciAodm9pZCkKK0BAIC0xNDAxLDcgKzE0MDEsNyBAQCBnbnVwZ19sb2NhbGVkaXIg
KHZvaWQpCiAgICAgICAgcmV0dXJuIG5hbWU7CiAgICAgIH0KICAgIGVsc2UKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC4wLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC4yLmJiCmluZGV4IDkwMGFhOGFk
NzMuLjU4MDc4MjAzN2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnXzIuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNC4y
LmJiCkBAIC0yMyw3ICsyMyw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmls
ZTovLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIKIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL3JlbG9jYXRlLnBhdGNoIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMWQ3OTE1OGRkMDFkOTkyNDMxZGQyZTNmYWNiODlmZGFjOTcxMjdmODk3
ODRlYTJjYjYxMGM2MDBmYjBjMTQ4MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5N2ViNDdkZjhh
ZTVhM2ZmNzQ0Zjg2ODAwNWEwOTBkYTVhYjQ1Y2I0OGVlOTgzNmRiZjVlZTczOWE0ZTVjZjQ5Igog
CiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWxkYXAgXAogCQktLWRpc2FibGUtY2NpZC1kcml2
ZXIgXAotLSAKMi4zOS4yCgo=

--===============4569063635471122393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gnupg/gnupg-doc: FILELIST: removed "/usr/share/doc/gnupg/examples/systemd-user/gpg-agent-extra.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.socket /usr/share/doc/gnupg/examples/systemd-user/README /usr/share/doc/gnupg/examples/debug.prf /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-ssh.socket /usr/share/doc/gnupg/examples/VS-NfD.prf /usr/share/doc/gnupg/examples/systemd-user/dirmngr.service /usr/share/doc/gnupg/examples/Automatic.prf /usr/share/doc/gnupg/examples/systemd-user/dirmngr.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.service /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-browser.socket"

--===============4569063635471122393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnupg/gnupg-dbg: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 18426964 to 17819712 (-3%)
packages/core2-32-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-dev: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-doc: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 1163381 to 1182297 (+2%)
packages/core2-32-poky-linux/gnupg/gnupg-doc: FILELIST: removed "/usr/share/doc/gnupg/examples/VS-NfD.prf /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent.service /usr/share/doc/gnupg/examples/systemd-user/README /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-browser.socket /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-ssh.socket /usr/share/doc/gnupg/examples/systemd-user/dirmngr.service /usr/share/doc/gnupg/examples/systemd-user/gpg-agent-extra.socket /usr/share/doc/gnupg/examples/Automatic.prf /usr/share/doc/gnupg/examples/debug.prf /usr/share/doc/gnupg/examples/systemd-user/dirmngr.socket"
packages/core2-32-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1840880 to 1832784 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 240512 to 240391 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 244301 to 245640 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 222514 to 223822 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 220162 to 221446 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 250886 to 252865 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGSIZE changed from 238880 to 239546 (+0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 220044 to 219889 (-0%)
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-src: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 8849198 to 8937226 (+1%)
packages/core2-32-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.4.0-r0/agent -> /usr/src/debug/gnupg/2.4.2-r0/agent, directory renamed /usr/src/debug/gnupg/2.4.0-r0/kbx -> /usr/src/debug/gnupg/2.4.2-r0/kbx, directory renamed /usr/src/debug/gnupg/2.4.0-r0/common -> /usr/src/debug/gnupg/2.4.2-r0/common, directory renamed /usr/src/debug/gnupg/2.4.0-r0/g10 -> /usr/src/debug/gnupg/2.4.2-r0/g10, directory renamed /usr/src/debug/gnupg/2.4.0-r0/sm -> /usr/src/debug/gnupg/2.4.2-r0/sm, directory renamed /usr/src/debug/gnupg/2.4.0-r0/tests/gpgscm -> /usr/src/debug/gnupg/2.4.2-r0/tests/gpgscm, directory renamed /usr/src/debug/gnupg/2.4.0-r0/regexp -> /usr/src/debug/gnupg/2.4.2-r0/regexp, directory renamed /usr/src/debug/gnupg/2.4.0-r0/tools -> /usr/src/debug/gnupg/2.4.2-r0/tools, directory renamed /usr/src/debug/gnupg/2.4.0-r0/scd -> /usr/src/debug/gnupg/2.4.2-r0/scd, removed "/usr/src/debug/gnupg/2.4.0-r0/dirmngr/validate.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/
 dns-stuff.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/validate.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-hkp.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns-stuff.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-action.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-kdns.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dns.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-finger.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-action.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ks-engine-http.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http-common.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http-common.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlfetch.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/misc.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/misc.
 h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlfetch.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/certcache.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlcache.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/http-ntbtls.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/certcache.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/workqueue.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/crlcache.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr-client.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/loadswdb.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/cdblib.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/server.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/dirmngr-status.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/domaininfo.c /usr/src/debug/gnupg/2.4.0-r0/dirmngr/cdb.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ocsp.h /usr/src/debug/gnupg/2.4.0-r0/dirmngr/ocsp.c", added "/usr/src/debug/gnupg/2.4.2-r0/dirmngr/validate.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dns-stuff.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/validate.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-engine-hkp
 .c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dns-stuff.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dns.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/fakecrl.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-action.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-engine-kdns.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-engine-http.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-action.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-engine.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dns.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ks-engine-finger.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/http-common.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/http.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/http.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/http-common.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dirmngr.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/crlfetch.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/misc.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dirmngr.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/misc.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/crlfetch.c /usr/src/debu
 g/gnupg/2.4.2-r0/dirmngr/certcache.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/crlcache.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/http-ntbtls.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/certcache.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/workqueue.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/crlcache.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dirmngr-client.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/loadswdb.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/cdblib.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/server.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/dirmngr-status.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/domaininfo.c /usr/src/debug/gnupg/2.4.2-r0/dirmngr/cdb.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ocsp.h /usr/src/debug/gnupg/2.4.2-r0/dirmngr/ocsp.c"
packages/core2-32-poky-linux/gnupg/gnupg-src: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg/gnupg: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg/gnupg: PKGSIZE changed from 5649046 to 5374854 (-5%)
packages/core2-32-poky-linux/gnupg/gnupg: PKGV changed from 2.4.0 [default] to 2.4.2 [default]
packages/core2-32-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.2.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/core2-32-poky-linux/gnupg: PV changed from "2.4.0" to "2.4.2"
packages/core2-32-poky-linux/gnupg: PKGV changed from 2.4.0 [default] to 2.4.2 [default]

--===============4569063635471122393==--

