Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SZlah-0003iY-9D
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:17:43 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4UG7Iue013143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 18:07:19 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SZlQc-0002yM-HB; Wed, 30 May 2012 18:07:18 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1338391023-31189-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1338392680.20169.148.camel@ted>
Date: Wed, 30 May 2012 18:07:18 +0200
In-Reply-To: <1338392680.20169.148.camel@ted> (Richard Purdie's message of
	"Wed, 30 May 2012 16:44:40 +0100")
Message-ID: <lyy5o9zm89.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtasn: fixed cross build issue
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
X-List-Received-Date: Wed, 30 May 2012 16:17:43 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> | /bin/sh ../libtasn1-2.12-r1/libtasn1-2.12/build-aux/missing --run help2man --info-page libtasn1 \
>> |       --name="ASN.1 DER encoder" \
>> |       --output=asn1Coding.1 ../src/asn1Coding
>> | help2man: can't get `--help' info from ../src/asn1Coding
>> | Try `--no-discard-stderr' if option outputs to stderr
>> | make[3]: *** [asn1Coding.1] Error 1
>> 
>> which was caused by touching configure.ac which is a dependency of the
>> generated man pages.
>> 
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> ---
>>  meta/recipes-support/gnutls/libtasn1_2.12.bb |   10 +++++++++-
>>  1 files changed, 9 insertions(+), 1 deletions(-)
>
> This is just a workaround, I thought we'd found a better way to handle
> this.

setting HELP2MAN environment to 'true' for cross-builds might be a
general solution.... But this does not seem to be implemented...


Enrico


