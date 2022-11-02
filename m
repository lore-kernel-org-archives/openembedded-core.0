Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEF3C63718
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.878.1667349635251772201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VzGsPhDq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c85ca4-8174cccc-7b81-41dd-9696-ab36f2857c87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YT7MkZkEeQ/1xBM9kxru2SjX5iPCrNnC5uA9/PGdEOk=;
	b=VzGsPhDqHDxuX2kIDoqF/b6s3B38KqFF/+pEjS4+YkF8sBEXbNDig79c+QaGB0Wz
	99djV/9BX0b1WFxsvNiq8+Yy6o0IJOBrzchLZeaDaBK5J5v2BqjBl0e8HK3RkekxmLx
	9BtW94G07sZS3+Qt4px5T1rhRf7IO9CnpXYGH9zY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YT7MkZkEeQ/1xBM9kxru2SjX5iPCrNnC5uA9/PGdEOk=;
	b=JCQhI/Ue4RwxR0+r4N6NgHEyjddO3kkvwms+msJzB52QjXRNuGXW58gH4BUNsVhn
	YzsZgMYR3lAw4vhvCcdpno49DNhGI2fhhphuNLaZEV0NMiSf0GV6qWwG010IOGov6Hw
	G1EncchYazpiRQ4ga6Xv7C1mUvbxg9xtIA7Jv/ls=
Content-Type: multipart/mixed; boundary="===============5547987455540937742=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.01 SUCCEEDED
Message-ID: <0101018435c85ca4-8174cccc-7b81-41dd-9696-ab36f2857c87-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172458

--===============5547987455540937742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.01* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-5.13-6.01.patch
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
--===============5547987455540937742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-5.13.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.01.tar.gz"
packages/core2-32-poky-linux/man-pages: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 5.13 [default] to 6.01 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "5.13" to "6.01"
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 8388807 to 7404925 (-12%)
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/aiocb.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/cc_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/void.3 /usr/share/man/man3/blkcnt_t.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/mode_t.3 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/int32_t.3 /usr/share
 /man/man3/sigset_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/socklen_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/sockaddr.3 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/blksize_t.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/va_list.3", added "/usr/share/man/man3type/clockid_t.3type /usr/share/man/man3type/float_t.3type /usr/share/man/man3type/va_list.3type /usr/share/man/man3type/sa_family_t.3type /usr/share/man/man3type/itimerspec.3type /usr/share/man/man3type/void.3type /usr/share/man/man3type/pid_t.
 3type /usr/share/man/man3/_Generic.3 /usr/share/man/man3type/uintN_t.3type /usr/share/man/man3type/gid_t.3type /usr/share/man/man3type/suseconds_t.3type /usr/share/man/man7/landlock.7 /usr/share/man/man3type/timespec.3type /usr/share/man/man3type/in_port_t.3type /usr/share/man/man3type/uint8_t.3type /usr/share/man/man3type/epoll_data.3type /usr/share/man/man3type/tcflag_t.3type /usr/share/man/man3type/blkcnt_t.3type /usr/share/man/man3type/size_t.3type /usr/share/man/man3type/aiocb.3type /usr/share/man/man3type/ssize_t.3type /usr/share/man/man2/landlock_restrict_self.2 /usr/share/man/man3type/id_t.3type /usr/share/man/man3type/timeval.3type /usr/share/man/man3type/intmax_t.3type /usr/share/man/man3type/int64_t.3type /usr/share/man/man3type/sigset_t.3type /usr/share/man/man3type/off_t.3type /usr/share/man/man3type/uintmax_t.3type /usr/share/man/man3type/imaxdiv_t.3type /usr/share/man/man3type/loff_t.3type /usr/share/man/man3type/ldiv_t.3type /usr/share/man/man3type/sockaddr.3type /us
 r/share/man/man3/strftime_l.3 /usr/share/man/man2/landlock_create_ruleset.2 /usr/share/man/man3type/div_t.3type /usr/share/man/man3head/sysexits.h.3head /usr/share/man/man3type/time_t.3type /usr/share/man/man2type/open_how.2type /usr/share/man/man3type/tm.3type /usr/share/man/man3type/int32_t.3type /usr/share/man/man3type/sockaddr_storage.3type /usr/share/man/man2/memfd_secret.2 /usr/share/man/man3type/cc_t.3type /usr/share/man/man3type/epoll_event.3type /usr/share/man/man3type/in_addr.3type /usr/share/man/man3type/speed_t.3type /usr/share/man/man3type/socklen_t.3type /usr/share/man/man3type/off64_t.3type /usr/share/man/man3type/fenv_t.3type /usr/share/man/man3type/blksize_t.3type /usr/share/man/man3type/regmatch_t.3type /usr/share/man/man3type/double_t.3type /usr/share/man/man3type/mode_t.3type /usr/share/man/man3type/fexcept_t.3type /usr/share/man/man3type/regoff_t.3type /usr/share/man/man3type/sigval.3type /usr/share/man/man3const/NULL.3const /usr/share/man/man3type/iovec.3type /
 usr/share/man/man3type/useconds_t.3type /usr/share/man/man3type/intptr_t.3type /usr/share/man/man3type/epoll_data_t.3type /usr/share/man/man3type/dev_t.3type /usr/share/man/man3type/clock_t.3type /usr/share/man/man3type/uint32_t.3type /usr/share/man/man3type/sockaddr_un.3type /usr/share/man/man2/landlock_add_rule.2 /usr/share/man/man3type/lconv.3type /usr/share/man/man3type/int8_t.3type /usr/share/man/man3type/uid_t.3type /usr/share/man/man3type/in_addr_t.3type /usr/share/man/man3const/EOF.3const /usr/share/man/man3type/int16_t.3type /usr/share/man/man3type/siginfo_t.3type /usr/share/man/man3type/sockaddr_in6.3type /usr/share/man/man3type/sigevent.3type /usr/share/man/man3type/in6_addr.3type /usr/share/man/man3type/sockaddr_in.3type /usr/share/man/man3type/intN_t.3type /usr/share/man/man3type/ptrdiff_t.3type /usr/share/man/man3type/uintptr_t.3type /usr/share/man/man3type/uint64_t.3type /usr/share/man/man3type/lldiv_t.3type /usr/share/man/man3type/timer_t.3type /usr/share/man/man3typ
 e/stat.3type /usr/share/man/man3type/regex_t.3type /usr/share/man/man3type/uint16_t.3type"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 5.13 [default] to 6.01 [default]

--===============5547987455540937742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 8388807 to 7404925 (-12%)
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: removed "/usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/blksize_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/off64_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/blkcnt_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/uid_t.
 3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/cc_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/void.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/mode_t.3 /usr/share/man/man3/socklen_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man3/sockaddr.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/div_t.3", added "/usr/share/man/man3type/sigset_t.3type /usr/share/man/man3type/in_addr.3type /usr/share/man/man3type/in_port_t.3type /usr/share/man/man3type/pid_t.3type /usr/share/man/man3type/siginfo_t.3type /usr/share/man/man3type/lconv.3type /usr/share/man/man3type/id_t.3type 
 /usr/share/man/man2/memfd_secret.2 /usr/share/man/man3type/useconds_t.3type /usr/share/man/man3const/NULL.3const /usr/share/man/man3type/ptrdiff_t.3type /usr/share/man/man3type/blkcnt_t.3type /usr/share/man/man3type/cc_t.3type /usr/share/man/man3type/uint32_t.3type /usr/share/man/man3type/va_list.3type /usr/share/man/man3type/tcflag_t.3type /usr/share/man/man3type/sockaddr.3type /usr/share/man/man3type/float_t.3type /usr/share/man/man3type/dev_t.3type /usr/share/man/man3type/sockaddr_storage.3type /usr/share/man/man3/_Generic.3 /usr/share/man/man3type/fexcept_t.3type /usr/share/man/man3type/gid_t.3type /usr/share/man/man3type/uintmax_t.3type /usr/share/man/man3type/uintN_t.3type /usr/share/man/man3type/regex_t.3type /usr/share/man/man3type/aiocb.3type /usr/share/man/man3const/EOF.3const /usr/share/man/man3type/uintptr_t.3type /usr/share/man/man3type/uid_t.3type /usr/share/man/man3type/mode_t.3type /usr/share/man/man3type/lldiv_t.3type /usr/share/man/man3type/timespec.3type /usr/shar
 e/man/man3type/int16_t.3type /usr/share/man/man3type/off_t.3type /usr/share/man/man3type/div_t.3type /usr/share/man/man3type/sigevent.3type /usr/share/man/man3type/timer_t.3type /usr/share/man/man3type/speed_t.3type /usr/share/man/man3type/double_t.3type /usr/share/man/man3type/intmax_t.3type /usr/share/man/man3type/uint64_t.3type /usr/share/man/man3type/sockaddr_in6.3type /usr/share/man/man3type/clockid_t.3type /usr/share/man/man2/landlock_create_ruleset.2 /usr/share/man/man3type/ssize_t.3type /usr/share/man/man3type/regoff_t.3type /usr/share/man/man3type/iovec.3type /usr/share/man/man3type/sockaddr_un.3type /usr/share/man/man7/landlock.7 /usr/share/man/man3type/uint16_t.3type /usr/share/man/man3type/int32_t.3type /usr/share/man/man3type/int64_t.3type /usr/share/man/man3type/epoll_data_t.3type /usr/share/man/man3type/regmatch_t.3type /usr/share/man/man3type/time_t.3type /usr/share/man/man3type/sigval.3type /usr/share/man/man3type/blksize_t.3type /usr/share/man/man3type/intN_t.3type
  /usr/share/man/man3type/in6_addr.3type /usr/share/man/man2/landlock_add_rule.2 /usr/share/man/man3type/uint8_t.3type /usr/share/man/man3head/sysexits.h.3head /usr/share/man/man3type/imaxdiv_t.3type /usr/share/man/man3/strftime_l.3 /usr/share/man/man3type/sockaddr_in.3type /usr/share/man/man3type/sa_family_t.3type /usr/share/man/man3type/loff_t.3type /usr/share/man/man2type/open_how.2type /usr/share/man/man3type/fenv_t.3type /usr/share/man/man3type/socklen_t.3type /usr/share/man/man3type/ldiv_t.3type /usr/share/man/man3type/intptr_t.3type /usr/share/man/man3type/off64_t.3type /usr/share/man/man3type/tm.3type /usr/share/man/man3type/itimerspec.3type /usr/share/man/man3type/int8_t.3type /usr/share/man/man3type/epoll_data.3type /usr/share/man/man3type/in_addr_t.3type /usr/share/man/man3type/clock_t.3type /usr/share/man/man3type/void.3type /usr/share/man/man3type/timeval.3type /usr/share/man/man3type/stat.3type /usr/share/man/man3type/epoll_event.3type /usr/share/man/man3type/size_t.3ty
 pe /usr/share/man/man2/landlock_restrict_self.2 /usr/share/man/man3type/suseconds_t.3type"

--===============5547987455540937742==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-5.13-6.01.patch"

RnJvbSA4YzJhMjJhMmY1YWY1OGQxNDBhODhmZTU0NWM4ODRmMDQ0ODM1OTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMzozOTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
bi1wYWdlczogdXBncmFkZSA1LjEzIC0+IDYuMDEKCi0tLQogLi4uL3ttYW4tcGFnZXNfNS4xMy5i
YiA9PiBtYW4tcGFnZXNfNi4wMS5iYn0gIHwgNjYgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy97bWFuLXBhZ2VzXzUuMTMuYmIgPT4gbWFuLXBhZ2Vz
XzYuMDEuYmJ9ICgyOSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1w
YWdlcy9tYW4tcGFnZXNfNS4xMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tcGFnZXMv
bWFuLXBhZ2VzXzYuMDEuYmIKc2ltaWxhcml0eSBpbmRleCAyOSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNS4xMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1wYWdlcy9tYW4tcGFnZXNfNi4wMS5iYgppbmRleCBmODYw
MmM2OTllLi4zM2ViZTkyODYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFu
LXBhZ2VzL21hbi1wYWdlc181LjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4t
cGFnZXMvbWFuLXBhZ2VzXzYuMDEuYmIKQEAgLTEsMTMgKzEsNzUgQEAKKyMgRklYTUU6IHRoZSBM
SUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdy
YWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQg
YW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZh
bHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0
IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNl
LVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6Cisj
CisjIC0tLSBSRUFETUUKKyMgKysrIFJFQURNRQorIyBAQCAtMSw0MiArMSwxOSBAQAorIyAtVGhp
cyBwYWNrYWdlIGNvbnRhaW5zIExpbnV4IG1hbiBwYWdlcyBmb3Igc2VjdGlvbnMgMSB0aHJvdWdo
IDguICBTb21lCisjIC1tb3JlIGluZm9ybWF0aW9uIGlzIGdpdmVuIGluIHRoZSAnbWFuLXBhZ2Vz
LXgueS5Bbm5vdW5jZScgZmlsZS4KKyMgK1RoaXMgcGFja2FnZSBjb250YWlucyBMaW51eCBtYW4g
cGFnZXMgZm9yIHNlY3Rpb25zIDEgdGhyb3VnaCA4LgorIyArU29tZSBtb3JlIGluZm9ybWF0aW9u
IGlzIGdpdmVuIGluIHRoZSA8bWFuLXBhZ2VzLXgueS5Bbm5vdW5jZT4gZmlsZS4KKyMgIAorIyAg
SG9tZXBhZ2UKKyMgID09PT09PT09CisjICBGb3IgaW5mb3JtYXRpb24gYWJvdXQgdGhlIExpbnV4
IG1hbi1wYWdlcyBwcm9qZWN0LCBzZWUKKyMgLWh0dHA6Ly93d3cua2VybmVsLm9yZy9kb2MvbWFu
LXBhZ2VzL2luZGV4Lmh0bWwuCisjICs8aHR0cDovL3d3dy5rZXJuZWwub3JnL2RvYy9tYW4tcGFn
ZXMvaW5kZXguaHRtbD4uCisjICAKKyMgIEJ1ZyByZXBvcnRzIGFuZCBjb250cmlidXRpbmcKKyMg
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKyMgLUlmIHlvdSBoYXZlIGNvcnJlY3Rpb25z
IGFuZCBhZGRpdGlvbnMgdG8gc3VnZ2VzdCwgc2VlCisjIC1odHRwOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL21hbi1wYWdlcy9jb250cmlidXRpbmcuaHRtbAorIyAtKEFsdGhvdWdoIHRoZXJlIGlzIGEg
bWlycm9yIG9mIHRoaXMgcmVwb3NpdG9yeSBvbiBHaXRIdWIsCisjIC1wbGVhc2UgZG9uJ3QgcmVw
b3J0IGlzc3VlcyB2aWEgdGhlIEdpdEh1YiBpc3N1ZSB0cmFja2VyISkKKyMgLQorIyAtRm9yIGZ1
cnRoZXIgaW5mb3JtYXRpb24gb24gY29udHJpYnV0aW5nLCBzZWUgdGhlIENPTlRSSUJVVElORyBm
aWxlLgorIyArU2VlIHRoZSA8Q09OVFJJQlVUSU5HPiBmaWxlLgorIyAgCisjICBJbnN0YWxsaW5n
IGFuZCB1bmluc3RhbGxpbmcKKyMgID09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAtIm1h
a2UgaW5zdGFsbCIgd2lsbCBjb3B5IHRoZXNlIG1hbiBwYWdlcyB0byAvdXNyL2xvY2FsL3NoYXJl
L21hbi9tYW5bMS04XS4KKyMgLQorIyAtVG8gaW5zdGFsbCB0byBhIHBhdGggZGlmZmVyZW50IGZy
b20gL3Vzci9sb2NhbCwgdXNlCisjIC0ibWFrZSBpbnN0YWxsIHByZWZpeD0vaW5zdGFsbC9wYXRo
Ii4KKyMgLQorIyAtIm1ha2UgcmVtb3ZlIiBvciAibWFrZSB1bmluc3RhbGwiIHdpbGwgcmVtb3Zl
IGFueSBtYW4gcGFnZSBpbiB0aGlzCisjIC1kaXN0cmlidXRpb24gZnJvbSBpdHMgZGVzdGluYXRp
b24uICBVc2Ugd2l0aCBjYXV0aW9uLCBhbmQgcmVtZW1iZXIgdG8KKyMgLXVzZSAicHJlZml4IiBp
ZiBkZXNpcmVkLCBhcyB3aXRoIHRoZSAiaW5zdGFsbCIgdGFyZ2V0LgorIyAtCisjIC1UbyBpbnN0
YWxsIG9ubHkgYSBzcGVjaWZpYyBtYW4gc2VjdGlvbiAobWFuZGlyKSBzdWNoIGFzIG1hbjMsIHVz
ZQorIyAtIm1ha2UgaW5zdGFsbC1tYW4zIi4gIFNpbWlsYXIgc3ludGF4IGNhbiBiZSB1c2VkIHRv
IHVuaW5zdGFsbCBhCisjIC1zcGVjaWZpYyBtYW4gc2VjdGlvbiwgc3VjaCBhcyBtYW43OiAibWFr
ZSB1bmluc3RhbGwtbWFuNyIuCisjIC0KKyMgLSJtYWtlIiBvciAibWFrZSBhbGwiIHdpbGwgcGVy
Zm9ybSAibWFrZSB1bmluc3RhbGwiIGZvbGxvd2VkIGJ5ICJtYWtlCisjIC1pbnN0YWxsIi4KKyMg
LQorIyAtQ29uc2lkZXIgdXNpbmcgbXVsdGlwbGUgdGhyZWFkcyAoYXQgbGVhc3QgMikgd2hlbiBp
bnN0YWxsaW5nCisjIC10aGVzZSBtYW4gcGFnZXMsIGFzIHRoZSBNYWtlZmlsZSBpcyBvcHRpbWl6
ZWQgZm9yIG11bHRpcGxlIHRocmVhZHM6CisjIC0ibWFrZSAtaiBpbnN0YWxsIi4KKyMgK1NlZSB0
aGUgPElOU1RBTEw+IGZpbGUuCisjICAKKyMgIENvcHlyaWdodHMKKyMgID09PT09PT09PT0KKyMg
LVNlZSB0aGUgJ21hbi1wYWdlcy14LnkuQW5ub3VuY2UnIGZpbGUuCisjICtTZWUgdGhlIDxtYW4t
cGFnZXMteC55LkFubm91bmNlPiBmaWxlLgorIyAKKyMKKwogU1VNTUFSWSA9ICJMaW51eCBtYW4t
cGFnZXMiCiBERVNDUklQVElPTiA9ICJUaGUgTGludXggbWFuLXBhZ2VzIHByb2plY3QgZG9jdW1l
bnRzIHRoZSBMaW51eCBrZXJuZWwgYW5kIEMgbGlicmFyeSBpbnRlcmZhY2VzIHRoYXQgYXJlIGVt
cGxveWVkIGJ5IHVzZXIgcHJvZ3JhbXMiCiBTRUNUSU9OID0gImNvbnNvbGUvdXRpbHMiCiBIT01F
UEFHRSA9ICJodHRwOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2RvY3MvbWFuLXBhZ2VzIgog
TElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9SRUFETUU7bWQ1PTkyY2Q1ZWUyZTBiMzVkNzgyODE3ZTdlMjc3YjZjZTRiIgorTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO21kNT1iZjFmYWE5YjAyNDVlMzlhN2MwYzk2OTBmZmRm
NmU1NCIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9kb2NzLyR7QlBOfS8k
e0JQfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZDYxNWU5YTMxOTc4ODMzZjU5
ZTczMTY2NjdiOWFlZmZiYmRiMGE5MmQxMzkxZjljNjZmYWRjNmU3N2QwZGE4IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImMxZThiZWE4ODU4OWYxYTgwYjY3ZGFmZDgyZmI5OGIwMThkZGQ3ZjdiZmE1
OTRmOGY3OTY4NjI1OGQyNmU3ODQiCiAKIGluaGVyaXQgbWFucGFnZXMKIAotLSAKMi4zMS4xCgo=

--===============5547987455540937742==--

