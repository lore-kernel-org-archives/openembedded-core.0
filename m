Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0356212F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 18:23:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6RIN8kC028219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 11:23:09 -0700 (PDT)
Received: from [128.224.56.236] (128.224.56.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 11:23:08 -0700
To: Dengke Du <dengke.du@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1469595557.git.dengke.du@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <15e7860e-8025-82d3-b002-42c450c3b805@windriver.com>
Date: Wed, 27 Jul 2016 14:23:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1469595557.git.dengke.du@windriver.com>
X-Originating-IP: [128.224.56.236]
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
X-List-Received-Date: Wed, 27 Jul 2016 18:23:13 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-27 01:02 AM, Dengke Du wrote:
> The following changes since commit 36feb38045b7a2af86ece147fec54b0db3bf491f:
>
>   linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4 (2016-07-21 07:48:53 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib dengke/enable-help-man-pages-for-perf
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/enable-help-man-pages-for-perf
>
> Dengke Du (2):
>   Asciidoc: add it
>   perf: enable man pages for 'help' functionality
>
>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 20 ++++++++++++++++++++
>  meta/recipes-kernel/perf/perf.bb                 | 11 ++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>

Looks good .

I was under the impression that asciidoc was larger but it's just
  ~ 900KB plus it's all python so it's not going to add to the system
build time directly.

How much longer does it take to build perf?

Did you test for python3 only?

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

