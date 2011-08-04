Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qozby-0004Nr-UG
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:13:27 +0200
Received: by yxi19 with SMTP id 19so1148905yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=GE1K52ZkBFtNzjHoWVzMu21ab1WVUYOD22zLXMIQNos=;
	b=PVrUkRtY92u82DHGxCFzxYVq5uAT4K7g++Rs5HL2SwZTyjH7sqXOo0LLw1hvikmL0+
	jrDLOR3/rDE+RBMl1lMJ63kPl7DRypfzXuz8qNkA0YP2dBBc0vagXO18eDlhXF6J/TIr
	hreLUjy1fvlGpOwlhTPz+ijPQH1/9opYsPKjU=
Received: by 10.142.186.18 with SMTP id j18mr822957wff.406.1312470542415;
	Thu, 04 Aug 2011 08:09:02 -0700 (PDT)
Received: from perseus.localnet (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id i2sm470369wfd.20.2011.08.04.08.09.01
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 08:09:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2011 08:08:58 -0700
Message-ID: <3084551.78r5ORDKhl@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1312465942.2344.743.camel@rex>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<d395c1bac934913af1ed7c8fc3a09601c823339b.1311807353.git.tom_rini@mentor.com>
	<1312465942.2344.743.camel@rex>
MIME-Version: 1.0
Subject: Re: [PATCH 3/9] Various site files: Drop monotone
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
X-List-Received-Date: Thu, 04 Aug 2011 15:13:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 04, 2011 02:52:22 PM Richard Purdie wrote:
> On Wed, 2011-07-27 at 15:56 -0700, Tom Rini wrote:
> > Not in oe-core nor meta-oe and based on oe.dev, possibly incomplete.
> > 
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
> > ---
> > 
> >  meta/site/arm-common        |    3 ---
> >  meta/site/arm-linux         |    3 ---
> >  meta/site/common-glibc      |    3 ---
> >  meta/site/ix86-common       |    3 ---
> >  meta/site/mips-linux        |    5 -----
> >  meta/site/mips-linux-uclibc |    5 -----
> >  meta/site/mipsel-linux      |    5 -----
> >  meta/site/powerpc32-linux   |    4 ----
> >  meta/site/sh-common         |    3 ---
> >  9 files changed, 0 insertions(+), 34 deletions(-)
> > 
> > diff --git a/meta/site/arm-common b/meta/site/arm-common
> > index 2129298..7317a13 100644
> > --- a/meta/site/arm-common
> > +++ b/meta/site/arm-common
> > @@ -116,9 +116,6 @@ with_broken_putenv=${with_broken_putenv=no}
> > 
> >  # links
> >  ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_s
> >  truct=yes}> 
> > -# mono
> > -cv_mono_sizeof_sunpath=108
> > -
> > 
> >  # mysql
> >  mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
> >  mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
> 
> Isn't mono different from monotone?

yes its for mono. I think we should keep it since there are many users of mono
from oe.dev world who would want mono in future may be from  future meta-mono  

> 
> We don't have mono in OE.core either so the patch is probably fine but I
> just wanted to mention it...
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Khem Raj


