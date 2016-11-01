Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D380D719F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 13:17:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA1DHXfU031216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 1 Nov 2016 06:17:33 -0700
Received: from [147.11.119.110] (147.11.119.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Nov 2016 06:17:32 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1477928374.git.liezhi.yang@windriver.com>
	<bc402b553331b622af35b7fea7d30d82c7f2f686.1477928374.git.liezhi.yang@windriver.com>
	<1477994978.23123.46.camel@linuxfoundation.org>
	<fcb641d9-c4ae-bb72-cb96-98ec92e34797@windriver.com>
	<CAJTo0LYvV_b-A_0J=ms1pGibfys8kdbYRojQKy=gHBDsES0uhQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b5f89f9c-85a7-968c-d55a-3790133c27e8@windriver.com>
Date: Tue, 1 Nov 2016 21:17:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYvV_b-A_0J=ms1pGibfys8kdbYRojQKy=gHBDsES0uhQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe/copy_buildsystem.py: dereference symlink
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
X-List-Received-Date: Tue, 01 Nov 2016 13:17:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/01/2016 08:15 PM, Burton, Ross wrote:
>
> On 1 November 2016 at 10:18, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I should explain why not use oe.path.copytree(), but it was late last
>     night, so I forgot that. We can't use oe.path.copytree() since:
>     1) oe.path.copytree() doesn't dereference symlink
>     2) We need --exclude='.git'
>
>     I'd like to add two arguments to oe.path.copytree() to do this if it is worth.
>
>
> Adding options to dereference and exclude a specified list of files sounds like
> a good improvement to me.

Thanks, will send a V2.

// Robert

>
> Ross

