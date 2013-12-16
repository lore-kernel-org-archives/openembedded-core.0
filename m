Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4DEF6DA81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 03:31:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBG3VPkC009872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 19:31:25 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 15 Dec 2013 19:31:25 -0800
Message-ID: <52AE740D.1020607@windriver.com>
Date: Mon, 16 Dec 2013 11:31:25 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386920771.git.kai.kang@windriver.com>
	<1387149986.8783.3.camel@ted>
In-Reply-To: <1387149986.8783.3.camel@ted>
X-Enigmail-Version: 1.6
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Update for lsb and lsbtest
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
X-List-Received-Date: Mon, 16 Dec 2013 03:31:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 2013年12月16日 07:26, Richard Purdie wrote:
> On Fri, 2013-12-13 at 15:54 +0800, Kai Kang wrote:
>> Hi Saul,
>>
>> This version of lsb patch creates necessary directory otherwise do_install fails.
>> And some update for package lsbtest.
>>
>> The following changes since commit ba8506ee342a1a579ceb309f3f50285eaad84f25:
>>
>>   local.conf.extended: Bring into sync with OE-Core (2013-12-12 23:18:39 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib kangkai/lsb
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=kangkai%2Flsb
>>
>> Kai Kang (5):
>>   lsb: update directory of install_initd and remove_initd
>>   LSB_Test.sh: update rpm platform file when enable multilib
>>   LSB_Test.sh: check ldconfig before update cache
>>   LSB_Test.sh: update locales
>>   lsbtest: add ppc64 support
>>
>>  meta/recipes-extended/lsb/lsb_4.1.bb          |  7 ++++---
>>  meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 20 ++++++++++++++++++--
>>  meta/recipes-extended/lsb/lsbtest_1.0.bb      | 12 ++++++++++++
>>  3 files changed, 34 insertions(+), 5 deletions(-)
> These changes continue to break the multilib builds:
>
> http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/52

Something wrong when merge patches from build machine to local host. V3
will send.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>
>
>


-- 
Regards,
Neil | Kai Kang


