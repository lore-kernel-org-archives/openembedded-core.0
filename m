Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7D1760167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:01:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1DE1MNH025893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Feb 2015 06:01:23 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 06:01:22 -0800
Message-ID: <54DE03B0.7070308@windriver.com>
Date: Fri, 13 Feb 2015 22:01:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Chong Lu
	<Chong.Lu@windriver.com>
References: <cover.1423705692.git.Chong.Lu@windriver.com>
	<11486297.dKnYkC7eTZ@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <11486297.dKnYkC7eTZ@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 0/2] bitbake-layers: add a ability to query layer dependencies from layer index
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
X-List-Received-Date: Fri, 13 Feb 2015 14:01:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/13/2015 06:10 PM, Paul Eggleton wrote:
> On Thursday 12 February 2015 09:50:21 Chong Lu wrote:
>> Change since V4:
>> Change commit log for two variables.
>>
>> The following changes since commit 35c9fa0588ed8e88b541a6c80cc1517324616cea:
>>
>>    maintainers: Update for non-maintained recipes (2015-01-20 21:39:41 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib chonglu/layerindex
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/layerindex
>>
>> Chong Lu (2):
>>    bitbake.conf: Add two variables for layer index
>>    bitbake-layers: add a ability to query layer dependencies from layer index
>
> Thanks for fixing nearly all of the issues from v3 - I've tested it and it
> works pretty well. However, there is one that is still not addressed:
>
>>> * I think the new subcommand would make more sense if it were switched
>>> around so that it was fetching by default (and renamed as appropriate).
>>> Perhaps "layerindex-fetch" (with -n to avoid fetching and just report what
>>> it would fetch).
>
> FWIW I'm happy if we still have a "layerindex-show-deps" that is just an alias
> for "layerindex-fetch -n", so it's really about the naming.
>
> Additionally I'd really rather we did not hardcode the branch names - there's
> an API call available to get these in the layer index and we should use it. I
> also think we could improve the formatting of the output to make it a bit
> easier for the user to understand.
>
> I know you'll be out of office for the next few weeks - perhaps I could address
> these issues while you're out and send a new series if you have no objections.

Thank you very much, I had talked with Chong today, he would be very happy
if you can send the new series:-)

// Robert

>
> Cheers,
> Paul
>

