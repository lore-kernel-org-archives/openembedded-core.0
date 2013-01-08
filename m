Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TsbB4-0002Vy-7K
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:33:28 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r08FI4f7003188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Jan 2013 16:18:05 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TsawF-00065I-Vc; Tue, 08 Jan 2013 16:18:04 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50EC34AF.5010303@intel.com>
	<CAJTo0LbEV2STP5gYz77rRT5dOXMJ+yMYivzuyHkD7YkpeXH6Hg@mail.gmail.com>
	<50EC3725.2060604@intel.com>
Date: Tue, 08 Jan 2013 16:18:03 +0100
In-Reply-To: <50EC3725.2060604@intel.com> (Radu Moisan's message of "Tue, 08
	Jan 2013 17:11:33 +0200")
Message-ID: <lyk3rnn1p0.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Tue, 08 Jan 2013 15:33:29 -0000
Content-Type: text/plain

Radu Moisan <radu.moisan@intel.com> writes:

> No question about that, the question was whether to add Sign-off-by
> from the author itself. I know that we are doing it like that right
> now, but I don't understand it's reasoning. Being the author of a
> patch what would be the point in adding a Sign-off-by with the same
> name?

afaik, signed-off-by is required to allow tracking of the patch to prove
copyright or so.

The plain authorship information does not suffice because it may get
lost in some workflows.  E.g. when somebody sends a patch by email and
applies it manually, the metadata might get overridden.



Enrico


