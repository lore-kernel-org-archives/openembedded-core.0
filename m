Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC896FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 01:33:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u711XYlG020570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2016 18:33:34 -0700
Received: from [128.224.162.208] (128.224.162.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jul 2016 18:33:33 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1469595557.git.dengke.du@windriver.com>
	<15e7860e-8025-82d3-b002-42c450c3b805@windriver.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <579EA6E8.1040607@windriver.com>
Date: Mon, 1 Aug 2016 09:33:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <15e7860e-8025-82d3-b002-42c450c3b805@windriver.com>
Subject: Re: [PATCH 0/2] perf: enable man pages for 'help' functionality
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
X-List-Received-Date: Mon, 01 Aug 2016 01:33:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Randy

1.  I have checked the asciidoc-native: 3.1M

2.  real    4m41.858s
      user    27m3.280s
      sys    6m32.372s

3.  Yes, the build system using python3.

//dengke

On 2016年07月28日 02:23, Randy MacLeod wrote:
> On 2016-07-27 01:02 AM, Dengke Du wrote:
>> The following changes since commit 
>> 36feb38045b7a2af86ece147fec54b0db3bf491f:
>>
>>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4 
>> (2016-07-21 07:48:53 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib 
>> dengke/enable-help-man-pages-for-perf
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/enable-help-man-pages-for-perf
>>
>> Dengke Du (2):
>>   Asciidoc: add it
>>   perf: enable man pages for 'help' functionality
>>
>>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 20 
>> ++++++++++++++++++++
>>  meta/recipes-kernel/perf/perf.bb                 | 11 ++++++++++-
>>  2 files changed, 30 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>>
>
> Looks good .
>
> I was under the impression that asciidoc was larger but it's just
>  ~ 900KB plus it's all python so it's not going to add to the system
> build time directly.
>
> How much longer does it take to build perf?
>
> Did you test for python3 only?
>


