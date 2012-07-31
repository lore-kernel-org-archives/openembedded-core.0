Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwIps-00051K-IR
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 22:14:33 +0200
Received: from localhost ([127.0.0.1]:35461 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SwIed-0007NB-11
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 20:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=GRClNO6nGkQ5jqcnngJ7wzjdvuI=; b=ICdLqTC/K/GbAHcWKi65H3xr+HWL
	c3ZY0CM6Ln1cbJaD8+5pIkzZGDSxmZOzAx1nBVmpz1nWu587ppBFjB+tNNcdeIxa
	inSlslii29p970AOhB5/eXG5nIkLMNqG1XPeQ3Izhx9utB1fCQ6C6qpu1Qg/gcdI
	hl/dJSNoKmLqpn0=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:51097 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1SwIec-0007N8-Mi for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 20:02:54 +0000
Message-ID: <501839ED.4050004@communistcode.co.uk>
Date: Tue, 31 Jul 2012 21:02:53 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
In-Reply-To: <50183924.8010309@windriver.com>
Subject: Re: static busybox?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 31 Jul 2012 20:14:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2012 20:59, Mark Hatle wrote:
> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>> We are doing some work with LXC (containers) and one of the templates
>> is for busybox.  For LXC, the busybox package needs to be built 
>> statically and
>> there is a config option for this.
>>
>> A couple possible approaches:
>>
>>     -create a new 'busybox_static' recipe that the lxc package
>>      depends on that turns on the needed build options. Pretty
>>      straightforward, but now there are 2 variants of the busybox
>>      package.
>>
>>     -somehow propagate some configuration options through to
>>      the standard busybox recipe so it turns on the config
>>      option to build things statically.   Not sure how to
>>      do this, and seems like it could get pretty messy.
>>
>> Any thoughts?
>
> We've been talking about this as well..  I'm currently of the opinion 
> that the kernel's config fragement processing be added to busybox.  
> This way someone can simply add a configuration fragment via a 
> bbappend, or other approach and it'll pick it up.   That same can be 
> used to specify how to enable other optional pieces of busybox.

I like this, Busybox is one of the more complex recipes and a way to add 
and subtract config options without keeping your own copy in sync would 
be nice.

Regards,
Jack.

>
> --Mark
>
>> Thanks,
>> Stuart Yoder
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



