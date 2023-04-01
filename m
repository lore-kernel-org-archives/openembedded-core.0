Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32260C88C8D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.32139.1680384535109213537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H+snCxkj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101873eb92802-d7a3cf66-a448-43f8-9ba3-2ea9446d9bc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ec9i+ws7tcjMpDwhhXto0ZAmbT8jiey3hqBiWJbdoEQ=;
	b=H+snCxkj7pl+pN0+7QehhonXI9RLg67y/TghRNitgywfuVNBFCeb4zNEgeAHlof6
	TfSx23aeTDd6VuVD/yU+DM2jKfCfjv4zvUfnPKbJRrTMuMvpOa7Pej6p8cCJCViM0pT
	v3liUB2YFqCcZutNJj/QJRnIMGfGNuK7Cg3R6oIk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ec9i+ws7tcjMpDwhhXto0ZAmbT8jiey3hqBiWJbdoEQ=;
	b=EHm/mhE3QQ6tpj2NxhwrsQAJj5q5JvlvnJJcaZD3pboaukf//qJ8RDnq+tM4sik6
	bG47c+60aowcwPvEXvQpKfvsHUz5ckIS85uhJad5ZeoOr1Nh7d+vB5n52k0hXLVsufC
	bbetiXS+XKCu7wDBFJZzfwy+G19Cc/NfFobozOn8=
Content-Type: multipart/mixed; boundary="===============3256686050488241433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20230331 SUCCEEDED
Message-ID: <010101873eb92802-d7a3cf66-a448-43f8-9ba3-2ea9446d9bc4-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179512

--===============3256686050488241433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20230331* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20220331-20230331.patch
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
--===============3256686050488241433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============3256686050488241433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 8841404 to 8821496 (-0%)
packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica-src: FILELIST: directory renamed /usr/src/debug/acpica/20220331-r0/source/tools/acpibin -> /usr/src/debug/acpica/20230331-r0/source/tools/acpibin, directory renamed /usr/src/debug/acpica/20220331-r0/source/tools/acpiexec -> /usr/src/debug/acpica/20230331-r0/source/tools/acpiexec, directory renamed /usr/src/debug/acpica/20220331-r0/source/include -> /usr/src/debug/acpica/20230331-r0/source/include, directory renamed /usr/src/debug/acpica/20220331-r0/source/compiler -> /usr/src/debug/acpica/20230331-r0/source/compiler, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/namespace -> /usr/src/debug/acpica/20230331-r0/source/components/namespace, directory renamed /usr/src/debug/acpica/20220331-r0/source/common -> /usr/src/debug/acpica/20230331-r0/source/common, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/debugger -> /usr/src/debug/acpica/20230331-r0/source/components/debugger, directory renamed /usr/s
 rc/debug/acpica/20220331-r0/source/components/hardware -> /usr/src/debug/acpica/20230331-r0/source/components/hardware, directory renamed /usr/src/debug/acpica/20220331-r0/source/tools/acpisrc -> /usr/src/debug/acpica/20230331-r0/source/tools/acpisrc, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/resources -> /usr/src/debug/acpica/20230331-r0/source/components/resources, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/dispatcher -> /usr/src/debug/acpica/20230331-r0/source/components/dispatcher, directory renamed /usr/src/debug/acpica/20220331-r0/source/tools/examples -> /usr/src/debug/acpica/20230331-r0/source/tools/examples, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/executer -> /usr/src/debug/acpica/20230331-r0/source/components/executer, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/disassembler -> /usr/src/debug/acpica/20230331-r0/source/components/disassembler, directory renamed /us
 r/src/debug/acpica/20220331-r0/source/components/parser -> /usr/src/debug/acpica/20230331-r0/source/components/parser, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/tables -> /usr/src/debug/acpica/20230331-r0/source/components/tables, directory renamed /usr/src/debug/acpica/20220331-r0/generate/unix/iasl/obj -> /usr/src/debug/acpica/20230331-r0/generate/unix/iasl/obj, directory renamed /usr/src/debug/acpica/20220331-r0/source/tools/acpixtract -> /usr/src/debug/acpica/20230331-r0/source/tools/acpixtract, directory renamed /usr/src/debug/acpica/20220331-r0/source/tools/acpidump -> /usr/src/debug/acpica/20230331-r0/source/tools/acpidump, directory renamed /usr/src/debug/acpica/20220331-r0/source/os_specific/service_layers -> /usr/src/debug/acpica/20230331-r0/source/os_specific/service_layers, directory renamed /usr/src/debug/acpica/20220331-r0/source/components/events -> /usr/src/debug/acpica/20230331-r0/source/components/events, directory renamed /usr/src/debug
 /acpica/20220331-r0/source/tools/acpihelp -> /usr/src/debug/acpica/20230331-r0/source/tools/acpihelp, removed "/usr/src/debug/acpica/20220331-r0/source/components/utilities/utcopy.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/uthex.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utosi.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utstrtoul64.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utinit.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/uterror.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utstate.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utuuid.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utxface.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utaddress.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utdecode.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utlock.c /usr/src/debug/acpica/2
 0220331-r0/source/components/utilities/utmisc.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utxfinit.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utalloc.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utmath.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utmutex.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utdebug.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utcache.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utglobal.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utnonansi.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utbuffer.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utexcep.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utstring.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/uttrack.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utresdecode.c /usr
 /src/debug/acpica/20220331-r0/source/components/utilities/utxferror.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utxfmutex.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utids.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utdelete.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utobject.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/uteval.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utpredef.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utstrsuppt.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utascii.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utresrc.c /usr/src/debug/acpica/20220331-r0/source/components/utilities/utownerid.c", added "/usr/src/debug/acpica/20230331-r0/source/components/utilities/utcopy.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/uthex.c /usr/src/debug/acpica/20230331-r0/source/component
 s/utilities/utstrtoul64.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utosi.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utinit.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/uterror.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utstate.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utuuid.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utxface.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utcksum.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utlock.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utdecode.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utaddress.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utmisc.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utxfinit.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utalloc.c /usr/src/debug/acpica/20230331-r0/sou
 rce/components/utilities/utmath.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utmutex.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utdebug.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utcache.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utglobal.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utnonansi.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utexcep.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utbuffer.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utstring.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/uttrack.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utresdecode.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utxferror.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utxfmutex.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utids.c /usr/src/debug/a
 cpica/20230331-r0/source/components/utilities/utdelete.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utobject.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/uteval.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utpredef.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utstrsuppt.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utascii.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utresrc.c /usr/src/debug/acpica/20230331-r0/source/components/utilities/utownerid.c"
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10298629 to 10435562 (+1%)
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20220331" to "20230331"
packages/core2-32-poky-linux/acpica/acpica: PKGSIZE changed from 2659420 to 2694524 (+1%)
packages/core2-32-poky-linux/acpica: PKGV changed from 20220331 [default] to 20230331 [default]
packages/core2-32-poky-linux/acpica: SRC_URI changed from "https://acpica.org/sites/acpica/files/acpica-unix-20220331.tar.gz" to "https://acpica.org/sites/acpica/files/acpica-unix-20230331.tar.gz"
packages/core2-32-poky-linux/acpica: PV changed from "20220331" to "20230331"

--===============3256686050488241433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20220331-20230331.patch"

RnJvbSBmMzg0M2ZmZTQxNGUyZTRmYTIzNzJkOGJmMDVlZmJiZjQ2Yjc1ZTMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMTo1MjoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFj
cGljYTogdXBncmFkZSAyMDIyMDMzMSAtPiAyMDIzMDMzMQoKLS0tCiAuLi57YWNwaWNhXzIwMjIw
MzMxLmJiID0+IGFjcGljYV8yMDIzMDMzMS5iYn0gfCAyNiArKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL3thY3BpY2FfMjAyMjAzMzEuYmIgPT4gYWNwaWNh
XzIwMjMwMzMxLmJifSAoNjUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9h
Y3BpY2EvYWNwaWNhXzIwMjIwMzMxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2FjcGljYS9h
Y3BpY2FfMjAyMzAzMzEuYmIKc2ltaWxhcml0eSBpbmRleCA2NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2FjcGljYS9hY3BpY2FfMjAyMjAzMzEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjMwMzMxLmJiCmluZGV4IDJjNTU0Zjg2
M2EuLmU3ZjdjNTY1OWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2Ev
YWNwaWNhXzIwMjIwMzMxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNw
aWNhXzIwMjMwMzMxLmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBz
b3VyY2UvY29tcGlsZXIvYXNsY29tcGlsZS5jCisjICsrKyBzb3VyY2UvY29tcGlsZXIvYXNsY29t
cGlsZS5jCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICoKKyMgICAqIDEuIENvcHlyaWdodCBOb3Rp
Y2UKKyMgICAqCisjIC0gKiBTb21lIG9yIGFsbCBvZiB0aGlzIHdvcmsgLSBDb3B5cmlnaHQgKGMp
IDE5OTkgLSAyMDIyLCBJbnRlbCBDb3JwLgorIyArICogU29tZSBvciBhbGwgb2YgdGhpcyB3b3Jr
IC0gQ29weXJpZ2h0IChjKSAxOTk5IC0gMjAyMywgSW50ZWwgQ29ycC4KKyMgICAqIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCisjICAgKgorIyAgICogMi4gTGljZW5zZQorIyAKKyMKKwogU1VNTUFSWSA9
ICJBQ1BJQ0EgdG9vbHMgZm9yIHRoZSBkZXZlbG9wbWVudCBhbmQgZGVidWcgb2YgQUNQSSB0YWJs
ZXMiCiBERVNDUklQVElPTiA9ICJUaGUgQUNQSSBDb21wb25lbnQgQXJjaGl0ZWN0dXJlIChBQ1BJ
Q0EpIHByb2plY3QgcHJvdmlkZXMgYW4gXAogT1MtaW5kZXBlbmRlbnQgcmVmZXJlbmNlIGltcGxl
bWVudGF0aW9uIG9mIHRoZSBBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBcCkBAIC0xMCwxNCAr
MzIsMTQgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hY3BpY2Eub3JnLyIKIFNFQ1RJT04gPSAi
Y29uc29sZS90b29scyIKIAogTElDRU5TRSA9ICJJbnRlbCB8IEJTRC0zLUNsYXVzZSB8IEdQTC0y
LjAtb25seSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NvdXJjZS9jb21waWxlci9hc2xj
b21waWxlLmM7YmVnaW5saW5lPTc7ZW5kbGluZT0xNTA7bWQ1PTQxYTc2YjRiMWY4MTYyNDBmMDkw
Y2YwMTBmZWZlYmYwIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vc291cmNlL2NvbXBpbGVy
L2FzbGNvbXBpbGUuYztiZWdpbmxpbmU9NztlbmRsaW5lPTE1MDttZDU9NzlhNjkwNTliNDk5YmNj
YzcwYTQ4NDQ1OTU0OTc1OGYiCiAKIENPTVBBVElCTEVfSE9TVCA9ICIoaS44Nnx4ODZfNjR8YXJt
fGFhcmNoNjQpLiotbGludXgiCiAKIERFUEVORFMgPSAibTQtbmF0aXZlIGZsZXgtbmF0aXZlIGJp
c29uLW5hdGl2ZSIKIAogU1JDX1VSSSA9ICJodHRwczovL2FjcGljYS5vcmcvc2l0ZXMvYWNwaWNh
L2ZpbGVzL2FjcGljYS11bml4LSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJh
Y2FmZjY4YjE0ZjFlMDgwNGViYmZjNGI5NzI2OGE0Y2NiZWZjZmEwNTNiMDJlZDk5MjRmMmIxNGQ4
YTk4ZTIxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjNWQ2OTVkNjA1YWFhNjE3MDlmM2M2M2Y1
N2ExYTk5Yjg5MDIyOTE3MjM5OTg0NDZiMDgxM2I1N2FjMzEwZTIiCiAKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwczovL2FjcGljYS5vcmcvZG93bmxvYWRzIgogCi0tIAoyLjM5LjIKCg==

--===============3256686050488241433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============3256686050488241433==--

