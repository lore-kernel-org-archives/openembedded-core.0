Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 24B4A75032
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 15:24:27 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 21-v6so2222837oip.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BcLGc65CKa6ZhJDeg96gn5uI4cQd8/8bkW45lrw20rE=;
	b=r9BQQGcRnE0azEVs1THwvkjoDv0BtZtYx+ghLVSa2Bpnk6qe1/TtZmxeVOgFO2uWSD
	ZFtEque4Z3ELjW7NHcKeXjBynIbvRoQanc0YPfPdnEt69VSXCjow1bvsmD5wgWdH8AUK
	3XonuLbBZANEJ3vxOlhogvRupq6ONFq1aNS6xnEuGi/t0R9AJ0mQOgGdrMlOvQJ5XPMO
	KuzMSXTcf/7DzwLdSuetyr/wLPjhPNY7011DfsDP0pDX+7J3mRxnpCNVMz12oT7O39LV
	5ATA840uJxUEHvviZoaB1P95R4eaASotsi0C8DGp161c1j86m2H+9kpSDCGKN9MbaVrm
	drSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BcLGc65CKa6ZhJDeg96gn5uI4cQd8/8bkW45lrw20rE=;
	b=PlE/1Up4M4yJtGjiXGakVVFgG6YHdML33wTT43mV2LH0ZHhJRGlnQvmVDQgJV9wkwD
	EPSZFoiV4uDllnIiJaszCZaF8gAiLX+juenwW1k4WZy85Q0O4n5qiELiBq4o72QFL8q5
	o1MBX5YpUK9Gnq9Kt3SFIa9FVyf9ft8JIX38tkmTHKdcSmceK0gviN3oJqgBXZ7cwL9x
	B6/Ly6JtcuBHx/1hRmbUDOOIv+6meW/mQk812+DKcdgSYvbgtFlo2WHBPjqRo210qfR+
	2SMaxJ4+zeZ81DHY06EhFWo+X7frvXMYnxFGRvQ/hX535fEZbNLXkyxt0DAHTDpUsxmg
	LLwQ==
X-Gm-Message-State: APt69E2p/XF+Di5O2uZcqEnGPTyxDCzhfQq0kHlsu38/ip/4PRFDrquk
	M+iQDxvDAg2ZS82HDiOP1UZ/xziwIEBel7GeKag=
X-Google-Smtp-Source: AAOMgpfuLYsuSDzz1lAkOZ6mQl3vIiNwJKhf3pD07RIuJOdHg1uLmANBgmge1glJ2m+Cydwu1iNtTqbZQVAWtrarjpU=
X-Received: by 2002:aca:eb0f:: with SMTP id
	j15-v6mr3319435oih.85.1530113068929; 
	Wed, 27 Jun 2018 08:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1529604086.git.chris_larson@mentor.com>
	<dc42596e94fa1548971c5e4fe703eea79d5f2dfb.1529604086.git.chris_larson@mentor.com>
	<99ecf8bdd0075ba8dd826f0d0fcb1dfdf4228142.camel@linuxfoundation.org>
In-Reply-To: <99ecf8bdd0075ba8dd826f0d0fcb1dfdf4228142.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 27 Jun 2018 08:24:18 -0700
Message-ID: <CABcZANnmzwnK3RjomHfWOnFj2hsmmXsCvgU=WPPLSHRD3b_PGQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] oe.scriptutils.run_editor: ditch the error-prone argument quoting
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
X-List-Received-Date: Wed, 27 Jun 2018 15:24:28 -0000
Content-Type: multipart/alternative; boundary="000000000000f0995c056fa135d1"

--000000000000f0995c056fa135d1
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 27, 2018 at 5:52 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-06-22 at 02:07 +0500, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Rather than trying to construct a string by quoting the files in an
> > error-prone way, parse $EDITOR to pass a list to subprocess rather
> > than
> > a string.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  scripts/lib/scriptutils.py | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> > index 85b1c949bf5..470f76995f0 100644
> > --- a/scripts/lib/scriptutils.py
> > +++ b/scripts/lib/scriptutils.py
> > @@ -214,15 +215,14 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir,
> > logger, preserve_tmp=False, mirr
> >
> >  def run_editor(fn, logger=None):
> >      if isinstance(fn, str):
> > -        params = '"%s"' % fn
> > +        files = [fn]
> >      else:
> > -        params = ''
> > -        for fnitem in fn:
> > -            params += ' "%s"' % fnitem
> > +        files = fn
> >
> >      editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
> >      try:
> > -        return subprocess.check_call('%s %s' % (editor, params),
> shell=True)
> > +        print(shlex.split(editor) + files)
> > +        return subprocess.check_call(shlex.split(editor) + files)
> >      except subprocess.CalledProcessError as exc:
> >          logger.error("Execution of '%s' failed: %s" % (editor, exc))
> >          return 1
>
> I'm guessing you didn't mean to leave the print() above in?
>
> If the print is there, it breaks:
>
> "oe-selftest -r devtool.DevtoolTests.test_devtool_add"
>
> I can comment it out...
>

Yeah, that was a debug remnant, sorry about that. :\
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000f0995c056fa135d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Jun 27, 2018 at 5:52 AM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Fri, 2018-06-22 at 02:07 +0500, C=
hristopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; <br>
&gt; Rather than trying to construct a string by quoting the files in an<br=
>
&gt; error-prone way, parse $EDITOR to pass a list to subprocess rather<br>
&gt; than<br>
&gt; a string.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/scriptutils.py | 24 ++++++++++++------------<br>
&gt;=C2=A0 1 file changed, 12 insertions(+), 12 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py<b=
r>
&gt; index 85b1c949bf5..470f76995f0 100644<br>
&gt; --- a/scripts/lib/scriptutils.py<br>
&gt; +++ b/scripts/lib/scriptutils.py<br>
&gt; @@ -214,15 +215,14 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir,<=
br>
&gt; logger, preserve_tmp=3DFalse, mirr<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def run_editor(fn, logger=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if isinstance(fn, str):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 params =3D &#39;&quot;%s&quot;&#39; % fn<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D [fn]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 params =3D &#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fnitem in fn:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params +=3D &#39; &quot;%s&=
quot;&#39; % fnitem<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D fn<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 editor =3D os.getenv(&#39;VISUAL&#39;, os.getenv(&=
#39;EDITOR&#39;, &#39;vi&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return subprocess.check_call(&#39;%s %s&#=
39; % (editor, params), shell=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(shlex.split(editor) + files)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return subprocess.check_call(shlex.split(=
editor) + files)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 except subprocess.CalledProcessError as exc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot;Execution of &#39=
;%s&#39; failed: %s&quot; % (editor, exc))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
<br>
I&#39;m guessing you didn&#39;t mean to leave the print() above in?<br>
<br>
If the print is there, it breaks:<br>
<br>
&quot;oe-selftest -r devtool.DevtoolTests.test_devtool_add&quot;<br>
<br>
I can comment it out...<br clear=3D"all"></blockquote><div><br></div><div c=
lass=3D"">Yeah, that was a debug remnant, sorry about that. :\<br></div></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>k=
ergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>S=
enior Software Engineer, Mentor Graphics</div></div></div></div></div>

--000000000000f0995c056fa135d1--
