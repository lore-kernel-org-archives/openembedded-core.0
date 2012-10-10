Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TLlab-0006HH-UP
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 04:00:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9A1kos6001861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2012 18:46:50 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 9 Oct 2012 18:46:50 -0700
Message-ID: <5074D388.6060008@windriver.com>
Date: Wed, 10 Oct 2012 09:46:48 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1349689653.git.jackie.huang@windriver.com>
	<2072868.bxk9nbbmYZ@helios>
	<CAJTo0LY9xi7=s0N1LX_zc9Hk3L1Wb15JRF4nN5sar8anjepJKA@mail.gmail.com>
In-Reply-To: <CAJTo0LY9xi7=s0N1LX_zc9Hk3L1Wb15JRF4nN5sar8anjepJKA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] ruby: Add from OE-Classic and update to 1.9.3-p194
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 02:00:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/2012 8:38 PM, Burton, Ross wrote:
> On 9 October 2012 11:38, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>>> * I sent this months ago but was told that oe-core is not the right place,
>>>    however, we think it makes sense to add ruby to complete the scripting
>>>    language set of: python, perl, ruby, so I re-send it.
>>
>> I have to say, my opinion is the same now as it was then. Ruby support is
>> certainly useful to have, and we have had requests for it; but unlike Perl and
>> Python which are needed by many other things, nothing we have in OE-Core
>> actually needs Ruby; thus it really belongs in another layer IMHO.
>
> Agreed.  If we're completing the set of scripting languages there's
> plenty left out.  A standalone meta-ruby layer that contains the
> runtime and pretty much every useful library sounds like a much better
> idea as the runtime and the libraries will be in a single place and
> incompatible changes can be done in a single move without having to
> co-ordinate multiple layers.

I see, thanks, so I think I should send it to meta-oe at this point.

Thanks,
Jackie

>
> Ross
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


