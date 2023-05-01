Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB89CA9ED0
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.107441.1682976352929701157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AKl7SXxE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010187d93527c9-3ffa8ea2-00b4-4407-8cbb-12974656fad1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cIisobhGtPHVfK+RmRuxYWZFMKub6dh3Fs9sNevPdnk=;
	b=AKl7SXxE10HqlsL7e84XECxCMS5l+CWH1oczXY69VjlE/zwdVlfAOpr2opRa/nh4
	HkL2naMIetTcQ0ncsm3TEfdxS+XzCXOVuL3DKO+wd6LE1HcuMjdinfEHmLhgL/GC77G
	/xdY1UYN3Lk8b5uBNZ14Z1qZSAqQkJq4yX4jJ4+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cIisobhGtPHVfK+RmRuxYWZFMKub6dh3Fs9sNevPdnk=;
	b=JlGCAyDt1GR+b+JKRyAXfQkf7D9xQUAT5wNQPz/J0umPHp9HUHpTtKceuJYLt0Tl
	nqyO9Gv6Ckz1FgbciCMSdx2Hfrr/BuNaAmxoiBFF3Yh6uutKR02AMN61GC/An+E6uGR
	2qWARCkN3rNPnmRC41mnQgKwQIG0BbnZ478JNMVY=
Content-Type: multipart/mixed; boundary="===============0627850372039041603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial: upgrading to 2.18.0 FAILED
Message-ID: <01010187d93527c9-3ffa8ea2-00b4-4407-8cbb-12974656fad1-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180656

--===============0627850372039041603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-initial* to *2.18.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libva-initial /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (17:09:51.457949)
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1802 targets, 39 skipped, 0 masked, 0 errors.

INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe libva-initial...
ERROR: Command 'bitbake -c clean libva-initial' failed, output:
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting


Next steps:
    - apply the patch: git am 0001-libva-initial-upgrade-2.16.0-2.18.0.patch
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
--===============0627850372039041603==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-initial-upgrade-2.16.0-2.18.0.patch"

RnJvbSBlM2QwNDE5YmM2ZjE0YTQxNzJlMTNjZGEyMzAzYmNlMjFiYjYxNjA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNzowOTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnZhLWluaXRpYWw6IHVwZ3JhZGUgMi4xNi4wIC0+IDIuMTguMAoKLS0tCiAuLi4vbGlidmEvbGli
dmEtaW5pdGlhbF8yLjE2LjAuYmIgICAgICAgICAgICAgfCAgOCAtLS0tCiBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbGlidmEvbGlidmEuaW5jICAgICAgICAgfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS1pbml0aWFsXzIuMTYuMC5iYgogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjE2LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjE2LjAuYmIK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDQ1MzA5NjgyMmYuLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4xNi4wLmJiCisr
KyAvZGV2L251bGwKQEAgLTEsOCArMCwwIEBACi1yZXF1aXJlIGxpYnZhLmluYwotCi1QQUNLQUdF
Q09ORklHID89ICIiCi0KLWRvX2luc3RhbGw6YXBwZW5kICgpIHsKLQlybSAtZiAke0R9JHtsaWJk
aXJ9Lyouc28qCi19Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9s
aWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwZjE2ZGFjYzk4Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIC9kZXYvbnVsbApAQCAtMSwzNyAr
MCwwIEBACi1TVU1NQVJZID0gIlZpZGVvIEFjY2VsZXJhdGlvbiAoVkEpIEFQSSBmb3IgTGludXgi
Ci1ERVNDUklQVElPTiA9ICJWaWRlbyBBY2NlbGVyYXRpb24gQVBJIChWQSBBUEkpIGlzIGEgbGli
cmFyeSAobGliVkEpIFwKLWFuZCBBUEkgc3BlY2lmaWNhdGlvbiB3aGljaCBlbmFibGVzIGFuZCBw
cm92aWRlcyBhY2Nlc3MgdG8gZ3JhcGhpY3MgXAotaGFyZHdhcmUgKEdQVSkgYWNjZWxlcmF0aW9u
IGZvciB2aWRlbyBwcm9jZXNzaW5nIG9uIExpbnV4IGFuZCBVTklYIFwKLWJhc2VkIG9wZXJhdGlu
ZyBzeXN0ZW1zLiBBY2NlbGVyYXRlZCBwcm9jZXNzaW5nIGluY2x1ZGVzIHZpZGVvIFwKLWRlY29k
aW5nLCB2aWRlbyBlbmNvZGluZywgc3VicGljdHVyZSBibGVuZGluZyBhbmQgcmVuZGVyaW5nLiBU
aGUgXAotc3BlY2lmaWNhdGlvbiB3YXMgb3JpZ2luYWxseSBkZXNpZ25lZCBieSBJbnRlbCBmb3Ig
aXRzIEdNQSAoR3JhcGhpY3MgXAotTWVkaWEgQWNjZWxlcmF0b3IpIHNlcmllcyBvZiBHUFUgaGFy
ZHdhcmUsIHRoZSBBUEkgaXMgaG93ZXZlciBub3QgXAotbGltaXRlZCB0byBHUFVzIG9yIEludGVs
IHNwZWNpZmljIGhhcmR3YXJlLCBhcyBvdGhlciBoYXJkd2FyZSBhbmQgXAotbWFudWZhY3R1cmVy
cyBjYW4gYWxzbyBmcmVlbHkgdXNlIHRoaXMgQVBJIGZvciBoYXJkd2FyZSBhY2NlbGVyYXRlZCBc
Ci12aWRlbyBkZWNvZGluZy4iCi0KLUhPTUVQQUdFID0gImh0dHBzOi8vMDEub3JnL2xpbnV4bWVk
aWEvdmFhcGkiCi1CVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9saWJ2YS9p
c3N1ZXMiCi0KLVNFQ1RJT04gPSAieDExIgotTElDRU5TRSA9ICJNSVQiCi0KLVNSQ19VUkkgPSAi
JHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L2xpYnZhLSR7UFZ9LnRhci5iejIiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yZTQ4OTQwZjk0YWNiMGFmNTgy
ZTVlZjAzNTM3ODAwZiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMTVmYWNhMGRiMmM0MTdhMzdk
YTQ5ODMwODcwZTI2MDQ1MGZhMTMwNjZmNWUyNGUyNTJhMjBjMzZkOTIwYTFjIgotCi1TID0gIiR7
V09SS0RJUn0vbGlidmEtJHtQVn0iCi0KLUdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvbGlidmEvcmVsZWFzZXMiCi0KLURFUEVORFMgPSAibGliZHJtIgotCi1pbmhl
cml0IG1lc29uIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKLQotUEFDS0FHRUNPTkZJR1t4MTFd
ID0gIi1Ed2l0aF94MTE9eWVzLC1Ed2l0aF94MTE9bm8sdmlydHVhbC9saWJ4MTEgbGlieGV4dCBs
aWJ4Zml4ZXMiCi1QQUNLQUdFQ09ORklHW2dseF0gPSAiLUR3aXRoX2dseD15ZXMsLUR3aXRoX2ds
eD1ubyx2aXJ0dWFsL21lc2EiCi0KLVBBQ0tBR0VDT05GSUdbd2F5bGFuZF0gPSAiLUR3aXRoX3dh
eWxhbmQ9eWVzLC1Ed2l0aF93YXlsYW5kPW5vLHdheWxhbmQtbmF0aXZlIHdheWxhbmQiCi0KLUJC
Q0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLQotLSAKMi4zOS4yCgo=

--===============0627850372039041603==--

