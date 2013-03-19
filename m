Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UHwPi-0008Nu-FZ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 14:17:26 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r2JD0G6d011171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 14:00:17 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1UHw9H-0006Ff-OZ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 14:00:15 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1363031776.git.ross.burton@intel.com>
	<4ad7ea263a05fb3c1960623760340549a20c849c.1363031776.git.ross.burton@intel.com>
	<ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0Lb7tbVpCn4-hGfs8KOKKp8LQW2p2grnGvmLfNUG9bR0eg@mail.gmail.com>
	<lyip4ny4jo.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0Lb-RGs0s6o6YHN11ud0rNTy7pzatTQEuO+u2ZXe9Hq4zw@mail.gmail.com>
Date: Tue, 19 Mar 2013 14:00:15 +0100
In-Reply-To: <CAJTo0Lb-RGs0s6o6YHN11ud0rNTy7pzatTQEuO+u2ZXe9Hq4zw@mail.gmail.com>
	(Ross Burton's message of "Tue, 19 Mar 2013 12:11:29 +0000")
Message-ID: <lyhak7mtnk.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.7
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH 6/9] systemd: allow postinsts to run without systemd being present
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
X-List-Received-Date: Tue, 19 Mar 2013 13:17:28 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

>> 'type systemctl'; 'type -p ...' is a bashism.
>
> Pretty sure I tried both, and busybox source shows it won't error out
> on "-p".

But 'dash' on host will fail.


Enrico


