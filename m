Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 39DD560588
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 13:55:50 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id A1FC11A002E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 14:55:49 +0100 (CET)
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <568533E5.4000105@topic.nl>
Date: Thu, 31 Dec 2015 14:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: Getting "menuconfig" to work again?
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
X-List-Received-Date: Thu, 31 Dec 2015 13:55:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

When running a "menuconfig" (or any other task that needs a terminal), 
bitbake just "stops" and doesn't show any terminal.

I'm using the current master branch of everything, on Ubuntu 15.

When running with "-D" I can see the following log:

DEBUG: Executing task do_menuconfig
DEBUG: Attempting to spawn terminal "custom"
DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
DEBUG: Attempting to spawn terminal "tmux-running"
DEBUG: Attempting to spawn terminal "tmux-new-window"
DEBUG: Attempting to spawn terminal "gnome"

But nothing happens from that point.

-- 
Mike Looijmans

