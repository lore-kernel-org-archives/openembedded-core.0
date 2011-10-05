Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RBXm8-0008Dp-SI
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 22:09:09 +0200
Received: (qmail 11653 invoked by uid 1003); 5 Oct 2011 20:03:32 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.183.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	5 Oct 2011 20:03:32 -0000
Message-ID: <4E8CB801.7050003@balister.org>
Date: Wed, 05 Oct 2011 16:03:13 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.22) Gecko/20110906 Fedora/3.1.14-1.fc14 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E8B6564.4090002@balister.org>
	<4E8B67C5.8050602@intel.com>	<4E8B6C17.80509@balister.org>
	<4E8B6D47.9000600@intel.com>	<4E8B8C05.5050508@windriver.com>
	<4E8C662B.4090300@balister.org>
	<CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
In-Reply-To: <CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
Subject: Re: Bringing an image from OE to OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 20:09:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2011 03:35 PM, Khem Raj wrote:
> On Wed, Oct 5, 2011 at 7:14 AM, Philip Balister<philip@balister.org>  wrote:
>>
>> 1) I do not want rpm in the image. This would confuse my customer base.
>> 2) I am tired of dropbear, I want openssh only.
>> 3) I need the full versions of tools, not the busybox ones.
>> 4) I am not limited to gpv2 software.
>>
>> Richard, it looks to me like we should add an item for the next Yocto
>> development cycle to review how images are built and try to make the base
>> stuff in oe-core more usable by everyone. We need to define what choices are
>> made by distros. For example opkg, rpm, no package management in image.
>> Images may want dropbear or openssh.
>>
>> Short term, I think I'll copy the tasks/images into my bsp and get some
>> stuff together for testing. I'd like a better long term solution though.
>
> There always will be customizations needed. But we can strive for
> better basic blocks

Sure. The immediate things I noticed are rpm being installed and lack of 
a way to chose between dropbear/openssh.

I think it is worth having a conversation to find out if when can make 
it easier for users to create images, with a small number of knobs to turn.

Philip


