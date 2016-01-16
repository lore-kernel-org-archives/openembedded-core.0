Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 540E7601B8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 05:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0G5b1G9002751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jan 2016 21:37:01 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 21:37:00 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
	<1452856339.28375.139.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5699D6FB.7040302@windriver.com>
Date: Sat, 16 Jan 2016 13:36:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452856339.28375.139.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Sat, 16 Jan 2016 05:37:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/15/2016 07:12 PM, Richard Purdie wrote:
> On Thu, 2016-01-14 at 18:29 -0800, Robert Yang wrote:
>> There are a lot of binary packages have files in /etc/, but only a
>> few
>> of them have set CONFFILES, more than 180 packages are not set in a
>> world build.  So treat all the files in /etc/ as CONFFILES as Debian
>> does:
>> - All the files in /etc/ are CONFFILES
>> - Move the file out of /etc/ if it is not a conffile
>> - If /etc/foo can't be moved out, and is changed during
>>    runtime, then create a symlink /etc/foo -> /var/foo
>>
>> [YOCTO #8436]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/conf/bitbake.conf |    1 +
>>   1 file changed, 1 insertion(+)
>
> We have discussed this before and we decided that setting CONFFILES
> globally seemed like a bad idea?

Sorry, but I can't find any emails which said this was a bad idea.
If we don't set CONFFILES by default, maybe we need mark a lot of
CONFFILES inside the recipes. I think that mark the CONFFILES under
/etc/ doesn't hurt anything, but help a lot when doing upgrade on
target:

1) When the old file is not changed, it will be replaced by new file.
2) When the old file is changed, it will ask the user what to do (dpkg)
    or save a bak (rpm).

//Robert

>
> What has changed since the last discussion?
>
> Cheers,
>
> Richard
>

