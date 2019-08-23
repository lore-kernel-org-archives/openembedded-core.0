Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D75067F361
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 14:37:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7NEbR78004747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 07:37:38 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 07:37:10 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
	<1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
	<20190822170111.GA2069@localhost>
	<e73ede01-3f54-232c-a97a-db4890527a7f@windriver.com>
	<20190823142623.GA30097@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <e3d242a2-f784-7ca0-9d16-a85896eb07f2@windriver.com>
Date: Fri, 23 Aug 2019 22:37:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823142623.GA30097@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] elfutils: 0.176 -> 0.177
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
X-List-Received-Date: Fri, 23 Aug 2019 14:37:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/23/19 10:26 PM, Adrian Bunk wrote:
> On Fri, Aug 23, 2019 at 09:28:11AM +0800, Hongxu Jia wrote:
>> On 8/23/19 1:01 AM, Adrian Bunk wrote:
>>> On Thu, Aug 22, 2019 at 09:40:18AM +0800, Hongxu Jia wrote:
>>>> - Update Debian patches
>>>>     http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
>>>>
>>>> - Rebase Debian patches to 0.177
>>>>     debian/hppa_backend.diff
>>>>     debian/mips_backend.diff
>>>>     debian/arm_backend.diff
>>>>     debian/mips_readelf_w.patch
>>>>     debian/testsuite-ignore-elflint.diff
>>>>     debian/mips_cfi.patch
>>>> ...
>>>>    ...1-fix-compile-failure-with-debian-patches.patch |  48 ++++++++
>>>> ...
>>>>    .../elfutils/files/debian/hppa_backend.diff        |  57 +++++----
>>>>    .../elfutils/files/debian/hurd_path.patch          |  17 +--
>>>> ...
>>>>    .../elfutils/files/debian/kfreebsd_path.patch      |  13 +-
>>>> ...
>>>>    .../elfutils/files/debian/mips_cfi.patch           | 131 +++++++++++++++++++++
>>>> ...
>>> Why are we following Debian patches in a package with active upstream?
>> I am afraid no, we need to rebase them (0.176) to 0.177
> The part about rebasing existing patches is clear.
>
> But why are we for example adding mips_cfi.patch when this is not upstream?
> There might be a good reason for doing so, but "because it is a Debian patch"
> is not a good reason.
>
> And the existing hppa/hurd/kfreebsd patches from Debian are unlikely to
> make sense in OE.

I just integrate debian patches as a whole, if you are familiar with 
elfutils and

make sure some of them does not make sense, modification on them is welcome

//Hongxu

>> //Hongxu
> cu
> Adrian
>


