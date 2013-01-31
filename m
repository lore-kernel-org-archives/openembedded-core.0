Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hchapman-oecore@3gfp.com>) id 1U10C9-0004gQ-H9
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 20:53:29 +0100
X-Authority-Analysis: v=2.0 cv=W/m6pGqk c=1 sm=0 a=0BEmelG+NCIkmYz4MtfDKA==:17
	a=KAMKcUAUZugA:10 a=zxqQms7TkB8A:10 a=h1JwTc6auzgA:10
	a=wPDyFdB5xvgA:10 a=kj9zAlcOel0A:10 a=cL4bF6sHAAAA:8
	a=S5D55JnJK1YA:10 a=B0fEy1mhyyIiXt5QhW8A:9 a=CjuIK1q_8ugA:10
	a=HU3bICl8N38A:10 a=0BEmelG+NCIkmYz4MtfDKA==:117
X-Cloudmark-Score: 0
X-Authenticated-User: 
X-Originating-IP: 65.34.9.19
Received: from [65.34.9.19] ([65.34.9.19:39898] helo=blue.3gfp.com)
	by hrndva-oedge02.mail.rr.com (envelope-from
	<hchapman-oecore@3gfp.com>) (ecelerity 2.2.3.46 r()) with ESMTP
	id 6C/CC-08009-AF7CA015; Thu, 31 Jan 2013 19:37:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by blue.3gfp.com (Postfix) with ESMTP id C33931080591;
	Thu, 31 Jan 2013 14:37:29 -0500 (EST)
X-Virus-Scanned: by amavisd-new-2.6.4 (20090625) (Debian) at 3gfp.com
Received: from blue.3gfp.com ([127.0.0.1])
	by localhost (blue.3gfp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHklkia-fbrn; Thu, 31 Jan 2013 14:37:23 -0500 (EST)
Received: from [192.168.0.115] (rrcs-71-43-163-130.se.biz.rr.com
	[71.43.163.130])
	by blue.3gfp.com (Postfix) with ESMTPSA id B09F01080068;
	Thu, 31 Jan 2013 14:37:23 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <E6324045-B9B1-491C-8B53-8E947F540701@3gfp.com>
Date: Thu, 31 Jan 2013 14:37:23 -0500
Message-Id: <FD05009A-3348-42F7-A820-3D1542D86DFD@3gfp.com>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310834500.31170@oneiric>
	<20130131135020.GD2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310935390.9110@oneiric>
	<04B45244-D82F-4BC3-AB01-1747586DDEE2@3gfp.com>
	<E6324045-B9B1-491C-8B53-8E947F540701@3gfp.com>
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
X-List-Received-Date: Thu, 31 Jan 2013 19:53:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 31, 2013, at 2:30 PM, Harvey Chapman <hchapman-oecore@3gfp.com> =
wrote:

> On Jan 31, 2013, at 1:17 PM, Harvey Chapman <hchapman-oecore@3gfp.com> =
wrote:
>=20
>> On Jan 31, 2013, at 9:45 AM, "Robert P. J. Day" =
<rpjday@crashcourse.ca> wrote:
>>=20
>>> and i'm trying to build a core-image-minimal.  with regular
>>> (git-allowed) net access, the build works fine.  but i haven't yet
>>> found any combination of BB_SRCREV_POLICY or BB_FETCH_PREMIRRORONLY =
or
>>> anything else that let's me "fetchall", then disconnect from the net
>>> to do the build.
>>=20
>> This really seems like a bug in bitbake/lib/bb/fetch2/git.py to me. =
It should honor BB_NO_NETWORK by trying to see if it has the tag locally =
before it runs the ls-remote to see if the tag has changed. I was going =
to suggest this earlier in the thread, but due to my relatively new =
experience with layered OE and the newer bitbake, I refrained. However, =
I was just inside that code updating the mercurial.py fetcher to =
actually work for file:// urls. At some point in the next few weeks, =
I'll update it further to try and be on par with git.py and to at least =
match the functionality since mercurial.py does things differently. It =
makes it difficult to understand them both if you only know how to use =
one.
>=20
> I made some minor tweaks to git.py so _latest_revision() now respects =
BB_NO_NETWORK. However, I noticed that fetch2.latest_revision() =
contains:
>=20
>        revs =3D bb.persist_data.persist('BB_URI_HEADREVS', d)
>        key =3D self.generate_revision_key(url, ud, d, name)
>        try:
>            return revs[key]
>        except KeyError:
>            revs[key] =3D rev =3D self._latest_revision(url, ud, d, =
name)
>            return rev
>=20
> What does BB_URI_HEADREVS do and could it be part of the solution to =
this problem?

Nevermind, found BB_URI_HEADREVS is used for BB_SRCREV_POLICY=3Dcache.=


