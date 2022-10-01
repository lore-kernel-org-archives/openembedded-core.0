Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B14C4743F
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.421.1664643227615665943
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KCutXDBy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477dddb-3e9865c5-8484-49d0-8803-cd42201e66f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I3joVo1pzurHjOMQ4xjlQYAGcD7ogW5Z42oSZOWOePE=;
	b=KCutXDByV2EmmVueILue5Wm8uh6n6zwBPlM23lCTqwl5dJtFgY/yd4KOTA6+bHkZ
	kOHSAd05bAK+FRKgVG3je7DJpNi5N0PK+9Kw/926QhQQbaBdEYloWC9GuFH+P5LESQ1
	cndco58+L+0v7UDltA5sVwS2HUvOgmeB+sT98aIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I3joVo1pzurHjOMQ4xjlQYAGcD7ogW5Z42oSZOWOePE=;
	b=PeLVseynLEiGXheoja3yRbn8pFJjJPclyyyRu4CfQQA3uyIrpPs7K4eW+lxWgHeQ
	/CdPXSebGQXJLU1B/hDV7oIk/fP10kuBNgijWDdnBdXyM2bXmkI4c2DrTf3jWzdGHqi
	8RpebUZQlLIcMTQFX6zNDyDIfix3719kWMzP+x0s=
Content-Type: multipart/mixed; boundary="===============8649890510339802683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.10.7 FAILED
Message-ID: 
 <010101839477dddb-3e9865c5-8484-49d0-8803-cd42201e66f1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171282

--===============8649890510339802683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.10.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.10.6-3.10.7.patch
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
--===============8649890510339802683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.10.6-3.10.7.patch"

RnJvbSA4NDU3NWYyOWNiZGUyYWZhOTY4ZjY5NGNjZjEwZDc1N2JhN2FjMTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODo0MTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjM6IHVwZ3JhZGUgMy4xMC42IC0+IDMuMTAuNwoKLS0tCiAuLi4tc2VhcmNoLXN5c3RlbS1m
b3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2ggfCAgMiArLQogLi4uLXVzZS1wcmVmaXgtdmFsdWUt
ZnJvbS1idWlsZC1jb25maWd1LnBhdGNoIHwgIDIgKy0KIC4uLmUtdGhlLXJhY2UtY29uZGl0aW9u
LWluLXRlc3RTb2NrTmFtZS5wYXRjaCB8IDQ3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLmZpZy1h
cHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5wYXRjaCB8ICAyICstCiAuLi50dXRpbHMt
cHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2ggfCAgMiArLQogLi4uL3tweXRob24z
XzMuMTAuNi5iYiA9PiBweXRob24zXzMuMTAuNy5iYn0gIHwgIDcgKystCiA2IGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTWl0aWdhdGUtdGhlLXJh
Y2UtY29uZGl0aW9uLWluLXRlc3RTb2NrTmFtZS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjNfMy4xMC42LmJiID0+IHB5dGhvbjNfMy4xMC43LmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8w
MDAxLURvbi10LXNlYXJjaC1zeXN0ZW0tZm9yLWhlYWRlcnMtbGlicmFyaWVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtRG9uLXQtc2VhcmNoLXN5c3Rl
bS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2gKaW5kZXggYzc5MGM3Yjg4Ni4uMTMwYjhlMjc5
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEt
RG9uLXQtc2VhcmNoLXN5c3RlbS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtRG9uLXQtc2VhcmNoLXN5c3Rl
bS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc1ODlh
YjAzYWQzZjdjYjRiYjA5MmMzMTI3M2ZmMjIzNzFhYzc3ZTQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDRlMmZhZTczMmIyOTQwMDhmYmFkOTI2NmM3YTQ1M2E4YmYyMDU3NjUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3Rh
LmNvbT4KIERhdGU6IFdlZCwgNCBNYXIgMjAyMCAwMDowNjo0MiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBEb24ndCBzZWFyY2ggc3lzdGVtIGZvciBoZWFkZXJzL2xpYnJhcmllcwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXN5c2NvbmZp
Zy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxpYi1zeXNjb25maWcucHktdXNlLXBy
ZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2gKaW5kZXggNjQxMDE3ZWRkNS4uYmEw
NzJlODllMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LzAwMDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJlZml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmln
dS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1M
aWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkODJjYjk2ZWVkMTA5ODkyMGFkM2NkY2IzNmZlYjMyMTM3
NjE4MDY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MzhmYTJjODFlN2M2ZGIzMjkz
ODYyNDM3ZWEwMzdhMzQyZmI5ZDVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IEZyaSwgMTAgU2VwIDIw
MjEgMTI6Mjg6MzEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gTGliL3N5c2NvbmZpZy5weTogdXNl
IHByZWZpeCB2YWx1ZSBmcm9tIGJ1aWxkIGNvbmZpZ3VyYXRpb24KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLU1pdGlnYXRlLXRoZS1yYWNlLWNv
bmRpdGlvbi1pbi10ZXN0U29ja05hbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMvMDAwMS1NaXRpZ2F0ZS10aGUtcmFjZS1jb25kaXRpb24taW4tdGVzdFNvY2tO
YW1lLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlMTlkZjA4Zjg3Li4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLU1p
dGlnYXRlLXRoZS1yYWNlLWNvbmRpdGlvbi1pbi10ZXN0U29ja05hbWUucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSw0NyArMCwwIEBACi1VcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLVNpZ25lZC1v
ZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCi1Gcm9tIDgxMDNiOTAx
NDhlODc2ODQ1NmMzYWI3MDdkZTEwNWQ2M2Q5ZDViMjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLURhdGU6IEZyaSwgMTcg
SnVuIDIwMjIgMTE6NTM6NTkgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gTWl0aWdhdGUgdGhlIHJh
Y2UgY29uZGl0aW9uIGluIHRlc3RTb2NrTmFtZQotCi1maW5kX3VudXNlZF9wb3J0KCkgaGFzIGFu
IGluaGVyZW50IHJhY2UgY29uZGl0aW9uLCBidXQgd2UgY2FuJ3QgdXNlCi1iaW5kX3BvcnQoKSBh
cyB0aGF0IHVzZXMgLmdldHNvY2tuYW1lKCkgd2hpY2ggdGhpcyB0ZXN0IGlzIGV4ZXJjaXNpbmcu
Ci0KLVRyeSBiaW5kaW5nIHRvIHVudXNlZCBwb3J0cyBhIGZldyB0aW1lcyBiZWZvcmUgZmFpbGlu
Zy4KLS0tLQotIExpYi90ZXN0L3Rlc3Rfc29ja2V0LnB5IHwgMTUgKysrKysrKysrKysrKy0tCi0g
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYg
LS1naXQgYS9MaWIvdGVzdC90ZXN0X3NvY2tldC5weSBiL0xpYi90ZXN0L3Rlc3Rfc29ja2V0LnB5
Ci1pbmRleCBjOTgxOTAzODI0Li5iMTYzMGQxOGI2IDEwMDY0NAotLS0tIGEvTGliL3Rlc3QvdGVz
dF9zb2NrZXQucHkKLSsrKyBiL0xpYi90ZXN0L3Rlc3Rfc29ja2V0LnB5Ci1AQCAtMTM5MCwxMCAr
MTM5MCwyMSBAQCBkZWYgdGVzdFN0cmluZ1RvSVB2NihzZWxmKToKLSAKLSAgICAgZGVmIHRlc3RT
b2NrTmFtZShzZWxmKToKLSAgICAgICAgICMgVGVzdGluZyBnZXRzb2NrbmFtZSgpCi0tICAgICAg
ICBwb3J0ID0gc29ja2V0X2hlbHBlci5maW5kX3VudXNlZF9wb3J0KCkKLSAgICAgICAgIHNvY2sg
PSBzb2NrZXQuc29ja2V0KHNvY2tldC5BRl9JTkVULCBzb2NrZXQuU09DS19TVFJFQU0pCi0gICAg
ICAgICBzZWxmLmFkZENsZWFudXAoc29jay5jbG9zZSkKLS0gICAgICAgIHNvY2suYmluZCgoIjAu
MC4wLjAiLCBwb3J0KSkKLSsKLSsgICAgICAgICMgU2luY2UgZmluZF91bnVzZWRfcG9ydCgpIGlz
IGluaGVyZW50bHkgc3ViamVjdCB0byByYWNlIGNvbmRpdGlvbnMsIHdlCi0rICAgICAgICAjIGNh
bGwgaXQgYSBjb3VwbGUgdGltZXMgaWYgbmVjZXNzYXJ5LgotKyAgICAgICAgZm9yIGkgaW4gaXRl
cnRvb2xzLmNvdW50KCk6Ci0rICAgICAgICAgICAgcG9ydCA9IHNvY2tldF9oZWxwZXIuZmluZF91
bnVzZWRfcG9ydCgpCi0rICAgICAgICAgICAgdHJ5OgotKyAgICAgICAgICAgICAgICBzb2NrLmJp
bmQoKCIwLjAuMC4wIiwgcG9ydCkpCi0rICAgICAgICAgICAgZXhjZXB0IE9TRXJyb3IgYXMgZToK
LSsgICAgICAgICAgICAgICAgaWYgZS5lcnJubyAhPSBlcnJuby5FQUREUklOVVNFIG9yIGkgPT0g
NToKLSsgICAgICAgICAgICAgICAgICAgIHJhaXNlCi0rICAgICAgICAgICAgZWxzZToKLSsgICAg
ICAgICAgICAgICAgYnJlYWsKLSsKLSAgICAgICAgIG5hbWUgPSBzb2NrLmdldHNvY2tuYW1lKCkK
LSAgICAgICAgICMgWFhYKG5ub3J3aXR6KTogaHR0cDovL3Rpbnl1cmwuY29tL29zNWp6IHNlZW1z
IHRvIGluZGljYXRlCi0gICAgICAgICAjIGl0IHJlYXNvbmFibGUgdG8gZ2V0IHRoZSBob3N0J3Mg
YWRkciBpbiBhZGRpdGlvbiB0byAwLjAuMC4wLgotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtZGlzdHV0aWxzLXN5c2Nv
bmZpZy1hcHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLWRpc3R1dGlscy1zeXNjb25maWctYXBwZW5k
LVNUQUdJTkdfTElCRElSLXB5dGhvbi1zeXMucGF0Y2gKaW5kZXggMzY4YTcyNWZmNy4uZDMwMTEz
NjdlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAw
MDEtZGlzdHV0aWxzLXN5c2NvbmZpZy1hcHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1kaXN0
dXRpbHMtc3lzY29uZmlnLWFwcGVuZC1TVEFHSU5HX0xJQkRJUi1weXRob24tc3lzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBjMjQ2NzRlMGE1MjM2NzM1OWExYTNkOTUwYmFiOGJjM2QyODIy
NzliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0N2Q0YjU2YTlmNDNjZDQxYjMwMjMy
OTU3ODQ2ZWM5NGRhZGFhMTlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDMxIEphbiAy
MDE5IDE2OjQ2OjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRpc3R1dGlscy9zeXNjb25maWc6
IGFwcGVuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5zaWRlLXN0YWdpbmctYXJlYS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8xMi1kaXN0dXRpbHMtcHJlZml4LWlzLWlu
c2lkZS1zdGFnaW5nLWFyZWEucGF0Y2gKaW5kZXggYTA2ZTliNTZjMS4uOGU5ZTIxNjI5NiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzEyLWRpc3R1dGls
cy1wcmVmaXgtaXMtaW5zaWRlLXN0YWdpbmctYXJlYS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3Rh
Z2luZy1hcmVhLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxY2M0Y2FiOGQ1NzliYmNjYjhh
NGZjMTNhMjgxNThhNThjNjAzY2I0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMGMx
YmVkNWQ4YmE2MDRlMzBkODE2ZTEzNDUzOGY0ZTFmZTI3ZTBkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTQg
TWF5IDIwMTMgMTU6MDA6MjYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uMzogQWRkIHRh
cmdldCBhbmQgbmF0aXZlIHJlY2lwZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uM18zLjEwLjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjNfMy4xMC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjEwLjYuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjEwLjcuYmIKaW5kZXggMWY4YjYwYTdh
NS4uNjk0ZmE1YmRjNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zXzMuMTAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjNfMy4xMC43LmJiCkBAIC0zNSw3ICszNSwxMCBAQCBTUkNfVVJJID0gImh0dHA6Ly93d3cucHl0
aG9uLm9yZy9mdHAvcHl0aG9uLyR7UFZ9L1B5dGhvbi0ke1BWfS50YXIueHogXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1zZXR1cC5weS1Eby1ub3QtZGV0ZWN0LW11bHRpYXJjaC1wYXRocy13aGVu
LWNyb3NzLWNvLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2RldGVybWluaXN0aWNfaW1wb3J0
cy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUF2b2lkLXNoZWJhbmctb3ZlcmZsb3ct
b24tcHl0aG9uLWNvbmZpZy5weS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLU1pdGln
YXRlLXRoZS1yYWNlLWNvbmRpdGlvbi1pbi10ZXN0U29ja05hbWUucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8vMDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWls
ZC1jb25maWd1LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtZGlzdHV0aWxzLXN5c2Nv
bmZpZy1hcHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5wYXRjaCBcCisgICAgICAgICAg
IGZpbGU6Ly8xMi1kaXN0dXRpbHMtcHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2gg
XAorICAgICAgICAgICBmaWxlOi8vMDAwMS1Eb24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJz
LWxpYnJhcmllcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3Mt
bmF0aXZlID0gIiBcCkBAIC00NCw3ICs0Nyw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2
ZSA9ICIgXAogICAgICAgICAgICBmaWxlOi8vMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUt
c3RhZ2luZy1hcmVhLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRG9uLXQtc2VhcmNo
LXN5c3RlbS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjc5NWZmODdkMTFkNGIwYzdjMzNiYzg4NTFiMGMyODY0OGQ4YTQ1
ODNhYTIxMDBhOThjMjJiNDMyNmI2ZDNmMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZWVkODQx
NWI3NTE2ZmIyZjI2MDkwNmRiNWQ0OGRkNGMwNmFjYzBjYjI0YTdkNmNjMTUyOTZhNjA0ZGNkYzQ4
IgogCiAjIGV4Y2x1ZGUgcHJlLXJlbGVhc2VzIGZvciBib3RoIHB5dGhvbiAyLnggYW5kIDMueAog
VVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiW1BwXXl0aG9uLSg/UDxwdmVyPlxkKyhcLlxkKykrKS50
YXIiCi0tIAoyLjMxLjEKCg==

--===============8649890510339802683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e9a3474a37c0c9bb94bf196437eebdd7cd1de49"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 173 Local 55 Mirrors 0 Missed 118 Current 152 (31% match, 63% complete)
Removing 44 stale sstate objects for arch qemux86...done.
Removing 15 stale sstate objects for arch core2-32...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 161 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 162 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 173 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 176 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 181 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 182 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 186 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 191 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 194 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 197 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 204 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 212 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 217 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 226 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 229 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 262 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 280 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 289 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_stash_locale_setscene)
NOTE: Running setscene task 295 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 298 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running noexec task 264 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_fetch)
NOTE: Running task 297 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_fetch)
NOTE: Running noexec task 323 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 534 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_fetch)
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 535 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 547 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 548 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_fetch)
NOTE: Running task 556 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 602 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 603 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 604 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 605 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 606 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 607 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 608 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 609 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: Running task 610 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 611 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running task 612 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_fetch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 613 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 615 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_fetch)
NOTE: Running task 616 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_fetch)
NOTE: Running task 617 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_fetch)
NOTE: Running task 618 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 619 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running task 620 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 621 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 622 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 623 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 311 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 624 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 625 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: Running task 626 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_fetch)
NOTE: recipe libgcc-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 313 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 627 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_fetch)
NOTE: Running task 629 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_fetch)
NOTE: Running task 630 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 631 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 633 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 634 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Started
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.65-r0: task do_fetch: Started
NOTE: Running task 635 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: Running task 636 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_fetch: Succeeded
NOTE: Running setscene task 317 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 637 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 638 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_unpack)
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: Running task 639 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: recipe xz-5.2.6-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: Running task 640 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_unpack)
NOTE: Running task 641 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_unpack)
NOTE: Running task 642 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 643 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: Running task 644 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_unpack)
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: Running task 645 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_unpack)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe xz-5.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_fetch: Started
NOTE: Running task 646 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_unpack)
NOTE: Running task 647 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: recipe util-linux-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: Running task 648 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_unpack)
NOTE: Running task 649 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 650 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: Running task 651 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: Running task 652 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe python3-3.10.7-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Started
NOTE: Running task 653 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 318 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 654 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_unpack)
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: Running task 655 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 656 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 657 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_unpack)
NOTE: Running task 658 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 659 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 660 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_unpack)
NOTE: recipe linux-libc-headers-5.19-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 319 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 661 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_unpack)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_fetch: Succeeded
NOTE: Running task 662 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.3+20220423-r0: task do_fetch: Succeeded
NOTE: Running task 663 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 664 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 665 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_unpack)
NOTE: Running task 666 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_unpack)
NOTE: Running task 667 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 320 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: Running setscene task 321 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: Running task 668 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 669 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 670 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Started
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_fetch)
NOTE: recipe cracklib-2.9.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Started
NOTE: Running task 672 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: Running task 673 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: Running task 674 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 675 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.65-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_unpack: Succeeded
NOTE: Running task 676 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_patch)
NOTE: recipe xz-5.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 678 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe psmisc-23.5-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 679 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_patch)
NOTE: Running task 680 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: Running task 681 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 682 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running task 683 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Started
NOTE: recipe zlib-1.2.12-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_unpack: Started
NOTE: Running task 684 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe libcap-2.65-r0: task do_patch: Started
NOTE: Running task 685 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_patch)
NOTE: recipe linux-libc-headers-5.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_patch: Started
NOTE: Running task 686 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: Running task 687 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_unpack)
NOTE: recipe xz-5.2.6-r0: task do_patch: Started
NOTE: Running task 688 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 689 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe python3-native-3.10.7-r0: task do_unpack: Started
NOTE: Running task 690 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 691 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 692 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: Running task 693 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: recipe libgcc-initial-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 322 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 696 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: Running task 697 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_unpack)
NOTE: Running task 698 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: Running task 699 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_patch: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Started
NOTE: Running task 704 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 705 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 708 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 711 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_patch: Started
NOTE: Running task 712 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe shadow-4.12.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: Running task 714 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: Running task 715 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_patch: Started
NOTE: Running task 718 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 719 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_patch: Succeeded
NOTE: Running task 722 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.5-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 725 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: Running task 726 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 727 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: Running task 728 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 729 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Started
NOTE: Running task 733 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_patch)
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 735 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: Running task 739 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe psmisc-23.5-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe openssl-3.0.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: Running task 742 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: Running task 744 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe zlib-1.2.12-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: Running task 750 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_patch)
NOTE: Running task 753 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_patch)
NOTE: Running task 754 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 758 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 760 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_patch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: Running task 766 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-native-3.10.7-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 1194 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch)
NOTE: recipe python3-3.10.7-r0: task do_patch: Succeeded
NOTE: Running task 775 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 776 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_populate_lic)
NOTE: recipe python3-native-3.10.7-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_unpack: Succeeded
NOTE: Running task 777 of 1194 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_patch)
NOTE: recipe python3-3.10.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.7-r0: task do_populate_lic: Started
NOTE: recipe glibc-2.36-r0: task do_patch: Started
NOTE: recipe python3-3.10.7-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-3.10.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.10.7-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-5.19-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 778 tasks of which 646 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-native-3.10.7-r0 do_patch: Applying patch '0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.7-r0/Python-3.10.7'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.7-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-native/3.10.7-r0/temp/log.do_patch.168513
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.7.bb:do_patch) failed with exit code '1'

--===============8649890510339802683==--

