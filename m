Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHq59-0004S5-2Z
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 06:22:32 +0200
Received: by pzk36 with SMTP id 36so832547pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 21:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=J4kfiOekZ5OPk07aJ0ixC+MaZGEPhk0nKer1LDZBNJI=;
	b=fgKPiS4hNfyJLk/kNO+HDGRPBIRS6MJhimu7o3a582BmHbrlQs/KKJKFexIXKvO4mB
	CF+qn+9HMbPHwFoeVzRy+63W8ic9GxZ8gLGFbrZj+7qdUZDLO3kqYgHopPSC+0+7m4Rq
	siW2x9PcyJ3gtVjRHnpHeUPpMjovKXLt/RgIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=FmP+ODVKV6dlTmeGm+M0DJMdoGo2EkQoTCWIzWKoUtuQO+f5mYFS4hTZMD9g0s2vlI
	NPPxsIDmwM1dBA3aQ6HnEPlBZ0ov9OK/4SfZGqlZ3Xv+Jbouuc9kJOeP3DZmxJymbkCE
	hEoxz28ppIQVVguhIvJO1MCy9JzY5YR42uUB4=
Received: by 10.68.34.201 with SMTP id b9mr2536451pbj.422.1304569189545;
	Wed, 04 May 2011 21:19:49 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j2sm1164204pbo.79.2011.05.04.21.19.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2011 21:19:48 -0700 (PDT)
Date: Wed, 4 May 2011 21:19:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20110505041912.GA10374@sakrah.homelinux.org>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
	<1304424898.21461.107.camel@rex>
	<20110503180447.GB5436@sakrah.homelinux.org>
	<1304462379.21461.144.camel@rex>
	<BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Thu, 05 May 2011 04:22:32 -0000
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (04/05/11 18:07), Khem Raj wrote:
> On Tue, May 3, 2011 at 3:39 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2011-05-03 at 11:04 -0700, Khem Raj wrote:
> >> This has the same problem It empties out DEPENDS_GETTEXT after they have
> >> have already been added to DEPENDS via virtclass e.g. when you build
> >> gcc-runtime-nativesdk it will report a dep loop since now it depends on
> >> virtual/gettext-nativesdk (added by gettext class)
> >> and virtual/gettext-nativesdk depends on compilerlibs
> >> provided by gcc-runtime-nativesdk. This was same problem I was trying to
> >> circumvent
> >
> > Ok, how about this version:
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index 4f20bc2..3b83e42 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -89,9 +89,11 @@ def base_dep_prepend(d):
> >                        deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
> >        return deps
> >
> > -DEPENDS_prepend="${@base_dep_prepend(d)} "
> > -DEPENDS_virtclass-native_prepend="${@base_dep_prepend(d)} "
> > -DEPENDS_virtclass-nativesdk_prepend="${@base_dep_prepend(d)} "
> > +BASEDEPENDS = "${@base_dep_prepend(d)}"
> > +
> > +DEPENDS_prepend="${BASEDEPENDS} "
> > +DEPENDS_virtclass-native_prepend="${BASEDEPENDS} "
> > +DEPENDS_virtclass-nativesdk_prepend="${BASEDEPENDS} "
> >
> >  FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
> >  # THISDIR only works properly with imediate expansion as it has to run
> > diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> > index a40e74f..6f79e5e 100644
> > --- a/meta/classes/gettext.bbclass
> > +++ b/meta/classes/gettext.bbclass
> > @@ -1,17 +1,17 @@
> > -def gettext_after_parse(d):
> > -    # Remove the NLS bits if USE_NLS is no.
> > -    if bb.data.getVar('USE_NLS', d, 1) == 'no':
> > -        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
> > -        cfg += " --disable-nls"
> > -        depends = bb.data.getVar('DEPENDS', d, 1) or ""
> > -        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
> > -        bb.data.setVar('EXTRA_OECONF', cfg, d)
> > +def gettext_dependencies(d):
> > +    if d.getVar('USE_NLS', True) == 'no':
> > +        return ""
> > +    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
> > +        return ""
> > +    return d.getVar('DEPENDS_GETTEXT', False)
> >
> > -python () {
> > -    gettext_after_parse(d)
> > -}
> > +def gettext_oeconf(d):
> > +    # Remove the NLS bits if USE_NLS is no.
> > +    if d.getVar('USE_NLS', True) == 'no':
> > +        return '--disable-nls'
> > +    return "--enable-nls"
> >
> > -DEPENDS_GETTEXT = "gettext gettext-native"
> > +DEPENDS_GETTEXT = "virtual/gettext gettext-native"
> >
> > -DEPENDS =+ "${DEPENDS_GETTEXT}"
> > -EXTRA_OECONF += "--enable-nls"
> > +BASEDEPENDS =+ "${@gettext_dependencies(d)}"
> > +EXTRA_OECONF += "${@gettext_oeconf(d)}"
> >
> >
> 
> a build from scratch revealed few more issues with this patch too.
> 
> 1. We have to only remove gettext from dependencies if its a target
> package for all other it still it needed otherwise all native and
> cross tools start failing to build
>  e.g. binutils-cross this can be easily solved by a patch
> 
> iff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index 6f79e5e..cc39204 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,5 +1,5 @@
>  def gettext_dependencies(d):
> -    if d.getVar('USE_NLS', True) == 'no':
> +    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d,
> 'native', 'nativesdk', 'cross')
>          return ""
>      if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not
> oe.utils.inherits(d, 'cross-canadian')
>          return ""
> 
> 
> second problem is that EXTRA_OECONF when recipes override it instead
> of += or appending etc.
> then --enable|--disable-nls that we added via gettext_oeconf() is lost
> as a result some packages complain about config.rpath
> when USE_NLS is set to no the reason is their configure is missing the
> argument --disable-nls this works ok
> for eglibc based targets since default is to enable-nls if nothing is
> specified but uclibc fails. As a testcase try to preprocess
> utils-linux
> recipe and check the contents of EXTRA_OECONF

attached is a patch on top of this patch which fixes both the issues I
mentioned. I also thought of defining USE_NLS to yes in
native/cross/nativesdk classes but then I resorted to add the check in
gettext.bbclass

Please review and apply if appropriate

Thanks

-- 
-Khem

--fUYQa+Pmc3FrFX/N--
