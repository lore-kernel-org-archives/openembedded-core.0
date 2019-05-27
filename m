Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 022BC7E1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 16:56:32 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p26so27587382edr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 09:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DrJmM+wiJYN33QM8Sm1pBH7GGPe6r0tbwuIQTcf7ytc=;
	b=qvq2+adgrkBE7UDj1qM36a35eCXpCo8Ko3Af99qCTSOfxl4+VBjKJpCBhWVBO3YcWo
	Z6RTGxKMBQqHtcV0xP+rJkm2x0EC/ZtTCLbWUk6TuCbIKa2owX8w2dJK0mwj1pe11a3W
	rreew41GUKc6ZTMnZ253nlD7TAyhimXrA6iIjM05nCZtgviDYdPs8FpLK0MRKQijJSLS
	iOekpDbg8SehgZZ/ZoKHc3fO8wRSVYc4qjJuFY2oJjuiKwECYUlbwDyMMkkjId2K0WyY
	fLaUMqJt6T2emduksdadGpCRsSrZF9nwCaDJuHIEirtOWK6nlkdlC+KcJKVwNhWXREqi
	Arkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DrJmM+wiJYN33QM8Sm1pBH7GGPe6r0tbwuIQTcf7ytc=;
	b=JY62TfqgrHnV0xexiveOAl+m81kfOht6AVe1YiHunNlXV0/OtheR/SlKXOLiHiJDMU
	0nbbNRclRuN3Iz+lHGMtehH3WvdTGdovgHV/0bBhaUQvVhXctlzgGwFQ+gsnfCPBtc2x
	JLIgcCQpTy5T/Q4YR33YMcLN9O8HrLF7YjfTeTQobouVFR4yEw7r6hlNqEMiC2I29lqo
	gu67VazX0R2/paPzKVxFHoUuWb6dNt8oy4QnyKZL0QJgRmBaOdho2mbX/RLyyU8Kd2/g
	yUJTCSYinQNyKD/gw1h89eRS302YCo2MjdJmKOEZECdOhcYBH2/irswzXiAmQnH+C4Ln
	pAHQ==
X-Gm-Message-State: APjAAAXs5DqnTvOVH8e/WbfVvHts+jEZeKr3n1aV7hW3np5PQUgqU/iU
	Iy7rNZ9tmSmUNVMA4TfeQxK537Nz+OxcR/C4rL0=
X-Google-Smtp-Source: APXvYqy58ClOGxv4UK8Mk12QzsY6gK7LUX4/rEzloLJ5a0vy/FdqUgRPYGrcsVXI4kcxSW1VL5o10o70Lz9C/RElGtI=
X-Received: by 2002:a50:b513:: with SMTP id y19mr3034522edd.153.1558976193666; 
	Mon, 27 May 2019 09:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <1557324149-15256-1-git-send-email-Michael.Ho@bmw.de>
	<CABcZANkiucQ6m13KLdEvOj9mUwSp+BpFwQaPB7G7w=r-opSqgw@mail.gmail.com>
	<7627EBD3-0D41-46C2-AAF5-2833320C9995@bmw.de>
	<CA+chaQcFrwhzSNxdAoUxoN53OfoFVuyxmrWA=p8NkeA4BNJNtw@mail.gmail.com>
	<FAB50201-6E64-468E-98AD-FF9DAEB881B1@bmw.de>
In-Reply-To: <FAB50201-6E64-468E-98AD-FF9DAEB881B1@bmw.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 May 2019 18:56:22 +0200
Message-ID: <CA+chaQeGgKs+L0fedGLQL_Go4KVh5f70S6JFRSaoCisE3aEwzg@mail.gmail.com>
To: Michael.Ho@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add named SRCREVs to the sstate hash
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
X-List-Received-Date: Mon, 27 May 2019 16:56:33 -0000
Content-Type: multipart/alternative; boundary="0000000000003ca33c0589e16e35"

--0000000000003ca33c0589e16e35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

sorry I wasn't clear in the reply, I meant that it's easy to work around
this issue, but it's error prone.

Your patch does it automatically and I don't see any cases where we
wouldn't want all the SRCREVs included in do_fetch signature, so I like
your patch.

+1 from me.

Cheers,

On Mon, May 27, 2019 at 6:34 PM <Michael.Ho@bmw.de> wrote:

> Hi Martin,
>
>
>
> It seems a little tricky though to need to know about the sstate hashing
> in order to use named
> source revisions and it could be a bit confusing that using a normal
> SRCREV doesn=E2=80=99t require any
> extra effort but named SRCREVs require additional lines of metadata. As
> you can see in the
> commit message of my patches, the vulkan-demos recipe in poky also has
> this issue so it might
> be quite easy to forget.
>
>
>
> Thanks for the feedback. If the patch idea isn=E2=80=99t good, let me kno=
w if you
> think I should instead
> post a patch for the documentation to try to more explicitly note the nee=
d
> for the additional vardeps
> statements when using named SRCREVs.
>
>
>
> Thanks.
>
>
>
> Kind regards,
>
> Michael
>
>
>
> --
>
> *BMW Car IT GmbH*
> Michael Ho
> Spezialist Entwicklung =E2=80=93 Build and Release Engineering
> Lise-Meitner-Stra=C3=9Fe 14
> 89081 Ulm
>
> Tel.: =C2=AD+49-731-37804-071
>
> Mobil: +49-152-54980-471
> Fax: +49-731-37804-001
> Mail: michael.ho@bmw-carit.de
> Web: http://www.bmw-carit.de
> -------------------------------------------------------------------------
> BMW Car IT GmbH
> Gesch=C3=A4ftsf=C3=BChrer: Kai-Uwe Balszuweit und Christian Salzmann
> Sitz und Registergericht: M=C3=BCnchen HRB 134810
> -------------------------------------------------------------------------
>
>
>
>
>
> *From: *Martin Jansa <martin.jansa@gmail.com>
> *Date: *Monday, 27 May 2019 at 5:44 pm
> *To: *"Ho Michael, JC-3UL" <Michael.Ho@bmw.de>
> *Cc: *Chris Larson <kergoth@gmail.com>, Patches and discussions about the
> oe-core layer <openembedded-core@lists.openembedded.org>
> *Subject: *Re: [OE-core] [PATCH] base.bbclass: add named SRCREVs to the
> sstate hash
>
>
>
> In those recipes which don't include SRCPV in PV (for whatever reason) we
> usually add them explicitly with:
>
> do_fetch[vardeps] +=3D "SRCREV_common"
>
> it's not ideal as people sometimes forget about this. Good practice is to
> add this next to the SRCREV_FORMAT (if you set one, to clearly show which
> revs are and aren't included).
>
>
>
> On Mon, May 27, 2019 at 5:37 PM <Michael.Ho@bmw.de> wrote:
>
> Hi Christopher,
>
>
>
> Thank you for the feedback. Since SRCPV is not always enforced (correct m=
e
> if I=E2=80=99m wrong), it seems easy to trip over this bug when just foll=
owing the
> documentation on multiple named source uri=E2=80=99s (also if you purpose=
ly don=E2=80=99t
> want to include the secondary source revisions in the package version).
> I=E2=80=99ll give it another shot to make it more efficient. If it=E2=80=
=99s not expected
> to be an encounterable bug case you can ignore the patch.
>
>
>
> Thanks.
>
>
>
> Kind regards,
>
> Michael
>
>
>
> --
>
> *BMW Car IT GmbH*
> Michael Ho
> Spezialist Entwicklung =E2=80=93 Build and Release Engineering
> Lise-Meitner-Stra=C3=9Fe 14
> 89081 Ulm
>
> Tel.: =C2=AD+49-731-37804-071
>
> Mobil: +49-152-54980-471
> Fax: +49-731-37804-001
> Mail: michael.ho@bmw-carit.de
> Web: http://www.bmw-carit.de
> -------------------------------------------------------------------------
> BMW Car IT GmbH
> Gesch=C3=A4ftsf=C3=BChrer: Kai-Uwe Balszuweit und Christian Salzmann
> Sitz und Registergericht: M=C3=BCnchen HRB 134810
> -------------------------------------------------------------------------
>
>
>
>
>
> *From: *Christopher Larson <kergoth@gmail.com>
> *Date: *Wednesday, 8 May 2019 at 5:17 pm
> *To: *"Ho Michael, JC-3UL" <Michael.Ho@bmw.de>
> *Cc: *Patches and discussions about the oe-core layer <
> openembedded-core@lists.openembedded.org>
> *Subject: *Re: [OE-core] [PATCH] base.bbclass: add named SRCREVs to the
> sstate hash
>
>
>
> Does SRCPV not already cover this in the majority of cases? SRCREV_FORMAT
> controls how the multiple revs end up in PV, and the change to PV results
> in rebuilding anyway. And iterating over d.keys() is inefficient, *if*
> you=E2=80=99re going to do this, operate on SRCREV, gather up the name=3D=
 parameters
> from scm urls, and use that to drive it.
>
>
>
> On Wed, May 8, 2019 at 7:10 AM Michael Ho <Michael.Ho@bmw.de> wrote:
>
> Several fetchers support named sources that require setting a SRCREV with
> the source name as a suffix. These named SRCREV variables are not capture=
d
> in the sstate hash calculation because they're only referenced within the
> bitbake fetcher function.
>
> Add a snippet to the base.bbclass anonymous python to add all named SRCRE=
V
> variables to the vardeps of do_fetch to capture them in the sstate hash
> calculation.
>
> Testing of the bug can be shown by running the following bitbake commands
> with this patch set not applied:
>
> bitbake vulkan-demos | tee
> sed -i 's/SRCREV_gli =3D ".*"/SRCREV_gli =3D "xxx"/' \
>   ../meta/recipes-graphics/vulkan/vulkan-demos_git.bb
> bitbake vulkan-demos | tee;
>
> Results in no errors despite a broken SRCREV because the vulkan-demos is
> considered unchanged.
>
> After applying this patch the above commands instead result in a fetcher
> error which is correct.
> ---
>  meta/classes/base.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 1636c6e..84a27f5 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -638,6 +638,16 @@ python () {
>
>      if needsrcrev:
>          d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
> +        # Gather all SRCREV_* references to add to the sstate hash
> calculation
> +        # This may capture SRCREVs not used but it's difficult to try to
> restrict it
> +        # to only what is needed
> +        for dkey in d.keys():
> +            if dkey.startswith("SRCREV_"):
> +                # This anonymous python snippet is called multiple times
> so we
> +                # need to be careful to not double up the appends here
> and cause
> +                # the base hash to mismatch the task hash
> +                if dkey not in (d.getVarFlag("do_fetch", "vardeps") or
> '').split():
> +                    d.appendVarFlag("do_fetch", "vardeps", "
> {}".format(dkey))
>
>      set_packagetriplet(d)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
>
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--0000000000003ca33c0589e16e35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michael,<div><br></div><div>sorry I wasn&#39;t clear in=
 the reply, I meant that it&#39;s easy to work around this issue, but it&#3=
9;s error prone.</div><div><br></div><div>Your patch does it automatically =
and I don&#39;t see any cases where we wouldn&#39;t want all the SRCREVs in=
cluded in do_fetch signature, so I like your patch.</div><div><br></div><di=
v>+1 from me.<br></div><div><br></div><div>Cheers,</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 27, 201=
9 at 6:34 PM &lt;<a href=3D"mailto:Michael.Ho@bmw.de">Michael.Ho@bmw.de</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-AU">
<div class=3D"gmail-m_-2939507229560680711WordSection1">
<p class=3D"MsoNormal">Hi Martin,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">It seems a little tricky though to need to know abou=
t the sstate hashing in order to use named<br>
source revisions and it could be a bit confusing that using a normal SRCREV=
 doesn=E2=80=99t require any<br>
extra effort but named SRCREVs require additional lines of metadata. As you=
 can see in the<br>
commit message of my patches, the vulkan-demos recipe in poky also has this=
 issue so it might<br>
be quite easy to forget.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks for the feedback. If the patch idea isn=E2=80=
=99t good, let me know if you think I should instead<br>
post a patch for the documentation to try to more explicitly note the need =
for the additional vardeps<br>
statements when using named SRCREVs.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Kind regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Michael<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">--=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:rgb(51,51,51)">BMW Car IT GmbH</span></b><span style=3D"f=
ont-size:10.5pt;font-family:Arial,sans-serif;color:rgb(51,51,51)"><br>
<span style=3D"background:white">Michael Ho</span><br>
Spezialist Entwicklung =E2=80=93 Build and Release Engineering<br>
<span style=3D"background:white">Lise-Meitner-Stra=C3=9Fe 14</span><br>
<span style=3D"background:white">89081 Ulm</span><br>
<br>
<span style=3D"background:white">Tel.:=C2=A0=C2=AD+49-731-37804-071<u></u><=
u></u></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:rgb(51,51,51);background:white">Mobil: +49-152-54980-471</sp=
an><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(5=
1,51,51)"><br>
<span style=3D"background:white">Fax: +49-731-37804-001</span><br>
<span style=3D"background:white">Mail:=C2=A0</span></span><span style=3D"fo=
nt-size:10.5pt;font-family:Arial,sans-serif"><a href=3D"mailto:michael.ho@b=
mw-carit.de" target=3D"_blank"><span style=3D"color:rgb(5,99,193)">michael.=
ho@bmw-carit.de</span></a><span style=3D"color:rgb(51,51,51);background:whi=
te">=C2=A0</span><span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white">Web:=C2=A0</span></span></span><a href=3D"=
http://www.bmw-carit.de/" target=3D"_blank"><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:rgb(50,108,166)">http://www.bmw-carit.d=
e</span></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;co=
lor:rgb(51,51,51)"><br>
<span style=3D"background:white">------------------------------------------=
-------------------------------</span><br>
<span style=3D"background:white">BMW Car IT GmbH</span><br>
<span style=3D"background:white">Gesch=C3=A4ftsf=C3=BChrer:=C2=A0Kai-Uwe Ba=
lszuweit und</span></span><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:rgb(153,153,153)">=C2=A0</span><span style=3D"font-size:1=
0.5pt;font-family:Arial,sans-serif;color:rgb(51,51,51);background:white">Ch=
ristian
 Salzmann</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-seri=
f;color:rgb(51,51,51)"><br>
<span style=3D"background:white">Sitz und Registergericht: M=C3=BCnchen HRB=
 134810</span><br>
<span style=3D"background:white">------------------------------------------=
-------------------------------</span></span><u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">Martin Jansa &lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.=
com</a>&gt;<br>
<b>Date: </b>Monday, 27 May 2019 at 5:44 pm<br>
<b>To: </b>&quot;Ho Michael, JC-3UL&quot; &lt;<a href=3D"mailto:Michael.Ho@=
bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
<b>Cc: </b>Chris Larson &lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"=
_blank">kergoth@gmail.com</a>&gt;, Patches and discussions about the oe-cor=
e layer &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH] base.bbclass: add named SRCREVs to th=
e sstate hash<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">In those recipes which don&#39;t include SRCPV in PV=
 (for whatever reason) we usually add them explicitly with:
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">do_fetch[vardeps] +=3D &quot;SRCREV_common&quot;<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">it&#39;s not ideal as people sometimes forget about =
this. Good practice is to add this next to the SRCREV_FORMAT (if you set on=
e, to clearly show which revs are and aren&#39;t included).<u></u><u></u></=
p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, May 27, 2019 at 5:37 PM &lt;<a href=3D"mailt=
o:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt; wrote:<u><=
/u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal">Hi Christopher,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Thank you for the feedback. Since SRCPV is not alway=
s enforced (correct me if I=E2=80=99m wrong), it seems easy to trip over th=
is bug when just following the documentation on multiple named
 source uri=E2=80=99s (also if you purposely don=E2=80=99t want to include =
the secondary source revisions in the package version). I=E2=80=99ll give i=
t another shot to make it more efficient. If it=E2=80=99s not expected to b=
e an encounterable bug case you can ignore the patch.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Kind regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Michael<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">--=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:rgb(51,51,51)">BMW Car IT GmbH</span></b><span style=3D"f=
ont-size:10.5pt;font-family:Arial,sans-serif;color:rgb(51,51,51)"><br>
<span style=3D"background:white">Michael Ho</span><br>
Spezialist Entwicklung =E2=80=93 Build and Release Engineering<br>
<span style=3D"background:white">Lise-Meitner-Stra=C3=9Fe 14</span><br>
<span style=3D"background:white">89081 Ulm</span><br>
<br>
<span style=3D"background:white">Tel.:=C2=A0=C2=AD+49-731-37804-071</span><=
/span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:rgb(51,51,51);background:white">Mobil: +49-152-54980-471</sp=
an><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(5=
1,51,51)"><br>
<span style=3D"background:white">Fax: +49-731-37804-001</span><br>
<span style=3D"background:white">Mail:=C2=A0</span></span><span style=3D"fo=
nt-size:10.5pt;font-family:Arial,sans-serif"><a href=3D"mailto:michael.ho@b=
mw-carit.de" target=3D"_blank"><span style=3D"color:rgb(5,99,193)">michael.=
ho@bmw-carit.de</span></a><span style=3D"color:rgb(51,51,51);background:whi=
te">=C2=A0</span><span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white">Web:=C2=A0</span></span></span><a href=3D"=
http://www.bmw-carit.de/" target=3D"_blank"><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:rgb(50,108,166)">http://www.bmw-carit.d=
e</span></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;co=
lor:rgb(51,51,51)"><br>
<span style=3D"background:white">------------------------------------------=
-------------------------------</span><br>
<span style=3D"background:white">BMW Car IT GmbH</span><br>
<span style=3D"background:white">Gesch=C3=A4ftsf=C3=BChrer:=C2=A0Kai-Uwe Ba=
lszuweit und</span></span><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:rgb(153,153,153)">=C2=A0</span><span style=3D"font-size:1=
0.5pt;font-family:Arial,sans-serif;color:rgb(51,51,51);background:white">Ch=
ristian
 Salzmann</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-seri=
f;color:rgb(51,51,51)"><br>
<span style=3D"background:white">Sitz und Registergericht: M=C3=BCnchen HRB=
 134810</span><br>
<span style=3D"background:white">------------------------------------------=
-------------------------------</span></span><u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">Christopher Larson &l=
t;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com<=
/a>&gt;<br>
<b>Date: </b>Wednesday, 8 May 2019 at 5:17 pm<br>
<b>To: </b>&quot;Ho Michael, JC-3UL&quot; &lt;<a href=3D"mailto:Michael.Ho@=
bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
<b>Cc: </b>Patches and discussions about the oe-core layer &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH] base.bbclass: add named SRCREVs to th=
e sstate hash</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Does SRCPV not already cover this in the majority of=
 cases? SRCREV_FORMAT controls how the multiple revs end up in PV, and the =
change to PV results in rebuilding anyway. And iterating
 over d.keys() is inefficient, *if* you=E2=80=99re going to do this, operat=
e on SRCREV, gather up the name=3D parameters from scm urls, and use that t=
o drive it.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, May 8, 2019 at 7:10 AM Michael Ho &lt;<a hre=
f=3D"mailto:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt; =
wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal">Several fetchers support named sources that require =
setting a SRCREV with<br>
the source name as a suffix. These named SRCREV variables are not captured<=
br>
in the sstate hash calculation because they&#39;re only referenced within t=
he<br>
bitbake fetcher function.<br>
<br>
Add a snippet to the base.bbclass anonymous python to add all named SRCREV<=
br>
variables to the vardeps of do_fetch to capture them in the sstate hash<br>
calculation.<br>
<br>
Testing of the bug can be shown by running the following bitbake commands<b=
r>
with this patch set not applied:<br>
<br>
bitbake vulkan-demos | tee<br>
sed -i &#39;s/SRCREV_gli =3D &quot;.*&quot;/SRCREV_gli =3D &quot;xxx&quot;/=
&#39; \<br>
=C2=A0 ../meta/recipes-graphics/vulkan/<a href=3D"http://vulkan-demos_git.b=
b" target=3D"_blank">vulkan-demos_git.bb</a><br>
bitbake vulkan-demos | tee;<br>
<br>
Results in no errors despite a broken SRCREV because the vulkan-demos is<br=
>
considered unchanged.<br>
<br>
After applying this patch the above commands instead result in a fetcher<br=
>
error which is correct.<br>
---<br>
=C2=A0meta/classes/base.bbclass | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index 1636c6e..84a27f5 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -638,6 +638,16 @@ python () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0if needsrcrev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;SRCPV&quot;, &quot;${@bb.f=
etch2.get_srcrev(d)}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Gather all SRCREV_* references to add to the=
 sstate hash calculation<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This may capture SRCREVs not used but it&#39=
;s difficult to try to restrict it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to only what is needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dkey in d.keys():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dkey.startswith(&quot;SRCREV_=
&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This anonymous p=
ython snippet is called multiple times so we<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # need to be caref=
ul to not double up the appends here and cause<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the base hash to=
 mismatch the task hash<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dkey not in (d.=
getVarFlag(&quot;do_fetch&quot;, &quot;vardeps&quot;) or &#39;&#39;).split(=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.ap=
pendVarFlag(&quot;do_fetch&quot;, &quot;vardeps&quot;, &quot; {}&quot;.form=
at(dkey))<br>
<br>
=C2=A0 =C2=A0 =C2=A0set_packagetriplet(d)<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">--
<u></u><u></u></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Christopher Larson<br>
kergoth at gmail dot com<br>
Founder - BitBake, OpenEmbedded, OpenZaurus<br>
Senior Software Engineer, Mentor Graphics<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal">-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><u></u><u></u></p>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--0000000000003ca33c0589e16e35--
