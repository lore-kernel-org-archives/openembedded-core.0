Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U9vY4-0004hH-CS
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 11:45:15 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1PASMTS025003
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Feb 2013 11:28:24 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U9vIE-0002Dx-GB; Mon, 25 Feb 2013 11:28:22 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted>
	<CAP9ODKosL9YcwoXhZ58VsQ=S+ynzwe_vTZQG4GGtKTjvzUEafQ@mail.gmail.com>
	<20130224085046.GF3154@sakrah.homelinux.org>
Date: Mon, 25 Feb 2013 11:28:22 +0100
In-Reply-To: <20130224085046.GF3154@sakrah.homelinux.org> (Khem Raj's message
	of "Sun, 24 Feb 2013 00:50:48 -0800")
Message-ID: <lyr4k43cxl.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -1.7
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.73
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
X-List-Received-Date: Mon, 25 Feb 2013 10:46:17 -0000
Content-Type: text/plain

Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

>> > On the specifics of the do_install_append, you've seen my comments about
>> > how we're not learning from past mistakes with the way the do_install in
>> > the class was written. I note Phil also agreed with them, both of us
>> > remembering some of the horrors we've dealt with in the past (and
>> > binconfig.bbclass is still around, sadly).
>> 
>> So you prefer same code to copy same type of files all over the recipes?
>
> duplicating usecase is better even though it may sound copying here
> now think if you add this to a bbclass and works ok for a package
> where we glue the unitfiles fast forward 6mos and the next version of
> the package has added the unitfiles into the package itself since
> systemd is so cool. We will be silently installing our own unit files
> without knowing.

The recent .bbappends with their own do_install_append have this problem
too. But due to the code replication the problem must be fixed at a lot
of different places instead of at a central one.

The .bbclass can do some sanity checks (e.g. making the copy operation
fail when the unit file already exists).


> Worst if the files from package are different. Having individual
> install append gives you an opportunity to this append

I do not see how this is better than removing the local .service from
SRC_URI.



Enrico


