Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZfRB-0001oZ-CZ for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 11:43:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4U9XCFW020836
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 10:33:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17694-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 10:33:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4U9X24W020830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 10:33:04 +0100
Message-ID: <1338370380.20169.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 10:33:00 +0100
In-Reply-To: <lyr4u3rtpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1338294584.20169.103.camel@ted>
	<lyr4u3rtpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] ccache: Separate out into its own class
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
X-List-Received-Date: Wed, 30 May 2012 09:43:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-29 at 15:40 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > Currently, ccache is used if it is present. When building from scratch
> > it gives no performance improvement
> 
> Here, I have a 10% cache hit ratio in a scratch build:
> 
> cache hit (direct)                  2841
> cache hit (preprocessed)            1370
> cache miss                         39957
> called for link                     3369
> called for preprocessing            3207
> multiple source files                  8
> compile failed                      2531
> preprocessor error                   432
> couldn't find the compiler           111
> bad compiler arguments               468
> unsupported source language          532
> autoconf compile/link               6613
> unsupported compiler option          132
> no input file                       2919
> files in cache                     94205
> cache size                           2.0 Gbytes
> max cache size                       3.0 Gbytes
> 

That's good data, thanks for sharing it. In any measurement I've made,
it doesn't seem to help the wall time for the build though :(

We're not removing the ability to use ccache, just changing the way its
enabled which all things considered I still think is a good move...

Cheers,

Richard



