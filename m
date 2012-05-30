Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SZgsn-0002PN-Mn
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 13:16:05 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 28F9AF81242; Wed, 30 May 2012 05:05:48 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id C791EF8123F;
	Wed, 30 May 2012 05:05:38 -0600 (MDT)
Message-ID: <4FC5FF02.5070608@mlbassoc.com>
Date: Wed, 30 May 2012 05:05:38 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1338368508.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1338368508.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/1] Fix browser crash on PPC
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
X-List-Received-Date: Wed, 30 May 2012 11:16:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-30 03:08, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
>      This patch use glib as unicode backend to avoid browser crash
>
> webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
> target system owns different endian. ICU's community is not responsive to make
> a patch for this, so glib is used as work around here.
>
> [YOCTO #1570] got fixed
>
>
> The following changes since commit f28209d9d3c67203a2c7a2b25cacfe31643d1bfa:
>
>    cooker.py: terminate the Parser processes (2012-05-25 11:39:33 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/fix3
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3
>
> Zhai Edwin (1):
>    webkit-gtk: Use glib as unicode backend to avoid browser crash
>
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
>   1 files changed, 9 insertions(+), 1 deletions(-)

Note: any big-endian target will probably suffer the same as PowerPC,
so should this not also be extended to those, e.g. big-endian MIPS, etc?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


