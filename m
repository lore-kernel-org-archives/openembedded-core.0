Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2Vbt-0004P8-PZ for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 00:38:11 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14NRE31014108; Mon, 4 Feb 2013 23:27:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Klh1heBSzz6E; Mon,  4 Feb 2013 23:27:14 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14NR8vH014105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 23:27:11 GMT
Message-ID: <1360020111.14071.172.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Mon, 04 Feb 2013 23:21:51 +0000
In-Reply-To: <20130204122309.12582d0b@e6410-2>
References: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
	<20130204122309.12582d0b@e6410-2>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix sqlite path and package missing files
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
X-List-Received-Date: Mon, 04 Feb 2013 23:38:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-04 at 12:23 -0600, Peter Seebach wrote:
> On Mon, 4 Feb 2013 13:33:26 +0200
> Constantin Musca <constantinx.musca@intel.com> wrote:
> 
> > - replace --enable-sqlite-static with --with-sqlite-static=.. in order
> > to pass ${baselib} to configure (/lib doesn't work for the multilib
> > lib32 build)
> 
> This looks eerily similar to, yet subtly different from, the changes I
> made for pseudo-1.4.2/1.4.3. I'd spelled that as
> "--with-static-sqlite=" for specifying an exact path to libsqlite.a,
> but I eventually changed it to --with-sqlite-lib to allow an override
> because bitbake's design seems to want libsqlite3.a to always be in
> (host sysroot)/usr/lib, regardless of whether that's 64-bit or 32-bit.
> 
> > - use ${exec_prefix}/lib instead of ${libdir} because pseudo always
> > uses /usr/lib
> 
> This seems right, but I hadn't done it in the recent submission of
> 1.4.3, and things were working anyway. So now I want to know why...
> 
> Anyway, I think these changes are probably redundant with the changes I
> submitted over the weekend.

I suspect not since we don't always use "lib", we might use something
different in various multilib configurations for example. Using
${baselib} in the target configurations will therefore give us less
problems.

Cheers,

Richard





