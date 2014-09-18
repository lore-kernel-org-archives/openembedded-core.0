Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id A043D713C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 01:40:01 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so432469igd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JgjX3sX8AlNhfIbKkF0uMQU15lhCtzst7Fuk/ezN4WQ=;
	b=HYio9BrcrzymT5iZs1wI5aN0UPnj7ZMyllPruw5SrvOlrOc4zVa4vU0C0kBlfX0197
	PxW/h58N0k1nhQ/86dcDrLKSBKXzEv/ZBXBCC6hfta/CA/O06rKvaEM38el3NfMONRXj
	NzpWKTfRtAzIBqqtOH6Gayp4HYUHOVA+rOEOMJAxeGooiKfdL2dqJ47K8kZhsBWtnQvd
	NOhiqcTctoGR46hQ+0vTxj0BugaXHL6t1HzoWgTOcoOLSNMfMuPOvkPAvxf3j6bYInZB
	mqyLAdrWKDcX8SK4OjGl7CjRXgFEW05SqZ7o5aGpezE4WEyPm6RKmYhnjt7PmPINZTi2
	BLTA==
X-Received: by 10.50.153.83 with SMTP id ve19mr44475532igb.4.1411004402390;
	Wed, 17 Sep 2014 18:40:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Wed, 17 Sep 2014 18:39:32 -0700 (PDT)
In-Reply-To: <541A2C62.3060506@windriver.com>
References: <1410942161-18469-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1srbBfDZadaEBmLya5xDDXbVeJ6E4ERkWyuYbgnEzhTiHA@mail.gmail.com>
	<541A2C62.3060506@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2014 18:39:32 -0700
Message-ID: <CAMKF1srR3FmLazudFukO=d9zpdyZM8BWPOFjsKuHr_H58HkODw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to make customer able to use fixed port number
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
X-List-Received-Date: Thu, 18 Sep 2014 01:40:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 17, 2014 at 5:50 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
>
> On 09/18/2014 07:14 AM, Khem Raj wrote:
>>
>> On Wed, Sep 17, 2014 at 1:22 AM,<rongqing.li@windriver.com>  wrote:
>>>
>>> >From: Li Wang<li.wang@windriver.com>
>>> >
>>> >add option to make customer able to use fixed port number
>>
>> if you have not submitted it upstream please do so. I would be
>> interested to hear feedback from upstream before we apply this patch
>>
>
> 1. this patch was from a customer requirement. the customer verified it
> works.

Nice to know however, its important to not digress w.r.t feature from upstream

>
> 2. I post this patch to rpcbind discussion,
> https://sourceforge.net/p/rpcbind/discussion/716839/thread/32af721d/

Update this thread when you hear back from upstream rpcbind ml.

