Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F96B7147D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:26:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 02:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="446304268"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2015 02:13:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 10:26:49 +0000
Message-ID: <5560833.PRknWzKiac@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1422440024-9110-1-git-send-email-fabien.proriol@jdsu.com>
References: <1422440024-9110-1-git-send-email-fabien.proriol@jdsu.com>
MIME-Version: 1.0
Subject: Re: [PATCH] qt4-x11-free: Fix Qt4 to build without opengl
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
X-List-Received-Date: Wed, 28 Jan 2015 10:26:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 January 2015 11:13:44 Fabien Proriol wrote:
> If we don't have opengl support on target, qt4 still depends to libgl, but
> Qt4 don't need it...
> 
> Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
> ---
>  meta/recipes-qt/qt4/qt4-x11-free.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> b/meta/recipes-qt/qt4/qt4-x11-free.inc index 3b1e0fe..ae3e1ca 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -4,7 +4,8 @@ SUMMARY = "Cross-platform UI toolkit and application
> framework (X11 version)" DESCRIPTION = "Qt is a versatile cross-platform
> application framework -- this is the X11 version." HOMEPAGE =
> "http://qt-project.org/"
>  SECTION = "x11/libs"
> -DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext
> libxrender libxrandr libxcursor" 
> +DEPENDS += "virtual/libx11 fontconfig
> libxft libxext libxrender libxrandr libxcursor" 
> +DEPENDS += "${@bb.utils.contains('QT_CONFIG_FLAGS', '-opengl',
> 'virtual/libgl', '', d)} " 
> PROVIDES += "qt4-x11"
>  QT4DEPENDS = ""

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

