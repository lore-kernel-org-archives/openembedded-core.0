Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.mail.online.nl (smtp01.mail.online.nl [194.134.25.71])
	by mail.openembedded.org (Postfix) with ESMTP id 38631602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 13:58:22 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.mail.online.nl (Postfix) with ESMTP id D2AFB4002D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 14:58:22 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <568533E5.4000105@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5685347E.5080003@topic.nl>
Date: Thu, 31 Dec 2015 14:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <568533E5.4000105@topic.nl>
Subject: Re: Getting "menuconfig" to work again?
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
X-List-Received-Date: Thu, 31 Dec 2015 13:58:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-12-15 14:55, Mike Looijmans wrote:
> When running a "menuconfig" (or any other task that needs a terminal),
> bitbake just "stops" and doesn't show any terminal.
>
> I'm using the current master branch of everything, on Ubuntu 15.
>
> When running with "-D" I can see the following log:
>
> DEBUG: Executing task do_menuconfig
> DEBUG: Attempting to spawn terminal "custom"
> DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
> DEBUG: Attempting to spawn terminal "tmux-running"
> DEBUG: Attempting to spawn terminal "tmux-new-window"
> DEBUG: Attempting to spawn terminal "gnome"
>
> But nothing happens from that point.

Extra info: apparently it spawns a process:

/usr/bin/python3 /usr/bin/gnome-terminal --version

If I kill that process, the menuconfig magically appears.

-- 
Mike Looijmans

