Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFCC6D445
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 23:38:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA6NcVQT018988; Wed, 6 Nov 2013 23:38:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qr2OG4cvVjjp; Wed,  6 Nov 2013 23:38:30 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA6NcRwl018984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 6 Nov 2013 23:38:29 GMT
Message-ID: <1383781103.6271.199.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 06 Nov 2013 23:38:23 +0000
In-Reply-To: <CAMKF1so2W9JMHtLUg==ktYcQo1vrZ3K-FU+mddt4LMcvzAs-Rg@mail.gmail.com>
References: <1383622893-5185-1-git-send-email-raj.khem@gmail.com>
	<5279C70B.90103@linux.intel.com>
	<E60C2A2A-EC7B-4A72-8553-B37D7DD19A58@gmail.com>
	<527A900E.4050502@linux.intel.com>
	<CAMKF1so2W9JMHtLUg==ktYcQo1vrZ3K-FU+mddt4LMcvzAs-Rg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4] expect: Add recipe
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
X-List-Received-Date: Wed, 06 Nov 2013 23:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2013-11-06 at 10:58 -0800, Khem Raj wrote:On Wednesday, November
6, 2013, Saul Wold wrote:
>         On 11/05/2013 08:58 PM, Khem Raj wrote:
>                 
>                 On Nov 5, 2013, at 8:35 PM, Saul Wold
>                 <sgw@linux.intel.com> wrote:
>                 
>                         On 11/04/2013 07:41 PM, Khem Raj wrote:
>                                 From: Mihaela Sendrea
>                                 <mihaela.sendrea@enea.com>
>                                 
>                                 Nedeed for gcc-runtime tests.
>                                 
>                         
>                         i am seeing configure fails with this patch
>                         
>                                 configure:2350: checking for correct
>                                 TEA configuration
>                                 configure:2363: result: ok (TEA 3.9)
>                                 configure:2430: configuring expect
>                                 5.45
>                                 configure:2508: checking for Tcl
>                                 configuration
>                                 configure:2528:
>                                 error: /srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/lib directory doesn't contain tclConfig.sh
>                 
>                 
>                 OK what happens if you readd DEPENDS += “tcl” ?
>                 since you have it reproduced may be its best to try it
>                 out.
>                 
>         
>         yup, DEPENDS does the trick, so there might be some issue
>         someplace else.
>         
> 
> 
> thx i will send an update v5 but i wonder why RDEPENDS didnt turn into
> a depends may be bitbake issue

I take back what I said earlier, RDEPENDS do not automatically become
DEPENDS. Bitbake does translate them into DEPENDS namespace internally
and that are applied for the packaging tasks but the behaviour is
correct and you need both. Sorry for the confusion.

Cheers,

Richard



