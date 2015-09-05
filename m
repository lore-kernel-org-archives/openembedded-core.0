Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 514 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 05 Sep 2015 11:38:04 UTC
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 7510F7707C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 11:38:04 +0000 (UTC)
Received: from [192.168.1.5] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 7CB9D28000E;
	Sat,  5 Sep 2015 13:29:27 +0200 (CEST)
Message-ID: <55EAD217.3010806@topic.nl>
Date: Sat, 05 Sep 2015 13:29:27 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <55E949A4.9050805@dresearch-fe.de>
In-Reply-To: <55E949A4.9050805@dresearch-fe.de>
Subject: Re: "sub" machine types?
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
X-List-Received-Date: Sat, 05 Sep 2015 11:38:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-09-15 09:35, Steffen Sledz wrote:
> We have some products which differ in bootloaders (u-boot) and kernel device trees only. They use the same kernel and root filesystem.
>
> Does OE have concepts for this? Or any suggestions to realize this without building for many machines?

The way I handled this was to make it so that all machines have the same 
MACHINE_ARCH, but MACHINE has some suffixes. This combines the kernels 
and such. Only problem with that approach is that OE will erase the 
kernel for a previous machine if you build for the next one, so you have 
to copy the resulting images to another location at the end of the build.

For your case, I think you can just use a single MACHINE. You can just 
supply multiple devicetrees, and I think the u-boot recipe recently 
learned to have multiple targets, so you can build multiple bootloaders 
for a single machine too.


-- 
Mike Looijmans

