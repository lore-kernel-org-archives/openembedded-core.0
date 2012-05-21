Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SWOuU-0005Wa-5m
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 11:28:14 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4L9I5j3012058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 May 2012 11:18:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SWOkq-0005DZ-3f; Mon, 21 May 2012 11:18:16 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Andreas Oberritter <obi@opendreambox.org>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
	<lymx55fs0d.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4FBA00DC.4000709@opendreambox.org>
Date: Mon, 21 May 2012 11:18:16 +0200
In-Reply-To: <4FBA00DC.4000709@opendreambox.org> (Andreas Oberritter's message
	of "Mon, 21 May 2012 10:46:20 +0200")
Message-ID: <lyliklevtz.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 09:28:14 -0000
Content-Type: text/plain; charset=us-ascii

Andreas Oberritter <obi@opendreambox.org> writes:

>>> What's the use case for removing packages offline
>> 
>> I am developing very much with NFS root filesystems (--> the temporary
>> image directory which is kept by IMAGE_KEEPROOTFS=1).  Packaging operations
>> like install, remove or upgrade are common actions to test recipes and
>> applications.
>
> Just to make sure we're talking about the same thing: Do you run
> opkg-cl on the build machine to remove or upgrade packages inside the
> target's NFS root?

yes; I am working on the build machine. The NFS filesystem is mounted
read-only on the target.


Enrico


