Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SuO7J-000058-S2
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:28:37 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6QDH5hk030499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 15:17:06 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1SuNw9-0008Qr-3y
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:17:05 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
Date: Thu, 26 Jul 2012 15:17:05 +0200
In-Reply-To: <1343283462-25435-1-git-send-email-radu.moisan@intel.com> (Radu
	Moisan's message of "Thu, 26 Jul 2012 09:17:42 +0300")
Message-ID: <lyipdavezy.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 13:28:38 -0000
Content-Type: text/plain

Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Followed suggestions from Bugz 2261:
>
> 1) remove the --with-x/--without-x configure arguments.

why? They are valid ./configure options and common when evaluating the
x11 distro-feature.  Selecting them explicitly makes the build more
predictable and detects configuration errors earlier.

Sense of '--without-x' was disabling of x11 dependency, but not turning
off the x11-autolaunch feature.


Enrico


