Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SZMpH-0004T2-Js
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 15:51:07 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4TDemLo011406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 15:40:50 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1SZMfI-00023o-R2
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 15:40:48 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1338294584.20169.103.camel@ted>
Date: Tue, 29 May 2012 15:40:48 +0200
In-Reply-To: <1338294584.20169.103.camel@ted> (Richard Purdie's message of
	"Tue, 29 May 2012 13:29:44 +0100")
Message-ID: <lyr4u3rtpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Tue, 29 May 2012 13:51:07 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

> Currently, ccache is used if it is present. When building from scratch
> it gives no performance improvement

Here, I have a 10% cache hit ratio in a scratch build:

cache hit (direct)                  2841
cache hit (preprocessed)            1370
cache miss                         39957
called for link                     3369
called for preprocessing            3207
multiple source files                  8
compile failed                      2531
preprocessor error                   432
couldn't find the compiler           111
bad compiler arguments               468
unsupported source language          532
autoconf compile/link               6613
unsupported compiler option          132
no input file                       2919
files in cache                     94205
cache size                           2.0 Gbytes
max cache size                       3.0 Gbytes



Enrico


