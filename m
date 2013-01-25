Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TynuQ-0002z3-6m
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:21:51 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0PI6Bam004607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Jan 2013 19:06:12 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TynfT-0001Tk-KW; Fri, 25 Jan 2013 19:06:23 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<6d174abd95de70a59f54ca28c965ca72933a3ce7.1359049755.git.ross.burton@intel.com>
Date: Fri, 25 Jan 2013 19:06:23 +0100
In-Reply-To: <6d174abd95de70a59f54ca28c965ca72933a3ce7.1359049755.git.ross.burton@intel.com>
	(Ross Burton's message of "Thu, 24 Jan 2013 17:52:56 +0000")
Message-ID: <ly1ud9cf34.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Fri, 25 Jan 2013 18:21:51 -0000
Content-Type: text/plain

Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Backfilling DISTRO_FEATURES and MACHINE_FEATURES with _append statements
> happens too late to use those variables with conditional inherits, like
> this:

This causes regressions for setups where DISTRO_FEATURES_BACKFILL uses
the override mechanism. E.g. I have

| DISTRO_FEATURES_BACKFILL_mydist = "ld-is-gold ${${PROJECT_FEATURES}"
| DISTRO_FEATURES_INITMAN_mydist = "systemd"

Before this commit, DISTRO_FEATURES contained 'ld-is-gold' and the
project features.  Now, project features + ld-is-gold vanished and
pulseaudio is in again.



Enrico


