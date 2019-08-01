Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 934596D548
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 20:13:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x71KDYhe001456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Aug 2019 13:13:35 -0700 (PDT)
Received: from [128.224.56.213] (128.224.56.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 13:13:34 -0700
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAP71WjxR7OQkiAFaYULnPn_Ufj0pcxHfRxV5ia4tfzY2i05E8A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <2b1e9fd0-36ba-189b-8c43-c48d156312c9@windriver.com>
Date: Thu, 1 Aug 2019 16:13:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjxR7OQkiAFaYULnPn_Ufj0pcxHfRxV5ia4tfzY2i05E8A@mail.gmail.com>
X-Originating-IP: [128.224.56.213]
Subject: Re: build stat output
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
X-List-Received-Date: Thu, 01 Aug 2019 20:13:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 8/1/19 2:01 PM, Nicolas Dechesne wrote:
> hi,
> 
> I am trying to make up some sense with the bitbake output at the end
> of my build. I have enabled buildstats and buildstats-summary.
> 
> What do all these numbers mean? They don't quite sum up..
> 
> Sstate summary: Wanted 15 Found 9 Missed 12 Current 125 (60% match,
> 95% complete)
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 592 tasks of which 576 didn't need to
> be rerun and all succeeded.
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 99.5% sstate reuse(183 setscene, 1 scratch)
> NOTE:   do_package_qa: 98.9% sstate reuse(89 setscene, 1 scratch)
> NOTE:   do_package: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_packagedata: 98.9% sstate reuse(89 setscene, 1 scratch)
> NOTE:   do_package_write_ipk: 98.9% sstate reuse(89 setscene, 1 scratch)
> NOTE:   do_populate_lic: 99.5% sstate reuse(185 setscene, 1 scratch)
> NOTE: Writing buildhistory
> 
> thanks!
> 

See:
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/thread.html#272296



-- 
# Randy MacLeod
# Wind River Linux

