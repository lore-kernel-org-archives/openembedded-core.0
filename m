Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 63D33731F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 18:29:41 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 643B5280018
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 19:29:40 +0100 (CET)
To: openembedded-core@lists.openembedded.org
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5692A314.9030808@topic.nl>
Date: Sun, 10 Jan 2016 19:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: busybox can no longer upgrade on a running system
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
X-List-Received-Date: Sun, 10 Jan 2016 18:29:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Don't think anyone noticed yet, but if you try to upgrade busybox 
through "opkg upgrade", you'll end up with a bricked box.

Apparently busybox kills the /bin/sh link somewhere during the upgrade, 
and that results in the upgrade failing and a system that won't boot.

One way to work around the problem appears to be to remove "/bin/sh" 
from the busybox.links.nosuid file, so that update-alternatives won't 
touch it.

I haven't figured out yet what caused the regression. It's probably been 
like this for months.

-- 
Mike Looijmans

