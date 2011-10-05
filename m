Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBaOR-0004T0-OI
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 00:56:51 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Oct 2011 15:51:15 -0700
Received: by bke5 with SMTP id 5so2489779bke.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 15:51:13 -0700 (PDT)
Received: by 10.204.156.26 with SMTP id u26mr39089bkw.11.1317855072845;
	Wed, 05 Oct 2011 15:51:12 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id b10sm4290679fam.1.2011.10.05.15.51.10
	(version=SSLv3 cipher=OTHER); Wed, 05 Oct 2011 15:51:12 -0700 (PDT)
Message-ID: <4E8CDF5C.7050008@intel.com>
Date: Wed, 05 Oct 2011 15:51:08 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E8B6564.4090002@balister.org>
	<4E8B67C5.8050602@intel.com>	<4E8B6C17.80509@balister.org>
	<4E8B6D47.9000600@intel.com>	<4E8B8C05.5050508@windriver.com>
	<4E8C662B.4090300@balister.org>
	<CAMKF1soVx-m6aa0xhHeSvPDSBQvwc+L37r1xgTs58ZuCs+XhzQ@mail.gmail.com>
	<4E8CB801.7050003@balister.org>
In-Reply-To: <4E8CB801.7050003@balister.org>
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
X-List-Received-Date: Wed, 05 Oct 2011 22:56:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2011 01:03 PM, Philip Balister wrote:
> On 10/05/2011 03:35 PM, Khem Raj wrote:
>> On Wed, Oct 5, 2011 at 7:14 AM, Philip Balister<philip@balister.org>
>> wrote:
>>>
>>> 1) I do not want rpm in the image. This would confuse my customer base.
>>> 2) I am tired of dropbear, I want openssh only.
>>> 3) I need the full versions of tools, not the busybox ones.
>>> 4) I am not limited to gpv2 software.
>>>
>>> Richard, it looks to me like we should add an item for the next Yocto
>>> development cycle to review how images are built and try to make the
>>> base
>>> stuff in oe-core more usable by everyone. We need to define what
>>> choices are
>>> made by distros. For example opkg, rpm, no package management in image.
>>> Images may want dropbear or openssh.
>>>
>>> Short term, I think I'll copy the tasks/images into my bsp and get some
>>> stuff together for testing. I'd like a better long term solution though.
>>
>> There always will be customizations needed. But we can strive for
>> better basic blocks
>
> Sure. The immediate things I noticed are rpm being installed and lack of
> a way to chose between dropbear/openssh.
>
> I think it is worth having a conversation to find out if when can make
> it easier for users to create images, with a small number of knobs to turn.
>
I agree, your 4 items above make sense and we could create a set of 
tasks that can be use it as building blocks, I think that 
task-core-basic could be a starting point for that.

We did work to enable the selection of either openssh/dropbear but at an 
IMAGE_FEATURE level, not as a DISTRO_FEATURE or virtual.

Let's see what you come up with for your tasks and we can go from there.

Thanks
Sau!

> Philip
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



