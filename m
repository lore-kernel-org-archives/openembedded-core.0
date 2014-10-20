Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D8F1E6AC19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:26:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9K6QJfT010927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Oct 2014 23:26:20 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 19 Oct 2014 23:26:19 -0700
Message-ID: <5444AB0A.4000203@windriver.com>
Date: Mon, 20 Oct 2014 14:26:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1410257258.git.liezhi.yang@windriver.com>	<4e8cdaffb79ea56a3644ede8af0cacbefd167197.1410257258.git.liezhi.yang@windriver.com>	<54221EBB.8070606@windriver.com>	<CAJTo0LbYoQRbtKT_o7OLGn7d=YPu9AKv2vRAQzHsd-H19ZySnQ@mail.gmail.com>
	<5422D004.1020202@windriver.com>
In-Reply-To: <5422D004.1020202@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb
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
X-List-Received-Date: Mon, 20 Oct 2014 06:26:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/24/2014 10:07 PM, Robert Yang wrote:
>
>
> On 09/24/2014 06:46 PM, Burton, Ross wrote:
>> On 24 September 2014 02:30, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> Ping, I think that we need it since it is a function lost.
>>
>> If we're going to unify the behaviour - which is a good thing - then
>> ROOTFS_POSTPROCESS_COMMAND needs to be unified too.
>
> The ROOTFS_POSTPROCESS_COMMAND works well, there isn't anything wrong
> with it, did you mean the ROOTFS_POSTINSTALL_COMMAND ? I don't know
> the difference  between ROOTFS_POSTINSTALL_COMMAND and
> ROOTFS_POSTPROCESS_COMMAND, maybe we need remove ROOTFS_POSTINSTALL_COMMAND ?
>

Hi Ross,

Any comments on this, please ?

// Robert

> // Robert
>
>>
>> Ross
>>
>>

