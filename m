Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SxK0l-0001LU-6A
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 17:41:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q73FUFTO008453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 3 Aug 2012 08:30:16 -0700 (PDT)
Received: from msp-dhcp43.wrs.com (172.25.34.43) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 3 Aug 2012 08:30:15 -0700
Message-ID: <501BEE87.8080104@windriver.com>
Date: Fri, 3 Aug 2012 10:30:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
	<CAEsOVNfbJAqrDf-+DQh3h0pWtf-qDuQqKfC+_oBRHgyY4B6Obg@mail.gmail.com>
	<50197DFA.5070003@windriver.com>
	<CAP9ODKobAsEeouwR+dA2tLNHBxDaxYSunwbbLMs5rV-ES5XfDg@mail.gmail.com>
	<CALRxmdCf1vZF21Ruxw_Bi7=uvbQ6-s3_rHU=LtVS19_hR+vvtQ@mail.gmail.com>
	<CAP9ODKpCdoe2G5q3Ly-qTYKvDsWNq6sypQq8QQ=dPO1=gRZSpA@mail.gmail.com>
In-Reply-To: <CAP9ODKpCdoe2G5q3Ly-qTYKvDsWNq6sypQq8QQ=dPO1=gRZSpA@mail.gmail.com>
Subject: Re: static busybox?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 15:41:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/12 6:19 AM, Otavio Salvador wrote:
> On Thu, Aug 2, 2012 at 7:50 PM, Stuart Yoder <b08248@gmail.com> wrote:
>> On Wed, Aug 1, 2012 at 3:05 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> On Wed, Aug 1, 2012 at 4:05 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> On 8/1/12 1:59 PM, McClintock Matthew-B29882 wrote:
>>>>> This is one approach, to change busybox completely for a specific
>>>>> added layer. But, what if we only want to make this change to busybox
>>>>> if the lxc recipe is included in the image? What about other packages
>>>>> also requesting changes?
>>>>
>>>> There is no method within OE to change a configuration of one item, if
>>>> another item is included or not.
>>>>
>>>> The way to do this is use the PACKAGECONFIG options, and then pass via a
>>>> per-recipe configuration if you want lxc support enabled or not.. (or
>>>> possible lxc becomes a distro flag?)
>>>
>>> For lxc specific case I think we can just have a recipe that sets the
>>> busybox' static option. It seems to be the only difference we'd have
>>> for it.
>>
>> Do you mean a distinct 'busybox-static' recipe that lxc would
>> depend on?
>
> Yes; it might include the regular busybox recipe and do the need
> appends, or something like that.
>

That would certainly be my recommendation.  Use the same base recipe, same 
configuration mechanism, and then just add the addition chunk(s) to the SRC_URI 
and it should be much easier to maintain long-term.

The only thing remaining, is anyone working on adding the configuration yet? 
(I'd love to, but I'm swamped with work for about the next 2-3 weeks.)

--Mark


