Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D33E60118
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 08:32:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3I8WCu6002608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 18 Apr 2016 01:32:12 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 01:32:11 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <57149B89.2090607@windriver.com>
Date: Mon, 18 Apr 2016 16:32:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 08:32:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/18/2016 04:23 PM, Andreas Müller wrote:
> On Mon, Apr 18, 2016 at 10:11 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 04/18/2016 04:09 PM, Andreas Müller wrote:
>>> Has anybody tried remote debugging with this patch applied? For me the
>>> source files are no more found and I think this patch looks
>>> suspicious...
>>
>> What's your build steps?
>>
> Don't understand your question I guess. I build by bitbake <image> with
>
> INHIBIT_SYSROOT_STRIP = "1"
>
> and set sysroot to build sysroot - see [1].
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118635.html

Do you install *-dbp pkgs to your image? In the following example, we 
use gdb to
debug gzip.

Test steps:

1. vim local.conf
------
IMAGE_INSTALL_append = " gdb gcc gzip"
EXTRA_IMAGE_FEATURES_append = " dbg-pkgs"
------

Currently, The ${S} locates in 'work-shared' dir could not generate 
sources (such as gcc),
and ${S} located in WORKDIR works (such as above gzip).

And now I start a new building to verify the suspicious you report.

//Hongxu

>
> Andreas


