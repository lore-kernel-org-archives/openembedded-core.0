Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Tdlv1-0007tx-Hv
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:59:31 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qASHjETI025067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 18:45:15 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TdlhC-0008NH-AN; Wed, 28 Nov 2012 18:45:14 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1354122393-26636-1-git-send-email-cazfi74@gmail.com>
Date: Wed, 28 Nov 2012 18:45:14 +0100
In-Reply-To: <1354122393-26636-1-git-send-email-cazfi74@gmail.com> (Marko
	Lindqvist's message of "Wed, 28 Nov 2012 19:06:33 +0200")
Message-ID: <lyd2yx39lh.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readline: apply upstream patches
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
X-List-Received-Date: Wed, 28 Nov 2012 17:59:31 -0000
Content-Type: text/plain

Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> -SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz \
> +SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
> +           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-001;name=patch1 \
> ...
> +readline_patch () {
> +	# patch-command used to fail because of garbage value in $TMPDIR
> +	unset TMPDIR
> +	patch -p0 -d ${S} < ${WORKDIR}/readline52-001

I think, SRC_URI entries with ';apply=yes;striplevel=0' attributes are a
better way to solve this. E.g.

+SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
+           ${GNU_MIRROR}/readline/readline-5.2-patches/readline52-001;name=patch1;apply=yes;striplevel=0 \




Enrico


