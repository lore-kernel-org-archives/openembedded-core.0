Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RsuEp-0005ez-Fc
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 11:49:59 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rsu7B-0005JC-KT
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 11:42:05 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 10:42:04 +0000
In-Reply-To: <CAP9ODKrUM0B46Sm2-oNHJwa0hET+TRkV4UmP8ym4EEYeRAOiJA@mail.gmail.com>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<cc36eb9f3e699b9c4478e4de0939e50eb317446f.1328127940.git.otavio@ossystems.com.br>
	<1328129972.2716.158.camel@x121e.pbcl.net>
	<CAP9ODKrUM0B46Sm2-oNHJwa0hET+TRkV4UmP8ym4EEYeRAOiJA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328179325.29933.183.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix detection of script runtime requirement
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
X-List-Received-Date: Thu, 02 Feb 2012 10:49:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 19:03 -0200, Otavio Salvador wrote:
> On Wed, Feb 1, 2012 at 18:59, Phil Blundell <philb@gnu.org> wrote:
>         On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
>         > The code has been broken by
>         2feba313c991170747381c7cf821a45c2cd04632
>         > that changed the way this detection has being done.
>         
>         
>         What was the failure?  It isn't immediately obvious to me that
>         this
>         patch will make any functional difference (except for adding
>         the -q
>         argument to grep which was indeed missing).
> 
> 
> Nothing where setting runtime_script_required as 0 in case it worked.
> So it would never in fact remove the info files, even if read-only-fs
> where being in use and functional.

What else was using runtime_script_required?  I thought the last
references to that were removed by the patch in:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/016773.html

Did that one not get merged?

p.




