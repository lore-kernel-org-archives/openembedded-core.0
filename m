Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2EBC64E7B
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.877.1667349634281229063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cGR+fQHx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c85a02-9e945cef-78f8-46bf-bbf4-f942568ec5aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tc5gYNcmcXAFT86tdSjLJqbPNE+mB4eOpuVjwsKxni8=;
	b=cGR+fQHxxF4I8JEYgHHOttBiKT6+yHNyqY3O/qAlYX8aJP0PGtgD1fV2YsWMxdCp
	p2zFjSYkrlbXn4HwY4b2kCyk/bJKFpFKhXah+8EJE3aHZHOFSMaKB1+WBonQo4ItO3K
	6LgZeq6HaN/cDXdoxg5o7gJaFf7sRWIHrqN1kFqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tc5gYNcmcXAFT86tdSjLJqbPNE+mB4eOpuVjwsKxni8=;
	b=fmZRTZnu/zHV5Q/+YzdifWqGeDL7AVu9nVV+0rm46TCvX9GiFdjI6QtR3af2rGGN
	N/9lIqeJ6QYkHHLjhG/ERgjjEJgyTDy4uf79u6WbdZdXZ5JoZYjaj1VnIN0O5hUkcPC
	mISltOzgQx47rcqLlig5NL83SBrnKjnNQsG0BVlA=
Content-Type: multipart/mixed; boundary="===============7935398545426831714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.4.0 SUCCEEDED
Message-ID: <0101018435c85a02-9e945cef-78f8-46bf-bbf4-f942568ec5aa-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172448

--===============7935398545426831714==
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
--===============7935398545426831714==
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
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 185260 to 198292 (+7%)
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.3.0" to "4.4.0"
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.3.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.4.0.dist-info

--===============7935398545426831714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.3.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.4.0.dist-info

--===============7935398545426831714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.3.0-4.4.0.patch"

RnJvbSBlYTk4MDlhOGI4Mjg0ZmFhNTBhYWEzMWFmY2ZiMmMwZWEyOGMyYjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMTowOTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnM6IHVwZ3JhZGUgNC4zLjAgLT4gNC40LjAKCi0tLQogLi4u
L3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMy4wLmJiIHwgMTQgLS0tLQogLi4u
L3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNC4wLmJiIHwgNjkgKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4zLjAuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC40LjAu
YmIKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlw
aW5nLWV4dGVuc2lvbnNfNC4zLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC4zLjAuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDk2Mzg0OTFlYjQuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuMy4wLmJiCisrKyAvZGV2L251bGwK
QEAgLTEsMTQgKzAsMCBAQAotSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi90
eXBpbmciCi1MSUNFTlNFID0gIlBTRi0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT02NGZjMmIzMGI2N2QwYTg0MjNjMjUwZTAzODZlZDcyZiIKLQotIyBUaGUgbmFt
ZSBvbiBQeVBpIGlzIHNsaWdodGx5IGRpZmZlcmVudC4KLVBZUElfUEFDS0FHRSA9ICJ0eXBpbmdf
ZXh0ZW5zaW9ucyIKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU2ZDI2NzdhMzJmNDdmYzdlYjI3
OTVkYjFkZDE1YzFmMzRlZmY2MTZiY2FmMmNmYjVlOTk3Zjg1NGZhMWM0YTYiCi0KLWluaGVyaXQg
cHlwaSBweXRob25fZmxpdF9jb3JlCi0KLUJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayIKLQotVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiL3R5cGluZy1leHRlbnNpb25zLyg/UDxwdmVy
PihcZCtbXC5cLV9dKikrKS8iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC40LjAuYmIKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzhjYmIyMTVmMAotLS0gL2Rldi9udWxsCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10eXBpbmctZXh0ZW5zaW9u
c180LjQuMC5iYgpAQCAtMCwwICsxLDY5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5T
RQorIyArKysgTElDRU5TRQorIyBAQCAtMTMsMTIgKzEzLDExIEBACisjICAKKyMgIEluIE1heSAy
MDAwLCBHdWlkbyBhbmQgdGhlIFB5dGhvbiBjb3JlIGRldmVsb3BtZW50IHRlYW0gbW92ZWQgdG8K
KyMgIEJlT3Blbi5jb20gdG8gZm9ybSB0aGUgQmVPcGVuIFB5dGhvbkxhYnMgdGVhbS4gIEluIE9j
dG9iZXIgb2YgdGhlIHNhbWUKKyMgLXllYXIsIHRoZSBQeXRob25MYWJzIHRlYW0gbW92ZWQgdG8g
RGlnaXRhbCBDcmVhdGlvbnMgKG5vdyBab3BlCisjIC1Db3Jwb3JhdGlvbiwgc2VlIGh0dHA6Ly93
d3cuem9wZS5jb20pLiAgSW4gMjAwMSwgdGhlIFB5dGhvbiBTb2Z0d2FyZQorIyAtRm91bmRhdGlv
biAoUFNGLCBzZWUgaHR0cDovL3d3dy5weXRob24ub3JnL3BzZi8pIHdhcyBmb3JtZWQsIGEKKyMg
LW5vbi1wcm9maXQgb3JnYW5pemF0aW9uIGNyZWF0ZWQgc3BlY2lmaWNhbGx5IHRvIG93biBQeXRo
b24tcmVsYXRlZAorIyAtSW50ZWxsZWN0dWFsIFByb3BlcnR5LiAgWm9wZSBDb3Jwb3JhdGlvbiBp
cyBhIHNwb25zb3JpbmcgbWVtYmVyIG9mCisjIC10aGUgUFNGLgorIyAreWVhciwgdGhlIFB5dGhv
bkxhYnMgdGVhbSBtb3ZlZCB0byBEaWdpdGFsIENyZWF0aW9ucywgd2hpY2ggYmVjYW1lCisjICta
b3BlIENvcnBvcmF0aW9uLiAgSW4gMjAwMSwgdGhlIFB5dGhvbiBTb2Z0d2FyZSBGb3VuZGF0aW9u
IChQU0YsIHNlZQorIyAraHR0cHM6Ly93d3cucHl0aG9uLm9yZy9wc2YvKSB3YXMgZm9ybWVkLCBh
IG5vbi1wcm9maXQgb3JnYW5pemF0aW9uCisjICtjcmVhdGVkIHNwZWNpZmljYWxseSB0byBvd24g
UHl0aG9uLXJlbGF0ZWQgSW50ZWxsZWN0dWFsIFByb3BlcnR5LgorIyArWm9wZSBDb3Jwb3JhdGlv
biB3YXMgYSBzcG9uc29yaW5nIG1lbWJlciBvZiB0aGUgUFNGLgorIyAgCisjICBBbGwgUHl0aG9u
IHJlbGVhc2VzIGFyZSBPcGVuIFNvdXJjZSAoc2VlIGh0dHA6Ly93d3cub3BlbnNvdXJjZS5vcmcg
Zm9yCisjICB0aGUgT3BlbiBTb3VyY2UgRGVmaW5pdGlvbikuICBIaXN0b3JpY2FsbHksIG1vc3Qs
IGJ1dCBub3QgYWxsLCBQeXRob24KKyMgQEAgLTc0LDggKzczLDkgQEAKKyMgIGRpc3RyaWJ1dGUs
IGFuZCBvdGhlcndpc2UgdXNlIFB5dGhvbiBhbG9uZSBvciBpbiBhbnkgZGVyaXZhdGl2ZSB2ZXJz
aW9uLAorIyAgcHJvdmlkZWQsIGhvd2V2ZXIsIHRoYXQgUFNGJ3MgTGljZW5zZSBBZ3JlZW1lbnQg
YW5kIFBTRidzIG5vdGljZSBvZiBjb3B5cmlnaHQsCisjICBpLmUuLCAiQ29weXJpZ2h0IChjKSAy
MDAxLCAyMDAyLCAyMDAzLCAyMDA0LCAyMDA1LCAyMDA2LCAyMDA3LCAyMDA4LCAyMDA5LCAyMDEw
LAorIyAtMjAxMSwgMjAxMiwgMjAxMywgMjAxNCBQeXRob24gU29mdHdhcmUgRm91bmRhdGlvbjsg
QWxsIFJpZ2h0cyBSZXNlcnZlZCIgYXJlCisjIC1yZXRhaW5lZCBpbiBQeXRob24gYWxvbmUgb3Ig
aW4gYW55IGRlcml2YXRpdmUgdmVyc2lvbiBwcmVwYXJlZCBieSBMaWNlbnNlZS4KKyMgKzIwMTEs
IDIwMTIsIDIwMTMsIDIwMTQsIDIwMTUsIDIwMTYsIDIwMTcsIDIwMTgsIDIwMTksIDIwMjAsIDIw
MjEsIDIwMjIgUHl0aG9uIFNvZnR3YXJlIEZvdW5kYXRpb247CisjICtBbGwgUmlnaHRzIFJlc2Vy
dmVkIiBhcmUgcmV0YWluZWQgaW4gUHl0aG9uIGFsb25lIG9yIGluIGFueSBkZXJpdmF0aXZlIHZl
cnNpb24KKyMgK3ByZXBhcmVkIGJ5IExpY2Vuc2VlLgorIyAgCisjICAzLiBJbiB0aGUgZXZlbnQg
TGljZW5zZWUgcHJlcGFyZXMgYSBkZXJpdmF0aXZlIHdvcmsgdGhhdCBpcyBiYXNlZCBvbgorIyAg
b3IgaW5jb3Jwb3JhdGVzIFB5dGhvbiBvciBhbnkgcGFydCB0aGVyZW9mLCBhbmQgd2FudHMgdG8g
bWFrZQorIyBAQCAtMTgwLDkgKzE4MCw5IEBACisjICBBZ3JlZW1lbnQsIExpY2Vuc2VlIG1heSBz
dWJzdGl0dXRlIHRoZSBmb2xsb3dpbmcgdGV4dCAob21pdHRpbmcgdGhlCisjICBxdW90ZXMpOiAi
UHl0aG9uIDEuNi4xIGlzIG1hZGUgYXZhaWxhYmxlIHN1YmplY3QgdG8gdGhlIHRlcm1zIGFuZAor
IyAgY29uZGl0aW9ucyBpbiBDTlJJJ3MgTGljZW5zZSBBZ3JlZW1lbnQuICBUaGlzIEFncmVlbWVu
dCB0b2dldGhlciB3aXRoCisjIC1QeXRob24gMS42LjEgbWF5IGJlIGxvY2F0ZWQgb24gdGhlIElu
dGVybmV0IHVzaW5nIHRoZSBmb2xsb3dpbmcKKyMgK1B5dGhvbiAxLjYuMSBtYXkgYmUgbG9jYXRl
ZCBvbiB0aGUgaW50ZXJuZXQgdXNpbmcgdGhlIGZvbGxvd2luZworIyAgdW5pcXVlLCBwZXJzaXN0
ZW50IGlkZW50aWZpZXIgKGtub3duIGFzIGEgaGFuZGxlKTogMTg5NS4yMi8xMDEzLiAgVGhpcwor
IyAtQWdyZWVtZW50IG1heSBhbHNvIGJlIG9idGFpbmVkIGZyb20gYSBwcm94eSBzZXJ2ZXIgb24g
dGhlIEludGVybmV0CisjICtBZ3JlZW1lbnQgbWF5IGFsc28gYmUgb2J0YWluZWQgZnJvbSBhIHBy
b3h5IHNlcnZlciBvbiB0aGUgaW50ZXJuZXQKKyMgIHVzaW5nIHRoZSBmb2xsb3dpbmcgVVJMOiBo
dHRwOi8vaGRsLmhhbmRsZS5uZXQvMTg5NS4yMi8xMDEzIi4KKyMgIAorIyAgMy4gSW4gdGhlIGV2
ZW50IExpY2Vuc2VlIHByZXBhcmVzIGEgZGVyaXZhdGl2ZSB3b3JrIHRoYXQgaXMgYmFzZWQgb24K
KyMgCisjCisKK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vdHlwaW5nIgor
TElDRU5TRSA9ICJQU0YtMi4wIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9ZjE2YjMyMzkxNzk5MmUwZjhhNmYwMDcxYmM5OTEzZTIiCisKKyMgVGhlIG5hbWUgb24gUHlQ
aSBpcyBzbGlnaHRseSBkaWZmZXJlbnQuCitQWVBJX1BBQ0tBR0UgPSAidHlwaW5nX2V4dGVuc2lv
bnMiCisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNTExNDM0YmI5MmJmOGRkMTk4YzEyYjFjYzgx
MmU4MDBkNDE4MWNmY2I4Njc2NzRlMGY4Mjc5Y2M5MzA4N2FhIgorCitpbmhlcml0IHB5cGkgcHl0
aG9uX2ZsaXRfY29yZQorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCisKK1VQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gIi90eXBpbmctZXh0ZW5zaW9ucy8oP1A8cHZlcj4oXGQrW1wu
XC1fXSopKykvIgotLSAKMi4zMS4xCgo=

--===============7935398545426831714==--

