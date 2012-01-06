Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Rj7T5-0005KU-Ha
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 11:56:15 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q06AmlVf027027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 11:48:47 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Fri,  6 Jan 2012 11:48:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <201201060029.45032.schnitzeltony@gmx.de>
Date: Fri, 06 Jan 2012 11:48:47 +0100
In-Reply-To: <201201060029.45032.schnitzeltony@gmx.de> ("Andreas
	=?iso-8859-1?Q?M=FCller=22's?=
	message of "Fri, 6 Jan 2012 00:29:44 +0100")
Message-ID: <ly7h1585tc.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 10:56:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Andreas M=FCller <schnitzeltony-Mmb7MZpHnFY@public.gmane.org> writes:

> currently some libs are moving from $libdir (/usr/lib) -> $base_libdir
> (/lib).

Parts of these changes are wrong resp. require adaptations in the build
system. Devel .so files can stay in /usr/lib; moving them to /lib breaks
builds because /lib is not in the 'ld' search path.


Enrico


