Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SwImd-0001WW-Vl
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 22:11:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6VJxXtJ006143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:59:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 31 Jul 2012 12:59:33 -0700
Message-ID: <50183924.8010309@windriver.com>
Date: Tue, 31 Jul 2012 14:59:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
In-Reply-To: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 31 Jul 2012 20:11:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/12 1:14 PM, Stuart Yoder wrote:
> We are doing some work with LXC (containers) and one of the templates
> is for busybox.  For LXC, the busybox package needs to be built statically and
> there is a config option for this.
>
> A couple possible approaches:
>
>     -create a new 'busybox_static' recipe that the lxc package
>      depends on that turns on the needed build options.   Pretty
>      straightforward, but now there are 2 variants of the busybox
>      package.
>
>     -somehow propagate some configuration options through to
>      the standard busybox recipe so it turns on the config
>      option to build things statically.   Not sure how to
>      do this, and seems like it could get pretty messy.
>
> Any thoughts?

We've been talking about this as well..  I'm currently of the opinion that the 
kernel's config fragement processing be added to busybox.  This way someone can 
simply add a configuration fragment via a bbappend, or other approach and it'll 
pick it up.   That same can be used to specify how to enable other optional 
pieces of busybox.

--Mark

> Thanks,
> Stuart Yoder
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



