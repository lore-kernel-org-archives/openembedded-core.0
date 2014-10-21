Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6D15601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 00:10:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9L0AGmL001461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Oct 2014 17:10:16 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 20 Oct 2014 17:10:16 -0700
Message-ID: <5445A46A.5050505@windriver.com>
Date: Tue, 21 Oct 2014 08:10:18 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1413364894-25626-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZ3p9R2CUnj_XffSQDoDE-_Cg8pmLBQ_VDu5p9TSxYc-Q@mail.gmail.com>
In-Reply-To: <CAJTo0LZ3p9R2CUnj_XffSQDoDE-_Cg8pmLBQ_VDu5p9TSxYc-Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: fix a Gcc undefined behavior
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
X-List-Received-Date: Tue, 21 Oct 2014 00:10:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/2014 06:59 PM, Burton, Ross wrote:
> On 15 October 2014 10:21,  <rongqing.li@windriver.com> wrote:
>> Calling strncpy with NULL second argument, even when the size is 0,
>> is undefined behavior, which leads to GCC to drop the check old
>> variable with NULL in following code.
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743
>
> I've merged this into my MUT branch but we're very late for 1.7.0
> unless it's a critical fix.  We can roll this into 1.7.1 though.
>
> Ross
>

It make the nfs-server unable to start up on my test environment


-Roy

-- 
Best Reagrds,
Roy | RongQing Li

