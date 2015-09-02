Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0927702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 19:09:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t82JA0RY029301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Sep 2015 12:10:00 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 2 Sep 2015 12:09:59 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Joe Slater
	<jslater@windriver.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <55E74986.1030703@windriver.com>
Date: Wed, 2 Sep 2015 15:09:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Wed, 02 Sep 2015 19:10:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-02 11:55 AM, Otavio Salvador wrote:
> On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
>> Implements ifup and ifdown.
>>
>> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
>> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>
> I think this belongs to meta-networking. Also, what this one provides
> which is not provided by the busybox one?
>

We're trying to make busybox optional for larger systems
that want to only use the full-featured/bloated packages.
It's not a large tax to carry busybox in a 50+ MB image but
it would be nice to not require it.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

