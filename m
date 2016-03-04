Return-Path: <pascal.bach@siemens.com>
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id D4E4B70149
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 08:42:49 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id u248gki3028294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 09:42:47 +0100
Received: from [139.16.79.50] (MD1FZU9C.ww002.siemens.net [139.16.79.50])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id u248gklv006483
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 09:42:46 +0100
To: openembedded-core@lists.openembedded.org
References: <56CC6832.90506@siemens.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56D94A86.7080908@siemens.com>
Date: Fri, 4 Mar 2016 09:42:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56CC6832.90506@siemens.com>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Fri, 04 Mar 2016 08:42:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping!
No comment on this topic?

Am 23.02.2016 um 15:09 schrieb Pascal Bach:
> Hi Everybody
>
> Currently debugging using sysroots seems to work as long as the work folder containing the original source is available.
> Once this work dir is gone the debugger is no longer able to find the source code. This is especially confusing if some packages are taken from sstate and others are built in the current projects, because for some libraries the sources can be found and for others not. It is hard at first to figure out the reason why one works and the other not.
>
> In order to make it easier to debug using sysroots I propose to modify the how the sysroots is built to do somethins similar to rootfs:
>
> 1. Changing the source reference in the debug symbols to point to the source under /usr/src/debug
> 2. Copy the sources into /usr/src/debug under sysroots similar to how it is done for a debug rootfs.
> 3. Document that the user needs to add the following to the .gdbinit to make it work:
>     ```
>     set sysroot /project/oe/build/tmp/sysroots/<target_sysrtoot>
>     set substitute-path /usr/src/debug /project/oe/build/tmp/sysroots/<target_sysrtoot>/usr/src/debug
>     ```
>
> This would also allow the sysroot to be relocatable as it is kind of standalone and everything required to debug is included.
>
> What do you think? Does this proposal make sense, or did I miss something and this is completly unnecessary and there is an easier way already working?
>
> Regards
> Pascal


