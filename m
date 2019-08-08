Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 900 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Aug 2019 05:15:02 UTC
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 506F06C1BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 05:15:02 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1hvaWw-000wou-Vl for openembedded-core@lists.openembedded.org;
	Thu, 08 Aug 2019 07:00:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Tim Blechmann <tim@klingt.org>
Date: Thu, 8 Aug 2019 12:58:33 +0800
Message-ID: <qiga5r$6omq$1@blaine.gmane.org>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
X-Mozilla-News-Host: news://news.gmane.org:119
Openpgp: preference=signencrypt
Autocrypt: addr=tim@klingt.org; keydata=
	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
	EfM=
Subject: deb: allow custom dpkg command
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
X-List-Received-Date: Thu, 08 Aug 2019 05:15:02 -0000
X-Groupsio-MsgNum: 127663
Content-Type: multipart/mixed; boundary="------------7BD0A9AA0D4F31FB7E377851"
Content-Language: en-US

--------------7BD0A9AA0D4F31FB7E377851
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

trying to reduce the turnaround times for local builds, i'm trying to
find a way to inject `-Zgzip -z1` into the dkpg-deb command line.

attached patch introduces a `DPKG_BUILDCMD` variable for this purpose.
(i'm not very familiar with the whole bitbake infrastructure, so i'm
wondering: do i have to add it to the `vardeps` of do_package_deb?)

tia,
tim

--------------7BD0A9AA0D4F31FB7E377851
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="0001-package_deb-allow-dpkg-deb-to-be-customized-via-DPKG.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="0001-package_deb-allow-dpkg-deb-to-be-customized-via-DPKG.pa";
 filename*1="tch"

RnJvbSA2MmQ0OTMwZDMwN2Q1ZDA3ODQ0ODg5MDAxZThhMWMzMTExYjcyYjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaW0gQmxlY2htYW5uIDx0aW1Aa2xpbmd0Lm9yZz4KRGF0ZTog
VGh1LCA4IEF1ZyAyMDE5IDA2OjQ4OjU0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gcGFja2FnZV9k
ZWI6IGFsbG93IGRwa2ctZGViIHRvIGJlIGN1c3RvbWl6ZWQgdmlhCiBEUEtHX0JVSUxEQ01ECgp0
aGUgY29tbWFuZCBsaW5lIHRvIGludm9rZSBgZHBrZy1kZWJgIGlzIGhhcmRjb2RlZC4gdGhlcmUg
YXJlIGNlcnRhaW4gdXNlCmNhc2VzIHdoZXJlIHdlIHdhbnQgdG8gdHdlYWsgaG93IGRlYmlhbiBw
YWNrYWdlcyBhcmUgY29tcGlsZWQ6IGUuZy4gdGhlCmRlZmF1bHQgdXNlcyB4eiBjb21wcmVzc2lv
biwgd2hpY2ggaXMgcmF0aGVyIENQVSBpbnRlbnNpdmUuIGZvciBsb2NhbApidWlsZHMgb25lIG1p
Z2h0IHdhbnQgdG8gcGFzcyBgLVpnemlwIC16MWAgdG8gZmF2b3Igc3BlZWQgb3ZlciBjb21wcmVz
c2lvbgpyYXRpby4KCndlIHRoZXJlZm9yZSBpbnRyb2R1Y2UgYSBgRFBLR19CVUlMRENNRGAgdmFy
aWFibGUgd2hpY2ggYWxsb3dzIGRvd25zdHJlYW0KY29kZSB0byBjdXN0b21pemUgaG93IGRwa2ct
ZGViIGlzIGV4ZWN1dGVkCgpTaWduZWQtb2ZmLWJ5OiBUaW0gQmxlY2htYW5uIDx0aW1Aa2xpbmd0
Lm9yZz4KLS0tCiBtZXRhL2NsYXNzZXMvcGFja2FnZV9kZWIuYmJjbGFzcyB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9tZXRhL2NsYXNzZXMvcGFja2FnZV9kZWIuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9wYWNrYWdl
X2RlYi5iYmNsYXNzCmluZGV4IDZmODE1OTE2NTMuLjc5MGIyNmFlZjIgMTAwNjQ0Ci0tLSBhL21l
dGEvY2xhc3Nlcy9wYWNrYWdlX2RlYi5iYmNsYXNzCisrKyBiL21ldGEvY2xhc3Nlcy9wYWNrYWdl
X2RlYi5iYmNsYXNzCkBAIC02LDYgKzYsOCBAQCBpbmhlcml0IHBhY2thZ2UKIAogSU1BR0VfUEtH
VFlQRSA/PSAiZGViIgogCitEUEtHX0JVSUxEQ01EID8/PSAiZHBrZy1kZWIiCisKIERQS0dfQVJD
SCA/PSAiJHtAZGViaWFuX2FyY2hfbWFwKGQuZ2V0VmFyKCdUQVJHRVRfQVJDSCcpLCBkLmdldFZh
cignVFVORV9GRUFUVVJFUycpKX0iCiBEUEtHX0FSQ0hbdmFyZGVwdmFsdWVdID0gIiR7RFBLR19B
UkNIfSIKIApAQCAtMjY5LDcgKzI3MSw4IEBAIGRlZiBkZWJfd3JpdGVfcGtnKHBrZywgZCk6CiAg
ICAgICAgICAgICBjb25mZmlsZXMuY2xvc2UoKQogCiAgICAgICAgIG9zLmNoZGlyKGJhc2VkaXIp
Ci0gICAgICAgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCJQQVRIPVwiJXNcIiBkcGtnLWRlYiAt
YiAlcyAlcyIgJSAobG9jYWxkYXRhLmdldFZhcigiUEFUSCIpLCByb290LCBwa2dvdXRkaXIpLAor
ICAgICAgICBzdWJwcm9jZXNzLmNoZWNrX291dHB1dCgiUEFUSD1cIiVzXCIgJXMgLWIgJXMgJXMi
ICUgKGxvY2FsZGF0YS5nZXRWYXIoIlBBVEgiKSwgbG9jYWxkYXRhLmdldFZhcigiRFBLR19CVUlM
RENNRCIpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJvb3QsIHBrZ291dGRpciksCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0ZGVycj1zdWJwcm9jZXNzLlNURE9VVCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2hlbGw9VHJ1ZSkKIAotLSAKMi4xOC4wCgo=

--------------7BD0A9AA0D4F31FB7E377851--
