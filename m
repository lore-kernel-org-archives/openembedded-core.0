Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2qyq-0001ul-32 for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 23:27:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r15MGKkj008675; Tue, 5 Feb 2013 22:16:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0uTKrHU0X3Xt; Tue,  5 Feb 2013 22:16:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r15MGI69008648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Feb 2013 22:16:21 GMT
Message-ID: <1360102256.28450.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Tue, 05 Feb 2013 22:10:56 +0000
In-Reply-To: <51115B09.9090607@linux.intel.com>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
	<lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<511144EC.1030704@linux.intel.com>
	<CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
	<lyhalq4lz0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51115B09.9090607@linux.intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Patches, Salvador <otavio@ossystems.com.br>,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	about the oe-core layer <openembedded-core@lists.openembedded.org>, Otavio,
	Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
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
X-List-Received-Date: Tue, 05 Feb 2013 22:27:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-05 at 11:18 -0800, Darren Hart wrote:
> 
> On 02/05/2013 11:08 AM, Enrico Scholz wrote:
> > Otavio Salvador <otavio@ossystems.com.br> writes:
> > 
> >> Please give it a try in dash as well.
> > 
> > fwiw, what's the point in writing such scripts plain sh?  I guess. every
> > machine where this script is running has /bin/bash and performance is
> > not critical for it. Using '#! /bin/bash' shebang fixes the problem
> > where sh is non bash.
> > 
> > Some constructs in the scripts can be expressed mor efficiently in bash
> > (e.g. the '... | sed' statements, or using arrays for the arguments).
> 
> Indeed, in fact I had to remove the bash parameter expansions
> (substrings, etc) I had in my original script in order to make it
> dash-able. I hate dash and personally find it to be completely
> pointless, but for better or worse, people like it and there is an
> expectation that scripts run in both dash and bash in OE-core.
> 
> If RP tells me a #!/bin/bash is acceptable, I'll restore the bashisms in
> a heartbeat.

General shell code in metadata should run under /bin/sh. Its fine for an
external scripts to use bashisms as long as it says so at the top of the
file :)

Cheers,

Richard





