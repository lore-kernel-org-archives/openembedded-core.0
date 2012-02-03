Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RtMPV-0002Oa-G2 for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:54:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13GksMG022557;
	Fri, 3 Feb 2012 16:46:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22119-06; Fri,  3 Feb 2012 16:46:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q13Gkjxv022551
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Feb 2012 16:46:46 GMT
Message-ID: <1328287611.16474.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 03 Feb 2012 16:46:51 +0000
In-Reply-To: <CAEsOVNdz1iFgoBa6MsanDUEgQym3-EbaBZy_rJ=om5_oYMvG4g@mail.gmail.com>
References: <1327425729.19643.113.camel@ted>
	<CAEsOVNdz1iFgoBa6MsanDUEgQym3-EbaBZy_rJ=om5_oYMvG4g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Machine dependencies validation with sstate
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
X-List-Received-Date: Fri, 03 Feb 2012 16:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-30 at 16:48 +0000, McClintock Matthew-B29882 wrote:
> Have you found an easy way to traverse up a dependency chain to the
> initial signature? It can take a while running the above command until
> you get to the *real* signature change on not just a signature change
> because one of the dependencies signature changed...
> 
> Some sort of tool at this point seems to be the solution. It could do
> a lot more as well. Tracking signature changes between builds would be
> nice as well. The list could go on and on...

There isn't an easy way at the moment, I've just been relying on an
educated guess from looking at two sets of files where the differences
appear to start from.

I agree we really need a tool in this kind of area. You could file an
enhancement request but it could really do with someone working on it to
help drive it forward. The bitbake core code at least already has many
useful functions to help perform the analysis.

Cheers,

Richard



