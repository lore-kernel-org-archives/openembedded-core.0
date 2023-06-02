Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE8DC88CB7
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7617.1685693430680420661
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LIbzyj0L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b288d68-9c0d94f8-28a6-4f85-bbf7-06838ba93e16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JgKqHI3u7Qsw+Fw9ysVHmjnghzoPcOqmL3tj09SJR1Q=;
	b=LIbzyj0LAqy1wRIBOadDtjiYfL8m8dggnYrLJ+2eFSgfF+4nL0jXA0xH2vuZI5z8
	bzBFiNTpfjsVmpw6N+vunLu4SxeE5qf9Qyl6+Ef0tw0EJ7ywlYEIZ3xCho1gF7Q375A
	2vFak2Xf0gnlpGBlzZMs5V9nUnenKnlfeSzufYo4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JgKqHI3u7Qsw+Fw9ysVHmjnghzoPcOqmL3tj09SJR1Q=;
	b=h9BceXJS7Z21u7Kjk6LVLT0/TQIt8ig8aV23rfFdCdCuTsEKCgtgkS6Jxep/BPTw
	Rx/c2shyxnh9YhDKbZdT1e4hngVLlOlAi0a9HCSwbPKJrHKxNLw89kCEMvxYPAvGFv+
	QIxKnZnYVMztNxIMq4LaSyu4N0L21nuU+eWub4wY=
Content-Type: multipart/mixed; boundary="===============4435376212549515499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] babeltrace2: upgrading to 2.0.5 SUCCEEDED
Message-ID: <010101887b288d68-9c0d94f8-28a6-4f85-bbf7-06838ba93e16-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182245

--===============4435376212549515499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *babeltrace2* to *2.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-babeltrace2-upgrade-2.0.4-2.0.5.patch
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
--===============4435376212549515499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-babeltrace2-upgrade-2.0.4-2.0.5.patch"

RnJvbSBmNDQwNGU0M2Y4YTExMzI1NTE3YjliYTYxODZhMjQzMDdjNzcwOGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMzowNzoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
YmVsdHJhY2UyOiB1cGdyYWRlIDIuMC40IC0+IDIuMC41CgotLS0KIC4uLi9sdHRuZy97YmFiZWx0
cmFjZTJfMi4wLjQuYmIgPT4gYmFiZWx0cmFjZTJfMi4wLjUuYmJ9ICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcve2JhYmVsdHJhY2UyXzIuMC40LmJiID0+IGJhYmVsdHJhY2Uy
XzIuMC41LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcv
YmFiZWx0cmFjZTJfMi4wLjQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJh
Y2UyXzIuMC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4wLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1rZXJuZWwvbHR0bmcvYmFiZWx0cmFjZTJfMi4wLjUuYmIKaW5kZXggMTZkOGI5NDVhNC4uNjEy
MzQ1NmMzMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9iYWJlbHRyYWNl
Ml8yLjAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2JhYmVsdHJhY2UyXzIu
MC41LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmVmZmljaW9zLmNv
bS9iYWJlbHRyYWNlLmdpdDticmFuY2g9c3RhYmxlLTIuMDtwcm90b2NvbD1odHRwCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLXRlc3RzLWRvLW5vdC1ydW4tdGVzdC1hcHBsaWNhdGlvbnMtZnJvbS0u
bGlicy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtbWFucGFnZXMtbXVsdGls
aWItaWRlbnRpY2FsLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjIzZThjZjRlNmZk
YzFkMGIyMzBlOTY0ZGFmYWMwOGE1N2U2MjI4ZTYiCitTUkNSRVYgPSAiNjZlNzZkMWVhNjAxNzA1
OTI4ODk5MTM4ZjAyNzMwYTNhMmEzMTUzZCIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0g
InYoP1A8cHZlcj4yKFwuXGQrKSspJCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuMzku
MgoK

--===============4435376212549515499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10353-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10353, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/hello-ust-10352-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10353/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/hello-ust-10353-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10352/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/he
 llo-ust-10352-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10353, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/hello-ust-10353-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10353, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10352-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10352/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10352-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10352/index, directory renamed /usr/lib/babeltrac
 e2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10353-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10353/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10353-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10353/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10352-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10352, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-103
 52-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10352, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10353-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10352, added "/usr/lib/babeltrace2/ptest/tests/data/plugins/src.ctf.fs/succeed/trace-meta-ctx-sequence.expect /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/fail/metadata-syntax-error/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/meta-ctx-sequence/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/meta-ctx-sequence/stream"

--===============4435376212549515499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/babeltrace2/babeltrace2-dbg: PKGSIZE changed from 7516776 to 7513544 (-0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dbg: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dbg: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dev: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-dev: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-doc: PKGSIZE changed from 393922 to 395480 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-doc: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-doc: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-locale: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-locale: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: PKGSIZE changed from 11369083 to 11370865 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: FILELIST: directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10353-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10353, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10352-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10352, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/hello-ust-10352-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10352, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/
 ust/pid/hello-ust-10353-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10352, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10353-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10352/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10353-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10353, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/hello-ust-10352-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/1/ust/pid/10353/index, directory renamed /usr/lib/b
 abeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/20190826T155753-0400-3/ust/pid/hello-ust-10353-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10352/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10352-20190826-155748 -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10353, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10353-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/a/2/ust/pid/10353/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155748-0400-20190826T155751-0400-1/ust/pid/hello-ust-10352-20190826-155748/ind
 ex -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10352/index, directory renamed /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/archives/20190826T155750-0400-20190826T155753-0400-2/ust/pid/hello-ust-10352-20190826-155748/index -> /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/session-rotation/3/ust/pid/10353/index, added "/usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/meta-ctx-sequence/metadata /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/succeed/meta-ctx-sequence/stream /usr/lib/babeltrace2/ptest/tests/data/ctf-traces/fail/metadata-syntax-error/metadata /usr/lib/babeltrace2/ptest/tests/data/plugins/src.ctf.fs/succeed/trace-meta-ctx-sequence.expect"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-ptest: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-src: PKGSIZE changed from 5376366 to 5376938 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2-src: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-src: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2-staticdev: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2-staticdev: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2/babeltrace2: PKGSIZE changed from 2255417 to 2259513 (+0%)
packages/core2-32-poky-linux/babeltrace2/babeltrace2: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2/babeltrace2: PV changed from "2.0.4" to "2.0.5"
packages/core2-32-poky-linux/babeltrace2: PKGV changed from 2.0.4 [default] to 2.0.5 [default]
packages/core2-32-poky-linux/babeltrace2: PV changed from "2.0.4" to "2.0.5"

--===============4435376212549515499==--

