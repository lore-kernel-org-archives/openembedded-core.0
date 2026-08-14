Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EACDC5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:36:47 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7569.1786689404830990636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nEa0pP4k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l482VS7a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ffefcbb36-2b884697-3475-47a7-a397-1c1b7001199a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786689403;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=zDRuzg2tX5PD0Fk/PiknMxJqdSqwvK8x5QcLQJKErB0=;
	b=nEa0pP4kISgxZcMDtGhAf8U8SP1Yznnh5QEnT9NKbrXB3qZolrBc3MwTur+ZdfYa
	nxb5iYTCkUXFOZyHYe3p466O2c+ixwx41LrVoShvoVqyntXpsuZlT/WXnaZ4KVsjqFf
	C0wxFxmr8vax7KThsHLK1rnIzpZUiEaEh0D0jotY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786689403;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=zDRuzg2tX5PD0Fk/PiknMxJqdSqwvK8x5QcLQJKErB0=;
	b=l482VS7aulxFEnU0IFYn+/QDIOvBbLbD685y0Ve3dF71Ty20rbdbYK7xdL6hijQK
	1NA6XEhsuEatAzcfppNlZ5BZagJ0O1SLetZPhSYVtJ3/QvGJZEEmFG+loLJeBDYadq+
	q9oB3CEkAz3C2LaJbE6L50R/+qkL3bGeCiQmk+wM=
Content-Type: multipart/mixed; boundary="===============4149441841723606521=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 50.6 FAILED
Message-ID: <0101019ffefcbb36-2b884697-3475-47a7-a397-1c1b7001199a-000000@us-west-2.amazonses.com>
Date: Fri, 14 Aug 2026 06:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.14-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 06:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243414

--===============4149441841723606521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICplcGlwaGFueSogdG8gKjUwLjYqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpEZXRhaWxl
ZCBlcnJvciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3RlcHM6CiAg
ICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtZXBpcGhhbnktdXBncmFkZS01MC40LTUw
LjYucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQg
c3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGlt
YWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNh
bml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29t
bWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9w
cmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVj
aXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVD
SVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1
dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJl
dmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxk
L3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6
Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0
ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44
IC0tCkZyb20gYTJkY2JiMGM0OTYzOTJiYTk3MDg3MzZiMTgzOTcxMmNkNzExNDdhNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBGcmksIDE0IEF1ZyAyMDI2IDA2OjI1OjU2ICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gZXBpcGhhbnk6IHVwZ3JhZGUgNTAuNCAtPiA1MC42Ck1JTUUtVmVyc2lvbjogMS4wCkNvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0CgpTb3VyY2U6IE5FV1MKCjUwLjYgLSBBdWd1c3QgMTMsIDIwMjYKPT09PT09PT09
PT09PT09PT09PT09PQoKKiBCdWdzIGZpeGVkOgogIC0gIzI4OTggSW52YWxpZCBib29rbWFyayBp
bXBvcnQgY3Jhc2hlcyBicm93c2VyCiAgLSAjMjkyMSBBdXRvZmlsbCBKUyBDb2RlIEluamVjdGlv
biB2aWEgQ1NTIFNlbGVjdG9yCiAgLSAjMjkyMiBXZWJFeHRlbnNpb24gWFBJIFBhdGggVHJhdmVy
c2FsIFpJUFNMSVAKCjUwLjUgLSBBdWd1c3QgMTAsIDIwMjYKPT09PT09PT09PT09PT09PT09PT09
PQoKKiBCdWdzIGZpeGVkOgogIC0gIzI3MTIgQ3Jhc2ggd2hlbiBvcGVuaW5nIHByZWZlcmVuY2Vz
IGRpYWxvZyBhZnRlciBkZWxldGluZyBkZWZhdWx0IHNlYXJjaAogICAgZW5naW5lCiAgLSAjMjg2
OCBBZGRyZXNzYmFyIFVSTCBwcmV0dGlmaWNhdGlvbiBkb2VzIG5vdCB1bmRlcnN0YW5kIElQdjYg
YWRkcmVzc2VzCiAgLSAjMjg3NSBFZGl0aW5nIHBhc3N3b3JkIHVzZXJuYW1lIGNyZWF0ZXMgZHVw
bGljYXRlIGVudHJpZXMKICAtICMyOTAxIE1lbW9yeSBsZWFrIGluIHRoZSBjb3JlIHN0cmluZyB1
dGlsaXR5IGZ1bmN0aW9uIGVwaHlfc3RyaW5nX3Nob3J0ZW4oKQogIC0gITIwOTEgcGFzc3dvcmQt
bWFuYWdlcjogZml4IGNyYXNoIHdoZW4gZGVsZXRpbmcgcGFzc3dvcmQgcmVjb3JkCiAgLSAhMjA5
NCBRdW90ZSBjb21tYW5kIGxpbmUgaW5wdXQgYmVmb3JlIHBhc3NpbmcgdG8gc2hlbGwKICAtICEy
MDk4IHBhc3N3b3JkLW1hbmFnZXI6IGF2b2lkIGR1cGxpY2F0ZSByZWNvcmQgd2hlbiBjaGFuZ2lu
ZyB1c2VybmFtZQogIC0gITIwOTkgRml4IGNyYXNoIHdoZW4gb3BlbmluZyBwcmVmZXJlbmNlcyBk
aWFsb2cgYWZ0ZXIgZGVsZXRpbmcgYSBzZWFyY2gKICAgIGVuZ2luZQogIC0gITIxMDQgRml4IGNy
YXNoIGFmdGVyIGFkZGluZyBhIG5ldyBPcGVuU2VhcmNoIGVuZ2luZQoKKiBUcmFuc2xhdGlvbiB1
cGRhdGVzOgogIC0gQmVsYXJ1c2lhbiAoVmFzaWwgUHVwa2luKQogIC0gQnVsZ2FyaWFuICh0d2x2
bm4ga3JhZnR3ZXJrKQogIC0gR2VybWFuIChDaHJpc3RpYW4gS2lyYmFjaCkKICAtIEluZG9uZXNp
YW4gKEFuZGlrYSBUcml3aWRhZGEpCiAgLSBMYW8gKFNhaWtlbyBLYXZoYW54YXkpCiAgLSBOb3J3
ZWdpYW4gQm9rbcOlbCAoS2phcnRhbiBNYXJhYXMpCiAgLSBQZXJzaWFuIChEYW5pYWwgQmVoemFk
aSkKICAtIFBvbGlzaCAoVmljdG9yaWEgTmllZHppZWxza2EpCiAgLSBTbG92YWsgKEpvc2UgUmlo
YSkKICAtIFRoYWkgKEFlZmdoIFRocmVlbmluZSkKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzUwLjQuYmIgPT4gZXBpcGhhbnlfNTAuNi5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkve2VwaXBoYW55XzUwLjQuYmIgPT4gZXBpcGhhbnlfNTAuNi5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAuNC5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC42LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC40
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAuNi5i
YgppbmRleCAyYjJkMDhiNjE1Li5hZDBmYWQxYTY1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNTAuNi5iYgpAQCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJICs9ICJc
CiAgICAgICAgICAgIGZpbGU6Ly9taWdyYXRvci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9k
aXN0cmlidXRvci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZz
dW1dID0gIjFlMjZmOTkwMWYwZjA4YmZlOTQzYWE3MDE2M2M5NTMzMzRjN2VjM2Q0YWVmYzhkMzU0
ZThhOWMxNDBiMzM0YTciCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI0NTgyMjJhODY5
NGNmYzkxNGU3YTJkNmRlOTg3OTA2NzAwMWE4ZDY1ZTAwYTkwN2Q5NjExMjA1OWM2N2FkNDQ2Igog
CiBleHBvcnQgR0lfVFlQRUxJQl9QQVRIID0gIiR7U1RBR0lOR19MSUJESVJ9L2dpcmVwb3NpdG9y
eS0xLjAvIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
MDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNh
YmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAppbmRleCAzNTA2MTEzOTQ1Li4xMmU5ZDk4MjMzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1l
c29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUt
dXNlLW9mLXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAwNDY5Y2ZjNTgxOGM3NzZh
YTAyNTQ2ZTllNTY0M2E1Y2Y5MDNlOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDll
NTFjYTQ3ZWZjNzRmZWRiNDIwZTZiNjY0MzY1NjlkNTY2MjNlMmQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
aGVscC9tZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCA0ZDNl
MTNiYjMxLi5iMTY1NTJiZmM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkM2E5OTE1
MTA2OGM5YWJjMjMxY2Y1NjJiMjg3NWJlYzgzZGRkMWViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBjYzBiOWE2OTA0Mjk3Mzg3MDY4Mjc0YzgwMjc4NGVlYTc0MDc4MmExIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9vcy1y
ZWxlYXNlIGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNv
bi5idWlsZAotaW5kZXggYzdkZWRjYi4uOTUxOGNlZCAxMDA2NDQKK2luZGV4IGMwMmI1OTEuLjhh
ZjlmZTcgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0x
NSw2ICsxNSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBlcy1n
bm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCAwYWVlZmM2ZjJiLi5iMjBj
YzMwNThiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3Jh
dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MzVkODlmZDI2NWMzMzRmYzRiNjRhMzE1
ZDZkMjczMjg1M2M0NDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMmVhZDJhZmJk
YWI5NmVlYjZiYWM4MjBjMzljMWU5NTFhMDQ3YzhiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CiBEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCi0tIAoyLjQ3LjEKCg==

--===============4149441841723606521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGSIZE changed from 118004 to 145891 (+24%)
packages/x86-64-v3-poky-linux/epiphany: PACKAGES: added "epiphany-locale-lo"

--===============4149441841723606521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="epiphany-changelog.txt"

Q2hhbmdlbG9nIGZvciBlcGlwaGFueTogNTAuNCAtPiA1MC42ClNvdXJjZTogTkVXUwoKNTAuNiAt
IEF1Z3VzdCAxMywgMjAyNgo9PT09PT09PT09PT09PT09PT09PT09CgoqIEJ1Z3MgZml4ZWQ6CiAg
LSAjMjg5OCBJbnZhbGlkIGJvb2ttYXJrIGltcG9ydCBjcmFzaGVzIGJyb3dzZXIKICAtICMyOTIx
IEF1dG9maWxsIEpTIENvZGUgSW5qZWN0aW9uIHZpYSBDU1MgU2VsZWN0b3IKICAtICMyOTIyIFdl
YkV4dGVuc2lvbiBYUEkgUGF0aCBUcmF2ZXJzYWwgWklQU0xJUAoKNTAuNSAtIEF1Z3VzdCAxMCwg
MjAyNgo9PT09PT09PT09PT09PT09PT09PT09CgoqIEJ1Z3MgZml4ZWQ6CiAgLSAjMjcxMiBDcmFz
aCB3aGVuIG9wZW5pbmcgcHJlZmVyZW5jZXMgZGlhbG9nIGFmdGVyIGRlbGV0aW5nIGRlZmF1bHQg
c2VhcmNoCiAgICBlbmdpbmUKICAtICMyODY4IEFkZHJlc3NiYXIgVVJMIHByZXR0aWZpY2F0aW9u
IGRvZXMgbm90IHVuZGVyc3RhbmQgSVB2NiBhZGRyZXNzZXMKICAtICMyODc1IEVkaXRpbmcgcGFz
c3dvcmQgdXNlcm5hbWUgY3JlYXRlcyBkdXBsaWNhdGUgZW50cmllcwogIC0gIzI5MDEgTWVtb3J5
IGxlYWsgaW4gdGhlIGNvcmUgc3RyaW5nIHV0aWxpdHkgZnVuY3Rpb24gZXBoeV9zdHJpbmdfc2hv
cnRlbigpCiAgLSAhMjA5MSBwYXNzd29yZC1tYW5hZ2VyOiBmaXggY3Jhc2ggd2hlbiBkZWxldGlu
ZyBwYXNzd29yZCByZWNvcmQKICAtICEyMDk0IFF1b3RlIGNvbW1hbmQgbGluZSBpbnB1dCBiZWZv
cmUgcGFzc2luZyB0byBzaGVsbAogIC0gITIwOTggcGFzc3dvcmQtbWFuYWdlcjogYXZvaWQgZHVw
bGljYXRlIHJlY29yZCB3aGVuIGNoYW5naW5nIHVzZXJuYW1lCiAgLSAhMjA5OSBGaXggY3Jhc2gg
d2hlbiBvcGVuaW5nIHByZWZlcmVuY2VzIGRpYWxvZyBhZnRlciBkZWxldGluZyBhIHNlYXJjaAog
ICAgZW5naW5lCiAgLSAhMjEwNCBGaXggY3Jhc2ggYWZ0ZXIgYWRkaW5nIGEgbmV3IE9wZW5TZWFy
Y2ggZW5naW5lCgoqIFRyYW5zbGF0aW9uIHVwZGF0ZXM6CiAgLSBCZWxhcnVzaWFuIChWYXNpbCBQ
dXBraW4pCiAgLSBCdWxnYXJpYW4gKHR3bHZubiBrcmFmdHdlcmspCiAgLSBHZXJtYW4gKENocmlz
dGlhbiBLaXJiYWNoKQogIC0gSW5kb25lc2lhbiAoQW5kaWthIFRyaXdpZGFkYSkKICAtIExhbyAo
U2Fpa2VvIEthdmhhbnhheSkKICAtIE5vcndlZ2lhbiBCb2ttw6VsIChLamFydGFuIE1hcmFhcykK
ICAtIFBlcnNpYW4gKERhbmlhbCBCZWh6YWRpKQogIC0gUG9saXNoIChWaWN0b3JpYSBOaWVkemll
bHNrYSkKICAtIFNsb3ZhayAoSm9zZSBSaWhhKQogIC0gVGhhaSAoQWVmZ2ggVGhyZWVuaW5lKQo=

--===============4149441841723606521==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-50.4-50.6.patch"

RnJvbSBhMmRjYmIwYzQ5NjM5MmJhOTcwODczNmIxODM5NzEyY2Q3MTE0N2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTQgQXVnIDIwMjYgMDY6MjU6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA1MC40IC0+IDUwLjYKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKClNvdXJjZTogTkVXUwoKNTAuNiAtIEF1Z3VzdCAxMywgMjAyNgo9PT09PT09PT09PT09
PT09PT09PT09CgoqIEJ1Z3MgZml4ZWQ6CiAgLSAjMjg5OCBJbnZhbGlkIGJvb2ttYXJrIGltcG9y
dCBjcmFzaGVzIGJyb3dzZXIKICAtICMyOTIxIEF1dG9maWxsIEpTIENvZGUgSW5qZWN0aW9uIHZp
YSBDU1MgU2VsZWN0b3IKICAtICMyOTIyIFdlYkV4dGVuc2lvbiBYUEkgUGF0aCBUcmF2ZXJzYWwg
WklQU0xJUAoKNTAuNSAtIEF1Z3VzdCAxMCwgMjAyNgo9PT09PT09PT09PT09PT09PT09PT09Cgoq
IEJ1Z3MgZml4ZWQ6CiAgLSAjMjcxMiBDcmFzaCB3aGVuIG9wZW5pbmcgcHJlZmVyZW5jZXMgZGlh
bG9nIGFmdGVyIGRlbGV0aW5nIGRlZmF1bHQgc2VhcmNoCiAgICBlbmdpbmUKICAtICMyODY4IEFk
ZHJlc3NiYXIgVVJMIHByZXR0aWZpY2F0aW9uIGRvZXMgbm90IHVuZGVyc3RhbmQgSVB2NiBhZGRy
ZXNzZXMKICAtICMyODc1IEVkaXRpbmcgcGFzc3dvcmQgdXNlcm5hbWUgY3JlYXRlcyBkdXBsaWNh
dGUgZW50cmllcwogIC0gIzI5MDEgTWVtb3J5IGxlYWsgaW4gdGhlIGNvcmUgc3RyaW5nIHV0aWxp
dHkgZnVuY3Rpb24gZXBoeV9zdHJpbmdfc2hvcnRlbigpCiAgLSAhMjA5MSBwYXNzd29yZC1tYW5h
Z2VyOiBmaXggY3Jhc2ggd2hlbiBkZWxldGluZyBwYXNzd29yZCByZWNvcmQKICAtICEyMDk0IFF1
b3RlIGNvbW1hbmQgbGluZSBpbnB1dCBiZWZvcmUgcGFzc2luZyB0byBzaGVsbAogIC0gITIwOTgg
cGFzc3dvcmQtbWFuYWdlcjogYXZvaWQgZHVwbGljYXRlIHJlY29yZCB3aGVuIGNoYW5naW5nIHVz
ZXJuYW1lCiAgLSAhMjA5OSBGaXggY3Jhc2ggd2hlbiBvcGVuaW5nIHByZWZlcmVuY2VzIGRpYWxv
ZyBhZnRlciBkZWxldGluZyBhIHNlYXJjaAogICAgZW5naW5lCiAgLSAhMjEwNCBGaXggY3Jhc2gg
YWZ0ZXIgYWRkaW5nIGEgbmV3IE9wZW5TZWFyY2ggZW5naW5lCgoqIFRyYW5zbGF0aW9uIHVwZGF0
ZXM6CiAgLSBCZWxhcnVzaWFuIChWYXNpbCBQdXBraW4pCiAgLSBCdWxnYXJpYW4gKHR3bHZubiBr
cmFmdHdlcmspCiAgLSBHZXJtYW4gKENocmlzdGlhbiBLaXJiYWNoKQogIC0gSW5kb25lc2lhbiAo
QW5kaWthIFRyaXdpZGFkYSkKICAtIExhbyAoU2Fpa2VvIEthdmhhbnhheSkKICAtIE5vcndlZ2lh
biBCb2ttw6VsIChLamFydGFuIE1hcmFhcykKICAtIFBlcnNpYW4gKERhbmlhbCBCZWh6YWRpKQog
IC0gUG9saXNoIChWaWN0b3JpYSBOaWVkemllbHNrYSkKICAtIFNsb3ZhayAoSm9zZSBSaWhhKQog
IC0gVGhhaSAoQWVmZ2ggVGhyZWVuaW5lKQotLS0KIC4uLi9lcGlwaGFueS97ZXBpcGhhbnlfNTAu
NC5iYiA9PiBlcGlwaGFueV81MC42LmJifSAgICAgICAgICAgfCAyICstCiAuLi4vZmlsZXMvMDAw
Mi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIHwgMiArLQog
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoICAgICAg
ICAgICB8IDQgKystLQogbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9y
LnBhdGNoICAgICAgICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS97
ZXBpcGhhbnlfNTAuNC5iYiA9PiBlcGlwaGFueV81MC42LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC40LmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUwLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUwLjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC42LmJiCmlu
ZGV4IDJiMmQwOGI2MTUuLmFkMGZhZDFhNjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9lcGlwaGFueS9lcGlwaGFueV81MC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlw
aGFueS9lcGlwaGFueV81MC42LmJiCkBAIC0zMSw3ICszMSw3IEBAIFNSQ19VUkkgKz0gIlwKICAg
ICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3Ry
aWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiMWUyNmY5OTAxZjBmMDhiZmU5NDNhYTcwMTYzYzk1MzMzNGM3ZWMzZDRhZWZjOGQzNTRlOGE5
YzE0MGIzMzRhNyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjQ1ODIyMmE4Njk0Y2Zj
OTE0ZTdhMmQ2ZGU5ODc5MDY3MDAxYThkNjVlMDBhOTA3ZDk2MTEyMDU5YzY3YWQ0NDYiCiAKIGV4
cG9ydCBHSV9UWVBFTElCX1BBVEggPSAiJHtTVEFHSU5HX0xJQkRJUn0vZ2lyZXBvc2l0b3J5LTEu
MC8iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAy
LWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCmluZGV4IDM1MDYxMTM5NDUuLjEyZTlkOTgyMzMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24u
YnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdu
b21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Ut
b2YteWVscC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDA0NjljZmM1ODE4Yzc3NmFhMDI1
NDZlOWU1NjQzYTVjZjkwM2U4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWU1MWNh
NDdlZmM3NGZlZGI0MjBlNmI2NjQzNjU2OWQ1NjYyM2UyZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogV2VkLCAzMSBKYW4gMjAxOCAxNTo1MDozOCArMDIwMAogU3ViamVjdDogW1BBVENIXSBoZWxw
L21lc29uLmJ1aWxkOiBkaXNhYmxlIHRoZSB1c2Ugb2YgeWVscApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCmluZGV4IDRkM2UxM2Ji
MzEuLmIxNjU1MmJmYzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9m
aWxlcy9kaXN0cmlidXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQzYTk5MTUxMDY4
YzlhYmMyMzFjZjU2MmIyODc1YmVjODNkZGQxZWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGNjMGI5YTY5MDQyOTczODcwNjgyNzRjODAyNzg0ZWVhNzQwNzgyYTEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjYgRmViIDIwMjEgMTA6MTc6NTIgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRjL29zLXJlbGVh
c2UgaW50byB0aGUKQEAgLTExLDcgKzExLDcgQEAgUlAgMjAyMS8yLzI2CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1
aWxkCi1pbmRleCBjN2RlZGNiLi45NTE4Y2VkIDEwMDY0NAoraW5kZXggYzAyYjU5MS4uOGFmOWZl
NyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTE1LDYg
KzE1LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCmluZGV4IDBhZWVmYzZmMmIuLmIyMGNjMzA1
OGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRv
ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3Iu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQzNWQ4OWZkMjY1YzMzNGZjNGI2NGEzMTVkNmQy
NzMyODUzYzQ0NjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDEyZWFkMmFmYmRhYjk2
ZWViNmJhYzgyMGMzOWMxZTk1MWEwNDdjOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERh
dGU6IFRodSwgMjUgRmViIDIwMjEgMTQ6NTI6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXBp
cGhhbnk6IEZpeCByZXByb2R1Y2liaWxpdHkgaXNzdWUKLS0gCjIuNDcuMQoK

--===============4149441841723606521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 10945296 to 10949880 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGSIZE changed from 116685 to 125754 (+8%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGSIZE changed from 129093 to 129090 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 100834 to 101152 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 117488 to 119198 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGSIZE changed from 94232 to 94289 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGSIZE changed from 68584 to 71635 (+4%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 100038 to 100179 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGSIZE changed from 100442 to 100441 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGSIZE changed from 118004 to 145891 (+24%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 32638282 to 32643480 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/50.4/src/preferences -> /usr/src/debug/epiphany/50.6/src/preferences, directory renamed /usr/src/debug/epiphany/50.4/lib/autofill -> /usr/src/debug/epiphany/50.6/lib/autofill, directory renamed /usr/src/debug/epiphany/50.4/src/profile-migrator -> /usr/src/debug/epiphany/50.6/src/profile-migrator, directory renamed /usr/src/debug/epiphany/50.4/embed -> /usr/src/debug/epiphany/50.6/embed, directory renamed /usr/src/debug/epiphany/50.4/src/search-provider -> /usr/src/debug/epiphany/50.6/src/search-provider, directory renamed /usr/src/debug/epiphany/50.4/src/webapp-provider -> /usr/src/debug/epiphany/50.6/src/webapp-provider, directory renamed /usr/src/debug/epiphany/50.4/lib/sync -> /usr/src/debug/epiphany/50.6/lib/sync, directory renamed /usr/src/debug/epiphany/50.4/src/webextension/api -> /usr/src/debug/epiphany/50.6/src/webextension/api, directory renamed /usr/src/debug/epiphany/5
 0.4/embed/web-process-extension -> /usr/src/debug/epiphany/50.6/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/50.4/lib/history -> /usr/src/debug/epiphany/50.6/lib/history, directory renamed /usr/src/debug/epiphany/50.4/lib/contrib -> /usr/src/debug/epiphany/50.6/lib/contrib, directory renamed /usr/src/debug/epiphany/50.4/third-party/gvdb -> /usr/src/debug/epiphany/50.6/third-party/gvdb, directory renamed /usr/src/debug/epiphany/50.4/lib/sync/debug -> /usr/src/debug/epiphany/50.6/lib/sync/debug, directory renamed /usr/src/debug/epiphany/50.4/src/webextension -> /usr/src/debug/epiphany/50.6/src/webextension, directory renamed /usr/src/debug/epiphany/50.4/src -> /usr/src/debug/epiphany/50.6/src, directory renamed /usr/src/debug/epiphany/50.4/third-party -> /usr/src/debug/epiphany/50.6/third-party, directory renamed /usr/src/debug/epiphany/50.4/src/bookmarks -> /usr/src/debug/epiphany/50.6/src/bookmarks, directory renamed /usr/src/debug/epiphany/50.4/lib -> /usr
 /src/debug/epiphany/50.6/lib
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 6693874 to 6695714 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "50.4" to "50.6"
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/50/epiphany-50.4.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/50/epiphany-50.6.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/x86-64-v3-poky-linux/epiphany: PACKAGES: added "epiphany-locale-lo"
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 50.4 [default] to 50.6 [default]
packages/x86-64-v3-poky-linux/epiphany: PV changed from "50.4" to "50.6"

--===============4149441841723606521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 955 .bb files complete (0 cached, 955 parsed). 1984 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-54c19fc7ac41af4d52f0b6df7e3d779477377959"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:54c19fc7ac41af4d52f0b6df7e3d779477377959"
meta-yocto-bsp       
meta-poky            = "master:30756f716a1f527a74a9e12bad8f6e0e756ed9a4"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1508 Local 933 Mirrors 0 Missed 575 Current 471 (61% match, 70% complete)
done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 544 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 662 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 699 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 714 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 790 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx_setscene)
NOTE: Running setscene task 799 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 809 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe epiphany-50.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 814 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 830 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe epiphany-50.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 840 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 842 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 864 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 869 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe groff-native-1.24.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 879 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-native-4.0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libportal-0.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 900 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 904 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 906 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcr-4.4.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 907 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-0.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 909 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 917 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 918 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libical-native-4.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2026.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 925 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 928 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb:do_recipe_qa_setscene)
NOTE: recipe libportal-0.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-c-native-0.10.24+cargo-0.98.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-native-2026.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 944 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe groff-native-1.24.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 952 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 955 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 957 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe appstream-1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe webkitgtk-2.52.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 958 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 971 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 973 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 979 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gsettings-desktop-schemas-50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-c-native-0.10.24+cargo-0.98.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shaderc-native-2026.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1002 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1006 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1016 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.52.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1018 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe orc-native-0.4.42-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-docutils-native-0.23-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1027 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1029 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1032 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1035 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe orc-native-0.4.42-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1036 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe groff-native-1.24.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe groff-native-1.24.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1040 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1046 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1055 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-docutils-native-0.23-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1059 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1060 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-native-2.44.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1062 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1064 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1069 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1072 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe p11-kit-0.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1078 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.70.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1080 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1081 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1083 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1087 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1089 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.24+cargo-0.98.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1090 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1091 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.19.bb:do_recipe_qa_setscene)
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.70.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1092 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1096 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1098 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1099 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1103 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1110 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe enchant2-2.8.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1111 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-native-4.0.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1125 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-native-4.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1131 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1132 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.8.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1133 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1135 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-native-4.0.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1140 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1142 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1144 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe shadow-native-4.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.24+cargo-0.98.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1146 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1157 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1159 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1168 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.24+cargo-0.98.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1170 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-native-3.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1173 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1185 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe groff-native-1.24.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1189 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1191 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1192 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1196 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe groff-native-1.24.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1199 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1202 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1203 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1204 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1206 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1213 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1217 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1220 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1226 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1227 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1229 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/chrpath/chrpath_0.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxmlb-0.3.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1235 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1237 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1240 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1243 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1244 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1259 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-native-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1260 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe librsvg-2.62.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-mako-native-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1273 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1283 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1285 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glslang-native-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1288 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1289 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.62.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1290 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe chrpath-native-0.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1294 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1297 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1298 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1299 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1300 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1304 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1316 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe makedepend-native-1_1.0.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1317 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1319 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1325 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1327 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1329 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1332 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1333 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1334 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1335 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1336 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1344 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1345 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1347 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1353 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1354 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1357 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1358 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.62.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1360 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1361 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1365 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.87-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1372 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1374 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1378 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1382 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1387 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1389 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1397 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1399 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1400 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1404 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1410 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1411 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1412 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1416 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1417 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1420 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1425 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1427 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1429 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1432 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1433 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-native-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1438 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1440 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1441 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1443 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1444 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1446 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1447 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1450 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1454 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1456 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1460 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1462 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1463 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1464 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1465 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1467 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1468 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1469 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1472 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1473 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1474 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1476 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-native-4.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1478 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1481 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1483 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1486 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1488 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1491 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1492 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1493 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1494 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1495 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1498 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1499 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1503 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-native-4.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1504 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1507 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.87-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1508 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1510 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1511 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1512 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1514 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1515 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1516 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1518 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1527 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1528 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_26.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.87-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1531 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1532 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1538 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1543 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1548 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1549 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1550 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libical-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1552 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1553 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1556 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1557 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1558 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1559 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1560 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1561 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1562 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1564 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1566 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1567 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1570 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1572 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1573 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1576 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1580 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1581 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1583 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1585 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1588 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-native-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-native-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1589 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1591 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1592 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1593 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1595 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1599 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1600 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1601 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1603 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1605 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1608 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1614 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1616 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1619 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mesa-2_26.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1620 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-14.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1621 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1622 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1623 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1624 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1627 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1631 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1632 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1633 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1634 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1635 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1636 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1637 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-14.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1638 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1639 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1642 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1643 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1646 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1648 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1649 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1650 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1651 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1654 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1657 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1659 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1665 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1667 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1668 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1669 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1670 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1671 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1672 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1673 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1677 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1678 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1680 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1682 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1684 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1687 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1688 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1695 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1696 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1697 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1698 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-14.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1699 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1700 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1701 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1702 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1707 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1708 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1711 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1712 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-14.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1715 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1716 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1718 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1720 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_package_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1721 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1722 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1723 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1725 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1726 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1727 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1728 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1731 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1735 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1736 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1737 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1739 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1741 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1743 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1745 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1746 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1751 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1753 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1755 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1758 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1759 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1760 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1761 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1762 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-22.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1764 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1765 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1766 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1767 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1772 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1773 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1774 of 1979 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1775 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1776 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1777 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1778 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1780 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1782 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1783 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1785 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1787 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1789 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1791 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1792 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1793 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1794 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1803 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1805 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1806 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1810 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1811 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1817 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1819 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1821 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1822 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1823 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1827 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1828 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1829 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1831 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_setscene)
NOTE: Running setscene task 1832 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1833 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1834 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1835 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1836 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_package_setscene)
NOTE: Running setscene task 1837 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1838 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1842 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1844 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_package_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1855 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1856 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1857 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1858 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 664 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Started
NOTE: Running task 818 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_write_config)
NOTE: Running task 883 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 885 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: Running task 887 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_fetch)
NOTE: Running task 891 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: Running task 893 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_fetch)
NOTE: Running task 903 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_fetch)
NOTE: Running task 916 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 921 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: Running task 933 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_write_config: Started
NOTE: Running task 947 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 949 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 952 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.58-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Started
NOTE: Running task 953 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Succeeded
NOTE: Running task 955 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 957 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: Running task 975 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 976 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: Running task 978 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 979 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1005 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_fetch)
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Started
NOTE: recipe libpng-1.6.58-r0: task do_fetch: Succeeded
NOTE: Running task 1007 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: recipe libpng-1.6.58-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_patch)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Started
NOTE: recipe libpng-1.6.58-r0: task do_unpack: Succeeded
NOTE: Running task 1010 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_patch)
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Started
NOTE: recipe libpng-1.6.58-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1011 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.58-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_patch: Succeeded
NOTE: Running task 1012 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1044 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 1045 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe freetype-2.14.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1047 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_deploy_source_date_epoch unihash changed to 03c97a87b876ced2ccf933d0f316eecf03265bcd4b3484be2c2da60ab6d7dc13
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_deploy_source_date_epoch unihash changed to 7402e63ce220cb3b0334222083e15fe253c713faa2f6adf53667c03c8f1762c2
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: Running task 1058 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1059 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1060 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1061 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1072 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_write_config)
NOTE: Running task 1074 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_fetch)
NOTE: Running task 1096 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_fetch)
NOTE: Running task 1098 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_fetch)
NOTE: recipe python3-3.14.7-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: Running setscene task 1859 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1860 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1861 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1862 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1863 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1864 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1865 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1866 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1867 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1869 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1870 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1871 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch unihash changed to 7402e63ce220cb3b0334222083e15fe253c713faa2f6adf53667c03c8f1762c2
NOTE: Running setscene task 1724 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1728 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1729 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1730 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1731 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_package_setscene)
NOTE: Running setscene task 1732 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1735 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_package_setscene)
NOTE: Running setscene task 1759 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1761 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1787 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1099 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: Running task 1100 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.7-r0: task do_package_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1889 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1892 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1116 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1118 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1119 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_patch)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1894 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1120 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_unpack)
NOTE: Running setscene task 1896 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1122 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1128 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_unpack: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1132 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 1136 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_patch)
NOTE: Running task 1138 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1897 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1898 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1899 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1900 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1901 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1902 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1903 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1904 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1905 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1906 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1907 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1908 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1909 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1911 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1913 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1151 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1915 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1916 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1918 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1919 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1921 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1924 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1926 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1929 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1159 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_patch)
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1931 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1933 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1162 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_fetch: Succeeded
NOTE: Running task 1173 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1936 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1217 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: Running task 1227 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_fetch)
NOTE: Running task 1229 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_fetch)
NOTE: Running task 1230 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_unpack)
NOTE: recipe expat-2.8.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1236 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_unpack)
NOTE: Running task 1237 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_unpack)
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Started
NOTE: Running task 1255 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1938 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: Running task 1256 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.3-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_write_config: Started
NOTE: Running task 1275 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Started
NOTE: Running task 1276 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_patch)
NOTE: recipe freetype-2.14.3-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1285 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: Running task 1308 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_write_config)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe expat-2.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_patch)
NOTE: recipe wayland-1.26.0-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Started
NOTE: recipe expat-2.8.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_unpack: Succeeded
NOTE: Running task 1310 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_patch)
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Succeeded
NOTE: Running task 1312 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.8.3-r0: task do_patch: Succeeded
NOTE: Running task 1315 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_write_config)
NOTE: recipe wayland-1.26.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_patch: Started
NOTE: Running task 1317 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.7.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Started
NOTE: Running task 1339 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Succeeded
NOTE: Running task 1343 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_write_config: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: Running task 1345 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.44.7-r0: task do_patch: Succeeded
NOTE: Running task 1352 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe icu-78.3-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_patch)
NOTE: recipe fontconfig-2.18.3-r0: task do_write_config: Started
NOTE: Running task 1354 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_unpack)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: Running task 1360 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_patch: Started
NOTE: Running task 1371 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1372 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_unpack)
NOTE: recipe fontconfig-2.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_patch)
NOTE: recipe util-linux-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 1374 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe libx11-1_1.8.13-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1380 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe fontconfig-2.18.3-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_patch: Succeeded
NOTE: Running task 1410 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: Running task 1413 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 1414 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_patch)
NOTE: Running task 1415 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1416 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe util-linux-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 1420 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1423 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1429 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: Running task 1432 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe harfbuzz-14.3.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: Running task 1440 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 1443 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1444 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch)
NOTE: recipe pango-1.58.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_fetch)
NOTE: recipe openssl-3.5.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1939 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.62.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1941 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1942 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1943 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running task 1455 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.58.0-r0: task do_fetch: Succeeded
NOTE: Running task 1456 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1944 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1945 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1947 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1458 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_patch)
NOTE: Running task 1459 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1949 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1461 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: Running task 1467 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe harfbuzz-14.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1469 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: Running task 1480 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1489 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1490 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1951 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 1491 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1953 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1954 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: Running task 1493 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1956 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 1957 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1958 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1959 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1960 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_unpack)
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: Running task 1501 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1502 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1506 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-14.3.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1511 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1965 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: Running setscene task 1966 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1970 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1972 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1975 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1977 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1529 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: Running task 1535 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1536 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running noexec task 1559 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_fetch)
NOTE: Running task 1560 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_generate_toolchain_file)
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: recipe pango-1.58.0-r0: task do_unpack: Started
NOTE: Running noexec task 1566 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: Running task 1572 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-22.1.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcxx-22.1.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1703 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: Running task 1727 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1734 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1735 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.58.0-r0: task do_unpack: Succeeded
NOTE: Running task 1736 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1737 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1746 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1757 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1758 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_configure)
NOTE: recipe libpng-1.6.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_configure)
NOTE: recipe libxml2-2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Started
NOTE: recipe libpng-1.6.58-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1760 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_configure)
NOTE: recipe xorgproto-2025.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_configure)
NOTE: recipe harfbuzz-14.3.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.42.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_configure)
NOTE: Running task 1764 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe xorgproto-2025.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.15.3-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe util-linux-2.42.2-r0: task do_configure: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 1779 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: Running task 1780 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_make_icudata)
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1781 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_make_icudata: Started
NOTE: recipe icu-78.3-r0: task do_make_icudata: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: Running task 1782 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1783 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1788 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: Running task 1789 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: Running task 1799 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_configure: Succeeded
NOTE: Running task 1800 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_compile)
NOTE: recipe xorgproto-2025.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2025.1-r0: task do_compile: Succeeded
NOTE: Running task 1801 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_install)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe xorgproto-2025.1-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1803 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_compile)
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1804 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_install)
NOTE: recipe xorgproto-2025.1-r0: task do_install: Succeeded
NOTE: Running task 1805 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Started
NOTE: Running task 1806 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_package)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_package: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_install: Succeeded
NOTE: Running task 1808 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot unihash changed to 94864a23337098b66d7d28800297309699c80d8956e529c47582b761593b266a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running setscene task 1935 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1974 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1809 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: Running task 1810 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1812 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_package unihash changed to 2464ae88886128826b1d44b1410d5e61efa0bbd6a98978edaf7927d0a56edf34
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata became valid
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running task 1813 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: Running task 1814 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: Running task 1815 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: Running task 1817 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_configure)
NOTE: Running task 1818 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1820 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_compile)
NOTE: Running task 1821 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe icu-78.3-r0: task do_configure: Succeeded
NOTE: Running task 1822 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure_ptest_base)
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Started
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1823 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile)
NOTE: recipe icu-78.3-r0: task do_compile: Started
NOTE: recipe libpng-1.6.58-r0: task do_configure: Succeeded
NOTE: Running task 1824 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: Running task 1826 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.58-r0: task do_configure_ptest_base: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 1827 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe libpng-1.6.58-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1828 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_compile)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe libpng-1.6.58-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_package unihash changed to fd385479c884f28fd493080625708c3583d11a384490efc68315e21e48266397
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx became valid
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot unihash changed to cab931cbfdfa6328577dedd88c50710ffbec74edd4a9ce56eb7aa0673f685d13
NOTE: Running setscene task 1934 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running task 1829 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_configure_ptest_base)
NOTE: Running task 1830 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: Running task 1832 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe libxml2-2.15.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1833 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_compile)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe libxml2-2.15.3-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1837 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1839 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot unihash changed to d9e293e257dfde2ada0550844464d3755a0448dd1ea13cb92789a041455d5e77
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 1977 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1840 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_compile)
NOTE: Running task 1841 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to aac821da5608e1a1409fac3591d8577eb65c369bdd0774c483b17127d46cd82d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx became valid
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 1946 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running task 1842 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_install)
NOTE: Running task 1843 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_install)
NOTE: Running task 1845 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: Running task 1846 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_compile: Succeeded
NOTE: Running task 1847 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_compile_ptest_base)
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 1848 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe libpng-1.6.58-r0: task do_compile_ptest_base: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1849 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_install)
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_install: Succeeded
NOTE: Running task 1857 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_patch)
NOTE: Running task 1859 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 1861 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_package)
NOTE: recipe libpng-1.6.58-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe harfbuzz-14.3.0-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1862 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe harfbuzz-14.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1863 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe pango-1.58.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 1869 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.58.0-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: recipe libcxx-22.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.58-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: Running task 1871 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_install_ptest_base)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1872 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: Running task 1873 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.58-r0: task do_install_ptest_base: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to a13f4779d34e689c147a34108b63428fb752486f389f7bf42b67696092b8a55f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: recipe libcxx-22.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package unihash changed to 527b79f35f8f0af6007c43bbb88398590658bd57eb7070d1060ba42732daa205
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to 67730b5410bc6e6cc4b122c3f97763ef17de56c55e5e791c2c3e3aa35803dd39
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 1978 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running task 1875 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot)
NOTE: Running task 1876 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: Running task 1877 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_configure)
NOTE: Running task 1878 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_configure)
NOTE: Running task 1886 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe libcxx-22.1.8-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_package unihash changed to 394a0082abd0521ffe43c4874090e2903b9d0db4a019e6e6c9f1caeee080fff8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx became valid
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot unihash changed to 39a69377f24cd66c7ad8dbc3b1f786cdc7b137715a2603202851263d70ce2c46
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running setscene task 1941 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running task 1887 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_configure_ptest_base)
NOTE: Running task 1888 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: Running task 1892 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1910 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: Running task 1915 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: Running task 1918 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_fetch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1919 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1925 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_fetch)
NOTE: Running task 1926 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1938 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1942 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb:do_fetch)
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1943 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1944 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1945 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: Running task 1946 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1949 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 1951 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Started
NOTE: Running task 1963 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1967 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe libxml2-2.15.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 1968 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1970 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxml2-2.15.3-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1977 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1978 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1979 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.3-r0: task do_install: Succeeded
NOTE: Running task 1980 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.15.3-r0: task do_install_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1981 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: Running task 1987 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-14.3.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Succeeded
NOTE: Running task 1989 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_write_config)
NOTE: recipe harfbuzz-14.3.0-r0: task do_write_config: Succeeded
NOTE: Running task 1991 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_write_config: Succeeded
NOTE: Running task 1992 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1993 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1999 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_fetch: Succeeded
NOTE: Running task 2000 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to e437dd59acc4f9a2801fdcd3fdc9fe728924b3cb9220f5c429ac3ac78047a2e1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: recipe freetype-2.14.3-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1947 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running task 2001 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_patch)
NOTE: Running task 2002 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2003 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: recipe librsvg-2.62.3-r0: task do_fetch: Succeeded
NOTE: Running task 2004 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: Running task 2005 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_patch: Started
NOTE: recipe freetype-2.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe freetype-2.14.3-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2011 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_write_config)
NOTE: Setscene tasks completed
NOTE: recipe librsvg-2.62.3-r0: task do_unpack: Started
NOTE: Running task 2017 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_unpack)
NOTE: recipe libxft-1_2.3.9-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Started
NOTE: Running task 2019 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_write_config)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2020 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx)
NOTE: Running task 2021 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 2022 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_patch)
NOTE: recipe pango-1.58.0-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Started
NOTE: recipe pango-1.58.0-r0: task do_write_config: Succeeded
NOTE: Running task 2023 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx)
NOTE: recipe freetype-2.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2024 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_configure)
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Succeeded
NOTE: Running task 2027 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe freetype-2.14.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2083 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 2085 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.96.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_fetch: Started
NOTE: Running task 2094 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_write_config)
NOTE: recipe mesa-2_26.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2100 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_unpack)
NOTE: Running task 2101 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_write_config: Succeeded
NOTE: Running task 2102 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Succeeded
NOTE: Running task 2103 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2104 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 2105 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Succeeded
NOTE: Running task 2110 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 2111 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2119 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 2120 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_patch: Succeeded
NOTE: Running task 2122 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2123 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running task 2125 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: Running task 2126 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2127 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: Running task 2128 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2129 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Started
NOTE: Running task 2130 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2131 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Succeeded
NOTE: Running task 2132 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_compile)
NOTE: recipe libxml2-2.15.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2134 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2136 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 2137 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_package)
NOTE: Running task 2138 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Started
NOTE: recipe wayland-1.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 2139 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_install)
NOTE: recipe freetype-2.14.3-r0: task do_compile: Started
NOTE: recipe libpng-1.6.58-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2140 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2141 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Started
NOTE: Running task 2142 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2143 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Running task 2145 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.26.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 2152 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2153 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 2154 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe libical-4.0.4-r0: task do_fetch: Started
NOTE: recipe libcxx-22.1.8-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_compile)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2156 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: recipe libcxx-22.1.8-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 2164 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: Running task 2173 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-4.0.4-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_unpack: Started
NOTE: Running task 2203 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: Running task 2215 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx)
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx: Started
NOTE: Running task 2221 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 2222 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2232 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_write_config)
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure)
NOTE: Running task 2234 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_compile_ptest_base)
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 2235 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_compile)
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Succeeded
NOTE: Running task 2236 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2237 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot unihash changed to 86dfcc83b663640a4b489cea723e1670ec1cdcbe8d6accd533940c2ae848e2cb
NOTE: Setscene tasks completed
NOTE: Running task 2243 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_unpack)
NOTE: recipe libical-4.0.4-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2244 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_configure)
NOTE: recipe librsvg-2.62.3-r0: task do_unpack: Succeeded
NOTE: recipe libical-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 2245 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_patch)
NOTE: recipe util-linux-2.42.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2246 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_patch)
NOTE: Running task 2247 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_configure_ptest_base)
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Started
NOTE: recipe libical-4.0.4-r0: task do_patch: Started
NOTE: recipe librsvg-2.62.3-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.42.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2248 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_compile)
NOTE: recipe libical-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_recipe_spdx)
NOTE: Running task 2250 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_install)
NOTE: recipe util-linux-2.42.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure: Succeeded
NOTE: Running task 2251 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_configure_ptest_base)
NOTE: recipe librsvg-2.62.3-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_install: Started
NOTE: Running task 2254 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_fetch)
NOTE: recipe libusb1-1.0.30-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2255 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_fetch)
NOTE: recipe wayland-1.26.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2256 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_compile)
NOTE: recipe wayland-1.26.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.87-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2257 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_install: Started
NOTE: Running task 2261 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_write_config)
NOTE: Running task 2262 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.87-r0: task do_fetch: Succeeded
NOTE: Running task 2263 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.3.bb:do_rust_gen_targets)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install_ptest_base: Started
NOTE: recipe freetype-2.14.3-r0: task do_install: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_write_config: Started
NOTE: Running task 2264 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe librsvg-2.62.3-r0: task do_write_config: Succeeded
NOTE: Running task 2272 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb:do_write_config)
NOTE: Running task 2273 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot)
NOTE: recipe librsvg-2.62.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.62.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2274 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_write_config: Started
NOTE: Running task 2276 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.28.5-r0: task do_write_config: Succeeded
NOTE: Running task 2277 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_write_config)
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Succeeded
NOTE: Running task 2278 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_compile_ptest_base)
NOTE: Running task 2287 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile_ptest_base: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot unihash changed to a6a902644ba4cca4e29fc40e83cbca8b363a1411d2446899204c6194e74078ef
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot unihash changed to 46b961f2504ac92bee310a2e4132a6a40966863bdfc466a8f15e121e0113aa50
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2289 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: Running task 2290 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_install)
NOTE: Running task 2291 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_configure)
NOTE: Running task 2292 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata)
NOTE: Running task 2293 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 2294 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_compile)
NOTE: Running task 2295 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: Running task 2297 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_write_config)
NOTE: Running task 2303 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 2304 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_patch: Started
NOTE: recipe wayland-1.26.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Started
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_write_config: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_write_config: Succeeded
NOTE: Running task 2321 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 2322 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_write_config)
NOTE: recipe xrandr-1_1.5.4-r0: task do_write_config: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_write_config: Succeeded
NOTE: Running task 2328 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_fetch)
NOTE: Running task 2329 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_patch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2349 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.3-r0: task do_fetch: Started
NOTE: Running task 2350 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: Running task 2356 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_package: Started
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_install)
NOTE: Running task 2358 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.30-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.30-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_install: Succeeded
NOTE: Running task 2359 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_install: Started
NOTE: Running task 2360 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2376 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: recipe bluez5-5.87-r0: task do_unpack: Started
NOTE: recipe wayland-1.26.0-r0: task do_install_ptest_base: Started
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.30-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.30-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bluez5-5.87-r0: task do_unpack: Succeeded
NOTE: Running task 2461 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.87.bb:do_patch)
NOTE: Running task 2462 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.87-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.87-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_install: Succeeded
NOTE: Running task 2464 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_package)
NOTE: Running task 2465 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2466 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_recipe_spdx)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.3-r0: task do_package: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2467 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_recipe_spdx)
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2470 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2471 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot unihash changed to 29cc0224e96b3f7ee8cea26189e435564223705bc2d4188748de2c120f873368
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2472 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2478 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2480 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 2484 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2485 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_patch)
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2486 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_configure)
NOTE: recipe libxi-1_1.8.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Started
NOTE: recipe freetype-2.14.3-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2490 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_package unihash changed to f8a545532287e0fbc87a1175cef81f1cb4c0d4b1ef7ae80fec9978f4995981d4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata became valid
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running task 2495 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 2496 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2503 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 2504 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_unpack)
NOTE: Running task 2505 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2506 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2509 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2510 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Succeeded
NOTE: Running task 2540 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: Running task 2541 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 2542 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Succeeded
NOTE: Running task 2543 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: Running task 2544 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.7-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2545 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2546 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2547 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Succeeded
NOTE: Running task 2557 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.4.bb:do_generate_toolchain_file)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libical-4.0.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-4.0.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2567 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Succeeded
NOTE: Running task 2568 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2569 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running task 2570 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2572 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_write_config: Succeeded
NOTE: Running task 2573 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: Running task 2580 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2588 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to e075b03fcf6cff6bab75cd269e249b7f247cd3c26574043f958dfdb2f2ef9dc2
NOTE: recipe util-linux-2.42.2-r0: task do_compile: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2589 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_compile_ptest_base)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2597 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: Running task 2600 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_unpack)
NOTE: Running task 2601 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: Running task 2608 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 2609 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 2610 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Succeeded
NOTE: Running task 2611 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure_ptest_base)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Succeeded
NOTE: Running task 2612 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: Running task 2614 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Started
NOTE: Running task 2615 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2617 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2618 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: Running task 2619 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile)
NOTE: recipe libdrm-2.4.134-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2620 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2621 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx)
NOTE: Running task 2622 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: Running task 2626 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package)
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to 1114d36e09252c3919164cf8250347a74c801abda6fb37d4b81b5feca11ce533
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_install: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running task 2627 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_configure)
NOTE: Running task 2628 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot)
NOTE: Running task 2630 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_fetch)
NOTE: Running task 2639 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: recipe util-linux-2.42.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2640 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_install)
NOTE: recipe libx11-1_1.8.13-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.28-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 2641 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: recipe util-linux-2.42.2-r0: task do_install: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2650 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: Running task 2655 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_compile)
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2656 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 2657 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot unihash changed to 897895293e06a909c232227eb43790096021d158beb4338b310c36e6c65cb491
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2658 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: Running task 2659 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Running task 2660 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_install)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package unihash changed to cf0afb2ef95565e68b77e6d2686e15bb6dc9ca55b9329edda2b3c22d01f036db
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata became valid
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata_setscene)
NOTE: Running task 2667 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.28-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2669 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2682 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 2683 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2685 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2686 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: Running task 2692 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2693 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Succeeded
NOTE: Running task 2696 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_fetch: Succeeded
NOTE: Running task 2698 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_recipe_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2699 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: Running task 2701 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2706 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2707 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_configure)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2710 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_fetch)
NOTE: recipe libxmlb-0.3.28-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.45-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2711 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.42.2-r0: task do_install: Succeeded
NOTE: Running task 2712 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_install_ptest_base)
NOTE: recipe libxslt-1.1.45-r0: task do_fetch: Succeeded
NOTE: Running task 2714 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.28-r0: task do_unpack: Succeeded
NOTE: Running task 2715 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_patch)
NOTE: recipe libxmlb-0.3.28-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.28-r0: task do_patch: Succeeded
NOTE: Running task 2718 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package)
NOTE: recipe libpciaccess-0.19-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2719 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.3.bb:do_create_spdx)
NOTE: recipe expat-2.8.3-r0: task do_create_spdx: Started
NOTE: recipe libcxx-22.1.8-r0: task do_compile: Succeeded
NOTE: Running task 2720 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_install)
NOTE: recipe xkeyboard-config-2.48-r0: task do_configure: Succeeded
NOTE: Running task 2721 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_compile)
NOTE: recipe libcxx-22.1.8-r0: task do_install: Started
NOTE: recipe expat-2.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2724 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.48-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_fetch: Succeeded
NOTE: Running task 2725 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2726 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2731 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_compile: Succeeded
NOTE: Running task 2732 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_install)
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.19-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package unihash changed to aafeef1f682e15966f5c7b7945674447d33df4bf5d55ec0a0e3c881ec7912c18
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata became valid
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_install: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2737 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: Running task 2741 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2742 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: Running task 2743 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe util-linux-2.42.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_populate_sysroot unihash changed to 96c7313061a0480d101711bdd3a1cf36caf5d4163b8d1726b6eb67c5bef9da8d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot became valid
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1935 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_populate_sysroot_setscene)
NOTE: Running task 2744 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2746 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package)
NOTE: Running task 2748 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx)
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Succeeded
NOTE: Running task 2749 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile_ptest_base)
NOTE: recipe fontconfig-2.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_install: Succeeded
NOTE: Running task 2750 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2751 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: Running task 2752 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 2753 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2754 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2755 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2758 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2759 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot unihash changed to 5bb6a5a0e33fc63cbb4d63ad840ffd9e48fdfac7c4a434502f5b02d87d4e7898
NOTE: Setscene tasks completed
NOTE: Running task 2762 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2763 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Succeeded
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: Running task 2764 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install_ptest_base)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Started
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2766 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_write_config)
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package unihash changed to 24c0fe83e7df958743ba778ab5d252605c5d1315d185128e6cfb1c79cd12b3a9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata became valid
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 1966 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running task 2768 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2769 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2770 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcxx-22.1.8-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2771 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2772 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2773 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2775 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2776 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: Running task 2777 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_configure)
NOTE: Running task 2778 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_unpack)
NOTE: recipe libdrm-2.4.134-r0: task do_package: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to a271c7c666e005ded22e0b8b611f500f583301f9a4d4e9d991553f88dd63c8b6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: recipe libxkbcommon-1.13.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_unpack: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package unihash changed to b1ba3e6ae32cfdf27b514d1a7c752f1762c0e5fbc5ad18807a5b03f9e5fdc4b6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot unihash changed to 65b2bfab3d362c63672efb0466fc4456ce60a616ba3ab87f1405cec71429aace
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata became valid
NOTE: Running setscene task 1957 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata_setscene)
NOTE: Running setscene task 1970 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running task 2779 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2780 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2782 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2784 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: Running task 2785 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2791 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2792 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2793 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: Running task 2794 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: Running task 2801 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_unpack)
NOTE: recipe libstd-rs-1.96.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2802 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_rust_create_wrappers)
NOTE: recipe libxslt-1.1.45-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libxslt-1.1.45-r0: task do_unpack: Succeeded
NOTE: Running task 2803 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_patch)
NOTE: recipe libstd-rs-1.96.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2804 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2805 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: recipe libxslt-1.1.45-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.45-r0: task do_patch: Succeeded
NOTE: Running task 2806 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: recipe libx11-1_1.8.13-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2807 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_compile)
NOTE: Running task 2808 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_configure: Succeeded
NOTE: Running task 2809 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_compile)
NOTE: recipe libx11-1_1.8.13-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2810 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx)
NOTE: recipe libstd-rs-1.96.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2811 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2813 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb:do_unpack)
NOTE: recipe fontconfig-2.18.3-r0: task do_configure: Succeeded
NOTE: Running task 2814 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2815 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_unpack: Succeeded
NOTE: Running task 2816 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2817 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_compile)
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2818 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2819 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2821 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2825 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 2826 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: Running task 2830 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_spdx)
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_package unihash changed to 0bcbadaa6da4dd3905d470fcdf0f2d436a74d23e697eabe9ad1f25ae099dcbe3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx became valid
NOTE: Running setscene task 1958 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_package unihash changed to 8bd1a5936becd70f9104063993c847443d5eae294c3288b0ddee26cbe069587c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_packagedata became valid
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2832 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_compile: Succeeded
NOTE: Running task 2833 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.26.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2842 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: Running task 2843 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to ee6788872592d41cda3f6318b317bb9ff6b2a10f4a2ce3271c2f42c688906491
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Running setscene task 1978 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_compile: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2844 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile_ptest_base)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2845 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 2846 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2847 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_fetch: Succeeded
NOTE: Running task 2848 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe python3-3.14.7-r0: task do_install: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: Running task 2850 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe tiff-4.7.2-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2860 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2861 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2862 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_install)
NOTE: Running task 2863 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe openssl-3.5.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2868 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_create_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_install: Started
NOTE: Running task 2869 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata)
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_compile)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2871 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe wayland-1.26.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2873 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_install: Succeeded
NOTE: Running task 2875 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2877 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_compile: Succeeded
NOTE: Running task 2878 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2880 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: recipe fontconfig-2.18.3-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2881 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2896 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_spdx)
NOTE: Running task 2899 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.28-r0: task do_write_config: Started
NOTE: recipe libxmlb-0.3.28-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 2908 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: Running task 2920 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_fetch)
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Succeeded
NOTE: Running task 2922 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package)
NOTE: recipe libice-1_1.1.2-r0: task do_package: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package unihash changed to 5f74d8b8f6b3943fc2e0bff79f71d0cc7c466bc1483def3588859c140a55332e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata became valid
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot unihash changed to 2d1d9e5ed94d761c0adbb08c72936f47dd0268ee2193692817c44a21922c1a35
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running task 2923 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_populate_sysroot)
NOTE: Running task 2924 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_package)
NOTE: Running task 2926 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.70.0-r0: task do_fetch: Started
NOTE: Running task 2927 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe fontconfig-2.18.3-r0: task do_package: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2939 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2940 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2942 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: recipe nghttp2-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 2943 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2944 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2945 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.42.2-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2946 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_unpack)
NOTE: Running task 2949 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_fetch)
NOTE: recipe tiff-4.7.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.22.4-r0: task do_fetch: Started
NOTE: recipe gtk4-4.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 2950 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe tiff-4.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2951 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2952 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2953 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_unpack: Succeeded
NOTE: Running task 2954 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe tiff-4.7.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: Running task 2957 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_configure_ptest_base)
NOTE: recipe tiff-4.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2958 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 2959 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe libgcrypt-1.12.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2960 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_compile)
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2961 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package unihash changed to c121e0dc6b85e895f84f873ac0e6b1864a656006fde2fd4aed75a9a2c20d13ca
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_patch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running task 2962 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: Running task 2966 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx)
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2967 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2969 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_write_config)
NOTE: Setscene tasks completed
NOTE: Running task 2971 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2972 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Started
NOTE: Running task 2980 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_write_config: Started
NOTE: recipe libxslt-1.1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_write_config: Succeeded
NOTE: Running task 2982 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe fontconfig-2.18.3-r0: task do_package: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 2983 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata)
NOTE: Running task 2984 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_unpack)
NOTE: recipe libxslt-1.1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2985 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_configure)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata: Started
NOTE: Running task 2992 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_unpack)
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_compile: Succeeded
NOTE: Running task 2993 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_install)
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Succeeded
NOTE: Running task 2994 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_patch)
NOTE: recipe libxslt-1.1.45-r0: task do_configure: Started
NOTE: recipe nghttp2-1.70.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_install: Started
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Succeeded
NOTE: Running task 3001 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx)
NOTE: recipe nghttp2-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3002 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_patch)
NOTE: Running task 3003 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb:do_write_config)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Started
NOTE: recipe nghttp2-1.70.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.5-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 3004 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3039 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_package)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3040 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3041 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: Running task 3042 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_compile: Succeeded
NOTE: Running task 3043 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_install)
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_install: Succeeded
NOTE: Running task 3047 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package unihash changed to 6944c6e7fea43e2cb80753fc5051c3a5abec7e3050c0142a8cc413b6ecbd1d22
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3049 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 8ff5bf39a061b7457d02044ecca676fa0099b33d3bed70b0f3b332e5649c622a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Running setscene task 1971 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3054 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: Running task 3055 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3056 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3057 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe gtk4-4.22.4-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package unihash changed to 59ef2b00a3b440a83b155c0ab10b9600076b84e9399f0b3fb8921ca1284e9151
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata became valid
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3058 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 3059 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.48-r0: task do_package: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_unpack: Succeeded
NOTE: Running task 3060 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_package unihash changed to caa113357bacca328cce493d3fe3223971fe0c7cf572b5669840c33d9bc537ad
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata became valid
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_package: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata_setscene)
NOTE: Running task 3062 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: Running task 3065 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot unihash changed to 5711a374acca9247a57d99374ae5ff79c072788b05c6c91637a0189566389f35
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot became valid
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_package unihash changed to 5b5d384362881f740486eff1717732ba73c2a9c5f9e778686e1edffdfd9e0f87
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_packagedata became valid
NOTE: Running setscene task 1861 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1876 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1929 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1949 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1966 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1974 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1978 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3066 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3067 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3068 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 3069 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3070 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_configure)
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3071 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3072 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_configure)
NOTE: Running task 3073 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: Running task 3074 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_configure)
NOTE: recipe libusb1-1.0.30-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3075 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3076 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: recipe libxslt-1.1.45-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_patch)
NOTE: recipe gtk4-4.22.4-r0: task do_patch: Started
NOTE: recipe gtk4-4.22.4-r0: task do_patch: Succeeded
NOTE: Running task 3084 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 01601c830bf0505dffefe38b59daca3ab016e10d573425e9e20abf8724f20aa7
NOTE: Setscene tasks completed
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3086 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: Running task 3088 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_package)
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: Running task 3093 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package: Started
NOTE: Running task 3094 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3097 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3098 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3100 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3108 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 3109 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_create_recipe_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: Running task 3110 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3112 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_package unihash changed to 8803839f338924bd16033000a4e4efa5083746d181a296c2dfab8727cb18a257
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata became valid
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot unihash changed to c1dc0eb3287ece4c9bdbb31ae57524001036d506c2f75fca3fcefb3a857bfdb9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1921 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1937 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1978 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: Running task 3113 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package: Succeeded
NOTE: Running task 3114 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3116 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 3117 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3118 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata: Started
NOTE: Running task 3119 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata unihash changed to 4a338e365e123cc4edc8b550d5f54784e57deaafb99f7f92aeac9502c8c73b31
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3120 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package unihash changed to 3393b013b4c1bf0cf06b18c855edce308bea7d8136bcc429254bf4e968db8858
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata became valid
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 3123 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_compile_ptest_base)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 3133 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 3138 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb:do_create_recipe_spdx)
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3139 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_install)
NOTE: recipe harfbuzz-14.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package unihash changed to a681b3f99586842b5562d15d226f7bce149c267e522b2a4766996e2d699bee8a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 3145 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx)
NOTE: recipe harfbuzz-14.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3149 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3151 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_fetch)
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3164 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3165 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_write_config: Started
NOTE: Running task 3166 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_write_config: Succeeded
NOTE: Running task 3167 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.5-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 3168 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3169 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe tiff-4.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Succeeded
NOTE: Running task 3170 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3171 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_install)
NOTE: recipe mesa-2_26.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Started
NOTE: recipe tiff-4.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3172 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_configure)
NOTE: recipe tiff-4.7.2-r0: task do_configure: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3173 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: Running task 3174 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3182 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 3183 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot unihash changed to f8739de3c6c97db84af1da9f688391d7386b651121ecd13aa0d6c48f603d7aa5
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3184 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_compile)
NOTE: Running task 3185 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_compile)
NOTE: Running task 3186 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_configure_ptest_base)
NOTE: Running task 3187 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package)
NOTE: Running task 3191 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3192 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: recipe libusb1-1.0.30-r0: task do_configure_ptest_base: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe libusb1-1.0.30-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3193 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_compile)
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.30-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3194 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: Running task 3197 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_install)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3199 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_install)
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3200 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: recipe libxext-1_1.3.7-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Succeeded
NOTE: Running task 3202 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: Running task 3204 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.30-r0: task do_compile: Succeeded
NOTE: Running task 3205 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3207 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 3209 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package unihash changed to 8d8e43c5b1a885bfdad923c71ef72c73eaccce5d823bf1bd205958de36256689
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata became valid
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3210 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3211 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3212 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 3213 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: Running task 3214 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3215 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_configure)
NOTE: recipe libxi-1_1.8.3-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3216 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 3217 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package unihash changed to 5f0221ecfc7d6b3762709e7a13606e29f86095390420fa5463ae825ccae64b3b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package unihash changed to 9594b9e8abc903610865bb46bdd9eb6d4b9cb0d4e2d74fb15ff7e83af9c99e96
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Running setscene task 1972 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running task 3218 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_compile)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_package unihash changed to b11fc4c31f54c70067171e83a801e270ea2cd0dcedbbba302f45faa6a463970d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata became valid
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package unihash changed to 8a2f69fe56d5920c246edd55e2cc6a21887b7b36e26cf2f8fcdc8549a66ddbf2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 1932 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running task 3219 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: Running task 3220 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_install)
NOTE: Running task 3222 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_compile)
NOTE: Running task 3225 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_compile_ptest_base)
NOTE: Running task 3226 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.30-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3227 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3229 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3230 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_install)
NOTE: Running task 3231 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.30-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 3232 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_install)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Started
NOTE: Running task 3233 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Succeeded
NOTE: Running task 3234 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: Running task 3235 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Running task 3236 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.30-r0: task do_install: Succeeded
NOTE: Running task 3237 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3238 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot unihash changed to 752b853eb3cc3d2950d09fc3db20f28537b81ec833771c5688c307cb4677e670
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3239 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3240 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3241 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3242 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot unihash changed to 4c33474522f595839884e16c9b1d9a8281042af71c9098247dd9e58486cfd8b8
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Succeeded
NOTE: Running task 3243 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: Running task 3244 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package unihash changed to 792fb01946284e5d025024bf5533c3513bdcceafda0c51d50c5e43b22577b30f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata became valid
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Started
NOTE: Running setscene task 1971 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running task 3245 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: Running task 3246 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3248 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: Running task 3249 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Running task 3250 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 3251 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_compile)
NOTE: recipe libstd-rs-1.96.1-r0: task do_compile: Succeeded
NOTE: Running task 3252 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_install)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to 6d11edf1b5326953131a136b5508b08281b2ce38aaea76c6f5806edccff08c14
NOTE: Running task 3253 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: Running task 3254 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_install_ptest_base)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: Running task 3255 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package unihash changed to e6d3237c3d74066820bd68ff1fcdf6ac62e7a29cb26e8345372df784c27c1786
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata became valid
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running task 3256 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_populate_sysroot)
NOTE: Running task 3259 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3260 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.96.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3261 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_compile)
NOTE: recipe tiff-4.7.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3263 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot unihash changed to a6c6bba6b3c0eb71d9e44b9f1704e943603ec0ca882bd2d7fd3052ac148d1f30
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libcxx-22.1.8-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3264 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: Running task 3265 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3266 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_populate_sysroot unihash changed to 1299c3688fdd44c2b6728c0f795614b09c9c09195eeb4fff4fda3edebf6be557
NOTE: Setscene tasks completed
NOTE: Running task 3267 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_configure_ptest_base)
NOTE: recipe libxslt-1.1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libxslt-1.1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3268 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_compile)
NOTE: recipe libxslt-1.1.45-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3269 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_install)
NOTE: recipe xrandr-1_1.5.4-r0: task do_install: Started
NOTE: recipe icu-78.3-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 3270 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_compile)
NOTE: Running task 3271 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install_ptest_base)
NOTE: recipe libxi-1_1.8.3-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe icu-78.3-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package unihash changed to 6d0f340e0f38d75918c5ee1a534ecb2be637a008ab815f9f305addc76534e5c1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata became valid
NOTE: recipe xrandr-1_1.5.4-r0: task do_install: Succeeded
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: Running task 3272 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_compile)
NOTE: Running task 3273 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3274 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_package)
NOTE: recipe icu-78.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3276 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_install)
NOTE: recipe xrandr-1_1.5.4-r0: task do_package: Started
NOTE: recipe icu-78.3-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot unihash changed to 2390f74f42a68d0616e882bb2141432209941e18664be38a3bba36d70b1b9169
NOTE: Setscene tasks completed
NOTE: Running task 3278 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_recipe_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3279 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 3280 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3281 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_recipe_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 3285 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe clang-cross-arm-git-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3289 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.0.bb:do_create_recipe_spdx)
NOTE: recipe pango-1.58.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_install: Succeeded
NOTE: Running task 3291 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3292 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_package unihash changed to f0c9ff3bdee910f476b203e83e326d17758cf280dbbe48979e8905fdef749773
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata became valid
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.58.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_package: Started
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running task 3294 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3295 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: Running task 3300 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx)
WARNING: libarchive-3.8.9-r0 do_fetch: Failed to fetch URL https://libarchive.org/downloads/libarchive-3.8.9.tar.gz, attempting MIRRORS if available
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: Running task 3301 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3303 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: Running task 3304 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3305 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_configure)
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3306 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_unpack)
NOTE: recipe sbc-2.2-r0: task do_configure: Started
NOTE: recipe libsoup-3.6.6-r0: task do_unpack: Started
NOTE: recipe libsoup-3.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 3307 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3311 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3317 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3320 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: recipe libsoup-3.6.6-r0: task do_patch: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 3321 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_patch)
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 3322 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_install)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_install: Started
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: Running task 3331 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb:do_fetch)
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Succeeded
NOTE: Running task 3332 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.5.bb:do_fetch)
NOTE: recipe libsoup-3.6.6-r0: task do_patch: Succeeded
NOTE: Running task 3333 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: recipe p11-kit-0.26.5-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.5-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 3334 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_fetch)
NOTE: Running task 3335 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 3336 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_package)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.26.5-r0: task do_fetch: Succeeded
NOTE: Running task 3337 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_fetch)
NOTE: recipe libsecret-0.21.7-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3338 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_package unihash changed to fb2a6ad769d685c1454d5526c28aa15ac1b8e33c4ca4a0eed0df7a1e341a4d08
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_packagedata became valid
NOTE: recipe mesa-2_26.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 1978 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.21.7-r0: task do_fetch: Succeeded
NOTE: Running task 3339 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_fetch)
NOTE: recipe libnotify-0.8.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3341 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.19.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package unihash changed to a6377f0f39fbb90388a37930a7da98b21616cae9fefc7f45b6113099e719715a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata became valid
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe enchant2-2.8.19-r0: task do_fetch: Started
NOTE: recipe libcxx-22.1.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_package unihash changed to f4d0a30170b579b6d4b186573267b07e0cf439fa99b0b80a6bc7eb6e9f80f780
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata became valid
NOTE: recipe tiff-4.7.2-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1973 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: Running task 3342 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: Running task 3343 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: Running task 3344 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_install)
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe tiff-4.7.2-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3346 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot)
NOTE: recipe libcxx-22.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3348 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_package)
NOTE: recipe mesa-2_26.2.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3349 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_package: Started
NOTE: recipe enchant2-2.8.19-r0: task do_fetch: Succeeded
NOTE: Running task 3351 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: recipe mesa-2_26.2.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 3355 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot unihash changed to 4770f9e9e9c4023f43f7aa6e1076a371ed1abf50b576cca84cdc29a163755b80
NOTE: recipe gtk4-4.22.4-r0: task do_write_config: Started
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3356 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_packagedata)
NOTE: Running task 3357 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: Running task 3375 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_recipe_spdx)
NOTE: Running task 3376 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3377 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3378 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_generate_toolchain_file)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_packagedata unihash changed to fdafd9df393ea9db95e76a088e7d9a471a707f85a863b47b50277c7b95b261b0
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3379 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: Running task 3380 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_install_ptest_base)
NOTE: Running task 3381 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_generate_toolchain_file)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe nghttp2-1.70.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_install_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 3382 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3384 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe nghttp2-1.70.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3385 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx)
NOTE: recipe nghttp2-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3392 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb:do_fetch)
NOTE: recipe nghttp2-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3393 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb:do_configure)
NOTE: Running task 3394 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: recipe webkitgtk-2.52.5-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.52.5-r0: task do_fetch: Succeeded
NOTE: Running task 3395 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: recipe nghttp2-1.70.0-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package unihash changed to 0dc8d8d017e32661f3268089af7337a8935bb16e6028a65cee5e78cc528c5717
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata became valid
NOTE: recipe libstd-rs-1.96.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_package unihash changed to ef52f7ff1d8de2a7231219a99c41d3d58d08acb69bc11b7d53101f875a817f66
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_packagedata became valid
NOTE: Running setscene task 1974 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1979 of 1979 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3397 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.96.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3399 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3405 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Failed
NOTE: Running task 3406 of 4615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sbc-2.2-r0: task do_configure: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe icu-78.3-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: recipe nghttp2-1.70.0-r0: task do_configure: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.2.0-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_install: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3406 tasks of which 2592 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814062350.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260814062350.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.1309567
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.9-r0 do_fetch: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-3.8.9.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz', '--progress=dot', '--verbose'] failed with exit code 4, see logfile for output
ERROR: libarchive-3.8.9-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://libarchive.org/downloads/libarchive-3.8.9.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.9/temp/log.do_fetch.1309567
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch) failed with exit code '1'

--===============4149441841723606521==--

