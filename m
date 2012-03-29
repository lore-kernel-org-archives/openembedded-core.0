Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDNZz-000207-Q4 for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 00:12:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TM3PxE006044
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 23:03:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05632-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 23:03:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TM3EJI006038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 23:03:18 +0100
Message-ID: <1333058593.18082.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 23:03:13 +0100
In-Reply-To: <20120329225332.0e8cc2f4@eb-e6520>
References: <20120329225332.0e8cc2f4@eb-e6520>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2TM3PxE006044
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Thu, 29 Mar 2012 22:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-29 at 22:53 +0200, Eric B=C3=A9nard wrote:
> I noticed in from scratch builds for qemuarm that the longest time is
> taken in fetching sources, especially those fetched using git
> (linux-yocto for example) & svn (gcc, eglibc & co).

Are you timing these as fetches from the source control systems or from
the mirror tarballs of the repositories. The tarballs should be
faster...

> To reduce the fetch time would that make sense to=20
> - fetch gcc/glibc & co from the archive of a stable version and then
>   apply patches on top of it (maybe patches stored in an archive
>   fetched from oe's website and applied in bulk or patches stored in OE=
)

Unfortunately the patches tend to get unwieldy. The tarballs of the svn
repos on the mirror should be about equal in size to the upstream
archive in this case.=20

> - do the same thing for the linux-yocto kernel or add a --reference
>   option to the git fetcher so that we can provide a local tree as a
>   reference ?

This is effectively how the repositories in DL_DIR are used. If you
place a tree in the right place there, it should reuse references...

> Do you have other ideas (appart from using a local mirror) to optimize
> the fetch time ?

I'd be interested firstly to understand if you're using the SCM directly
or using the mirror tarballs as that should make a big difference. In
the standard configuration it should be using mirror tarballs...

Cheers,

Richard



