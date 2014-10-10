Return-Path: <openembedded-devel@urbanec.net>
X-Greylist: delayed 898 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Oct 2014 17:10:06 UTC
Received: from mail16.tpgi.com.au (smtp-out16.tpgi.com.au [220.244.226.126])
	by mail.openembedded.org (Postfix) with ESMTP id F155A716CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 17:10:06 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Sat, 11 Oct 2014 03:40:25 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s9AGeMPQ004214
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 03:40:25 +1100
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XcdEq-0003V8-Sk for openembedded-core@lists.openembedded.org;
	Sat, 11 Oct 2014 03:40:20 +1100
Message-ID: <54380BF4.6010205@urbanec.net>
Date: Sat, 11 Oct 2014 03:40:20 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Fix for gcc bug 61144
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
X-List-Received-Date: Fri, 10 Oct 2014 17:10:17 -0000
X-Groupsio-MsgNum: 58513
Content-Type: multipart/mixed; boundary="------------070904050405050206090608"

--------------070904050405050206090608
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61144 for details.

This patch is taken from the gcc repository and should be obsoleted by a 
gcc release after 4.9.1

The problem is severe enough (at least from my point of view) to need 
this patch until the next gcc release is available.



--------------070904050405050206090608
Content-Type: text/plain; charset=ISO-8859-1;
 name="commit-03ae791"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="commit-03ae791"

Y29tbWl0IDAzYWU3OTEyYWFkYmYzYjU1Yjk2NmExMzY3ZjA3YzdkYmJkZGRhODAKQXV0aG9yOiBQ
ZXRlciBVcmJhbmVjCkRhdGU6ICAgRnJpIE9jdCAxMCAwMDowMzoyOCAyMDE0ICsxMTAwCgogICAg
Z2NjOiBQYXRjaCBmb3IgZ2NjIGJ1ZyA2MTE0NC4KICAgIAogICAgVGhpcyBmaXhlcyBnY2MgYnVn
IDYxNDQsIHdoaWNoIGluIG15IGNhc2UgZXhoaWJpdGVkIGl0c2VsZiBhcyBhIGtlcm5lbAogICAg
bW9kdWxlIHRoYXQgZmFpbGVkIHRvIGxvYWQuIFRoaXMgd2FzIGJlY2F1c2Ugc3RhdGljIHBsYXRm
b3JtX2RhdGEKICAgIHN0cnVjdHVyZXMgd2VyZSBiZWluZyBjb3JydXB0ZWQgd2l0aCB0aGUgb3B0
aW1pc2VyIGJlaW5nIHNldCB0byBhbnkKICAgIHZhbHVlIG90aGVyIHRoYW4gLU8wLgoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTQuOS5pbmMgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2NjL2djYy00LjkuaW5jCmluZGV4IDI1Nzc4YmQuLjlhNjZjZDIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTQuOS5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtNC45LmluYwpAQCAtNzAsNiArNzAsNyBAQCBTUkNfVVJJ
ID0gIlwKICAgICBmaWxlOi8vMDA1My1nY2MtZml4LXNlZ2ZhdWx0LWZyb20tY2FsbGluZy1mcmVl
LW9uLW5vbi1tYWxsb2MtZC1hLnBhdGNoIFwKICAgICBmaWxlOi8vMDA1NC1nY2MtTWFrZWZpbGUu
aW4tZml4LXBhcmFsbGVsLWJ1aWxkaW5nLWZhaWx1cmUucGF0Y2ggXAogICAgIGZpbGU6Ly8wMDU1
LVBSLXJ0bC1vcHRpbWl6YXRpb24tNjE4MDEucGF0Y2ggXAorICAgIGZpbGU6Ly8wMDU2LXRvcC1s
ZXZlbC1yZW9yZGVyX2djYy1idWctNjExNDQucGF0Y2ggXAogIgogU1JDX1VSSVttZDVzdW1dID0g
ImZkZGY3MTM0ODU0NmFmNTIzMzUzYmQ0M2QzNDkxOWMxIgogU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImQzMzQ3ODFhMTI0YWRhNmYzOGU2M2I1NDVlMmEzYjhjMjE4MzA0OTUxNWExYWJhYjZkNTEzZjEw
OWYxZDcxN2UiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy00Ljkv
MDA1Ni10b3AtbGV2ZWwtcmVvcmRlcl9nY2MtYnVnLTYxMTQ0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtNC45LzAwNTYtdG9wLWxldmVsLXJlb3JkZXJfZ2NjLWJ1Zy02MTE0
NC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4xMWZhOTY5Ci0tLSAv
ZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtNC45LzAwNTYtdG9w
LWxldmVsLXJlb3JkZXJfZ2NjLWJ1Zy02MTE0NC5wYXRjaApAQCAtMCwwICsxLDI1IEBACistLS0g
L2Rldi9udWxsCisrKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy00LjkvMDA1Ni10
b3AtbGV2ZWwtcmVvcmRlcl9nY2MtYnVnLTYxMTQ0LnBhdGNoCitAQCAtMCwwICsxLDIxIEBACisr
LS0tIGEvZ2NjL3ZhcnBvb2wuYyAgICAyMDE0LzEwLzA1IDAyOjUwOjAxICAgICAyMTU4OTUKKysr
KysgYi9nY2MvdmFycG9vbC5jICAgIDIwMTQvMTAvMDUgMDQ6NTI6MTkgICAgIDIxNTg5NgorK0BA
IC0zMjksOCArMzI5LDE2IEBACisrCisrICAgLyogVmFyaWFibGVzIGRlY2xhcmVkICdjb25zdCcg
d2l0aG91dCBhbiBpbml0aWFsaXplcgorKyAgICAgIGhhdmUgemVybyBhcyB0aGUgaW5pdGlhbGl6
ZXIgaWYgdGhleSBtYXkgbm90IGJlCisrLSAgICAgb3ZlcnJpZGRlbiBhdCBsaW5rIG9yIHJ1biB0
aW1lLiAgKi8KKystICBpZiAoIURFQ0xfSU5JVElBTCAocmVhbF9kZWNsKQorKysgICAgIG92ZXJy
aWRkZW4gYXQgbGluayBvciBydW4gdGltZS4KKysrCisrKyAgICAgSXQgaXMgYWN0dWFsbHkgcmVx
dWlyZW1lbnQgZm9yIEMrKyBjb21waWxlciB0byBvcHRpbWl6ZSBjb25zdCB2YXJpYWJsZXMKKysr
ICAgICBjb25zaXN0ZW50bHkuIEFzIGEgR05VIGV4dGVuc2lvbiwgZG8gbm90IGVuZm9yZSB0aGlz
IHJ1bGUgZm9yIHVzZXIgZGVmaW5lZAorKysgICAgIHdlYWsgdmFyaWFibGVzLCBzbyB3ZSBzdXBw
b3J0IGludGVycG9zaXRpb24gb246CisrKyAgICAgc3RhdGljIGNvbnN0IGludCBkdW1teSA9IDA7
CisrKyAgICAgZXh0ZXJuIGNvbnN0IGludCBmb28gX19hdHRyaWJ1dGVfXygoX193ZWFrX18sIF9f
YWxpYXNfXygiZHVtbXkiKSkpOworKysgICAqLworKysgIGlmICgoIURFQ0xfSU5JVElBTCAocmVh
bF9kZWNsKQorKysgICAgICAgfHwgKERFQ0xfV0VBSyAoZGVjbCkgJiYgIURFQ0xfQ09NREFUIChk
ZWNsKSkpCisrICAgICAgICYmIChERUNMX0VYVEVSTkFMIChkZWNsKSB8fCBkZWNsX3JlcGxhY2Vh
YmxlX3AgKGRlY2wpKSkKKysgICAgIHJldHVybiBlcnJvcl9tYXJrX25vZGU7CisrIAorCg==

--------------070904050405050206090608--
