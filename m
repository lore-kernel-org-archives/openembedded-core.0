Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0001F74A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 01:33:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5J1VljI030931
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 18:32:04 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 18 Jun 2018 18:31:37 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1529051705-100332-1-git-send-email-mingli.yu@windriver.com>
	<83c024358c85f13cf3a8d0d021b090cc755af1a3.camel@linuxfoundation.org>
	<CAMKF1sqeoLNzuAV8W_LjNk0fNDQDKVT1dF-Hwsv4OTuesib84w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B285BFC.90103@windriver.com>
Date: Tue, 19 Jun 2018 09:27:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqeoLNzuAV8W_LjNk0fNDQDKVT1dF-Hwsv4OTuesib84w@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] boost: Improve reproducibility
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
X-List-Received-Date: Tue, 19 Jun 2018 01:33:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年06月17日 22:04, Khem Raj wrote:
>
>
> On Sun, Jun 17, 2018 at 2:17 AM Richard Purdie
> <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Fri, 2018-06-15 at 16:35 +0800, mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com> wrote:
>      > From: Mingli Yu <Mingli.Yu@windriver.com
>     <mailto:Mingli.Yu@windriver.com>>
>      >
>      > Set .file section explicitly for .S files to avoid
>      > the linker introduces the host path in symbols for
>      > object files whose source file is .S
>      > Otherwise, there is a host path in the symbols as
>      > below:
>      > $ readelf --wide --symbols /my-build/boost/1.67.0-
>      > r0/boost_1_67_0/x86_64-poky-
>      > linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
>      > d/libboost_context.so.1.67.0
>      > 42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-
>      > r0/boost_1_67_0/x86_64-poky-
>      > linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
>      > d/asm/make_x86_64_sysv_elf_gas.o
>      >
>      > [YOCTO #12708]
>      >
>      > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
>     <mailto:Mingli.Yu@windriver.com>>
>      >
>     Thanks for working through this, the final result is a much better fix!
>
>
> If we add this directive to all the .S files there
> Then it can be up streamed too

Yes, I did try to send the related fix to upstream.
Thanks Khem's help!

Thanks,

>
>
>
>     Cheers,
>
>     Richard
>

