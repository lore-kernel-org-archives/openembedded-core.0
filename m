Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlLtv-0002K2-HN
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:12:55 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlLpt-0000rV-LI
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:08:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 15:08:44 +0100
In-Reply-To: <ec019a276e8c9b59f26bd492d9a37e3b8241aee3.1311601422.git.richard.purdie@linuxfoundation.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<ec019a276e8c9b59f26bd492d9a37e3b8241aee3.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311602925.30326.226.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] Fix recipe multilib header conflicts
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
X-List-Received-Date: Mon, 25 Jul 2011 14:12:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> Fix the issue where the generated header differs based on the bitsize of the
> target at the time of building.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc        |    4 +++-
>  .../linux-libc-headers-yocto_git.bb                |    5 ++++-
>  .../linux-libc-headers_2.6.37.2.bb                 |    5 ++++-
>  .../linux-libc-headers_2.6.39.bb                   |    5 +++++
>  meta/recipes-support/apr/apr_1.4.2.bb              |    8 ++++++--
>  meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    8 ++++++--
>  6 files changed, 28 insertions(+), 7 deletions(-)

The changes in linux-libc-header and linux-libc-headers-yocto don't seem
to be related to the description above. 

Also, the binutils.inc change seems to be missing a PR bump.

The changes in apr and beecrypt look like they are probably fine, though
it would be nice for the subject line to mention the names of the
recipes being changed.

p.




