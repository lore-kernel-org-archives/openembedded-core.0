Return-Path: <nathan@nathan.to>
Received: from sasl.smtp.pobox.com (pb-smtp0.int.icgroup.com [208.72.237.35])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1D7731FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 17:23:09 +0000 (UTC)
Received: from sasl.smtp.pobox.com (unknown [127.0.0.1])
	by pb-smtp0.pobox.com (Postfix) with ESMTP id 8131A3EA5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:23:08 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from
	:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version; s=sasl; bh=eQ33yde4fS/5E7LlqSEyohCRS/U=; b=WKk
	My624JhbVyMr8Mu1gCbLtsz0qJjupMC5SQFyLHvTcIzmFiOQvv9R9lY89lbk8cxI
	5PQj+7I4d6pnkxW85bsXwxbnug2HWghqBtXtmFthh94386H9Nda4m8AHbX19vI5U
	pxMucHmspOTqVVy25V4PL6ffZm0lrhpIQmloceYo=
Received: from pb-smtp0.int.icgroup.com (unknown [127.0.0.1])
	by pb-smtp0.pobox.com (Postfix) with ESMTP id 792F53EA5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:23:08 -0500 (EST)
Received: from [10.41.136.109] (unknown [79.153.217.219])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pb-smtp0.pobox.com (Postfix) with ESMTPSA id EE8373EA59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:23:06 -0500 (EST)
From: Nathan Sowatskey <nathan@nathan.to>
Message-Id: <1B0E749C-F6AB-4D7A-9A0C-C4D3E349794A@nathan.to>
Date: Thu, 11 Feb 2016 17:29:48 +0100
To: openembedded-core@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3120\))
X-Mailer: Apple Mail (2.3120)
X-Pobox-Relay-ID: 1E1C638E-D0E4-11E5-AB74-79226BB36C07-96844961!pb-smtp0.pobox.com
Subject: util-linux_2.26.2.bb, do_patch failed with exit code '1
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
X-List-Received-Date: Thu, 11 Feb 2016 17:23:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

I am using the Jethro branch of oe-core, and my build is failing with =
the error below.=20

This has started happening in the last few days. This build worked as =
expected last week.

Has anyone else seen anything like this please?

I have removed the contents of the tmp, downloads and caches a few times =
to test.

Many thanks

Nathan

ERROR: Command Error: exit status: 1  Output:
Applying patch nsenter-to-be-more-flexible.patch
patching file sys-utils/nsenter.c
Hunk #1 succeeded at 28 with fuzz 1.
Hunk #2 succeeded at 38 (offset -4 lines).
Hunk #3 succeeded at 72 (offset -4 lines).
Hunk #4 FAILED at 94.
Hunk #5 succeeded at 96 (offset -7 lines).
Hunk #6 succeeded at 106 (offset -7 lines).
Hunk #7 succeeded at 196 (offset -10 lines).
Hunk #8 FAILED at 214.
Hunk #9 succeeded at 217 (offset -13 lines).
Hunk #10 FAILED at 309.
Hunk #11 succeeded at 374 (offset -32 lines).
3 out of 11 hunks FAILED -- rejects in file sys-utils/nsenter.c
Patch nsenter-to-be-more-flexible.patch does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: =
/home/builder/git/iox-yocto-build/tmp/work/core2-64-poky-linux/util-linux/=
2.26.2-r0/temp/log.do_patch.116544
ERROR: Task 2897 =
(/home/builder/git/oe-core/meta/recipes-core/util-linux/util-linux_2.26.2.=
bb, do_patch) failed with exit code '1'

=E2=80=94
Nathan John Sowatskey
Consulting Engineer - Programmable Infrastructure, DevOps, IoT and SDN
nathan@nathan.to
www.linkedin.com/in/nathandevops
XMPP: nathandotto@im.koderoot.net
Google: nathanjohnsowatskey@gmail.com
Skype: nathan_sowatskey
Twitter: NathanDotTo
GitHub: https://github.com/DevOps4Networks
http://www.kipling.org.uk/poems_if.htm


