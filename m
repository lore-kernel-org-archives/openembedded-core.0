Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50426737A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:59:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t69ExnOF029316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jul 2015 07:59:49 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 07:59:49 -0700
Message-ID: <559E8C63.20002@windriver.com>
Date: Thu, 9 Jul 2015 22:59:47 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1436178756.git.liezhi.yang@windriver.com>
	<3a571bfe258bda28dd34a61b2a6bf323a06ca911.1436178756.git.liezhi.yang@windriver.com>
	<CAJTo0LZYJEmmPsgiQc8R2whGkOH3vQdAXn9vwXz7W8nYA9KUyA@mail.gmail.com>
In-Reply-To: <CAJTo0LZYJEmmPsgiQc8R2whGkOH3vQdAXn9vwXz7W8nYA9KUyA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-target 5.1: fix for libcc1
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
X-List-Received-Date: Thu, 09 Jul 2015 14:59:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2015 10:54 PM, Burton, Ross wrote:
>
> On 6 July 2015 at 11:35, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * Install libcc1.so and libcc1plugin.so to
>        $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version) as lto-plugin did.
>
>
> Why are plugin libraries going into $libexecdir?  libexecdir is for "binaries
> that the user doesn't directly execute", not for libraries or plugins.

Hi Ross,

I put libcc1plugin.so into $libexecdir is because lto-plugin is there,
do you know more about why lto-plugin is in $libexecdir, please ?

// Robert

>
> Ross

