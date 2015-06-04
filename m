Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3767A6AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:35:56 +0000 (UTC)
Received: by wiga1 with SMTP id a1so39788144wig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=22a4FlY0CcuQh4E9qhFPCBm7/B8mLFfgx4P4FoW/kto=;
	b=AXcKz2SiHR1nOPnpS9McDNehUN8KBGycc04vBvWmk6N1/RozYagNbo6MP9ejiJCF1R
	X4npbFnGu1z+cTAPW3oOvF1CkTEXAv77BctbtMzDyHeYIzKlNfT4cWEeNZzHWCRY35zw
	NdmiMTIjvY7aUbwkCiCFohAKmJeSYbDA0sYpoJh9x65ER8/EdhFJsDTDJPByr5WNM6kT
	4JQ7MPJdwzGenZfotFM77xG9NaXo7PjbM5U38tUkWtjfDtpVnBr6WlDfFlH9n+YecN22
	XEAv9M1k7WyD8fdJ8/C82lE53W/P6X00ycotBDOQUzO0+L+SC8ZTW4mYmDZIc8Es/r1S
	v5wA==
X-Received: by 10.194.3.11 with SMTP id 11mr32246542wjy.121.1433406957532;
	Thu, 04 Jun 2015 01:35:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id 12sm4654981wjw.17.2015.06.04.01.35.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 01:35:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 10:36:17 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150604083617.GA2376@jama>
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
	<5547FB9B.5080102@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5547FB9B.5080102@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Thu, 04 Jun 2015 08:35:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 04:07:07PM -0700, akuster808 wrote:
> merged to staging.
> - armin

Ping for merging staging to dizzy branch

> On 05/01/2015 10:47 AM, Martin Jansa wrote:
> > From: Andre McCurdy <armccurdy@gmail.com>
> >
> > As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
> > has been renamed to "--enable-llvm-shared-libs".
> >
> >    http://www.mesa3d.org/relnotes/10.2.html
> >
> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >   meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 1857f3c..658bd3a 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -62,7 +62,7 @@ PACKAGECONFIG[gallium]      =3D "--with-gallium-drive=
rs=3D${GALLIUMDRIVERS}, --witho
> >   PACKAGECONFIG[gallium-egl]  =3D "--enable-gallium-egl, --disable-gall=
ium-egl"
> >   PACKAGECONFIG[gallium-gbm]  =3D "--enable-gallium-gbm, --disable-gall=
ium-gbm"
> >   MESA_LLVM_RELEASE ?=3D "3.3"
> > -PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm --with-llvm-sha=
red-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
> > +PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm --enable-llvm-s=
hared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
> >                                  ${@'elfutils' if ${GALLIUMDRIVERS_LLVM=
33_ENABLED} else ''}"
> >   export WANT_LLVM_RELEASE =3D "${MESA_LLVM_RELEASE}"
> >
> >
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

