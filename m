Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B44565DFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:51:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3PGpJud015057
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:51:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 25 Apr 2014 09:51:19 -0700
Message-ID: <535A9286.4010309@windriver.com>
Date: Fri, 25 Apr 2014 11:51:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCH 0/5] Allow arm tunes which support only thumb
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
X-List-Received-Date: Fri, 25 Apr 2014 16:51:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/14, 11:40 AM, Martin Jansa wrote:
> Now with 1.7 open for new changes can we please apply first 4 patches?
>
> The following changes since commit 866d2854139e0b00063dde06bc3a34d635ae2fc8:
>
>    build-appliance-image: Update to  head revision (2014-04-24 17:54:58 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib jansa/tune
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/tune
>
> Andrei Gherzan (1):
>    tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions
>
> Martin Jansa (4):
>    feature-arm-thumb.inc: Replace inner quotes with apostrophes
>    feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
>    tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES
>    WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding
>      thumb suffix

I looked these over and I do like what I see.

The last WIP item is what I originally wanted to implement.. but at the time was 
told not to do it that way... so I'm more then happy to support the package arch 
clearly indicating if thumb was enabled for compilation or not.

--Mark

>   meta/conf/machine/include/arm/arch-armv4.inc       |  3 +-
>   meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
>   meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
>   meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
>   .../conf/machine/include/arm/feature-arm-thumb.inc | 36 ++++++++++++++++------
>   meta/conf/machine/include/tune-cortexm3.inc        |  2 +-
>   meta/conf/machine/include/tune-cortexr4.inc        |  2 +-
>   7 files changed, 34 insertions(+), 15 deletions(-)
>


