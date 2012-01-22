Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rp4KM-0007VS-Ph
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 21:47:50 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rp4Cv-0004nB-MX
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 21:40:09 +0100
Message-ID: <1327264803.2859.7.camel@pb-ThinkPad-R50e>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jan 2012 20:40:03 +0000
In-Reply-To: <a6a863bec95ca8b6835a5515062fe8a48b6c3e06.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
	<a6a863bec95ca8b6835a5515062fe8a48b6c3e06.1327123057.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
Subject: Re: [PATCH 20/20] gcc: refactor packages for staticdev
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
X-List-Received-Date: Sun, 22 Jan 2012 20:47:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 21:18 -0800, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.6.inc             |    2 +-
>  meta/recipes-devtools/gcc/gcc-package-runtime.inc |    9 +++++++--
>  meta/recipes-devtools/gcc/libgcc_4.6.bb           |    4 +++-
>  3 files changed, 11 insertions(+), 4 deletions(-)

This patch has no long commit message at all, and it seems to do
something with "libgcov-dev" which I wouldn't have guessed from the
terse summary in the subject line.  Can you add some more commentary
about what is going on with that?

Please see the guidance on the wiki:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages

which is quite explicit that "[i]t is not acceptable to have an empty or
non-existent header, or just a single line message. The summary and
description is required for all changes."

thanks

p.




