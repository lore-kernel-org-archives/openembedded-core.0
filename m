Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9lbe-0006T0-Mb for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 00:03:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JMsONY002841
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 22:54:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02279-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 22:54:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2JMsD5C002834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 22:54:14 GMT
Message-ID: <1332197654.9740.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 22:54:14 +0000
In-Reply-To: <COL120-W436E890CF0879C1F67450CDD420@phx.gbl>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl> <,> <,>
	,<1332192150.9740.72.camel@ted> <,>
	,<COL120-W278115027639B2C6CC9F7BDD420@phx.gbl> <, >
	, <EBB81F82C91641E49DD69302B85DB8BF@gmail.com>
	, <COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>
	, <B0098CE307294E64ABD9A4F359B2382D@gmail.com>
	<COL120-W436E890CF0879C1F67450CDD420@phx.gbl>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Linking two recipes
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
X-List-Received-Date: Mon, 19 Mar 2012 23:03:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-19 at 15:10 -0700, simran singh wrote:
> This is how I was able to install it:
> 
> 
> do_install(){
>        python configure.py --prefix=${D}/${libdir}/botan
> }
>
> 
> But still the other recipe is unable to locate the files.
> 

In the other recipe, look in ${STAGING_LIBDIR}...

Cheers,

Richard




