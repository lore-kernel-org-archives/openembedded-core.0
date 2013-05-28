Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 65F626A529
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 10:03:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2013 03:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,757,1363158000"; d="scan'208";a="320651343"
Received: from unknown (HELO helios.localnet) ([10.255.12.250])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2013 03:02:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2013 11:02:33 +0100
Message-ID: <1876342.IDW41su17Y@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-22-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369729792-19019-1-git-send-email-net147@gmail.com>
References: <1369729792-19019-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qt4: fix path to demos documentation
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
X-List-Received-Date: Tue, 28 May 2013 10:03:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 May 2013 18:29:52 Jonathan Liu wrote:
> The qt4-demos-doc package is not created when building qt4-x11-free
> because ${docdir}/qtopia/qch/qt.qch doesn't exist.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-qt/qt4/qt4.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 84c0ae9..828e30a 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -130,7 +130,7 @@ ALLOW_EMPTY_${PN} = "1"
>  FILES_${PN}     = ""
>  FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
>  FILES_${PN}-dbg = "/usr/src/debug/"
> -FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/qtopia/qch/qt.qch"
> +FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
>  RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
>  RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
>  RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

