Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 98A016E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 11:47:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 04 Aug 2015 04:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,608,1432623600"; d="scan'208";a="741859089"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.4.166])
	([10.252.4.166])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2015 04:47:34 -0700
Message-ID: <1438688853.15875.2.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Pau Espin Pedrol <pau.espin@aweurope.be>
Date: Tue, 04 Aug 2015 14:47:33 +0300
In-Reply-To: <1438255993-9124-1-git-send-email-pau.espin@aweurope.be>
References: <1438255993-9124-1-git-send-email-pau.espin@aweurope.be>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/3] bitbake.conf: Add nonarch_libdir and base systemd vars on it
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
X-List-Received-Date: Tue, 04 Aug 2015 11:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These patches look good to me, except that the commit messages don't
explain why the changes are made. In any case, I don't have the ability
to push the patches to master - either Ross or Richard has to do that.

-- Tanu


On Thu, 2015-07-30 at 13:33 +0200, Pau Espin Pedrol wrote:
> Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
> ---
>  meta/conf/bitbake.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 730ab80..21f1698 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -32,7 +32,10 @@ export datadir = "${prefix}/share"
>  export infodir = "${datadir}/info"
>  export mandir = "${datadir}/man"
>  export docdir = "${datadir}/doc"
> -export systemd_unitdir = "/lib/systemd"
> +export systemd_unitdir = "${nonarch_base_libdir}/systemd"
> +export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
> +export nonarch_libdir = "${exec_prefix}/lib"
> +export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
>  
>  # Architecture dependent paths
>  export bindir = "${exec_prefix}/bin"
> -- 
> 1.9.1
> 



