Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62681761E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:54:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T5sBbO013244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 22:54:11 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 22:53:53 -0700
Message-ID: <55B86A81.6090100@windriver.com>
Date: Wed, 29 Jul 2015 13:54:09 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
	<edf889b1140dcb63168fe1c0dd2368ea3d6d1875.1438049511.git.liezhi.yang@windriver.com>
	<CAJTo0Lbz+MGPLHZCc4jphi3os9Nk8RvUpnonBThxpz0tR3btKw@mail.gmail.com>
	<20150728134825.GB2465@jama>
In-Reply-To: <20150728134825.GB2465@jama>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] file: 5.23 -> 5.24
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
X-List-Received-Date: Wed, 29 Jul 2015 05:54:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/28/2015 09:48 PM, Martin Jansa wrote:
> On Tue, Jul 28, 2015 at 02:08:20PM +0100, Burton, Ross wrote:
>> On 28 July 2015 at 03:12, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>>> * Use git repo rather than tarball since the original SRC_URI is not
>>>    stable, it is not reachable sometimes.
>>>
>>
>> Personally speaking I see this as a recipe for a release of file which just
>> happens to use git to fetch the tarball (and presumably that hash is the
>> 5.24 tag).  In situations like this I prefer to see the recipe called
>> file_5.24.bb as there's no point having a giant PV including git SHAs when
>> it's just the release.
>
> until someone sets SRCREV_pn-file = "${AUTOREV}" somewhere and git SHAs
> in PV suddenly gets very useful.
>
> Personally speaking I prefer recipes with git SCM in SRC_URI named
> <foo>_git.bb and PV set to "A.B.C+gitr${SRCPV}".

Thanks Ross and Martin, as Ross suggested, when the release is just 5.24,
not 5.24+some patches in the repo, I prefer name it as file_5.24.bb,
so the PV would be 5.24 which is more clear, I will update the patch.

// Robert

>

