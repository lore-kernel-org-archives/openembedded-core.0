Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBAC72267
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 23:37:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2015 15:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,400,1418112000"; d="scan'208";a="662005054"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.5.233])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2015 15:37:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Jan 2015 23:37:15 +0000
Message-ID: <2329621.N3Gx8aQTec@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <D4B5A5D3-8D56-4ACA-AEE0-9FD7931D9780@gmail.com>
References: <1421235149-13079-1-git-send-email-koen.kooi@linaro.org>
	<D4B5A5D3-8D56-4ACA-AEE0-9FD7931D9780@gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgpg-error 1.17: simplify tupple handling and add armv8b support
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
X-List-Received-Date: Wed, 14 Jan 2015 23:37:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 January 2015 09:24:46 Khem Raj wrote:
> > On Jan 14, 2015, at 3:32 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> > 
> > Add a default option to the case statement and remove the duplicates. Also
> > add support for armv8b architectures.
> > 
> > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > ---
> > meta/recipes-support/libgpg-error/libgpg-error_1.17.bb | 8 ++------
> > 1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
> > b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb index
> > c905bd1..843b9ae 100644
> > --- a/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
> > +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
> > @@ -28,18 +28,14 @@ do_compile_prepend() {
> > 
> > 	fi
> > 	
> > 	case ${TARGET_ARCH} in
> > 
> > -	  aarch64)    TUPLE=aarch64-unknown-linux-gnu ;;
> > +	  aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
> > 
> > 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
> 
> this can move to default case too.
> 
> > 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
> > 	  i586)       TUPLE=i486-pc-linux-gnu ;;
> > 
> > -	  mipsel)     TUPLE=mipsel-unknown-linux-gnu ;;
> > 
> > 	  mips64el)   TUPLE=mipsel-unknown-linux-gnu ;;
> > 	  mips64)     TUPLE=mips-unknown-linux-gnu ;;
> > 
> > -	  mips)       TUPLE=mips-unknown-linux-gnu ;;
> > -	  powerpc64)  TUPLE=powerpc64-unknown-linux-gnu ;;
> > -	  powerpc)    TUPLE=powerpc-unknown-linux-gnu ;;
> > -	  sh4)	      TUPLE=sh4-unknown-linux-gnu ;;
> > 
> > 	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
> 
> this as well.

Only assuming s/pc/unknown/ is OK - is it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

