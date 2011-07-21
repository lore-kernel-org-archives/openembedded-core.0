Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjwQw-00022D-1N
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 18:49:10 +0200
Received: by pvf24 with SMTP id 24so1267279pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=J6G1N47I+yyIhtfzuiltcL8nYvFPOAXNar5JxiZ2ZOc=;
	b=Nk3Mhh9D/U+i0EmEAJMbDGC/utYESHkVKV9+gWkyMB28Bfpcg1ZF+Ra9WPxBvwQpuf
	i98wIjcuPLh263bl04x+79CCx7KmqEtxHyieEuy0cMV9QOtEJPbtRsXcgvVrQIOB10sM
	bLTjig2DFe+OTabcOVGFOKXH/hVARdbJGJI48=
Received: by 10.68.33.200 with SMTP id t8mr567342pbi.144.1311266701505; Thu,
	21 Jul 2011 09:45:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 09:44:30 -0700 (PDT)
In-Reply-To: <1311241147.2344.74.camel@rex>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
	<4E277049.6020308@gmail.com>
	<4E2778DF.4040001@mentor.com> <20110721061111.GD3443@jama.jama.net>
	<1311241147.2344.74.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 09:44:30 -0700
Message-ID: <CAMKF1sp0iaFrCSj6u+G=UADeCY=MEKiM783VF-SWxdZNLSwFxQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 16:49:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 2:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-07-21 at 08:11 +0200, Martin Jansa wrote:
>> On Wed, Jul 20, 2011 at 05:54:55PM -0700, Tom Rini wrote:
>> > On 07/20/2011 05:18 PM, Khem Raj wrote:
>> > > On 07/20/2011 02:06 PM, Martin Jansa wrote:
>> > >> Fixes for recipes using intltool, distributions not having locales
>> > >> support in libc and distutils fix
>> > >>
>> > >> The following changes since commit
>> > >> 0d03800caffc2341b74190d38f7a372223c89f4c:
>> > >>
>> > >> =C2=A0 =C2=A0lsbsetup_1.0.bb: Change the hardcoded /usr/lib to supp=
ort multilib
>> > >> (2011-07-20 15:43:43 +0100)
>> > >>
>> > >> are available in the git repository at:
>> > >> =C2=A0 =C2=A0git://git.openembedded.org/openembedded-core-contrib j=
ansa/pull
>> > >>
>> > >> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Djansa/pull
>> > >>
>> > >>
>> > >> Martin Jansa (10):
>> > >> =C2=A0 =C2=A0tcmode-default: set preferred version also for (e)glib=
c-locale
>> > >> =C2=A0 =C2=A0eglibc-package: don't fail without localedef/gconv
>> > >> =C2=A0 =C2=A0intltool: inherit perlnative
>> > >> =C2=A0 =C2=A0polkit: inherit perlnative
>> > >> =C2=A0 =C2=A0shared-mime-info: inherit perlnative
>> > >> =C2=A0 =C2=A0xkeyboard-config: inherit perlnative
>> > >> =C2=A0 =C2=A0avahi: inherit perlnative
>> > >> =C2=A0 =C2=A0vte: inherit perlnative
>> > >
>> > > I guess all inherit perlnative patches can me squashed into one
>> >
>> > Or not done? :)
>>
>> I still see this issue, with
>> http://patches.openembedded.org/patch/8069/
>> applied.
>
> I'm wondering if a better approach to fixing this might be to change
> intltool.m4 so where it says AC_PATH_PROG(INTLTOOL_PERL, perl), it says
> AC_PATH_PROG(INTLTOOL_PERL, nativeperl) instead, at least in the
> sysroot.
>

yeah though it wont work for folks who would want to use intltool on the ta=
rget
unless nativeperl is installed on target too

> Another option would be a class that did:
>
> DEPENDS =3D+ "intltool"
> export INTLTOOL_PERL =3D "nativeperl"

this might work well.

>
> although I think I prefer correcting the intltool m4 macro slightly
> more. Or do we just add the export to the core in bitbake.conf or
> autotools.bbclass?...
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


