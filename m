Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E929C64E76
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.24458.1665871395341072615
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Mv2DBadm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac3822-6f0f4cd7-66e3-4a55-a643-e9e66f5ea452-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PbUKHyiC4hyW0bf/XQrDgTMoW7csrLB7OVVB2ak2XzM=;
	b=Mv2DBadmYxX1wkDDx3bTSgIqQvtdDk0HBqbDDPGY8AodcxmlaEjmDk6tXu4RBOY1
	x6M8MapBMygcuqNB+eVBOk5P155PsOEwELiiJ5jnxZFF6jPBlB1YYXLHB5fRChdGLzq
	I+WRHwFrtEOi0BvpJud1HAzkT3Uxoi7//ph7Gi+8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PbUKHyiC4hyW0bf/XQrDgTMoW7csrLB7OVVB2ak2XzM=;
	b=ACjY5ArBIvmA6mxNis6Bqd47CD4BKtVra5WepRzdercUboS2F5Tw9dqqPnjsR/Rg
	4AzzSKFV04OixDP8TNjDXbZVxVI1zswzsv1nAC+/ApBIHPyXKY3zLwpWTDAngyt6RHS
	XlbIdDELyDPPyXzkolB3KNfuKw6EEW4yYZj6eeVU=
Content-Type: multipart/mixed; boundary="===============3507446021296801958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.00 SUCCEEDED
Message-ID: <01010183ddac3822-6f0f4cd7-66e3-4a55-a643-e9e66f5ea452-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171794

--===============3507446021296801958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.00* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-5.13-6.00.patch
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
--===============3507446021296801958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/uintN_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/cc_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/sockaddr.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/gid_t.3 /usr
 /share/man/man3/blksize_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/void.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/blkcnt_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/mode_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/socklen_t.3 /usr/share/man/man3/int16_t.3", added "/usr/share/man/man3type/regmatch_t.3type /usr/share/man/man3type/double_t.3type /usr/share/man/man3type/uintN_t.3type /usr/share/man/man3type/tm.3type /usr/share/man/man3type/ptrdiff_t.3type /usr/share/man/man3type/intmax_t.3type /usr/share/man/man3type/uid_t.3typ
 e /usr/share/man/man3type/blksize_t.3type /usr/share/man/man3type/uintptr_t.3type /usr/share/man/man2/landlock_restrict_self.2 /usr/share/man/man3type/regex_t.3type /usr/share/man/man3type/intptr_t.3type /usr/share/man/man3type/regoff_t.3type /usr/share/man/man3type/mode_t.3type /usr/share/man/man3type/gid_t.3type /usr/share/man/man3/_Generic.3 /usr/share/man/man3type/cc_t.3type /usr/share/man/man3type/div_t.3type /usr/share/man/man3type/int8_t.3type /usr/share/man/man3type/time_t.3type /usr/share/man/man3type/size_t.3type /usr/share/man/man3type/float_t.3type /usr/share/man/man3type/timeval.3type /usr/share/man/man3type/sockaddr_storage.3type /usr/share/man/man2/landlock_add_rule.2 /usr/share/man/man3type/in_addr_t.3type /usr/share/man/man3type/uint64_t.3type /usr/share/man/man3type/loff_t.3type /usr/share/man/man3type/useconds_t.3type /usr/share/man/man3type/id_t.3type /usr/share/man/man3type/siginfo_t.3type /usr/share/man/man3type/sigevent.3type /usr/share/man/man3type/sigset_t.3
 type /usr/share/man/man3type/imaxdiv_t.3type /usr/share/man/man3type/va_list.3type /usr/share/man/man3type/pid_t.3type /usr/share/man/man2/memfd_secret.2 /usr/share/man/man3type/in_addr.3type /usr/share/man/man3type/fenv_t.3type /usr/share/man/man3type/clock_t.3type /usr/share/man/man3type/socklen_t.3type /usr/share/man/man2type/open_how.2type /usr/share/man/man3type/sockaddr.3type /usr/share/man/man3type/int32_t.3type /usr/share/man/man3type/intN_t.3type /usr/share/man/man3type/int64_t.3type /usr/share/man/man3type/timer_t.3type /usr/share/man/man3type/epoll_data_t.3type /usr/share/man/man3type/tcflag_t.3type /usr/share/man/man3type/suseconds_t.3type /usr/share/man/man3type/sigval.3type /usr/share/man/man3type/lconv.3type /usr/share/man/man3type/sa_family_t.3type /usr/share/man/man3/strftime_l.3 /usr/share/man/man2/landlock_create_ruleset.2 /usr/share/man/man3type/uint16_t.3type /usr/share/man/man3type/sockaddr_in.3type /usr/share/man/man3type/uintmax_t.3type /usr/share/man/man3typ
 e/uint8_t.3type /usr/share/man/man3type/epoll_event.3type /usr/share/man/man3type/fexcept_t.3type /usr/share/man/man3type/clockid_t.3type /usr/share/man/man3const/NULL.3const /usr/share/man/man3type/dev_t.3type /usr/share/man/man7/landlock.7 /usr/share/man/man3type/in6_addr.3type /usr/share/man/man3type/iovec.3type /usr/share/man/man3type/off_t.3type /usr/share/man/man3type/lldiv_t.3type /usr/share/man/man3type/ssize_t.3type /usr/share/man/man3type/ldiv_t.3type /usr/share/man/man3type/void.3type /usr/share/man/man3type/itimerspec.3type /usr/share/man/man3type/uint32_t.3type /usr/share/man/man3type/sockaddr_un.3type /usr/share/man/man3type/off64_t.3type /usr/share/man/man3type/in_port_t.3type /usr/share/man/man3type/timespec.3type /usr/share/man/man3type/int16_t.3type /usr/share/man/man3type/blkcnt_t.3type /usr/share/man/man3type/aiocb.3type /usr/share/man/man3type/sockaddr_in6.3type /usr/share/man/man3head/sysexits.h.3head /usr/share/man/man3type/stat.3type /usr/share/man/man3type/s
 peed_t.3type /usr/share/man/man3type/epoll_data.3type"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 8388807 to 7397713 (-12%)

--===============3507446021296801958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-5.13-6.00.patch"

RnJvbSA0ZWQ5ZjA2YzEyMzRmNzA2NWY1M2I0NGRiY2U0MmIwOGViYjBhNzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTM6Mzc6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tcGFnZXM6IHVwZ3JhZGUgNS4xMyAtPiA2LjAwCgotLS0KIC4uLi97bWFuLXBhZ2VzXzUuMTMu
YmIgPT4gbWFuLXBhZ2VzXzYuMDAuYmJ9ICB8IDY2ICsrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMve21hbi1wYWdlc181LjEzLmJiID0+IG1hbi1wYWdl
c182LjAwLmJifSAoMjklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4t
cGFnZXMvbWFuLXBhZ2VzXzUuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2Vz
L21hbi1wYWdlc182LjAwLmJiCnNpbWlsYXJpdHkgaW5kZXggMjklCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzUuMTMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMDAuYmIKaW5kZXggZjg2
MDJjNjk5ZS4uMmRiYTIyZDk3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21h
bi1wYWdlcy9tYW4tcGFnZXNfNS4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc182LjAwLmJiCkBAIC0xLDEzICsxLDc1IEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gUkVBRE1FCisjICsrKyBSRUFETUUKKyMgQEAgLTEsNDIgKzEsMTkgQEAKKyMgLVRo
aXMgcGFja2FnZSBjb250YWlucyBMaW51eCBtYW4gcGFnZXMgZm9yIHNlY3Rpb25zIDEgdGhyb3Vn
aCA4LiAgU29tZQorIyAtbW9yZSBpbmZvcm1hdGlvbiBpcyBnaXZlbiBpbiB0aGUgJ21hbi1wYWdl
cy14LnkuQW5ub3VuY2UnIGZpbGUuCisjICtUaGlzIHBhY2thZ2UgY29udGFpbnMgTGludXggbWFu
IHBhZ2VzIGZvciBzZWN0aW9ucyAxIHRocm91Z2ggOC4KKyMgK1NvbWUgbW9yZSBpbmZvcm1hdGlv
biBpcyBnaXZlbiBpbiB0aGUgPG1hbi1wYWdlcy14LnkuQW5ub3VuY2U+IGZpbGUuCisjICAKKyMg
IEhvbWVwYWdlCisjICA9PT09PT09PQorIyAgRm9yIGluZm9ybWF0aW9uIGFib3V0IHRoZSBMaW51
eCBtYW4tcGFnZXMgcHJvamVjdCwgc2VlCisjIC1odHRwOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL21h
bi1wYWdlcy9pbmRleC5odG1sLgorIyArPGh0dHA6Ly93d3cua2VybmVsLm9yZy9kb2MvbWFuLXBh
Z2VzL2luZGV4Lmh0bWw+LgorIyAgCisjICBCdWcgcmVwb3J0cyBhbmQgY29udHJpYnV0aW5nCisj
ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjIC1JZiB5b3UgaGF2ZSBjb3JyZWN0aW9u
cyBhbmQgYWRkaXRpb25zIHRvIHN1Z2dlc3QsIHNlZQorIyAtaHR0cDovL3d3dy5rZXJuZWwub3Jn
L2RvYy9tYW4tcGFnZXMvY29udHJpYnV0aW5nLmh0bWwKKyMgLShBbHRob3VnaCB0aGVyZSBpcyBh
IG1pcnJvciBvZiB0aGlzIHJlcG9zaXRvcnkgb24gR2l0SHViLAorIyAtcGxlYXNlIGRvbid0IHJl
cG9ydCBpc3N1ZXMgdmlhIHRoZSBHaXRIdWIgaXNzdWUgdHJhY2tlciEpCisjIC0KKyMgLUZvciBm
dXJ0aGVyIGluZm9ybWF0aW9uIG9uIGNvbnRyaWJ1dGluZywgc2VlIHRoZSBDT05UUklCVVRJTkcg
ZmlsZS4KKyMgK1NlZSB0aGUgPENPTlRSSUJVVElORz4gZmlsZS4KKyMgIAorIyAgSW5zdGFsbGlu
ZyBhbmQgdW5pbnN0YWxsaW5nCisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT0KKyMgLSJt
YWtlIGluc3RhbGwiIHdpbGwgY29weSB0aGVzZSBtYW4gcGFnZXMgdG8gL3Vzci9sb2NhbC9zaGFy
ZS9tYW4vbWFuWzEtOF0uCisjIC0KKyMgLVRvIGluc3RhbGwgdG8gYSBwYXRoIGRpZmZlcmVudCBm
cm9tIC91c3IvbG9jYWwsIHVzZQorIyAtIm1ha2UgaW5zdGFsbCBwcmVmaXg9L2luc3RhbGwvcGF0
aCIuCisjIC0KKyMgLSJtYWtlIHJlbW92ZSIgb3IgIm1ha2UgdW5pbnN0YWxsIiB3aWxsIHJlbW92
ZSBhbnkgbWFuIHBhZ2UgaW4gdGhpcworIyAtZGlzdHJpYnV0aW9uIGZyb20gaXRzIGRlc3RpbmF0
aW9uLiAgVXNlIHdpdGggY2F1dGlvbiwgYW5kIHJlbWVtYmVyIHRvCisjIC11c2UgInByZWZpeCIg
aWYgZGVzaXJlZCwgYXMgd2l0aCB0aGUgImluc3RhbGwiIHRhcmdldC4KKyMgLQorIyAtVG8gaW5z
dGFsbCBvbmx5IGEgc3BlY2lmaWMgbWFuIHNlY3Rpb24gKG1hbmRpcikgc3VjaCBhcyBtYW4zLCB1
c2UKKyMgLSJtYWtlIGluc3RhbGwtbWFuMyIuICBTaW1pbGFyIHN5bnRheCBjYW4gYmUgdXNlZCB0
byB1bmluc3RhbGwgYQorIyAtc3BlY2lmaWMgbWFuIHNlY3Rpb24sIHN1Y2ggYXMgbWFuNzogIm1h
a2UgdW5pbnN0YWxsLW1hbjciLgorIyAtCisjIC0ibWFrZSIgb3IgIm1ha2UgYWxsIiB3aWxsIHBl
cmZvcm0gIm1ha2UgdW5pbnN0YWxsIiBmb2xsb3dlZCBieSAibWFrZQorIyAtaW5zdGFsbCIuCisj
IC0KKyMgLUNvbnNpZGVyIHVzaW5nIG11bHRpcGxlIHRocmVhZHMgKGF0IGxlYXN0IDIpIHdoZW4g
aW5zdGFsbGluZworIyAtdGhlc2UgbWFuIHBhZ2VzLCBhcyB0aGUgTWFrZWZpbGUgaXMgb3B0aW1p
emVkIGZvciBtdWx0aXBsZSB0aHJlYWRzOgorIyAtIm1ha2UgLWogaW5zdGFsbCIuCisjICtTZWUg
dGhlIDxJTlNUQUxMPiBmaWxlLgorIyAgCisjICBDb3B5cmlnaHRzCisjICA9PT09PT09PT09Cisj
IC1TZWUgdGhlICdtYW4tcGFnZXMteC55LkFubm91bmNlJyBmaWxlLgorIyArU2VlIHRoZSA8bWFu
LXBhZ2VzLXgueS5Bbm5vdW5jZT4gZmlsZS4KKyMgCisjCisKIFNVTU1BUlkgPSAiTGludXggbWFu
LXBhZ2VzIgogREVTQ1JJUFRJT04gPSAiVGhlIExpbnV4IG1hbi1wYWdlcyBwcm9qZWN0IGRvY3Vt
ZW50cyB0aGUgTGludXgga2VybmVsIGFuZCBDIGxpYnJhcnkgaW50ZXJmYWNlcyB0aGF0IGFyZSBl
bXBsb3llZCBieSB1c2VyIHByb2dyYW1zIgogU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIgogSE9N
RVBBR0UgPSAiaHR0cDovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9kb2NzL21hbi1wYWdlcyIK
IExJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vUkVBRE1FO21kNT05MmNkNWVlMmUwYjM1ZDc4MjgxN2U3ZTI3N2I2Y2U0YiIKK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL1JFQURNRTttZDU9YmYxZmFhOWIwMjQ1ZTM5YTdjMGM5NjkwZmZk
ZjZlNTQiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvZG9jcy8ke0JQTn0v
JHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWQ2MTVlOWEzMTk3ODgzM2Y1
OWU3MzE2NjY3YjlhZWZmYmJkYjBhOTJkMTM5MWY5YzY2ZmFkYzZlNzdkMGRhOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjMjcxZThmMTQ3YmQ3MjYxMjlhNDNkMjEyMTM3YjA4OWQ0MDBlNmYyZDA0
NGM1OTQ0ZTgyMGE5ZjEyMzZkNWFjIgogCiBpbmhlcml0IG1hbnBhZ2VzCiAKLS0gCjIuMzEuMQoK

--===============3507446021296801958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-5.13.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.00.tar.gz"
packages/core2-32-poky-linux/man-pages: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "5.13" to "6.00"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 8388807 to 7397713 (-12%)
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/cc_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/sockaddr.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/socklen_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/blkcnt_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/id_t.3 /usr/sha
 re/man/man3/dev_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/blksize_t.3 /usr/share/man/man3/mode_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/void.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/uintmax_t.3", added "/usr/share/man/man3type/uintmax_t.3type /usr/share/man/man3type/tm.3type /usr/share/man/man3type/speed_t.3type /usr/share/man/man3type/loff_t.3type /usr/share/man/man3type/in_addr_t.3type /usr/share/man/man3/strftime_l.3 /usr/share/man/man3type/timespec.3type /usr
 /share/man/man3type/cc_t.3type /usr/share/man/man3type/regoff_t.3type /usr/share/man/man3type/ptrdiff_t.3type /usr/share/man/man3const/NULL.3const /usr/share/man/man2/memfd_secret.2 /usr/share/man/man3type/int32_t.3type /usr/share/man/man3type/epoll_data.3type /usr/share/man/man3type/in6_addr.3type /usr/share/man/man3type/suseconds_t.3type /usr/share/man/man3type/lldiv_t.3type /usr/share/man/man3/_Generic.3 /usr/share/man/man3type/tcflag_t.3type /usr/share/man/man3type/size_t.3type /usr/share/man/man3type/ssize_t.3type /usr/share/man/man3type/fexcept_t.3type /usr/share/man/man3type/sigval.3type /usr/share/man/man2/landlock_restrict_self.2 /usr/share/man/man3type/void.3type /usr/share/man/man3type/timeval.3type /usr/share/man/man3type/timer_t.3type /usr/share/man/man3type/gid_t.3type /usr/share/man/man3type/uint64_t.3type /usr/share/man/man3type/stat.3type /usr/share/man/man3type/aiocb.3type /usr/share/man/man3type/uint8_t.3type /usr/share/man/man3type/clock_t.3type /usr/share/man/ma
 n3type/in_addr.3type /usr/share/man/man3type/div_t.3type /usr/share/man/man2type/open_how.2type /usr/share/man/man3type/intN_t.3type /usr/share/man/man3type/epoll_data_t.3type /usr/share/man/man3type/regex_t.3type /usr/share/man/man3head/sysexits.h.3head /usr/share/man/man3type/time_t.3type /usr/share/man/man3type/uintptr_t.3type /usr/share/man/man3type/sockaddr_in6.3type /usr/share/man/man3type/uint16_t.3type /usr/share/man/man3type/mode_t.3type /usr/share/man/man3type/float_t.3type /usr/share/man/man3type/itimerspec.3type /usr/share/man/man3type/clockid_t.3type /usr/share/man/man3type/intmax_t.3type /usr/share/man/man3type/intptr_t.3type /usr/share/man/man3type/uintN_t.3type /usr/share/man/man3type/off64_t.3type /usr/share/man/man3type/sockaddr.3type /usr/share/man/man3type/fenv_t.3type /usr/share/man/man3type/regmatch_t.3type /usr/share/man/man3type/int16_t.3type /usr/share/man/man3type/off_t.3type /usr/share/man/man2/landlock_add_rule.2 /usr/share/man/man3type/sockaddr_un.3type 
 /usr/share/man/man3type/uint32_t.3type /usr/share/man/man3type/id_t.3type /usr/share/man/man3type/epoll_event.3type /usr/share/man/man3type/socklen_t.3type /usr/share/man/man3type/imaxdiv_t.3type /usr/share/man/man3type/ldiv_t.3type /usr/share/man/man3type/siginfo_t.3type /usr/share/man/man3type/sockaddr_in.3type /usr/share/man/man3type/double_t.3type /usr/share/man/man3type/sigset_t.3type /usr/share/man/man3type/sockaddr_storage.3type /usr/share/man/man3type/in_port_t.3type /usr/share/man/man3type/sa_family_t.3type /usr/share/man/man3type/sigevent.3type /usr/share/man/man3type/dev_t.3type /usr/share/man/man7/landlock.7 /usr/share/man/man3type/iovec.3type /usr/share/man/man3type/uid_t.3type /usr/share/man/man3type/va_list.3type /usr/share/man/man3type/useconds_t.3type /usr/share/man/man3type/blksize_t.3type /usr/share/man/man3type/int64_t.3type /usr/share/man/man3type/lconv.3type /usr/share/man/man3type/blkcnt_t.3type /usr/share/man/man3type/int8_t.3type /usr/share/man/man3type/pid_
 t.3type /usr/share/man/man2/landlock_create_ruleset.2"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 5.13 [default] to 6.00 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "5.13" to "6.00"

--===============3507446021296801958==--

