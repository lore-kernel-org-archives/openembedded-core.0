Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TCUGU-0002Vo-Ov
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 13:40:56 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q8EBSFQC015767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 13:28:16 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TCU4V-0006vp-N6; Fri, 14 Sep 2012 13:28:31 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
Date: Fri, 14 Sep 2012 13:28:31 +0200
In-Reply-To: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
	(Constantin Musca's message of "Wed, 12 Sep 2012 14:58:18 +0300")
Message-ID: <lyvcfgu9ls.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.7
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Constantin Musca
	<constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] patch.bbclass: Use one TMPDIR per patching process
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
X-List-Received-Date: Fri, 14 Sep 2012 11:40:56 -0000
Content-Type: text/plain

Constantin Musca
<constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> +    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
> +    if os.path.exists(process_tmpdir):
> +        shutil.rmtree(process_tmpdir)
> +    os.makedirs(process_tmpdir)

ooohhhh... this violates trivial rules regarding secure generation of
tempfiles. Better use 'mkdtemp()' from the 'tempfile' module.


Enrico


