Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id C30537D39B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 11:50:30 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id b187so4553387vsc.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s3MwGG83wwLW5EQlR3M9SyU/1Mrw9q6tHTHb0j//l0o=;
	b=M/JEnqPha0cwki1PO/0irlc91GSRid4F41BkgfmTXdFTaIPYDXFUymW0eppmJANGg8
	aIkuohAYFzpEyGLgmQqadMBqFYnbC6xsGuficdDiCuaUZ6TlegGhLM3ROyWZk90a2Um6
	zfG3etObDh7WlrwcvT7MOcHJQOQUeqaizo40fQ+ylj4P2B1kjztS3kobsBT4up6vO+I4
	ACuxgavZhDXPd2dJVIYAB5jALfjBr+292cL2GlRpS53N6P5PdSxecbFH01rVGoUZzn/l
	oQ6I6vkW8y0jiXyc3EZD8W+sX1fFfCcLQz7/SmHIPF/klTpCrs0mJ//VAk96riCae8nV
	toAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s3MwGG83wwLW5EQlR3M9SyU/1Mrw9q6tHTHb0j//l0o=;
	b=h9NAAQ1zIvyuJ5raJBo7nxosKUMd2uyAJFCqW9JsuaiBaeyXUYfidUxb9/OrwkCdXx
	CX8Ix9KnQeu5sMGvuChns0Vwm5k4/hAne+HFG1w747Ihzp6Mg6izDFFnLbJBvtC1Coi5
	DwZY0Xq9Zotb9nYXhI4eUuXmCnYf5hJShgpjFNf9g41VQ/gEFDzapMTDy/f0sCiSQWqf
	5vFwVLRe4cNcZsOYEF1XVj0lNolwxjgrXxits8YiWLaaGVrhvMNPRMflGtjCNnu+XZ8k
	xjE1ulBKXyKWqN5ibWE3yVjYLgK6Vw30AyE6vKc1YQN7BYbG+55JlzCbWysMMpNByrLH
	ocpA==
X-Gm-Message-State: APjAAAX0fiAFgNgFVxe1fzQoBbzzvHb1ZVIAn0JlrIOBEIjN+ZtNea+6
	wARj++Diq6hLmxuZgpKbbOs19tS7bjdi0LPC5RYa7Q==
X-Google-Smtp-Source: APXvYqyKhTN6W64NgF8FXAG01ToWBPHeE7Lhyudm+FLPSnn5KrHxMXJHADCbUZ11GSzP9TXg/dXjj+inw4dgqU3s3Gk=
X-Received: by 2002:a67:e45a:: with SMTP id n26mr8330123vsm.94.1567165831735; 
	Fri, 30 Aug 2019 04:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190828152440.70861-1-alex.kanavin@gmail.com>
	<20190828152440.70861-3-alex.kanavin@gmail.com>
	<48b10fe5d26221da2cb169a0ec968dc7bff082c7.camel@intel.com>
In-Reply-To: <48b10fe5d26221da2cb169a0ec968dc7bff082c7.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Aug 2019 13:50:20 +0200
Message-ID: <CANNYZj9TPDEMY45Q2-Ou3GJSrAO_=tS14ScpkqfB+WXQePzCTg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Fri, 30 Aug 2019 11:50:31 -0000
Content-Type: multipart/alternative; boundary="000000000000b46d180591543aa2"

--000000000000b46d180591543aa2
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2019 at 03:55, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> > -QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
> > +QB_OPT_APPEND = "-show-cursor"
>
> Was this intentional? This is reverting an earlier fix:
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/conf/machine/qemuarm64.conf?h=master-next&id=b181bf92e2bc51a808478c12fe62177d966f2a85
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/conf/machine/qemuarm64.conf?h=master-next&id=ff35b6c57a380ca4dc158c5104a6137f8faea5cd
>
> I'm not sure if this is the reason but master-next build is also
> showing problems when running X with qemuarm:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/978/steps/8/logs/step1c
>

Thanks, I wasn't aware that qemu's list of supported graphical hardware
(and what the default selection is) differs between architectures and
machines.
The documentation erroneously claims that '-vga std' is the default
everywhere where in reality it is the default only on x86.

Patch will be reworked to not touch arm bits.


...
>
> > diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
> > b/meta/lib/oeqa/runtime/cases/parselogs.py
> > index 19c9c52a0a9..0002730d46f 100644
> > --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> > +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> > @@ -55,7 +55,11 @@ common_errors = [
> >      "Failed to read /var/lib/nfs/statd/state: Success",
> >      "error retry time-out =",
> >      "logind: cannot setup systemd-logind helper (-61), using legacy
> > fallback",
> > -    "Error changing net interface name 'eth0' to "
> > +    "Error changing net interface name 'eth0' to ",
> > +    "modeset(0): Failed to initialize the DRI2 extension",
> > +    "uvesafb: cannot reserve video memory at",
> > +    "uvesafb: probe of uvesafb.0 failed with error",
> > +    "glamor initialization failed"
> >      ]
> >
>
> parselogs test is used not only for qemu but for other MACHINES as well
> including genericx86 on actual hardware where glamor initialization
> error might need looking into. Perhaps this should be added to qemu
> specific parts of this test only?
>

 That's right as well. Let's add the messages to qemux86 parts, and see if
other qemu targets need this as well.

Alex

--000000000000b46d180591543aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 30 Aug 2019 at 03:55, Mittal, Anu=
j &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">&gt; -QB_OPT_APPEND =3D &quot;-show-cursor -device VGA,=
edid=3Don&quot;<br>
&gt; +QB_OPT_APPEND =3D &quot;-show-cursor&quot;<br>
<br>
Was this intentional? This is reverting an earlier fix:<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/conf=
/machine/qemuarm64.conf?h=3Dmaster-next&amp;id=3Db181bf92e2bc51a808478c12fe=
62177d966f2a85" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproje=
ct.org/cgit/cgit.cgi/poky/commit/meta/conf/machine/qemuarm64.conf?h=3Dmaste=
r-next&amp;id=3Db181bf92e2bc51a808478c12fe62177d966f2a85</a><br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/conf=
/machine/qemuarm64.conf?h=3Dmaster-next&amp;id=3Dff35b6c57a380ca4dc158c5104=
a6137f8faea5cd" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproje=
ct.org/cgit/cgit.cgi/poky/commit/meta/conf/machine/qemuarm64.conf?h=3Dmaste=
r-next&amp;id=3Dff35b6c57a380ca4dc158c5104a6137f8faea5cd</a><br>
<br>
I&#39;m not sure if this is the reason but master-next build is also<br>
showing problems when running X with qemuarm:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/38/build=
s/978/steps/8/logs/step1c" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/38/builds/978/steps/8/logs/ste=
p1c</a><br></blockquote><div><br></div><div>Thanks, I wasn&#39;t aware that=
 qemu&#39;s list of supported graphical hardware (and what the default sele=
ction is) differs between architectures and machines.</div><div>The documen=
tation erroneously claims that &#39;-vga std&#39; is the default everywhere=
 where in reality it is the default only on x86.</div><div><br></div><div>P=
atch will be reworked to not touch arm bits.<br></div></div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote"><br><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
...<br>
<br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; index 19c9c52a0a9..0002730d46f 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; @@ -55,7 +55,11 @@ common_errors =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to read /var/lib/nfs/statd/state: Suc=
cess&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;error retry time-out =3D&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;logind: cannot setup systemd-logind helper (=
-61), using legacy<br>
&gt; fallback&quot;,<br>
&gt; -=C2=A0 =C2=A0 &quot;Error changing net interface name &#39;eth0&#39; =
to &quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;Error changing net interface name &#39;eth0&#39; =
to &quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;modeset(0): Failed to initialize the DRI2 extensi=
on&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;uvesafb: cannot reserve video memory at&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 &quot;uvesafb: probe of uvesafb.0 failed with error&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 &quot;glamor initialization failed&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ]<br>
&gt;=C2=A0 <br>
<br>
parselogs test is used not only for qemu but for other MACHINES as well<br>
including genericx86 on actual hardware where glamor initialization<br>
error might need looking into. Perhaps this should be added to qemu<br>
specific parts of this test only?<br></blockquote><div><br></div><div>=C2=
=A0That&#39;s right as well. Let&#39;s add the messages to qemux86 parts, a=
nd see if other qemu targets need this as well.</div><div><br></div><div>Al=
ex<br></div></div></div>

--000000000000b46d180591543aa2--
