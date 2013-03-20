Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UINmA-0002nE-Mr
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 19:30:26 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r2KIDGBk026871
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 20 Mar 2013 19:13:18 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UINVk-0008EC-8M; Wed, 20 Mar 2013 19:13:16 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1363673104.git.Qi.Chen@windriver.com>
	<face120c816e78dffad876f43218920c1a7da423.1363673104.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 20 Mar 2013 19:13:16 +0100
In-Reply-To: <face120c816e78dffad876f43218920c1a7da423.1363673104.git.Qi.Chen@windriver.com>
	(Qi's message of "Tue, 19 Mar 2013 14:51:05 +0800")
Message-ID: <lytxo6rlc3.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org
Subject: Re: [PATCH 1/1] util-linux: better co-operate with systemd
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
X-List-Received-Date: Wed, 20 Mar 2013 18:30:29 -0000
Content-Type: text/plain

<Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> So in case of a systemd based image, we add to EXTRA_OECONF
> '--with-systemdsystemunitdir' to specify the location of systemd unit
> files, and '--enable-socket-activation' to build uuidd with socket
> activation.

nak; this should go into an own subpackage:

* the socket itself is broken: systemd tries to create the /var/uiidd/request
  socket which will fail on ro filesystems.  It should be moved to a
  volatile location

* util-linux contains lot of other programs which might be useful for
  other purposes; having a daemon which is activated silently is unwanted.


Enrico


