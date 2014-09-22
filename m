Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCF716B876
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 17:04:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8MH4mEk009847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Sep 2014 10:04:48 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 22 Sep 2014 10:04:47 -0700
Message-ID: <542056AF.8080009@windriver.com>
Date: Mon, 22 Sep 2014 13:04:47 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<2251278.GaOGmN6XgQ@peggleto-mobl5.ger.corp.intel.com>
	<54203FCE.3080901@windriver.com>
	<CAMKF1srheZyVe5ATST-ToxZQJkXTTNvoh8j+PzrytSVbjVV9wA@mail.gmail.com>
In-Reply-To: <CAMKF1srheZyVe5ATST-ToxZQJkXTTNvoh8j+PzrytSVbjVV9wA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Mon, 22 Sep 2014 17:04:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-22 01:03 PM, Khem Raj wrote:
> On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> But the reports we've been getting have been that externalsrc
>> builds are working for kernels, and linux-yocto without the change
>> in place, so I'm looking to reduce the patch footprint and re-submit.
>
> no, it cant work if folks were trying the usecase I have mentioned.
> The fix is infact for
> non linux-yocto kernels.

I'll send out my updated patch shortly, it should fix both cases.

Bruce

>


