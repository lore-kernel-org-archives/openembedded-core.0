Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6052DC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:25:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.7965.1646907949697577265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ESHl9mas;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BDD4D1C0005;
	Thu, 10 Mar 2022 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646907947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xbYtirqmmaCgIZM95nEvEpcLPwFckANeW3v53oqvPXo=;
	b=ESHl9masN6v0lYOZDmUG47tr0Vhw0jvSovYYGV921qKt7QaAQh0OlrjSjoiERR/B1AnWfb
	2c4YerGO9bewsJg/wxYYM10Mo9VSMrmbesfEWa3iELJT1yIm1igLJ2emejVisffIwFBekH
	v/TOz2bRNRHtI30D9/BIRPTUmLW5aijJlXCkCVUhZFwgZ1g4R+l4K72fSLC6dRfg5s4kE/
	f5JMf4jRT8/HHEHKvGoG0wGJXCYyoRBi5ei+I1/0DscjFh3lgP3XR6iPotbF8O1x/6lzoj
	T9MFp/MQ1qG4vdOA73a7cxZlZxuex9b2+ScbRLGc5jDg9R/Ugx5J5wrSj1aAyw==
Message-ID: <bed867f3-8226-701c-0ee7-ac8f02723edc@bootlin.com>
Date: Thu, 10 Mar 2022 11:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: List of changes for Kirkstone migration notes
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:25:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163011

Greetings

We need to prepare the final migration notes for Kirkstone and need your
help. Here is a quick list of already documented changes (see
https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-3.5.rst),
and changes that haven't been documented yet:

Already documented
- Branch name required in git:// and gitsm:// SRC_URI entries
- ";protocol=https" required at the end of GitHub URLs
- Network access disabled for tasks
- TOPDIR and current directory no longer modified while parsing recipes
- ``append``, ``prepend`` and ``remove`` only working with "=" and ":="
- allarch packagegroups can no longer depend on packages using PKG renaming
- distutils* classes moved to meta-python
- `blacklist.bbclass`` removed and introduction of SKIP_RECIPE


Not documented yet
- Shared State reuse from the autobuilder, speeding up builds if the
network is fast enough
- License fields now using SPDX identifiers
- Inclusive language updates, conversion script available
- Python build process based on wheels. New python packaging classes:
setuptools_build_meta.bbclass, pip_install_wheel.bbclass,
flit_core.bbclass;
- prelink support dropped
- New overlayfs and overlayfs-etc classes
- Support for AlmaLinux replacing CentOS, dropped CentOS 8, Ubuntu
16.04, Fedora 30-32...
- State cache: use ZStandard (zstd) instead of Gzip compression
- Fixed the reproducibility issues with rust-llvm and golang. Full
reprocibility in OE-Core
- BitBake: improve setscene task display
- New "crate" fetcher for Rust

Any noteworthy changes we should add to the list? I also realize that
some of the changes probably shouldn't make it to the migration notes,
just to the release notes. If so, let us know.

Don't hesitate to amend the above list by replying to this e-mail.
Documentation patches are also welcome, of course.

Thanks in advance,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


