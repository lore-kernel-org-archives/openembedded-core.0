Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SZmKb-0007j4-7u
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 19:05:09 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4UGsmBa018543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 18:54:49 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SZmAa-0004wn-Aa; Wed, 30 May 2012 18:54:48 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1338391023-31189-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1338392680.20169.148.camel@ted>
	<lyy5o9zm89.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1338396454.20169.163.camel@ted>
Date: Wed, 30 May 2012 18:54:48 +0200
In-Reply-To: <1338396454.20169.163.camel@ted> (Richard Purdie's message of
	"Wed, 30 May 2012 17:47:34 +0100")
Message-ID: <lyehq1zk13.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.85
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
X-List-Received-Date: Wed, 30 May 2012 17:05:09 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> setting HELP2MAN environment to 'true' for cross-builds might be a
>> general solution.... But this does not seem to be implemented...
>
> Right, I remember looking into this and its hard to disable. I've pushed
> a PATH change to address this problem...

But this makes 'help2man' completely unavailable which might break
man-page generation for -native (where 'help2man' works) or for every
package which requires a working 'help2man' tool.


Enrico


