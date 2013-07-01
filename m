Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A50B6AD31
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 10:02:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2013 03:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="338345111"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by orsmga001.jf.intel.com with ESMTP; 01 Jul 2013 03:02:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
Date: Mon, 01 Jul 2013 11:02:28 +0100
Message-ID: <19067624.GhNbuypGS2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>
References: <1371660580-4754-1-git-send-email-muhammad_shakeel@mentor.com>
	<A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [dylan] lighttpd: Enabling with systemd
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
X-List-Received-Date: Mon, 01 Jul 2013 10:02:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 June 2013 13:01:15 Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> 
> - Remove dependency on systemd layer
> - Use lighttpd service type 'simple' rather than 'oneshot'
> 
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>  meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb index df6ce97..d73a76a
> 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> @@ -5,7 +5,6 @@ BUGTRACKER =
> "http://redmine.lighttpd.net/projects/lighttpd/issues" LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
> 
> -
>  SECTION = "net"
>  DEPENDS = "zlib libpcre"
>  RDEPENDS_${PN} += " \
> @@ -18,10 +17,15 @@ RDEPENDS_${PN} += " \
> 
>  PR = "r0"
> 
> +inherit systemd
> +
> +SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> +
>  SRC_URI =
> "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz
> 2 \ file://index.html.lighttpd \
>          file://lighttpd.conf \
>          file://lighttpd \
> +        file://lighttpd.service \

You've added a reference to lighttpd.service, but the patch does not add it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

