Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCAC7C301
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 23:18:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m22so4894176wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 15:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7ClpwUc5BuJp/yYtT/OuN2JgCZBGGTS7qEIrJr+2O8w=;
	b=q/NnvxyqD1LtF3GLHXUysngvO6gNFjz4ezjbHARAhPzGhbDxfDMJu3+c4L4oo8FMRs
	TqIm9Xl9BQJ33PDrfoqvkQr44BCVy4CgG7wlFPfQjZka5igh18Ymi9z7fV6pZow8+X8M
	2VVVC0O8M54kJslM1dO4NO5NCl3MZQIIkyCOR/aSFRuhb62dqpvC5DqaClgml5UH7jgQ
	loaTRa5qFEy20AYe6hKOe93fpGtUp5X4gNglljRLMfeJ/WoeShWmGPKIRXIFIlNSapuP
	oiATW8bl5bEgmRbz/njRkG9R4ZhqJ1EZaJGfMalxOcOYGnj+jsXtrKqhh16C1fF/ENgw
	Ku1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7ClpwUc5BuJp/yYtT/OuN2JgCZBGGTS7qEIrJr+2O8w=;
	b=hWkrW+KDHEagT83kiylQRzEvqyxJgb6RNUsp4ofjwreYaD6wMAzHhtwPKCbf1hRDYp
	ogbsBABkzqipHrBeIxBonHJ2K3fr+iWLITgps4G5sqYcMIW94AZxg4h8e/udGIbB32wR
	KLMIqsk0jD+1Bs8JwmpDkV7VjLxUP4ijNW0U1Jj9Cg8xelGO2bgtyWj/H3FZe/B5GWqF
	hOo8TmoIzqYDS1ZDI7o8buvymMbiBDMqZPkMoeFPprmmy/crarOymlFJUUtt6pocmC2o
	qQ3pw8KLFnV5lmUuOlzAXjtaWlCeVnmADzXB8t2GVvkKH0BlIvsfYI/BhRdgQlGG4s4P
	Rc5A==
X-Gm-Message-State: AJcUukeWo/f0GpeOpZLsxHwK9hZUTaQq8/JgChlTweN+hKo4ud7K8K7a
	sqxNlcf/6znD88SlC77pmZg929fiUhGbJNenASE=
X-Google-Smtp-Source: ALg8bN5j8ZPbU8lIurGIroDeK2d+cxDP8m8+q1FYKkWwOmWsbPsIq6SSSS8fmRxuRjpCnpAZ5bqhZcwLLTVinExbp5k=
X-Received: by 2002:a1c:6442:: with SMTP id y63mr4309305wmb.143.1548371936997; 
	Thu, 24 Jan 2019 15:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
In-Reply-To: <a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 24 Jan 2019 17:18:45 -0600
Message-ID: <CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Thu, 24 Jan 2019 23:18:56 -0000
Content-Type: multipart/alternative; boundary="00000000000048f7cc05803c6f2f"

--00000000000048f7cc05803c6f2f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 24, 2019, 4:43 PM Richard Purdie <
richard.purdie@linuxfoundation.org wrote:

> On Wed, 2019-01-23 at 17:17 +0100, Alexander Kanavin wrote:
> > The few cases where they failed should be now all fixed. The only allowed
> > exception is when building mingw32 SDKs, as there is currently no
> support for running
> > postinst_intercepts through wine.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/lib/oe/package_manager.py | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oe/package_manager.py
> b/meta/lib/oe/package_manager.py
> > index 1087144d47f..f26f597d03d 100644
> > --- a/meta/lib/oe/package_manager.py
> > +++ b/meta/lib/oe/package_manager.py
> > @@ -439,6 +439,11 @@ class PackageManager(object, metaclass=ABCMeta):
> >                  self._postpone_to_first_boot(script_full)
> >                  continue
> >
> > +            if populate_sdk == 'host' and self.d.getVar('SDK_OS') ==
> 'mingw32':
> > +                bb.warn("The postinstall intercept hook '%s' could not
> be executed due to missing wine support, details in %s/log.do_%s"
> > +                                % (script, self.d.getVar('T'),
> self.d.getVar('BB_CURRENTTASK')))
> > +                continue
> > +
> >              bb.note("> Executing %s intercept ..." % script)
> >
> >              try:
> > @@ -447,7 +452,7 @@ class PackageManager(object, metaclass=ABCMeta):
> >              except subprocess.CalledProcessError as e:
> >                  bb.note("Exit code %d. Output:\n%s" % (e.returncode,
> e.output.decode("utf-8")))
> >                  if populate_sdk == 'host':
> > -                    bb.warn("The postinstall intercept hook '%s'
> failed, details in %s/log.do_%s" % (script, self.d.getVar('T'),
> self.d.getVar('BB_CURRENTTASK')))
> > +                    bb.fatal("The postinstall intercept hook '%s'
> failed, details in %s/log.do_%s" % (script, self.d.getVar('T'),
> self.d.getVar('BB_CURRENTTASK')))
> >                  elif populate_sdk == 'target':
> >                      if "qemuwrapper: qemu usermode is not supported" in
> e.output.decode("utf-8"):
> >                          bb.warn("The postinstall intercept hook '%s'
> could not be executed due to missing qemu usermode support, details in
> %s/log.do_%s"
>
> I'm ok with this but could we change the bb.warn to something less
> important like a note?
>
> The reason I say this is that I'd like to get the autobuilder to the
> point where its warning free. This warning is the only reason meta-
> mingw shows warnings now. Either we fix them or if we can't, they
> probably aren't warnings.
>
> What should we do here?
>
> (also cc'd Joshua)
>

I think the one that fails currently is updating the GIO module cache. I'm
not sure if this is even necessary for mingw (my guess is no, since this
has never worked and no one has complained). We probably just need to
disable it in mingw, but when I looked very briefly a while ago, I didn't
see a straight forward way of doing that.

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=12962


> Cheers,
>
> Richard
>
>

--00000000000048f7cc05803c6f2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Thu, Jan 24, 2019, 4:43 PM Richard Purdie &lt;<a href=3D"mailto:richard.=
purdie@linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">richard.pu=
rdie@linuxfoundation.org</a> wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Wed, 2019-01-23 at 17:17 +0100, Alexander Kanavin wrote:<br>
&gt; The few cases where they failed should be now all fixed. The only allo=
wed<br>
&gt; exception is when building mingw32 SDKs, as there is currently no supp=
ort for running<br>
&gt; postinst_intercepts through wine.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/package_manager.py | 7 ++++++-<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_mana=
ger.py<br>
&gt; index 1087144d47f..f26f597d03d 100644<br>
&gt; --- a/meta/lib/oe/package_manager.py<br>
&gt; +++ b/meta/lib/oe/package_manager.py<br>
&gt; @@ -439,6 +439,11 @@ class PackageManager(object, metaclass=3DABCMeta)=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._po=
stpone_to_first_boot(script_full)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if populate_sdk =3D=3D &#39=
;host&#39; and self.d.getVar(&#39;SDK_OS&#39;) =3D=3D &#39;mingw32&#39;:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;The postinstall intercept hook &#39;%s&#39; could not be executed due to m=
issing wine support, details in %s/log.do_%s&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (script, self.d.getVar(&#39;T&=
#39;), self.d.getVar(&#39;BB_CURRENTTASK&#39;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;&gt; Exe=
cuting %s intercept ...&quot; % script)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; @@ -447,7 +452,7 @@ class PackageManager(object, metaclass=3DABCMeta):=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess.Call=
edProcessError as e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(=
&quot;Exit code %d. Output:\n%s&quot; % (e.returncode, e.output.decode(&quo=
t;utf-8&quot;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if popul=
ate_sdk =3D=3D &#39;host&#39;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.warn(&quot;The postinstall intercept hook &#39;%s&#39; failed, details =
in %s/log.do_%s&quot; % (script, self.d.getVar(&#39;T&#39;), self.d.getVar(=
&#39;BB_CURRENTTASK&#39;)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.fatal(&quot;The postinstall intercept hook &#39;%s&#39; failed, details=
 in %s/log.do_%s&quot; % (script, self.d.getVar(&#39;T&#39;), self.d.getVar=
(&#39;BB_CURRENTTASK&#39;)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif pop=
ulate_sdk =3D=3D &#39;target&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if &quot;qemuwrapper: qemu usermode is not supported&quot; in e.outp=
ut.decode(&quot;utf-8&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;The postinstall intercept hook &#39;%s&#=
39; could not be executed due to missing qemu usermode support, details in =
%s/log.do_%s&quot;<br>
<br>
I&#39;m ok with this but could we change the bb.warn to something less<br>
important like a note?<br>
<br>
The reason I say this is that I&#39;d like to get the autobuilder to the<br=
>
point where its warning free. This warning is the only reason meta-<br>
mingw shows warnings now. Either we fix them or if we can&#39;t, they<br>
probably aren&#39;t warnings.<br>
<br>
What should we do here?<br>
<br>
(also cc&#39;d Joshua)<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">I think the one that fails currently is updating the =
GIO module cache. I&#39;m not sure if this is even necessary for mingw (my =
guess is no, since this has never worked and no one has complained). We pro=
bably just need to disable it in mingw, but when I looked very briefly a wh=
ile ago, I didn&#39;t see a straight forward way of doing that.=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">See=C2=A0<a href=3D"https://b=
ugzilla.yoctoproject.org/show_bug.cgi?id=3D12962">https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D12962</a></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--00000000000048f7cc05803c6f2f--
