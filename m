Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFA2370961
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 18:09:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6UI9saR027203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jul 2014 11:09:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 11:09:53 -0700
Message-ID: <53D934F1.2030807@windriver.com>
Date: Wed, 30 Jul 2014 13:09:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Leah <leah@wolfssl.com>, <openembedded-core@lists.openembedded.org>
References: <CAL0pqZ0w0qmwPUhtEOfc6DCMggH6t_ELWOxhpWPSCxETta-u9A@mail.gmail.com>
	<CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
In-Reply-To: <CAL0pqZ2VaH_mCrNkXQvUOWNC_eWSTUUk-Gyp1eX06XL17EvLQA@mail.gmail.com>
Subject: Re: Add recipe to openembedded, adjust layer
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
X-List-Received-Date: Wed, 30 Jul 2014 18:10:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/14, 12:53 PM, Leah wrote:
> Hi,
>
> I have a recipe - cyassl_3.1.0.bb <http://cyassl_3.1.0.bb>, a lightweight ssl
> library that I would like to add to openembedded. I am not sure as to the best
> location, perhaps recipes-connectivity? Do I need to submit this recipe the same
> way I would submit a layer?

Usually we say meta-oe first -- unless the item shows a significant reason to be 
in oe-core.  (The gating factor for oe-core is it really does need to be a core 
piece of functionality, and something the maintainers are willing to promise to 
fix if it brakes.  Due to limited resources, it's currently difficult for any of 
the maintainers to promise that.. thus meta-oe first.)

> Also, is there a way to edit my current layer's information(meta-wolfssl) on the
> openembedded layer index?

A number of us have access to edit the layer information (myself included). 
Feel free to send me an email with the edits.

--Mark

> Thanks,
>
> Leah
>
> --
>
> Leah Thompson
> www.wolfssl.com <http://www.wolfssl.com>
> leah@wolfssl.com <mailto:leah@wolfssl.com>
> 406-570-1389 <tel:406-570-1389>
> Skype: lchristina26
>
>
>
>
>
> --
>
> Leah Thompson
> www.wolfssl.com <http://www.wolfssl.com>
> leah@wolfssl.com <mailto:leah@wolfssl.com>
> 406-570-1389
> Skype: lchristina26
>
>
>
>


