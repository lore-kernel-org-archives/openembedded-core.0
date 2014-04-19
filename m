Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.online.nl (smtp03.online.nl [194.134.41.33])
	by mail.openembedded.org (Postfix) with ESMTP id C1A09606D4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 17:44:02 +0000 (UTC)
Received: from smtp03.online.nl (localhost [127.0.0.1])
	by smtp03.online.nl (Postfix) with ESMTP id 4D35E684C2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 19:44:00 +0200 (CEST)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp03.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 19:44:00 +0200 (CEST)
Message-ID: <5352B5E0.3080509@topic.nl>
Date: Sat, 19 Apr 2014 19:44:00 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp03.online.nl)
Subject: nfs-utils does NOT rdepend on bash
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
X-List-Received-Date: Sat, 19 Apr 2014 17:44:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

To my surprise, a megabyte sized package "bash" was installed on target 
when I installed nfs-utils to start the NFS server.

Commit 664ae3dc52fd7fc8c6f64e6cf5e70f97dedd332d claims the package needs 
bash.

It's simply not true. It does not require bash at all, it runs just fine 
with busybox's ash shell for example.

I don't understand the reasoning behind that commit. There's nothing in 
nfs-utils that really needs bash, it runs fine without it.



Also, there is an error in the startup script, I can submit a patch for 
that if you like. The script is needlessly complex too.


-- 
Mike Looijmans

