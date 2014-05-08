Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4C60665F45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 14:50:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2014 07:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="508427901"
Received: from unknown (HELO [10.255.12.155]) ([10.255.12.155])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2014 07:50:58 -0700
Message-ID: <1399560644.5749.0.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Thu, 08 May 2014 09:50:44 -0500
In-Reply-To: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
References: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] wic: using indirect string to connect images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 May 2014 14:51:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sorry for the delay on this.

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>


On Fri, 2014-04-04 at 23:14 -0300, João Henrique Ferreira de Freitas
wrote:
> Now is possible to pass a image OE name or a rootfs directory.
> 
> The command-line param and .wks remains the some.
> 
>     wic create ... --rootfs-dir rootfs1=core-image-minimal \
>         --rootfs-dir rootfs2=core-image-minimal-dev
>     
>     .wks:
>     
>       part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 \
>         --label primary --align 1024
>     
>       part /standby --source rootfs --rootfs-dir="rootfs2" \
>         --ondisk sda --fstype=ext3 --label secondary --align 1024
> 
> João Henrique Ferreira de Freitas (3):
>   wic: Move find_bitbake_env_line() to oe.misc
>   wic: add find_artifact() to get a specific bitbake variable
>   wic: Extend indirect string connection to support image names and
>     rootfs
> 
>  scripts/lib/image/engine.py              | 17 -----------------
>  scripts/lib/mic/plugins/source/rootfs.py | 27 ++++++++++++++++++++++++---
>  scripts/lib/mic/utils/oe/misc.py         | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 20 deletions(-)
> 



