Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6DD073FA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 02:04:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9D24uEN000559
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Oct 2015 19:04:56 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 12 Oct 2015 19:04:56 -0700
Message-ID: <561C66C6.4090408@windriver.com>
Date: Tue, 13 Oct 2015 10:04:54 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<wenzong.fan@windriver.com>
References: <1444642535-196919-1-git-send-email-wenzong.fan@windriver.com>
	<1444654455.3844.3.camel@linuxfoundation.org>
In-Reply-To: <1444654455.3844.3.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
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
X-List-Received-Date: Tue, 13 Oct 2015 02:04:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/12/2015 08:54 PM, Richard Purdie wrote:
> On Mon, 2015-10-12 at 05:35 -0400, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> "bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
>> "bzip2 -qt FILE" returns 0 when this happens, although it does print out
>> an error message as is does so.
>>
>> This has been fix by Debian, just port changes from Debian patch file
>> "20-legacy.patch":
>>
>> * Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   ...bunzip2-qt-returns-0-for-corrupt-archives.patch | 49 ++++++++++++++++++++++
>>   meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  1 +
>>   2 files changed, 50 insertions(+)
>>   create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
>>
>> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
>> new file mode 100644
>> index 0000000..63d705d
>> --- /dev/null
>> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
>> @@ -0,0 +1,49 @@
>> +From 8068659388127e8e63f2d2297ba2348c72b20705 Mon Sep 17 00:00:00 2001
>> +From: Wenzong Fan <wenzong.fan@windriver.com>
>> +Date: Mon, 12 Oct 2015 03:19:51 -0400
>> +Subject: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
>> +
>> +"bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
>> +"bzip2 -qt FILE" returns 0 when this happens, although it does print out
>> +an error message as is does so.
>> +
>> +This has been fix by Debian, just port changes from Debian patch file
>> +"20-legacy.patch":
>> +
>> +* Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).
>> +
>> +Upstream-Status: Backport [Debian]
>> +
>
> What is the upstream position on this issue? That they won't fix it? I'm
> not sure Backport is right for a debian patch since debian is not the
> bzip2 upstream.

I wrongly thought that it was right, and we did have several "Backport [Debian]"
in oe-core/meta, should it be a Pending or Pending [Debian], please ?

// Robert

>
> Cheers,
>
> Richard
>

