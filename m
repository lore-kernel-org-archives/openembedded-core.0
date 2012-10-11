Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TMJ4j-0008PU-AF
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 15:45:21 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9BDW4Ul018730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 11 Oct 2012 15:32:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TMIrr-0000Sz-Lp; Thu, 11 Oct 2012 15:32:03 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1349958020.14368.12.camel@ted>
Date: Thu, 11 Oct 2012 15:32:03 +0200
In-Reply-To: <1349958020.14368.12.camel@ted> (Richard Purdie's message of
	"Thu, 11 Oct 2012 13:20:20 +0100")
Message-ID: <ly7gqxf830.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.6
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Richard Purdie
	<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] sstate: Use -m option to tar when unpacking sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2012 13:45:21 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

> We've noticed failures on the project autobuilders where a shared
> sstate directory is used across multiple builders and the clocks
> become skewed.

I think, 'ntp' is a better way to solve this...


> This avoids modification times in the future and should make builds
> safer in shared environments sstate was designed for.

But this will remove information about the age of (packaged) files,
won't it?  E.g. previously, I was able to see on the target machine,
when a file was modified. It is not a critical feature but often very
useful.

Now, the date on image will be either the former date or the date when
the staged tarball will be extracted (--> e.g. after 'bitbake -c clean').
Sounds confusing.


> -	tar -xvzf ${SSTATE_PKG}
> +	tar -xmvzf ${SSTATE_PKG}



Enrico


