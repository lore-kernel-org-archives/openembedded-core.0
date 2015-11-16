Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAE76E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:55:37 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so59744455igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pBlyiwP63u6jpMPiDBl4snvXFcRFNaEcsgJWunpTFSM=;
	b=LMCm77r2Priqw7lBRH9Ik1wnRT5mtCxhsgccnw2QMoGYwPA0EYBA978f0GO39H4e63
	mQAwEhz5ckzlVZvaJMLmIJ2lvSOxOSbwziZ1yXBCC9OyQ1xoQw7nWeLOws+clGnujgsc
	RMLrZovOkJefE//cnUTMSjBE4/vnZ5EgnMuflArHibQc9o+SMuw9RFt/sStZYKpK6jjP
	xsWcT9HY1TOA/Da0rO1Ez8vFicTJwU+22wIPwl4RDZVmXiNpZdCV1qYKDblxPQ32jjAz
	9+m5VWQ1QIC3ipMWnYwPHC6mEvp9JT0aqBAWRrn39AxDOWHHckFdeOOq5AqB4Xg8+g61
	J5Gw==
X-Received: by 10.50.150.37 with SMTP id uf5mr18112680igb.10.1447689338095;
	Mon, 16 Nov 2015 07:55:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Mon, 16 Nov 2015 07:55:18 -0800 (PST)
In-Reply-To: <CAJTo0LZdW1+V8Sg1u05bEW8GYe8HjeWK=af4dReF9jer5GJ3YQ@mail.gmail.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<a2976f346a9ddf2822929c54c9e81b7b24f0e1d6.1447455202.git.chris_larson@mentor.com>
	<CAJTo0LZdW1+V8Sg1u05bEW8GYe8HjeWK=af4dReF9jer5GJ3YQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 16 Nov 2015 08:55:18 -0700
Message-ID: <CABcZANmGD44BuZP_tn4MWvHVK85Duf2e9uo83foECQVtcHYjaA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/6] sysprof: add missing gdk-pixbuf/pango deps
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
X-List-Received-Date: Mon, 16 Nov 2015 15:55:38 -0000
Content-Type: multipart/alternative; boundary=001a11c2c350be125d0524aa70cc

--001a11c2c350be125d0524aa70cc
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 8:12 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 13 November 2015 at 23:10, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> -PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ libglade"
>> +PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ gdk-pixbuf pango
>> libglade"
>>
>
> As you're patching something you just introduced, I squashed these.


Conceptually, they're independent, since these additional deps weren't in
the original DEPENDS either, so the first makes it conditional, the second
alters what the deps of the recipe are, but I don't feel too strongly about
it, squashing is okay too.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2c350be125d0524aa70cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 16, 2015 at 8:12 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><di=
v class=3D"gmail_quote">On 13 November 2015 at 23:10, Christopher Larson <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">=
kergoth@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div style=3D"overflow:hidden">-PACKAGECONFIG[gui] =3D &quot;--enable-gui,--=
disable-gui,gtk+ libglade&quot;<br>
+PACKAGECONFIG[gui] =3D &quot;--enable-gui,--disable-gui,gtk+ gdk-pixbuf pa=
ngo libglade&quot;<br></div></blockquote></div><br></span>As you&#39;re pat=
ching something you just introduced, I squashed these.</blockquote></div><b=
r>Conceptually, they&#39;re independent, since these additional deps weren&=
#39;t in the original DEPENDS either, so the first makes it conditional, th=
e second alters what the deps of the recipe are, but I don&#39;t feel too s=
trongly about it, squashing is okay too.<br>-- <br><div class=3D"gmail_sign=
ature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c2c350be125d0524aa70cc--
