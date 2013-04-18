Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1USsHV-00061N-1b
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 19:06:00 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3IGmLEd027994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 18:48:22 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1USs0S-0002dd-Ka
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 18:48:20 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1304181219550.8010@oneiric>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 18 Apr 2013 18:48:20 +0200
In-Reply-To: <alpine.DEB.2.02.1304181219550.8010@oneiric> (Robert P. J. Day's
	message of "Thu, 18 Apr 2013 12:23:28 -0400 (EDT)")
Message-ID: <lyfvynyecr.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.1
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH] local.conf.sample: Have comments ready to go for quad-core (4 -> 8).
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
X-List-Received-Date: Thu, 18 Apr 2013 17:06:11 -0000
X-List-Received-Date: Thu, 18 Apr 2013 17:06:11 -0000
Content-Type: text/plain

"Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
writes:

> Have default, commented values for parallelism reflect quad-core
> hosts.

fwiw, I use

PARALLEL_MAKE = "\
  -j ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 2} \
  -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100} \
"

BB_NUMBER_THREADS ?= "\
  ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100}"


which adjusts parallelism automatically.



Enrico


