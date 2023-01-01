Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA621C678DE
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20680.1672605968778841367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mukZs8qv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f15a6d4-d10adbf8-f42b-47fe-920c-af61ee12db7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ItaRt3geNUVl7d6t6YrLP+Pw5wOgPfp9mMGlgQo2ph8=;
	b=mukZs8qvCJI7MTVYQk0JZmUuGBZqHuwQbver0OYVRIYL+w3/MDCG81jK0rAAKrtC
	7+iRwi4SwLH4Ao8U9GqFZqCL4+kFB0t5Wzxx54eHgxCcsiFYrCkU9VxEvEvGWVmHb/4
	HEcvXEFDHfhPr+0vMj+xIkTBnXzCF56iXo3SoXh8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ItaRt3geNUVl7d6t6YrLP+Pw5wOgPfp9mMGlgQo2ph8=;
	b=Twq3LMF+RZbcpwhtQVV17Jz1PRTR2ow5fj3Kx4pyTtHJEWhkpI14vcrcKf7z8Z3y
	6/pw8qMFGVetfUMNRr5ixhx48zWCfyAfnLW/zYT5P/jHgwyitG3VW8SI8OmH5MLbAYJ
	AG/VngPQuWXqwkllHfSN3ROyqM62qwc3Ws8vrvQw=
Content-Type: multipart/mixed; boundary="===============8946611524568913786=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.6 SUCCEEDED
Message-ID: <010101856f15a6d4-d10adbf8-f42b-47fe-920c-af61ee12db7c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175285

--===============8946611524568913786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *21.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.4-21.1.6.patch
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
--===============8946611524568913786==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.4-21.1.6.patch"

RnJvbSAxNTkxZTA2ZTMxZmM1ZWYyODY4Mjg2YTVhMWFhZjdjYjU5NWQ3OGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxNTowMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjQgLT4gMjEuMS42CgotLS0KIC4uLnBvc3NpYmxlLW1l
bWxlYWtzLWluLVhrYkdldEtiZEJ5TmFtZS5wYXRjaCB8IDYzIC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLm50ZWRTdHJpbmctYWdhaW5zdC1yZXF1ZXN0LWxlbmd0aC1hdC5wYXRjaCB8IDM4IC0tLS0t
LS0tLS0tCiAuLi4teG9yZ18yMS4xLjQuYmIgPT4geHNlcnZlci14b3JnXzIxLjEuNi5iYn0gfCAg
NCArLQogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTA0IGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnLzAwMDEteGtiLWZpeC1zb21lLXBvc3NpYmxlLW1lbWxlYWtzLWluLVhrYkdldEti
ZEJ5TmFtZS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGtiLXByb29mLUdldENvdW50ZWRTdHJpbmct
YWdhaW5zdC1yZXF1ZXN0LWxlbmd0aC1hdC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjQuYmIgPT4geHNlcnZlci14b3Jn
XzIxLjEuNi5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhrYi1maXgtc29tZS1wb3NzaWJsZS1tZW1sZWFr
cy1pbi1Ya2JHZXRLYmRCeU5hbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14
c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhrYi1maXgtc29tZS1wb3NzaWJsZS1tZW1sZWFrcy1p
bi1Ya2JHZXRLYmRCeU5hbWUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDBl
NjFlYzU5NTMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcvMDAwMS14a2ItZml4LXNvbWUtcG9zc2libGUtbWVtbGVha3MtaW4t
WGtiR2V0S2JkQnlOYW1lLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNjMgKzAsMCBAQAotQ1ZF
OiBDVkUtMjAyMi0zNTUxCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLQotRnJvbSAxOGY5MWI5NTBlMjJj
MmEzNDJhNGZiYzU1ZTlkZGY3NTM0YTcwN2QyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogUGV0ZXIgSHV0dGVyZXIgPHBldGVyLmh1dHRlcmVyQHdoby10Lm5ldD4KLURhdGU6IFdlZCwg
MTMgSnVsIDIwMjIgMTE6MjM6MDkgKzEwMDAKLVN1YmplY3Q6IFtQQVRDSF0geGtiOiBmaXggc29t
ZSBwb3NzaWJsZSBtZW1sZWFrcyBpbiBYa2JHZXRLYmRCeU5hbWUKLQotR2V0Q29tcG9uZW50QnlO
YW1lIHJldHVybnMgYW4gYWxsb2NhdGVkIHN0cmluZywgc28gbGV0J3MgZnJlZSB0aGF0IGlmIHdl
Ci1mYWlsIHNvbWV3aGVyZS4KLQotU2lnbmVkLW9mZi1ieTogUGV0ZXIgSHV0dGVyZXIgPHBldGVy
Lmh1dHRlcmVyQHdoby10Lm5ldD4KLS0tLQotIHhrYi94a2IuYyB8IDI2ICsrKysrKysrKysrKysr
KysrKysrLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCi0KLWRpZmYgLS1naXQgYS94a2IveGtiLmMgYi94a2IveGtiLmMKLWluZGV4IDQ2OTI4
OTVkYi4uYjc5YTI2OWUzIDEwMDY0NAotLS0tIGEveGtiL3hrYi5jCi0rKysgYi94a2IveGtiLmMK
LUBAIC01OTM1LDE4ICs1OTM1LDMyIEBAIFByb2NYa2JHZXRLYmRCeU5hbWUoQ2xpZW50UHRyIGNs
aWVudCkKLSAgICAgeGtiID0gZGV2LT5rZXktPnhrYkluZm8tPmRlc2M7Ci0gICAgIHN0YXR1cyA9
IFN1Y2Nlc3M7Ci0gICAgIHN0ciA9ICh1bnNpZ25lZCBjaGFyICopICZzdHVmZlsxXTsKLS0gICAg
aWYgKEdldENvbXBvbmVudFNwZWMoJnN0ciwgVFJVRSwgJnN0YXR1cykpICAvKiBrZXltYXAsIHVu
c3VwcG9ydGVkICovCi0tICAgICAgICByZXR1cm4gQmFkTWF0Y2g7Ci0rICAgIHsKLSsgICAgICAg
IGNoYXIgKmtleW1hcCA9IEdldENvbXBvbmVudFNwZWMoJnN0ciwgVFJVRSwgJnN0YXR1cyk7ICAv
KiBrZXltYXAsIHVuc3VwcG9ydGVkICovCi0rICAgICAgICBpZiAoa2V5bWFwKSB7Ci0rICAgICAg
ICAgICAgZnJlZShrZXltYXApOwotKyAgICAgICAgICAgIHJldHVybiBCYWRNYXRjaDsKLSsgICAg
ICAgIH0KLSsgICAgfQotICAgICBuYW1lcy5rZXljb2RlcyA9IEdldENvbXBvbmVudFNwZWMoJnN0
ciwgVFJVRSwgJnN0YXR1cyk7Ci0gICAgIG5hbWVzLnR5cGVzID0gR2V0Q29tcG9uZW50U3BlYygm
c3RyLCBUUlVFLCAmc3RhdHVzKTsKLSAgICAgbmFtZXMuY29tcGF0ID0gR2V0Q29tcG9uZW50U3Bl
Yygmc3RyLCBUUlVFLCAmc3RhdHVzKTsKLSAgICAgbmFtZXMuc3ltYm9scyA9IEdldENvbXBvbmVu
dFNwZWMoJnN0ciwgVFJVRSwgJnN0YXR1cyk7Ci0gICAgIG5hbWVzLmdlb21ldHJ5ID0gR2V0Q29t
cG9uZW50U3BlYygmc3RyLCBUUlVFLCAmc3RhdHVzKTsKLS0gICAgaWYgKHN0YXR1cyAhPSBTdWNj
ZXNzKQotKyAgICBpZiAoc3RhdHVzID09IFN1Y2Nlc3MpIHsKLSsgICAgICAgIGxlbiA9IHN0ciAt
ICgodW5zaWduZWQgY2hhciAqKSBzdHVmZik7Ci0rICAgICAgICBpZiAoKFhrYlBhZGRlZFNpemUo
bGVuKSAvIDQpICE9IHN0dWZmLT5sZW5ndGgpCi0rICAgICAgICAgICAgc3RhdHVzID0gQmFkTGVu
Z3RoOwotKyAgICB9Ci0rCi0rICAgIGlmIChzdGF0dXMgIT0gU3VjY2VzcykgewotKyAgICAgICAg
ZnJlZShuYW1lcy5rZXljb2Rlcyk7Ci0rICAgICAgICBmcmVlKG5hbWVzLnR5cGVzKTsKLSsgICAg
ICAgIGZyZWUobmFtZXMuY29tcGF0KTsKLSsgICAgICAgIGZyZWUobmFtZXMuc3ltYm9scyk7Ci0r
ICAgICAgICBmcmVlKG5hbWVzLmdlb21ldHJ5KTsKLSAgICAgICAgIHJldHVybiBzdGF0dXM7Ci0t
ICAgIGxlbiA9IHN0ciAtICgodW5zaWduZWQgY2hhciAqKSBzdHVmZik7Ci0tICAgIGlmICgoWGti
UGFkZGVkU2l6ZShsZW4pIC8gNCkgIT0gc3R1ZmYtPmxlbmd0aCkKLS0gICAgICAgIHJldHVybiBC
YWRMZW5ndGg7Ci0rICAgIH0KLSAKLSAgICAgQ0hLX01BU0tfTEVHQUwoMHgwMSwgc3R1ZmYtPndh
bnQsIFhrYkdCTl9BbGxDb21wb25lbnRzTWFzayk7Ci0gICAgIENIS19NQVNLX0xFR0FMKDB4MDIs
IHN0dWZmLT5uZWVkLCBYa2JHQk5fQWxsQ29tcG9uZW50c01hc2spOwotLS0gCi0yLjM0LjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmcvMDAwMS14a2ItcHJvb2YtR2V0Q291bnRlZFN0cmluZy1hZ2FpbnN0LXJlcXVlc3QtbGVuZ3Ro
LWF0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmcvMDAwMS14a2ItcHJvb2YtR2V0Q291bnRlZFN0cmluZy1hZ2FpbnN0LXJlcXVlc3QtbGVuZ3Ro
LWF0LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2Zjg2MmU4MmY5Li4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14
b3JnLzAwMDEteGtiLXByb29mLUdldENvdW50ZWRTdHJpbmctYWdhaW5zdC1yZXF1ZXN0LWxlbmd0
aC1hdC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM4ICswLDAgQEAKLUNWRTogQ1ZFLTIwMjIt
MzU1MAotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0KLUZyb20gMTFiZWVmMGI3ZjFlZDI5MDM0OGU0NTYx
OGU1ZmEwZDJiZmZjYjcyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFBldGVyIEh1
dHRlcmVyIDxwZXRlci5odXR0ZXJlckB3aG8tdC5uZXQ+Ci1EYXRlOiBUdWUsIDUgSnVsIDIwMjIg
MTI6MDY6MjAgKzEwMDAKLVN1YmplY3Q6IFtQQVRDSF0geGtiOiBwcm9vZiBHZXRDb3VudGVkU3Ry
aW5nIGFnYWluc3QgcmVxdWVzdCBsZW5ndGggYXR0YWNrcwotCi1HZXRDb3VudGVkU3RyaW5nIGRp
ZCBhIGNoZWNrIGZvciB0aGUgd2hvbGUgc3RyaW5nIHRvIGJlIHdpdGhpbiB0aGUKLXJlcXVlc3Qg
YnVmZmVyIGJ1dCBub3QgZm9yIHRoZSBpbml0aWFsIDIgYnl0ZXMgdGhhdCBjb250YWluIHRoZSBs
ZW5ndGgKLWZpZWxkLiBBIHN3YXBwZWQgY2xpZW50IGNvdWxkIHNlbmQgYSBtYWxmb3JtZWQgcmVx
dWVzdCB0byB0cmlnZ2VyIGEKLXN3YXBzKCkgb24gdGhvc2UgYnl0ZXMsIHdyaXRpbmcgaW50byBy
YW5kb20gbWVtb3J5LgotCi1TaWduZWQtb2ZmLWJ5OiBQZXRlciBIdXR0ZXJlciA8cGV0ZXIuaHV0
dGVyZXJAd2hvLXQubmV0PgotLS0tCi0geGtiL3hrYi5jIHwgNSArKysrKwotIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL3hrYi94a2IuYyBiL3hrYi94a2Iu
YwotaW5kZXggZjQyZjU5ZWYzLi4xODQxY2ZmMjYgMTAwNjQ0Ci0tLS0gYS94a2IveGtiLmMKLSsr
KyBiL3hrYi94a2IuYwotQEAgLTUxMzcsNiArNTEzNywxMSBAQCBfR2V0Q291bnRlZFN0cmluZyhj
aGFyICoqd2lyZV9pbm91dCwgQ2xpZW50UHRyIGNsaWVudCwgY2hhciAqKnN0cikKLSAgICAgQ0FS
RDE2IGxlbjsKLSAKLSAgICAgd2lyZSA9ICp3aXJlX2lub3V0OwotKwotKyAgICBpZiAoY2xpZW50
LT5yZXFfbGVuIDwKLSsgICAgICAgIGJ5dGVzX3RvX2ludDMyKHdpcmUgKyAyIC0gKGNoYXIgKikg
Y2xpZW50LT5yZXF1ZXN0QnVmZmVyKSkKLSsgICAgICAgIHJldHVybiBCYWRWYWx1ZTsKLSsKLSAg
ICAgbGVuID0gKihDQVJEMTYgKikgd2lyZTsKLSAgICAgaWYgKGNsaWVudC0+c3dhcHBlZCkgewot
ICAgICAgICAgc3dhcHMoJmxlbik7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjQuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjYuYmIKc2lt
aWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjYuYmIKaW5kZXggYWJhMDlhZmVj
My4uMjU2OTAzY2U1ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmdfMjEuMS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuNi5iYgpAQCAtMiwxMCArMiw4IEBAIHJlcXVp
cmUgeHNlcnZlci14b3JnLmluYwogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS14Zjg2cGNpQnVz
LmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJh
c2UucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS14a2ItZml4LXNvbWUtcG9zc2libGUt
bWVtbGVha3MtaW4tWGtiR2V0S2JkQnlOYW1lLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDEteGtiLXByb29mLUdldENvdW50ZWRTdHJpbmctYWdhaW5zdC1yZXF1ZXN0LWxlbmd0aC1hdC5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1Y2M0YmU4ZWU0N2Vk
YjU4ZDRhOTBlNjAzYTU5ZDU2YjQwMjkxYWQzODM3MWIwYmQyNDcxZmMzY2JlZTFjNTg3IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjFlYjg2ZWQ2NzRkMDQyYjZjOGIxZjkxMzVlNTkzOTVjYmJjYTM1
ZWQ1NTFiMTIyZjczYTdkOGJiM2JiMjI0ODQiCiAKICMgVGhlc2UgZXh0ZW5zaW9ucyBhcmUgbm93
IGludGVncmF0ZWQgaW50byB0aGUgc2VydmVyLCBzbyBkZWNsYXJlIHRoZSBtaWdyYXRpb24KICMg
cGF0aCBmb3IgaW4tcGxhY2UgdXBncmFkZXMuCi0tIAoyLjM3LjMKCg==

--===============8946611524568913786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xserver-xorg: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.4.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch file://0001-xkb-proof-GetCountedString-against-request-length-at.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.6.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 23953204 to 23953036 (-0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11882563 to 11882999 (+0%)
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.4" to "21.1.6"
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.4 [default] to 21.1.6 [default]
packages/core2-32-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.4" to "21.1.6"

--===============8946611524568913786==--

