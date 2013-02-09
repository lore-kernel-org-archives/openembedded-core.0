Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U493s-0001xn-AF
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 12:57:40 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r19BfgY4013958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 9 Feb 2013 12:41:43 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U48oQ-0005SZ-83; Sat, 09 Feb 2013 12:41:42 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
	<11d3a4a06b141fc8b085baddb2195879fa7b8a03.1359935562.git.richard.purdie@linuxfoundation.org>
Date: Sat, 09 Feb 2013 12:41:42 +0100
In-Reply-To: <11d3a4a06b141fc8b085baddb2195879fa7b8a03.1359935562.git.richard.purdie@linuxfoundation.org>
	(Richard Purdie's message of "Sun, 3 Feb 2013 23:55:43 +0000")
Message-ID: <ly8v6xhfyh.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Richard Purdie
	<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 13/22] package.bbclass: Rewrite split_and_strip_files
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
X-List-Received-Date: Sat, 09 Feb 2013 11:57:40 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> writes:

> -                   os.path.isfile(file):
> ...
> +                try:
> +                    s = os.stat(file)
> +                except OSError, (err, strerror):
> +                    if err != errno.ENOENT:
> +                        raise

Causes a regression (resp. triggers the previously hidden bug catched by
the os.path.isfile() check):

ERROR: Error executing a python function in .../org.openembedded.core/meta/recipes-core/systemd/systemd-serialgetty.bb:
OSError: [Errno 13] Permission denied: '.../systemd-serialgetty/1.0-r3/package/etc/systemd/system/getty.target.wants/serial-getty@ttySA0.service'



Enrico


