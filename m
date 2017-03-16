Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB7E7305F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 06:35:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2G6ZXsw010403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Mar 2017 23:35:33 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 23:35:33 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
	<30b0c7a3bd07acb4f0b86ddb9076a4f443c59b50.1489481108.git.liezhi.yang@windriver.com>
	<CAJTo0LZipriFRQ8oRML1=9rze9C5ghzch-v87z637emaSQg6-g@mail.gmail.com>
	<CAJTo0LZ4hD7TMkqedh9ciJVvVbC3ee_yG1nsyhXk=hWd=B3NfA@mail.gmail.com>
	<0f0dc1dc-9714-609e-2584-7d913c44305f@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <794d7734-08fa-0d89-c7ea-483482a68e37@windriver.com>
Date: Thu, 16 Mar 2017 14:35:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <0f0dc1dc-9714-609e-2584-7d913c44305f@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] mc: set ac_cv_path_PERL to /usr/bin/perl
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
X-List-Received-Date: Thu, 16 Mar 2017 06:35:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/15/2017 10:14 AM, Robert Yang wrote:
>
>
> On 03/14/2017 08:10 PM, Burton, Ross wrote:
>>
>> On 14 March 2017 at 12:06, Burton, Ross <ross.burton@intel.com
>> <mailto:ross.burton@intel.com>> wrote:
>>
>>     On 14 March 2017 at 08:45, Robert Yang <liezhi.yang@windriver.com
>>     <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>         +CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
>>
>>
>>     Would it be sensible to put this in autotools.bbclass?
>>
>>
>> Hang on.  ac_cv_path_PERL is the result of AC_PATH_PROG(perl) which is the path
>> to the perl on the host.  Is mc using this path only for writing the hashbang
>> into scripts?  If it tries to execute the path on the build host then there's
>> several ways this can fail (perl in /usr/local or with buildtools).
>
> Hi Ross,
>
> The automake and autoconf had already set this:
>
> CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
>
> So I set it for mc referred to them, should we use "#!/usr/bin/env perl" here ?

Hi Ross,

Any comments, please ?

// Robert

>
> // Robert
>
>>
>> Ross
>>

