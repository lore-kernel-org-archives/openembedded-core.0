Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R90y5-0005gT-Sb for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:43:02 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SKhvKn023284 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:43:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WNKkDKw3SycK
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:43:56 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SKhpFO023281
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 21:43:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 21:37:26 +0100
In-Reply-To: <cover.1317223487.git.paul.eggleton@linux.intel.com>
References: <cover.1317223487.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317242253.12332.69.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Fix TMPDIR usage in scripts v3
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
X-List-Received-Date: Wed, 28 Sep 2011 20:43:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 16:28 +0100, Paul Eggleton wrote:
> Fix TMPDIR external environment variable usage within our scripts which
> is a problem on OpenSUSE within an X session (see Yocto bug #1530) by
> using OE_TMPDIR from the external environment instead.
> 
> Note that this will require changes to autobuilder scripts that use a
> TMPDIR environment variable when calling these scripts - they should now
> set OE_TMPDIR instead (if versions with and without this change need to
> be run on the same system, then setting both variables will cause no
> harm).
> 
> Since v1, fix pass-through references to TMPDIR in the
> qemuimage-testlib script.
> 
> Since v2, fix setting of OE_TMPDIR in classes/imagetest-qemu.bbclass.
> 
> The following changes since commit e0908b7b080c0d861a1b3ccb2185b9281b10fa1a:
> 
>   tables: remove it as obsolete recipe (2011-09-28 11:47:24 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/scripts-tmpdir
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/scripts-tmpdir
> 
> Paul Eggleton (2):
>   scripts: use OE_TMPDIR instead of TMPDIR external variable
>   scripts/oe-setup-rpmrepo: use setup_tmpdir from runqemu

Merged to master, thanks.

Richard



