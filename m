Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hchapman-oecore@3gfp.com>) id 1U0ywd-00085K-6c
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 19:33:07 +0100
X-Authority-Analysis: v=2.0 cv=QcjkT7nv c=1 sm=0 a=0BEmelG+NCIkmYz4MtfDKA==:17
	a=KAMKcUAUZugA:10 a=zxqQms7TkB8A:10 a=h1JwTc6auzgA:10
	a=wPDyFdB5xvgA:10 a=kj9zAlcOel0A:10 a=cL4bF6sHAAAA:8
	a=S5D55JnJK1YA:10 a=fchUi4ohel-nktsmC28A:9 a=CjuIK1q_8ugA:10
	a=0BEmelG+NCIkmYz4MtfDKA==:117
X-Cloudmark-Score: 0
X-Authenticated-User: 
X-Originating-IP: 65.34.9.19
Received: from [65.34.9.19] ([65.34.9.19:43730] helo=blue.3gfp.com)
	by hrndva-oedge03.mail.rr.com (envelope-from
	<hchapman-oecore@3gfp.com>) (ecelerity 2.2.3.46 r()) with ESMTP
	id 88/A0-06396-335BA015; Thu, 31 Jan 2013 18:17:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by blue.3gfp.com (Postfix) with ESMTP id 7B6701080591;
	Thu, 31 Jan 2013 13:17:23 -0500 (EST)
X-Virus-Scanned: by amavisd-new-2.6.4 (20090625) (Debian) at 3gfp.com
Received: from blue.3gfp.com ([127.0.0.1])
	by localhost (blue.3gfp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1wqtIVTWoyT; Thu, 31 Jan 2013 13:17:17 -0500 (EST)
Received: from [192.168.0.115] (rrcs-71-43-163-130.se.biz.rr.com
	[71.43.163.130])
	by blue.3gfp.com (Postfix) with ESMTPSA id F38F41080068;
	Thu, 31 Jan 2013 13:17:16 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <alpine.DEB.2.02.1301310935390.9110@oneiric>
Date: Thu, 31 Jan 2013 13:17:16 -0500
Message-Id: <04B45244-D82F-4BC3-AB01-1747586DDEE2@3gfp.com>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310834500.31170@oneiric>
	<20130131135020.GD2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310935390.9110@oneiric>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.1499)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 18:33:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 31, 2013, at 9:45 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> =
wrote:

> and i'm trying to build a core-image-minimal.  with regular
> (git-allowed) net access, the build works fine.  but i haven't yet
> found any combination of BB_SRCREV_POLICY or BB_FETCH_PREMIRRORONLY or
> anything else that let's me "fetchall", then disconnect from the net
> to do the build.

This really seems like a bug in bitbake/lib/bb/fetch2/git.py to me. It =
should honor BB_NO_NETWORK by trying to see if it has the tag locally =
before it runs the ls-remote to see if the tag has changed. I was going =
to suggest this earlier in the thread, but due to my relatively new =
experience with layered OE and the newer bitbake, I refrained. However, =
I was just inside that code updating the mercurial.py fetcher to =
actually work for file:// urls. At some point in the next few weeks, =
I'll update it further to try and be on par with git.py and to at least =
match the functionality since mercurial.py does things differently. It =
makes it difficult to understand them both if you only know how to use =
one.=


