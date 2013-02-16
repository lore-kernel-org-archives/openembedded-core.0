Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U6geW-0001fc-2r
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 13:14:48 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1GBvolE029683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 16 Feb 2013 12:57:52 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U6gOs-0003I9-FW; Sat, 16 Feb 2013 12:57:50 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
Date: Sat, 16 Feb 2013 12:57:50 +0100
In-Reply-To: <1361006114.31795.19.camel@ted> (Richard Purdie's message of
	"Sat, 16 Feb 2013 09:15:14 +0000")
Message-ID: <lyhalcmpxd.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.82
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 12:14:49 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> it would be nice when the decision to make the init manager a distribution
>> feature will be reverted to the old oe-meta mechanism.
>
> The trouble is that by making it an "image feature", people will
> expect *everything* to work properly and to be able to have fully
> functional sysvinit and systemd variants of images.

I do not see an obvious reason why fully functional sysvinit, systemd and
perhaps upstart image variants based on the same distribution/package set
are impossible.

Of course, not "everything" will work.  But initmgr being a distribution
feature makes some things completely impossible.


> We already see this expectation.

IMO, removal of features just to lower expectations is the completely
wrong way.


> Trying to explain to people what the limitations are, what is expected
> to work and what isn't will be difficult.

OpenEmbedded is not an end-user distribution but for people who are
willing to invest some learning effort.  Trying to limit ourself on the
lowest common ground is not desirable imo.


> For that reason I'd rather see this done in a different way, for
> example blacklisting the problematic systemd dependencies at image
> generation time with some kind of stronger BAD_RECOMMENDS code.

Assuming we are able to break the hard dependencies, what is with package
scripts which require programs, files or directories from these deps?  Do
we need a way to differ between good and bad script failures then?

Sounds extremely hacky and fragile...


Enrico


