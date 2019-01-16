Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 275BC745A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 02:39:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0G2cQxL018445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jan 2019 18:38:42 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 15 Jan 2019 18:38:22 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190115064546.121351-1-kai.kang@windriver.com>
	<CAJTo0LYwDmCkcjJFLNTj5DP9zs3=W1s2tGYgo3mnMe+HaJrMpg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <25f856fd-7d91-a5d8-16b0-13e6eae1e776@windriver.com>
Date: Wed, 16 Jan 2019 10:38:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYwDmCkcjJFLNTj5DP9zs3=W1s2tGYgo3mnMe+HaJrMpg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps & librepo: fix buildpaths qa warnings
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
X-List-Received-Date: Wed, 16 Jan 2019 02:39:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/1/15 下午6:01, Burton, Ross wrote:
> On Tue, 15 Jan 2019 at 06:46, <kai.kang@windriver.com> wrote:
>> Add preprocess option '-fmacro-prefix-map' to TARGET_CPPFLAGS to fix
>> buildpaths qa warnings of libcomps and librepo.
> This is something we should be doing globally, not in a specific recipe.
>
> We pass -fdebug-prefix-map already in bitbake.conf (remap debug
> paths), and macro-prefix-map is the same but for __FILE__.  This is
> good, because we've a few patches to remove __FILE__ already and this
> means we can drop it.
>
> Digging further reveals that there's also -ffile-prefix-map, which
> sets debug-prefix-map and macro-prefix-map at once.  We should just
> change bitbake.conf to use that instead of debug-prefix-map.

OK.

--Kai


>
> Ross
>

-- 
Kai Kang


