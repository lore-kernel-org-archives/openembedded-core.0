Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Ssu7r-0007gY-7i
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 13:15:03 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6MB3Y79027768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 13:03:36 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1Sstwk-0006FN-E8
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 13:03:34 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1342946469.21788.54.camel@ted>
	<lyipdg878m.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342953152.21788.59.camel@ted>
Date: Sun, 22 Jul 2012 13:03:34 +0200
In-Reply-To: <1342953152.21788.59.camel@ted> (Richard Purdie's message of
	"Sun, 22 Jul 2012 11:32:32 +0100")
Message-ID: <ly7gtw83cp.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.76
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH] bitbake: do not set CCACHE_DISABLE=0
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
X-List-Received-Date: Sun, 22 Jul 2012 11:15:03 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

>> and requesting explicitly that user specifies
>> 
>>  | CCACHE_DISABLE[unexport] = "1"
>> 
>> in his .conf?  Sounds hacky and inconsistent and makes it impossible to
>> set CCACHE_DISABLE by external environment.
>
> The idea is that anyone enabling ccache would inherit the bbclass.

afais, the ccache.bbclass class is for assigning and cleaning some
(imho) strange CCACHE_DIR only which lowers efficiency significantly.

Normal ccache usage with a single CCACHE_DIR works fine (and much better)
without this class.


> The above could therefore be simplified to a hard ??= 1

for what is the '??=' ?  The value does not matter so it makes no sense
that the user can assign a value.


Enrico


