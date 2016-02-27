Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE10777179
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 13:15:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1RDFCdZ004483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 27 Feb 2016 05:15:12 -0800 (PST)
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Sat, 27 Feb 2016 05:15:11 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56D1A14B.1090100@windriver.com>
Date: Sat, 27 Feb 2016 15:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
X-Originating-IP: [128.224.124.174]
Subject: Re: [PATCHv2] ARMv8 32-bit compiler tunings
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
X-List-Received-Date: Sat, 27 Feb 2016 13:15:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/27/2016 02:44 PM, Daniel Dragomir wrote:
> Hello!
>
> This is a second version for the patch:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117603.html
>
> I remove the python method from feature-arm-vfp and I added the TUNE_CCARGS appends for CRC, CRYPTO and fp-armv8 only in armv8a tune file.
> I fix some parsing failures for armv7a*-neon-vfpv4 tunes.
> Also, I reworked the tunes to eliminate multiple parsing failures that I got running Martin's script.
>
> @Martin, I ran again the script and the results are better. I pushed the results in a personal repo:
> Tune results without the patch - clean open-embedded:
> https://github.com/ddragomi/tune_test/tree/14861fd72be9aebaaa209d9990d72745c90b43eb/tune

Sorry, the correct link is:
https://github.com/ddragomi/tune_test/tree/c71174fad88c88257cc7d567327181cb57eb2185/tune

>
> Tune results with this patch (VERSION 2):
> https://github.com/ddragomi/tune_test/tree/master/tune
>
> And a diff between those here (I fix some parsing failures for armv7a*-neon-vfpv4 tunes):
> https://github.com/ddragomi/tune_test/commit/06fbd558bf7e5d91d312628a023b8c0495e8f37a

Sorry, the correct link is:
https://github.com/ddragomi/tune_test/commit/8575dbd9ea39e69908a6adaffa494f7a7198b243

>
> NOTE: I also added a new fake-machine (axxiaarm) that require arch-arm8a.inc
> to test/parse armv8a tunes:
> DEFAULTTUNE ?= "armv8a-neon"
> require conf/machine/include/arm/arch-armv8a.inc
>
> Previous message:
> Starting with linux-yocto-4.1, Intel provides kernel support for its
> ARM v8 Axxia platforms, both on 32-bit and 64-bit.
> Poky already contains arm 64-bit compiler tunings, so I added 32-bit
> tunings based on those for armv7.
>
> The patch that I send you is a draft. Please review it and if it's ok
> I will return with thumb and big-endian tunings.
>
> Best regards,
> Daniel Dragomir (1):
>    Add tune for 32-bit ARMv8-a
>
>   meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-
>   meta/conf/machine/include/arm/arch-armv8a.inc | 75 +++++++++++++++++++++++++++
>   2 files changed, 77 insertions(+), 2 deletions(-)
>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>


