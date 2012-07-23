Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1StJtV-0004Rb-GC
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 16:45:57 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6NEYS6c013808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 16:34:30 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1StJiO-0007pN-Da
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 16:34:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
Date: Mon, 23 Jul 2012 16:34:28 +0200
In-Reply-To: <1343052252-4154-1-git-send-email-radu.moisan@intel.com> (Radu
	Moisan's message of "Mon, 23 Jul 2012 17:04:12 +0300")
Message-ID: <lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Mon, 23 Jul 2012 14:45:57 -0000
Content-Type: text/plain

Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Close-on-exec seems to be unsuported on some architectures like CentOS 5.8
> and thus causing some packages to fail to build successfully. 

Have you verified that making O_CLOEXEC a noop does not break the
applications?


Enrico


