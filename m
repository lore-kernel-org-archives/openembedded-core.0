Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16A1B736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 01:42:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2V1gJlK027151
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Mar 2015 18:42:19 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Mar 2015 18:42:19 -0700
Message-ID: <5519FB7A.40903@windriver.com>
Date: Tue, 31 Mar 2015 09:42:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1427352132.git.liezhi.yang@windriver.com>	
	<86e4a87a659cffcf2383c89cdcec9ee4e2b84faa.1427352132.git.liezhi.yang@windriver.com>
	<1427710463.14020.272.camel@linuxfoundation.org>
In-Reply-To: <1427710463.14020.272.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] patch: fix CVE-2015-1196
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
X-List-Received-Date: Tue, 31 Mar 2015 01:42:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/30/2015 06:14 PM, Richard Purdie wrote:
> On Wed, 2015-03-25 at 23:42 -0700, Robert Yang wrote:
>> A directory traversal flaw was reported in patch:
>>
>> References:
>> http://www.openwall.com/lists/oss-security/2015/01/18/6
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=775227
>> https://bugzilla.redhat.com/show_bug.cgi?id=1182154
>>
>> [YOCTO #7182]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/patch/patch.inc              |    5 +-
>
> This patch shouldn't change the .inc but the versioned .bb file instead,
> otherwise non-gplv3 builds fail.
>
> In the interests of expedience, I tweaked the patch to apply to the
> versioned .bb file instead and queued it.

Thank you very much.

// Robert

>
> Cheers,
>
> Richard
>
>
>
>
>

