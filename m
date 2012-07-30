Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Svmgf-00064L-MR
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 11:55:05 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6U9hELR032649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 11:43:15 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1SvmVO-0001gv-9Q
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 11:43:14 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1343639174-29579-1-git-send-email-rongqing.li@windriver.com>
Date: Mon, 30 Jul 2012 11:43:14 +0200
In-Reply-To: <1343639174-29579-1-git-send-email-rongqing.li@windriver.com>
	(rongqing's message of "Mon, 30 Jul 2012 17:06:14 +0800")
Message-ID: <lyk3xlfutp.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH] perf-3.4: fix hardcoded slang include dir
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
X-List-Received-Date: Mon, 30 Jul 2012 09:55:06 -0000
Content-Type: text/plain

<rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> ...
> +	sed -i "s:-I/usr/include/slang:-I${STAGING_INCDIR}:" ${S}/tools/perf/Makefile

You are patching an already staged file here:

 | S = "${STAGING_KERNEL_DIR}"

When want to fix it in this way (another workaround might be adding
'WERROR=0' to EXTRA_OEMAKE), it must be done in kernel.bbclass.


Enrico


