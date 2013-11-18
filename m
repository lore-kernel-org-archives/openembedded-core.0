Return-Path: <saul.wold@intel.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id BB1996D8C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:31:16 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so6946128pbb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XCp2IuPCmeJk8kU9c9Rz1SMsobnZXKsI7aW6ouM5bk0=;
	b=dCjUZ9R8aO7i5p7GBwBybMI+phGzdhTLDV3+A1T7QKE7HcCPEsFqSswOqXWsUCLaAI
	tcWSvfPyHMQOkUQbqBbAX7nIp3sG0tNCMrUv0WmIIJWW5w0rsY/3dUEhKUnC86zL2sve
	IH0xUiIpHyx+cHnVQoEEmDNx8TLJ0eINSdlOuwT61aEO1PM96q5IuTjxusu59Sot6z/m
	wpV3fZcbajyvOV2xp+Bei48OEOjvHRUxQ1rD4wROWEMpepbzHylnH4u384z5p9gpK1p/
	pUM8oO6FVruhojIPknixGHxxRMfUsiazF6O0dqthu953qvYRotCdbekKed+s7sYc409d
	mT2g==
X-Gm-Message-State: ALoCoQlpOHrZkyQzojMswE1XGaXAAjfs3TBh/H6p0hoTFHYQpOhTkEIuEAhYqsrA6MG26dzL2wBb
X-Received: by 10.67.22.67 with SMTP id hq3mr3348869pad.132.1384788678495;
	Mon, 18 Nov 2013 07:31:18 -0800 (PST)
Received: from [10.6.18.24] (c-50-186-0-160.hsd1.or.comcast.net.
	[50.186.0.160])
	by mx.google.com with ESMTPSA id m2sm24148505pbn.19.2013.11.18.07.31.17
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 18 Nov 2013 07:31:17 -0800 (PST)
Message-ID: <528A32C4.3030306@intel.com>
Date: Mon, 18 Nov 2013 07:31:16 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>	<5283F507.7050607@linux.intel.com>	<CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>	<CADkTA4M8GkRVnHr5bW-1=Ff2PSdsYaOo6ROisjZDybnNpom2OA@mail.gmail.com>	<5284F5D1.4010004@linux.intel.com>	<CADkTA4ObDkKgm+_-RG650m2TtugDh4tZ+OHyOateGSUvv9hmhQ@mail.gmail.com>	<CADkTA4MCL8pe8jACx8T9o7S17XvjUiBj5GwSp9nW2snWjpCQxQ@mail.gmail.com>	<CAP9ODKo+dR_FSj4djpGKcbQFWRiWqSK6XApGtjS6NM1r5scJDg@mail.gmail.com>	<528A0755.2060100@windriver.com>	<CAP9ODKqfdgCe_wpzyzGqgbfvOoT1HrgM_7PoSvuNDBtueBi1tA@mail.gmail.com>
	<528A2927.7070009@windriver.com>
In-Reply-To: <528A2927.7070009@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Mon, 18 Nov 2013 15:31:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2013 06:50 AM, Robert Yang wrote:
>
> On 11/18/2013 10:18 PM, Otavio Salvador wrote:
>> On Mon, Nov 18, 2013 at 10:25 AM, Robert Yang
>> <liezhi.yang@windriver.com> wrote:
>>>>
>>>> This should be considered for Dora as well as it fixes the deadlock
>>>> and building with 3.12 kernels.
>>>>
>>>
>>> Hi Otavio, thanks for suggesting this for dora, but dora's kernel is
>>> 3.10.11,
>>> and this is an update for lttng-modules, I'm not sure whether dora needs
>>> this.
>>>
>>> Add Saul in the CC list.
>>
>> I think Dora ought to get the new 3.10 kernel updates; this can go
>> along side with it.
>>
>
> Hi Otavio,
>
> I'm sorry, but I'm not sure whether we need update dora's kernel from
> 3.10.11
> to 3.10.17, since we seldom do the package update for a stable branch,
> let's wait for others' comments:-).
>
This is correct, I do not think we will be updating the kernel for a 
stable branch.

Sau!

> // Robert
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


