Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id D520E71A8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 13:31:08 +0000 (UTC)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <f4c84d84-83fa-ecfb-dcce-683880df6cdd@embed.me.uk>
Date: Fri, 25 Nov 2016 13:32:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.0
MIME-Version: 1.0
Subject: mount bindir confusion
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
X-List-Received-Date: Fri, 25 Nov 2016 13:31:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Does anyone have any input on where mount.* utils should be placed in 
the filesystem. I have the following binaries installed

mount: /usr/sbin/mount.exfat /usr/sbin/mount.exfat-fuse 
/bin/mount.util-linux /bin/mount /sbin/mount.fuse /sbin/mount.exfat 
/sbin/mount.cifs

Due to some being in /usr/sbin and /sbin the mount utility can't find 
the extensions when you try to call it in the following manner:

mount -t exfat /dev/sda1 /mnt

So, what would be the preferable solution? Move mount to a different 
location, move the other mount helpers to where mount is, or create 
symlinks for the helpers to where mount is?

In ArchLinux which I'm currently using at install time everything from 
util-linux in /bin /sbin is moved to the /usr/bin /usr/sbin. Is this the 
way forward as I've heard some talk before of a merged /usr.

Cheers,
Jack.

