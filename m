Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2407974797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 15:37:28 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id a6-v6so16608911oia.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EUgh+0qu85kGeG9LYZEQ4W9OXtKQAMXS1ezqDI9cm7E=;
	b=KT0cVvzeiBZtQNYKyHHISjPD0aradz4D+XTnHhGanU90fOms62CPcDVmKT/0V8XJih
	0oIvXdVDr4shlNvi2sq5sVjKAOcWgGZVvA7UhZnoEIbbeGz5b4UizqkmtZv+OKfn7mCv
	RbFC5IdbSRNIDedi//I4WcoBfhOwgmSjnXuELiYAY0DNH9IuyZcEEXVqXT5x44TEN8tN
	RPzD6W1eKgowpyiQgOXJwDumyHMLWVMVBqnK8ot256bQ2eTi1LPhIDh7kZ5YOKbbni0d
	Y1ANIjARJaCt5SufQChz5bwH3W1LAVPn5QYY3KqVzoXGnxswIfhoQWeAQP0ejrQFrUih
	GqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EUgh+0qu85kGeG9LYZEQ4W9OXtKQAMXS1ezqDI9cm7E=;
	b=k24HaYdIcqD3toPkUVdI4Xu+dkO6n4QmzQuLuNjZTkcjagMJgle9fFF0ZgmqyVzUzm
	hCieEy0YtSKgbIygEIdBL0SgcZn8uZ7ult2j5DlQLcKbfz3q2z7eNJUFZKsk4i+OTOPb
	PFgGZai2m73gg1XNEGVTVmeSeHOBPVLJUmamWEjH9KWrpRDPZ2qprFlf5ra38GbQBgfg
	EeXiW6NPpMvcRwLSeKH3mgUI9VOa8ThgANUXTYjyplyJMXrbG4/mWbjhrjlF1uftwVuu
	3cx8v5Ak4LJbaefeGC381mZ4Ukl5J9xrWeVJuJ3d8ZHcQtZwudJ9xout1nvny6NdXpsA
	0pWg==
X-Gm-Message-State: ALKqPwfdm7dQAkE/h3ITKWTODOgkl4wv64aacGWQO8avPfCwt7xVjUTP
	QwEi1scPbQZNrcA4F2p3k+iRo7t+ytSEKi4wXtg=
X-Google-Smtp-Source: AB8JxZqrdrpb/UcdfVEHeO59tMCuxYbMLZQY3G+tXxwnfpwpz5Ecx1c+nUzdpqFSVRwuRgueFjPT0rb8ie44hpnK18w=
X-Received: by 2002:aca:3d05:: with SMTP id
	k5-v6mr15220444oia.302.1527003449798; 
	Tue, 22 May 2018 08:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
	<44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
In-Reply-To: <44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 22 May 2018 08:37:19 -0700
Message-ID: <CABcZANmAM5=5W1_BWFC6BG6kwR8SY=HMYXyCFTzKVQrJ-imY2Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-init-bashrc: add more user-friendly oe-setup utility
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
X-List-Received-Date: Tue, 22 May 2018 15:37:29 -0000
Content-Type: multipart/alternative; boundary="00000000000032345d056ccd322e"

--00000000000032345d056ccd322e
Content-Type: text/plain; charset="UTF-8"

I agree, there are a ton of build dir and project management tools, without
information about the use cases satisfied and why it's superior to
alternatives, much less why you think it belongs in oe-core as opposed to
all the other tools folks use, which would imply tactit approval as the
official method, particularly going into scripts instead of contrib, I
doubt this is going anywhere.

On Mon, May 21, 2018 at 12:04 PM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 05/21/2018 06:55 PM, Jens Rehsack wrote:
> > Move scripts/bashrc from meta-jens/scripts to oe-core to share
> user-friendly
> > oe builddir management with community. Using this script will help manage
> > multiple BSPs and targets like perl developers using perlbrew.
>
> Please explain in detail what this does, and why is it superior to
> existing tools. What are the typical usage scenarios? Where and how this
> should be documented and tested? It is not a good idea to just add
> something into scripts/, as no one will know or use it, and so it will
> just quietly bitrot.
>
> > +__oe_check_py () {
> > +    # Make sure we're not using python v3.x. This check can't go into
> > +    # sanity.bbclass because bitbake's source code doesn't even pass
> > +    # parsing stage when used with python v3, so we catch it here so we
> > +    # can offer a meaningful error message.
> > +    py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
> > +    if [ "$py_v3_check" != "" ]; then
> > +        echo >&2 "Bitbake is not compatible with python v3"
> > +        echo >&2 "Please set up python v2 as your default python
> interpreter"
> > +        return 1
> > +    fi
>
> Bitbake has in fact been compatible with Python 3.x for several
> releases. The above check is not particularly useful, as /usr/bin/python
> nearly always points to a 2.x version.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000032345d056ccd322e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I agree, there are a ton of build dir and project manageme=
nt tools, without information about the use cases satisfied and why it&#39;=
s superior to alternatives, much less why you think it belongs in oe-core a=
s opposed to all the other tools folks use, which would imply tactit approv=
al as the official method, particularly going into scripts instead of contr=
ib, I doubt this is going anywhere.<br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr">On Mon, May 21, 2018 at 12:04 PM Alexander Kanavin &lt;<a=
 href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.=
intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 05/21=
/2018 06:55 PM, Jens Rehsack wrote:<br>
&gt; Move scripts/bashrc from meta-jens/scripts to oe-core to share user-fr=
iendly<br>
&gt; oe builddir management with community. Using this script will help man=
age<br>
&gt; multiple BSPs and targets like perl developers using perlbrew.<br>
<br>
Please explain in detail what this does, and why is it superior to <br>
existing tools. What are the typical usage scenarios? Where and how this <b=
r>
should be documented and tested? It is not a good idea to just add <br>
something into scripts/, as no one will know or use it, and so it will <br>
just quietly bitrot.<br>
<br>
&gt; +__oe_check_py () {<br>
&gt; +=C2=A0 =C2=A0 # Make sure we&#39;re not using python v3.x. This check=
 can&#39;t go into<br>
&gt; +=C2=A0 =C2=A0 # sanity.bbclass because bitbake&#39;s source code does=
n&#39;t even pass<br>
&gt; +=C2=A0 =C2=A0 # parsing stage when used with python v3, so we catch i=
t here so we<br>
&gt; +=C2=A0 =C2=A0 # can offer a meaningful error message.<br>
&gt; +=C2=A0 =C2=A0 py_v3_check=3D`/usr/bin/env python --version 2&gt;&amp;=
1 | grep &quot;Python 3&quot;`<br>
&gt; +=C2=A0 =C2=A0 if [ &quot;$py_v3_check&quot; !=3D &quot;&quot; ]; then=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &gt;&amp;2 &quot;Bitbake is not comp=
atible with python v3&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &gt;&amp;2 &quot;Please set up pytho=
n v2 as your default python interpreter&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; +=C2=A0 =C2=A0 fi<br>
<br>
Bitbake has in fact been compatible with Python 3.x for several <br>
releases. The above check is not particularly useful, as /usr/bin/python <b=
r>
nearly always points to a 2.x version.<br>
<br>
Alex<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--00000000000032345d056ccd322e--
