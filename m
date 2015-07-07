Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jul 2015 07:24:29 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BA3B16AB9F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9709F2E446;
	Tue,  7 Jul 2015 09:18:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Qoe2GkOKYfLL; Tue,  7 Jul 2015 09:18:09 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 5E0A22E44E;
	Tue,  7 Jul 2015 09:18:09 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 465ADFF3;
	Tue,  7 Jul 2015 09:18:09 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 388F9B8B;
	Tue,  7 Jul 2015 09:18:09 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 368C13E049;
	Tue,  7 Jul 2015 09:18:09 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Tue, 7 Jul 2015 09:18:08 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id E33609C68B; 
	Tue,  7 Jul 2015 09:18:08 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: "wenzong.fan@windriver.com" <wenzong.fan@windriver.com>
In-Reply-To: <1436248608-29008-1-git-send-email-wenzong.fan@windriver.com>
References: <1436248608-29008-1-git-send-email-wenzong.fan@windriver.com>
Date: Tue, 7 Jul 2015 09:18:08 +0200
Message-ID: <1436253280-sup-824@axis.com>
User-Agent: Sup/0.20.0
MIME-Version: 1.0
Cc: "openembedded-core@"
	<lists.openembedded.orgopenembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: define NON_INTERACTIVE_LOGIN_SHELLS
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
X-List-Received-Date: Tue, 07 Jul 2015 07:24:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from wenzong.fan@windriver.com's message of 2015-07-07 07:56:48 +0200:
> From: Li Wang <li.wang@windriver.com>
> 
> Allow login shells to read the startup files, even if they are not
> interactive.
> 
> The patch comes from:
> * bash-3.2-30.fc10.src.rpm - bash-2.03-profile.patch

How is this different from

commit 3985cef24de2da3b6895e67f4d577d4806c032b0
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Tue Apr 21 17:30:47 2015 +0800

    bash: explicitly define NON_INTERACTIVE_LOGIN_SHELLS in CFLAGS

    If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
    startup files, even if they are not interactive.

    This is the behaviour of other major distros like Ubuntu and Fedora.
    We also need to set it so that when executing `su -l xxx -c env' command,
    /etc/profile is parsed.

    [YOCTO #5359]
    [YOCTO #7137]

?

-- 
olof johansson

