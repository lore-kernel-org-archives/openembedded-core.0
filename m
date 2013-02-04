Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U2QyV-0004X8-Tq
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 19:41:09 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r14IPCCP021837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 4 Feb 2013 19:25:13 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U2Qj9-0004Xk-Uc; Mon, 04 Feb 2013 19:25:12 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
	<510F8388.2030809@topic.nl> <510F875B.9070903@intel.com>
	<1360000031.6972.39.camel@phil-desktop.brightsign>
	<CAJTo0LaBDWRhcf+kj_k6OrV0B0sE98Fnoe5+XAK4gOhPzZTgjw@mail.gmail.com>
Date: Mon, 04 Feb 2013 19:25:11 +0100
In-Reply-To: <CAJTo0LaBDWRhcf+kj_k6OrV0B0sE98Fnoe5+XAK4gOhPzZTgjw@mail.gmail.com>
	(Ross Burton's message of "Mon, 4 Feb 2013 17:51:05 +0000")
Message-ID: <lyvca89bso.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 18:41:13 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> The fontconfig cache is perfectly capable of generation at image
> creation time,

really? The cache files are architecture dependent and I am not aware of
a cross-fc-cache tool.



Enrico


