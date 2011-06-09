Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QUhN1-0002kW-VP
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 17:42:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p59FclB4029346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 08:38:47 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 9 Jun 2011 08:38:47 -0700
Message-ID: <4DF0E906.3070600@windriver.com>
Date: Thu, 9 Jun 2011 10:38:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4DF0A70C.7080501@windriver.com> <4DF0E4A8.1000608@windriver.com>
	<BANLkTimV_znbLegSD-E3EEeFqEasmDHa4Q@mail.gmail.com>
In-Reply-To: <BANLkTimV_znbLegSD-E3EEeFqEasmDHa4Q@mail.gmail.com>
Subject: Re: Question about apply eglibc configurability to create minimal image
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
X-List-Received-Date: Thu, 09 Jun 2011 15:42:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/9/11 10:34 AM, Frans Meulenbroeks wrote:
> 
> 
> 2011/6/9 Mark Hatle <mark.hatle@windriver.com <mailto:mark.hatle@windriver.com>>
> 
>     On 6/9/11 5:57 AM, Kang Kai wrote:
>     > Hi Mark,
>     >
>     > I am focus on eglibc itself compilation with disabling all the
>     > configurable options, right now eglibc can be compiled with disable all
>     > the configurable options.
>     >
>     > But when I build core-image-minimal in a clear new directory, some
>     > packages build failed and they need eglibc supports, such as
> 
>     core-image-minimal is simply to large of an image to see some of the advantages
>     of the eglibc configuration.  Realistically the advantages come on single
>     application or small (busybox + single application) systems.
> 
> 
> Then again if you are in that usecase you're probably better off (spacewise)
> using static linking

dynamical linking has the advantage of requiring less run-time memory.  So
multi-process, small systems are better in dynamic configurations then static.
(Copy-On-Write)

On-disk space is better static then dynamic.  It's all trade-offs in the end.

--Mark

> Frans
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



