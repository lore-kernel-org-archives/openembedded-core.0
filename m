Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8sYL-0003QB-Iy for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:43:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SBimb9001830 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:44:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GnbFtzXkWzgi
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:44:48 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SBihjR001825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:44:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 12:38:19 +0100
In-Reply-To: <201109281225.41524.paul.eggleton@linux.intel.com>
References: <cover.1317201529.git.paul.eggleton@linux.intel.com>
	<1317208204.26109.240.camel@ted>
	<201109281225.41524.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317209906.26109.245.camel@ted>
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
X-List-Received-Date: Wed, 28 Sep 2011 11:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 12:25 +0100, Paul Eggleton wrote:
> On Wednesday 28 September 2011 12:09:57 Richard Purdie wrote:
> > At the very least we need to fix the references in
> > scripts/qemuimage-testlib so the automated image testing doesn't break.
> 
> OK, v2 on its way. The scripts that call qemuimage-testlib will still need to 
> be updated to set OE_TMPDIR though.

The "script" is "meta/classes/imagetest-qemu.bbclass" and you could even
test this by setting IMAGETEST = "qemu" in local.conf and then "bitbake
core-image-minimal" ;-).

Also, why can't scripts/qemuimage-testlib just do OE_TMPDIR=${TMPDIR} ?

Cheers,

Richard



