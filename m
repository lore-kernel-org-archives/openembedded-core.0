Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFEC70100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 15:05:53 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id s79so61885607oie.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=dYGP8WPZ09zrXzqQ3Ga+MnwFtOVutMSKeKUrZy9whsg=;
	b=c57mOdUXu+nMCy9Mfup18CGUwW2VobB9bo6XsU43TzHZK7VnBXn66tnFDwLAulsmq6
	OJ7PjhT7FF+MQ+0LV63eBnIPuuo8etJRl9JGaQ8EARenCFpi7jocTbQlWTbUg2D+Lvlu
	feL1lz8tJPmJcdvjTsVJopMVmstaiUBWxCd2P4XUNYtq6qIWDmKI5W7FJ1pLDnhWcCwu
	ghsnSSTg0yZvdyMR9Fa8tHBzBButnN+y0IdnC2bqQsaEzjU1HTc4Vu7vY2uKSED0jQXR
	e/0YdHaQOPLokzvjA8VHwRl0upa8PEGVA9+THIGLq/RfUUgETctwkrZKWkpSIPOAILeu
	x9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=dYGP8WPZ09zrXzqQ3Ga+MnwFtOVutMSKeKUrZy9whsg=;
	b=QEVUvxbNBPdH0xorgDomHtVgGLdDA25aRvq3zUbgz72G1RZZiul3JPnkCoWoL0nXOf
	z+91HRKz0+tB9sXC2rDI8X7AoAA4TckMkcuYQOwngnkrfxKEsRdNnqSpLtFSAi0AWcUZ
	pw3kAqpLOR2p1/U3Px5jU4TRRl8doq5IvK4lfieoJBBoBcBdI7SwfADGK6h+U+HGyW6P
	9nejZ+WzlRCog22TwmGX08AzBmeD65kFDm7bKbEA06YlAuNC1P73T/9Au4t1Wq5ZvzLw
	lfCgfw9O4mqJBl99As5o3cqpwKSia83y+Bc/+n//4/ZVAAXAqUoyGLVzkOGLf4fbUGlG
	haTg==
X-Gm-Message-State: AD7BkJJovNJ07piE95hjr/1SVAeTtwVgeC4T5N2dTTHH65SkRqcKe2g3SeZ8khVkHEp9sJMrz84vqDbkutvgIg==
MIME-Version: 1.0
X-Received: by 10.157.7.67 with SMTP id 61mr16109279ote.186.1459955149057;
	Wed, 06 Apr 2016 08:05:49 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Wed, 6 Apr 2016 08:05:48 -0700 (PDT)
In-Reply-To: <7D75864EFEE0E541A47E43940B77BA6950AF323D@IRSMSX107.ger.corp.intel.com>
References: <7D75864EFEE0E541A47E43940B77BA6950AF323D@IRSMSX107.ger.corp.intel.com>
Date: Wed, 6 Apr 2016 11:05:48 -0400
Message-ID: <CADkTA4OXf5GvoTjtKdV_RQBneT5EevJOFQCXNRYzQK+A-ZH8uA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Schuetterle, Markus" <markus.schuetterle@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto.bbclass: Fix SRCARCH path for x86 using DEFCONFIG
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
X-List-Received-Date: Wed, 06 Apr 2016 15:05:53 -0000
Content-Type: multipart/alternative; boundary=001a113dda080c33e7052fd24cfc

--001a113dda080c33e7052fd24cfc
Content-Type: text/plain; charset=UTF-8

I'll reply here .. but if you can re-send this with git send-email, we can
do a better review, since
we can reply to the patch itself.

You shouldn't need to actually do what you are doing in this patch. There's
already an inherited
kernel-arch bbclass that does the mapping to ARCH.

# $ARCH [2 operations]
#   exported /home/bruce/poky/meta/classes/kernel-arch.bbclass:37
#     [export] "1"
#   set /home/bruce/poky/meta/classes/kernel-arch.bbclass:37
#     "${@map_kernel_arch(d.getVar('TARGET_ARCH', True), d)}"
# pre-expansion value:
#   "${@map_kernel_arch(d.getVar('TARGET_ARCH', True), d)}"
export ARCH="x86"

And I can show how all my builds of the various qemux86 and other h/w
machines always
map to x86. The case you are solving has been considered for many kernel
operations,
so it shouldn't be causing a problem .. ARCH is always adjusted.

Is there a simple way to reproduce the problem you are seeing ?

Bruce

On Wed, Apr 6, 2016 at 8:47 AM, Schuetterle, Markus <
markus.schuetterle@intel.com> wrote:

>
>
> Intel Deutschland GmbH
> Registered Address: Am Campeon 10-12, 85579 Neubiberg, Germany
> Tel: +49 89 99 8853-0, www.intel.de
> Managing Directors: Christin Eisenschmid, Christian Lamprechter
> Chairperson of the Supervisory Board: Nicole Lau
> Registered Office: Munich
> Commercial Register: Amtsgericht Muenchen HRB 186928
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113dda080c33e7052fd24cfc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div>I&#39;ll reply her=
e .. but if you can re-send this with git send-email, we can do a better re=
view, since<br></div>we can reply to the patch itself.<br><br></div>You sho=
uldn&#39;t need to actually do what you are doing in this patch. There&#39;=
s already an inherited<br></div>kernel-arch bbclass that does the mapping t=
o ARCH.<br><br># $ARCH [2 operations]<br>#=C2=A0=C2=A0 exported /home/bruce=
/poky/meta/classes/kernel-arch.bbclass:37<br>#=C2=A0=C2=A0=C2=A0=C2=A0 [exp=
ort] &quot;1&quot;<br>#=C2=A0=C2=A0 set /home/bruce/poky/meta/classes/kerne=
l-arch.bbclass:37<br>#=C2=A0=C2=A0=C2=A0=C2=A0 &quot;${@map_kernel_arch(d.g=
etVar(&#39;TARGET_ARCH&#39;, True), d)}&quot;<br># pre-expansion value:<br>=
#=C2=A0=C2=A0 &quot;${@map_kernel_arch(d.getVar(&#39;TARGET_ARCH&#39;, True=
), d)}&quot;<br>export ARCH=3D&quot;x86&quot;<br><br></div>And I can show h=
ow all my builds of the various qemux86 and other h/w machines always<br></=
div>map to x86. The case you are solving has been considered for many kerne=
l operations, <br></div>so it shouldn&#39;t be causing a problem .. ARCH is=
 always adjusted.<br><br></div>Is there a simple way to reproduce the probl=
em you are seeing ?<br><br></div>Bruce<br><div><div><div><div><div><div><di=
v><div><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Apr 6, 2016 at 8:47 AM, Schuetterle, Markus <span dir=3D"ltr">&lt;<=
a href=3D"mailto:markus.schuetterle@intel.com" target=3D"_blank">markus.sch=
uetterle@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div link=3D"#0563C1" vlink=3D"#954F72" lang=3D"EN-US"><=
div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div></div><br>Intel De=
utschland GmbH<br>
Registered Address: Am Campeon 10-12, 85579 Neubiberg, Germany<br>
Tel: <a href=3D"tel:%2B49%2089%2099%208853-0" value=3D"+49899988530" target=
=3D"_blank">+49 89 99 8853-0</a>, <a href=3D"http://www.intel.de" rel=3D"no=
referrer" target=3D"_blank">www.intel.de</a><br>
Managing Directors: Christin Eisenschmid, Christian Lamprechter<br>
Chairperson of the Supervisory Board: Nicole Lau<br>
Registered Office: Munich<br>
Commercial Register: Amtsgericht Muenchen HRB 186928<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div>&quot;Thou sha=
lt not follow the NULL pointer, for chaos and madness await thee at its end=
&quot;</div>
</div></div></div></div></div></div></div></div></div></div></div></div>

--001a113dda080c33e7052fd24cfc--
