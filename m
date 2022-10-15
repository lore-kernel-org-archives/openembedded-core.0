Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4F4C64E7E
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.24456.1665871394708569673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Lw8/b6JI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac34a5-e0ae62bd-5708-46f2-8c52-cab29cf17719-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y68J48D3CCWYRbC4LmVoJD8TU32NBgYRyN3ILSuj9pY=;
	b=Lw8/b6JIwJ9KPhfBkPhWnjfM8ubtkvrjIJKLKICF80oJjVeeKEaJCtWw/X+S1TRG
	i/55Dvvg8jLh5yrlhmRiIyAcu+qm+RTd5vDWUqsnwgCrodTkEE48/r3JNUIfNesIn1Y
	/QdFwY3uZNZHsSrrs+lUwAZV45Ie8BG1YBsfhUzg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y68J48D3CCWYRbC4LmVoJD8TU32NBgYRyN3ILSuj9pY=;
	b=VVOHJjNk6SWeOvg1NA3800oZevPYyuKnjbJC6xNdsrU3DH1jxCQs97+B1ey3Ejj4
	+vY/lhNqz52md7svVMQhsU2xwet/2X1Pi4gWOCWZuMRbLFmYYxdpBSXvL9029WN6fWc
	yDCYQffOmtIK0Q2YGI+i4Gw0aRGwv8m0jqZANdns=
Content-Type: multipart/mixed; boundary="===============6811598357633457924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.4.0 SUCCEEDED
Message-ID: <01010183ddac34a5-e0ae62bd-5708-46f2-8c52-cab29cf17719-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171791

--===============6811598357633457924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.3.0-4.4.0.patch
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
--===============6811598357633457924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.10/site-packages/typing_extensions-4.3.0.dist-info moved to /usr/lib/python3.10/site-packages/typing_extensions-4.4.0.dist-info

--===============6811598357633457924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.3.0-4.4.0.patch"

RnJvbSA4NTJiNTM0NWUxZDIwNWYxMWEwNGViZTUwNzc2OTNiNTRiZjQwMzdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MTA6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXR5cGluZy1leHRlbnNpb25zOiB1cGdyYWRlIDQuMy4wIC0+IDQuNC4wCgotLS0KIC4u
Li9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjMuMC5iYiB8IDE0IC0tLS0KIC4u
Li9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjQuMC5iYiB8IDY5ICsrKysrKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMy4wLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNC4w
LmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR5
cGluZy1leHRlbnNpb25zXzQuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMy4wLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCA5NjM4NDkxZWI0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjMuMC5iYgorKysgL2Rldi9udWxs
CkBAIC0xLDE0ICswLDAgQEAKLUhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24v
dHlwaW5nIgotTElDRU5TRSA9ICJQU0YtMi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9NjRmYzJiMzBiNjdkMGE4NDIzYzI1MGUwMzg2ZWQ3MmYiCi0KLSMgVGhlIG5h
bWUgb24gUHlQaSBpcyBzbGlnaHRseSBkaWZmZXJlbnQuCi1QWVBJX1BBQ0tBR0UgPSAidHlwaW5n
X2V4dGVuc2lvbnMiCi0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlNmQyNjc3YTMyZjQ3ZmM3ZWIy
Nzk1ZGIxZGQxNWMxZjM0ZWZmNjE2YmNhZjJjZmI1ZTk5N2Y4NTRmYTFjNGE2IgotCi1pbmhlcml0
IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQotCi1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVz
ZGsiCi0KLVVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi90eXBpbmctZXh0ZW5zaW9ucy8oP1A8cHZl
cj4oXGQrW1wuXC1fXSopKykvIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNC4wLmJiCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmM4Y2JiMjE1ZjAKLS0tIC9kZXYvbnVsbAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lv
bnNfNC40LjAuYmIKQEAgLTAsMCArMSw2OSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VO
U0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEzLDEyICsxMywxMSBAQAorIyAgCisjICBJbiBNYXkg
MjAwMCwgR3VpZG8gYW5kIHRoZSBQeXRob24gY29yZSBkZXZlbG9wbWVudCB0ZWFtIG1vdmVkIHRv
CisjICBCZU9wZW4uY29tIHRvIGZvcm0gdGhlIEJlT3BlbiBQeXRob25MYWJzIHRlYW0uICBJbiBP
Y3RvYmVyIG9mIHRoZSBzYW1lCisjIC15ZWFyLCB0aGUgUHl0aG9uTGFicyB0ZWFtIG1vdmVkIHRv
IERpZ2l0YWwgQ3JlYXRpb25zIChub3cgWm9wZQorIyAtQ29ycG9yYXRpb24sIHNlZSBodHRwOi8v
d3d3LnpvcGUuY29tKS4gIEluIDIwMDEsIHRoZSBQeXRob24gU29mdHdhcmUKKyMgLUZvdW5kYXRp
b24gKFBTRiwgc2VlIGh0dHA6Ly93d3cucHl0aG9uLm9yZy9wc2YvKSB3YXMgZm9ybWVkLCBhCisj
IC1ub24tcHJvZml0IG9yZ2FuaXphdGlvbiBjcmVhdGVkIHNwZWNpZmljYWxseSB0byBvd24gUHl0
aG9uLXJlbGF0ZWQKKyMgLUludGVsbGVjdHVhbCBQcm9wZXJ0eS4gIFpvcGUgQ29ycG9yYXRpb24g
aXMgYSBzcG9uc29yaW5nIG1lbWJlciBvZgorIyAtdGhlIFBTRi4KKyMgK3llYXIsIHRoZSBQeXRo
b25MYWJzIHRlYW0gbW92ZWQgdG8gRGlnaXRhbCBDcmVhdGlvbnMsIHdoaWNoIGJlY2FtZQorIyAr
Wm9wZSBDb3Jwb3JhdGlvbi4gIEluIDIwMDEsIHRoZSBQeXRob24gU29mdHdhcmUgRm91bmRhdGlv
biAoUFNGLCBzZWUKKyMgK2h0dHBzOi8vd3d3LnB5dGhvbi5vcmcvcHNmLykgd2FzIGZvcm1lZCwg
YSBub24tcHJvZml0IG9yZ2FuaXphdGlvbgorIyArY3JlYXRlZCBzcGVjaWZpY2FsbHkgdG8gb3du
IFB5dGhvbi1yZWxhdGVkIEludGVsbGVjdHVhbCBQcm9wZXJ0eS4KKyMgK1pvcGUgQ29ycG9yYXRp
b24gd2FzIGEgc3BvbnNvcmluZyBtZW1iZXIgb2YgdGhlIFBTRi4KKyMgIAorIyAgQWxsIFB5dGhv
biByZWxlYXNlcyBhcmUgT3BlbiBTb3VyY2UgKHNlZSBodHRwOi8vd3d3Lm9wZW5zb3VyY2Uub3Jn
IGZvcgorIyAgdGhlIE9wZW4gU291cmNlIERlZmluaXRpb24pLiAgSGlzdG9yaWNhbGx5LCBtb3N0
LCBidXQgbm90IGFsbCwgUHl0aG9uCisjIEBAIC03NCw4ICs3Myw5IEBACisjICBkaXN0cmlidXRl
LCBhbmQgb3RoZXJ3aXNlIHVzZSBQeXRob24gYWxvbmUgb3IgaW4gYW55IGRlcml2YXRpdmUgdmVy
c2lvbiwKKyMgIHByb3ZpZGVkLCBob3dldmVyLCB0aGF0IFBTRidzIExpY2Vuc2UgQWdyZWVtZW50
IGFuZCBQU0YncyBub3RpY2Ugb2YgY29weXJpZ2h0LAorIyAgaS5lLiwgIkNvcHlyaWdodCAoYykg
MjAwMSwgMjAwMiwgMjAwMywgMjAwNCwgMjAwNSwgMjAwNiwgMjAwNywgMjAwOCwgMjAwOSwgMjAx
MCwKKyMgLTIwMTEsIDIwMTIsIDIwMTMsIDIwMTQgUHl0aG9uIFNvZnR3YXJlIEZvdW5kYXRpb247
IEFsbCBSaWdodHMgUmVzZXJ2ZWQiIGFyZQorIyAtcmV0YWluZWQgaW4gUHl0aG9uIGFsb25lIG9y
IGluIGFueSBkZXJpdmF0aXZlIHZlcnNpb24gcHJlcGFyZWQgYnkgTGljZW5zZWUuCisjICsyMDEx
LCAyMDEyLCAyMDEzLCAyMDE0LCAyMDE1LCAyMDE2LCAyMDE3LCAyMDE4LCAyMDE5LCAyMDIwLCAy
MDIxLCAyMDIyIFB5dGhvbiBTb2Z0d2FyZSBGb3VuZGF0aW9uOworIyArQWxsIFJpZ2h0cyBSZXNl
cnZlZCIgYXJlIHJldGFpbmVkIGluIFB5dGhvbiBhbG9uZSBvciBpbiBhbnkgZGVyaXZhdGl2ZSB2
ZXJzaW9uCisjICtwcmVwYXJlZCBieSBMaWNlbnNlZS4KKyMgIAorIyAgMy4gSW4gdGhlIGV2ZW50
IExpY2Vuc2VlIHByZXBhcmVzIGEgZGVyaXZhdGl2ZSB3b3JrIHRoYXQgaXMgYmFzZWQgb24KKyMg
IG9yIGluY29ycG9yYXRlcyBQeXRob24gb3IgYW55IHBhcnQgdGhlcmVvZiwgYW5kIHdhbnRzIHRv
IG1ha2UKKyMgQEAgLTE4MCw5ICsxODAsOSBAQAorIyAgQWdyZWVtZW50LCBMaWNlbnNlZSBtYXkg
c3Vic3RpdHV0ZSB0aGUgZm9sbG93aW5nIHRleHQgKG9taXR0aW5nIHRoZQorIyAgcXVvdGVzKTog
IlB5dGhvbiAxLjYuMSBpcyBtYWRlIGF2YWlsYWJsZSBzdWJqZWN0IHRvIHRoZSB0ZXJtcyBhbmQK
KyMgIGNvbmRpdGlvbnMgaW4gQ05SSSdzIExpY2Vuc2UgQWdyZWVtZW50LiAgVGhpcyBBZ3JlZW1l
bnQgdG9nZXRoZXIgd2l0aAorIyAtUHl0aG9uIDEuNi4xIG1heSBiZSBsb2NhdGVkIG9uIHRoZSBJ
bnRlcm5ldCB1c2luZyB0aGUgZm9sbG93aW5nCisjICtQeXRob24gMS42LjEgbWF5IGJlIGxvY2F0
ZWQgb24gdGhlIGludGVybmV0IHVzaW5nIHRoZSBmb2xsb3dpbmcKKyMgIHVuaXF1ZSwgcGVyc2lz
dGVudCBpZGVudGlmaWVyIChrbm93biBhcyBhIGhhbmRsZSk6IDE4OTUuMjIvMTAxMy4gIFRoaXMK
KyMgLUFncmVlbWVudCBtYXkgYWxzbyBiZSBvYnRhaW5lZCBmcm9tIGEgcHJveHkgc2VydmVyIG9u
IHRoZSBJbnRlcm5ldAorIyArQWdyZWVtZW50IG1heSBhbHNvIGJlIG9idGFpbmVkIGZyb20gYSBw
cm94eSBzZXJ2ZXIgb24gdGhlIGludGVybmV0CisjICB1c2luZyB0aGUgZm9sbG93aW5nIFVSTDog
aHR0cDovL2hkbC5oYW5kbGUubmV0LzE4OTUuMjIvMTAxMyIuCisjICAKKyMgIDMuIEluIHRoZSBl
dmVudCBMaWNlbnNlZSBwcmVwYXJlcyBhIGRlcml2YXRpdmUgd29yayB0aGF0IGlzIGJhc2VkIG9u
CisjIAorIworCitIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL3R5cGluZyIK
K0xJQ0VOU0UgPSAiUFNGLTIuMCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWYxNmIzMjM5MTc5OTJlMGY4YTZmMDA3MWJjOTkxM2UyIgorCisjIFRoZSBuYW1lIG9uIFB5
UGkgaXMgc2xpZ2h0bHkgZGlmZmVyZW50LgorUFlQSV9QQUNLQUdFID0gInR5cGluZ19leHRlbnNp
b25zIgorCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTUxMTQzNGJiOTJiZjhkZDE5OGMxMmIxY2M4
MTJlODAwZDQxODFjZmNiODY3Njc0ZTBmODI3OWNjOTMwODdhYSIKKworaW5oZXJpdCBweXBpIHB5
dGhvbl9mbGl0X2NvcmUKKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitV
UFNUUkVBTV9DSEVDS19SRUdFWCA9ICIvdHlwaW5nLWV4dGVuc2lvbnMvKD9QPHB2ZXI+KFxkK1tc
LlwtX10qKSspLyIKLS0gCjIuMzEuMQoK

--===============6811598357633457924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-typing-extensions: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.4.0.tar.gz"
packages/core2-32-poky-linux/python3-typing-extensions: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.3.0" to "4.4.0"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.3.0 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 155711 to 165656 (+6%)
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.3.0" to "4.4.0"
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.10/site-packages/typing_extensions-4.3.0.dist-info moved to /usr/lib/python3.10/site-packages/typing_extensions-4.4.0.dist-info

--===============6811598357633457924==--

