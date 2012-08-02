Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <b08248@gmail.com>) id 1Sx4Ot-0000z0-0Q
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 01:01:51 +0200
Received: by vbbfr13 with SMTP id fr13so64919vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 15:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=L/T+iEC4yr3pOnFtlVgdUdEKGqRudvbKcMrFm5wBraI=;
	b=Mhpz4P4T7SUeXF0bt/XV0YyDoRN1kcqfV9iKOPAANlx0BB1RKcy/lDclXGW5UFlZi4
	9kks7LKmeYl+hxF8/qFOKkw1ro+2OY4WXXlpD5hKK8sgxOdswOePqViKs9dxblwbnCKD
	tPr6IBvxD2x7lE/PUWgqmEAvK4wz5gOtEqC8/GOcF7WnYRUW3ILPpPBaC6jQBM17bTts
	dMRKDf1fdTrJIOcyDrZCiC7ZhP1dG8W/H5vp8ux+HJWJbe0mS5bjrFgTqCA9hZ/NYh2f
	iaXWxTtFIxnsooP4C6B4i/bC7eF78qHcrmt1teQceeOiEBoVUykZwTZGMAvE3QygUKBu
	3O7w==
MIME-Version: 1.0
Received: by 10.220.214.208 with SMTP id hb16mr21191178vcb.56.1343947810349;
	Thu, 02 Aug 2012 15:50:10 -0700 (PDT)
Received: by 10.58.231.106 with HTTP; Thu, 2 Aug 2012 15:50:10 -0700 (PDT)
In-Reply-To: <CAP9ODKobAsEeouwR+dA2tLNHBxDaxYSunwbbLMs5rV-ES5XfDg@mail.gmail.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
	<CAEsOVNfbJAqrDf-+DQh3h0pWtf-qDuQqKfC+_oBRHgyY4B6Obg@mail.gmail.com>
	<50197DFA.5070003@windriver.com>
	<CAP9ODKobAsEeouwR+dA2tLNHBxDaxYSunwbbLMs5rV-ES5XfDg@mail.gmail.com>
Date: Thu, 2 Aug 2012 17:50:10 -0500
Message-ID: <CALRxmdCf1vZF21Ruxw_Bi7=uvbQ6-s3_rHU=LtVS19_hR+vvtQ@mail.gmail.com>
From: Stuart Yoder <b08248@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 Aug 2012 23:01:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 3:05 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Wed, Aug 1, 2012 at 4:05 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 8/1/12 1:59 PM, McClintock Matthew-B29882 wrote:
>>> This is one approach, to change busybox completely for a specific
>>> added layer. But, what if we only want to make this change to busybox
>>> if the lxc recipe is included in the image? What about other packages
>>> also requesting changes?
>>
>> There is no method within OE to change a configuration of one item, if
>> another item is included or not.
>>
>> The way to do this is use the PACKAGECONFIG options, and then pass via a
>> per-recipe configuration if you want lxc support enabled or not.. (or
>> possible lxc becomes a distro flag?)
>
> For lxc specific case I think we can just have a recipe that sets the
> busybox' static option. It seems to be the only difference we'd have
> for it.

Do you mean a distinct 'busybox-static' recipe that lxc would
depend on?

Stuart


