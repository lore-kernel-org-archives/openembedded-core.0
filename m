Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35C0462252
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 09:20:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s899KvaV023258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Sep 2014 02:20:58 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 02:20:57 -0700
Message-ID: <540EC677.2010204@windriver.com>
Date: Tue, 9 Sep 2014 17:20:55 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
References: <cover.1409628729.git.wenzong.fan@windriver.com>
	<540EC448.5030001@windriver.com>
In-Reply-To: <540EC448.5030001@windriver.com>
Subject: Re: [PATCH 0/1] pango / ptest: clean CFLAGS for host binary
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
X-List-Received-Date: Tue, 09 Sep 2014 09:21:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2014 05:11 PM, wenzong fan wrote:

Oops, I replied wrong mail list, this patch works and have been merged, 
please just ignore my nonsense below:

============================================
> Recall this patch, it should be fixed from the dependency of swig.
>
> Sorry for the inconvenience.
>
> // Wenzong
>
============================================

Thanks
Wenzong

> On 09/02/2014 01:53 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> The binary gen-all-unicode needs to be compiled for the host
>> architecture, the CFLAGS passed to target system could cause
>> build issues for it.
>>
>> Such as if CFLAGS includes ARM specific flag '-mapcs-frame',
>> then it will cause build errors:
>>
>>    cc1: error: unrecognized command line option "-mapcs-frame"
>>
>> The following changes since commit
>> bb00d83675a1293ee8d7a3ac22cf01243fa2397b:
>>
>>    conf: Account for eglibc->glibc move (2014-09-01 18:03:06 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib wenzong/fix-pango
>>
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-pango
>>
>> Wenzong Fan (1):
>>    pango / ptest: clean CFLAGS for host binary
>>
>>   meta/recipes-graphics/pango/pango.inc |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>
>

