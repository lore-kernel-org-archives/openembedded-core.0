Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RsiiY-0001Kb-VH
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:31:55 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rsiav-0004ht-Pv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:24:01 +0100
Message-ID: <1328135030.2716.163.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Feb 2012 22:23:50 +0000
In-Reply-To: <e50f34e22b4a6fd1b7352affb529082c86f946c1.1328133261.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<e50f34e22b4a6fd1b7352affb529082c86f946c1.1328133261.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/8] bdwgc: change the PV
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
X-List-Received-Date: Wed, 01 Feb 2012 22:31:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 13:55 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../{bdwgc_20110107.bb => bdwgc_7_2alpha5.bb}      |    0

Why is this a good thing?  Does the "_" in the string actually do what
you wanted?

The commit message for this patch is, to put it mildly, poor.  Please
see:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#New_Development

and, in particular the last two sentences of that section:

"It is not acceptable to have an empty or non-existent header, or just a
single line message. The summary and description is required for all
changes."

p.




