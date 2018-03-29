Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51C9F78278
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 13:55:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2TDtbwV023151
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 06:55:37 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 06:55:36 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
	<CAJTo0La+oWebhkQXgFvY2yMQdwZzQ=ENbnyx0=5=MuvDiEBqew@mail.gmail.com>
	<fb094e1e-1196-0bed-190f-e69bf51bb675@windriver.com>
	<1522329229.11431.90.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <0cb0fadb-b594-67a7-49cc-ea6276b1624f@windriver.com>
Date: Thu, 29 Mar 2018 09:55:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522329229.11431.90.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 29 Mar 2018 13:55:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/29/2018 09:13 AM, Richard Purdie wrote:
> On Thu, 2018-03-29 at 08:58 -0400, Bruce Ashfield wrote:
>> There's the stack validation warning, but I can run the hellomod
>> test on my qemux86-64 target and the 4.14 kernel.
>>
>> It is an incremental patch to linux-yocto_4.14 to add the
>> dependencies.
>>
>> Would you like the entire queue again, or just the new patch sent to
>> the list ?
> 
> Just new patches is fine, I have the current set in master-next,
> thanks.

I just sent the new patch, with a quick summary of how I tested it.

I did revert my new devsrc package (since it has different rdepends)
and do another image build + test. Seems to work, but I never did have
the exact same error as the QA/autobuilder saw, so I always doubt the
fix.

I added the same dependencies as the newer kernels, but thinking about
it, I'm not 100% sure I understand how that fixes the on-target build
of the scripts, since the linux-yocto* isn't actually installed, but
only devsrc .. so maybe it isn't a fix.

If you can just reply to the single patch, and tell me I'm insane,
I'll have another go at it.

Bruce

> 
> Richard
> 


