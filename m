Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8s6s-0002qe-Jd for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:15:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SBGP65000999 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:16:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ssW+8d0L+lz3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:16:25 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SBGMYJ000986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:16:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 12:09:57 +0100
In-Reply-To: <cover.1317201529.git.paul.eggleton@linux.intel.com>
References: <cover.1317201529.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317208204.26109.240.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Fix TMPDIR usage in scripts
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
X-List-Received-Date: Wed, 28 Sep 2011 11:15:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 10:26 +0100, Paul Eggleton wrote:
> Fix TMPDIR external environment variable usage within our scripts which
> is a problem on OpenSUSE within an X session (see Yocto bug #1530) by
> using OE_TMPDIR from the external environment instead.
> 
> Note that this will require changes to autobuilder scripts that use a
> TMPDIR environment variable when calling these scripts - they should now
> set OE_TMPDIR instead (if versions with and without this change need to
> be run on the same system, then setting both variables will cause no
> harm).

At the very least we need to fix the references in
scripts/qemuimage-testlib so the automated image testing doesn't break.

Cheers,

Richard



