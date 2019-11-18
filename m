Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9218F7CB4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 12:41:19 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id r22so5164085uam.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RItr7PEldI05614Uu4pFAZ5/XZkK9EzhgJjKfnWjM0Q=;
	b=lj4bKl8/12ky0RsupUMjJJXWXfEJB/ElyKoMku0OA7+RXAz1R71htqViI2yZBzRvZj
	hCibTd8fr0nVB/wkgtcOToS/nMjdMapbg2h0ErEJsjaans8ncIEwUeW+bL6DJ87ccFew
	aj4QF9VtNKtjwOwbZhjgT9+OnP0MkYozwbq9d3OetXQ1qNz0v4hZoaq00w2uOY8DFbtA
	K8Dz2Fa+rjxlE9eSjFPCe8dONs2SbzxIBLPbLJijWwMiM3nhs8GruG7Q+suWnAR1W+Hd
	2wTisS/+BGJb5DoYMJtzl64Qmi9prVD7mnuY12kFDHE+vCE/euax6ZWDi0e0YHW9SRe3
	dUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RItr7PEldI05614Uu4pFAZ5/XZkK9EzhgJjKfnWjM0Q=;
	b=IDeMM5nZoQB60f/5iUAoNQPsiC90vRE2iXhOe3X8Wsegs2Std6q7LyyexhcyBRv7vS
	YIENoZyhQPqcoU7Mxee9jKXKG9piOmha0idl/648DtvB3nOihr/97Pqy3vu/fpIFVzcj
	t6cXiHLWCQZ/Bi5ntW39L/6wynCHV1ZXXjpPnFBzpN/TxdrTJKrEENkgiPlYTsC1LGJJ
	Gd2CbaogUyyHte55Uhh/m+JoSG222P/f3PnPAmOo+pvtoVN4/iPQdZrrrZMBnWfx2+5L
	ELzLmehdXbqF2dM+rUxY3pjeAYkvw/9uM0U4BQ6TsG6q7GpREnHECrsPu6tCsuC1lVUg
	qMjg==
X-Gm-Message-State: APjAAAXJcnRKWDDmt3N41soys45mupF5KKH3OB4jhJfcYKB90DqF9Tzx
	SjGfkZ0dTHmwMdnZdzMvmr+3vc0SVG3LBUY4fI4uWg==
X-Google-Smtp-Source: APXvYqw/0vKUGVg1gAba1oGdXWDIjDqaPgnoin9qN5l0bdLHnjolbvPqbFD2Hm6MNqVlqHNiugvGBDAoRMOxzTvo0u0=
X-Received: by 2002:ab0:644c:: with SMTP id j12mr15963454uap.22.1574080879411; 
	Mon, 18 Nov 2019 04:41:19 -0800 (PST)
MIME-Version: 1.0
References: <1568938409-5070-1-git-send-email-jaewon.lee@xilinx.com>
	<BYAPR02MB5816E371E89C380F99923768AF9C0@BYAPR02MB5816.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB5816E371E89C380F99923768AF9C0@BYAPR02MB5816.namprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Nov 2019 13:41:08 +0100
Message-ID: <CANNYZj8VJsB+EYnmpTTwnmifJNw6sUoAvb+FsNBEMC+LMH2jAQ@mail.gmail.com>
To: Jaewon Lee <JAEWON@xilinx.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] standard.py: Not filtering devtool workspace for devtool finish
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
X-List-Received-Date: Mon, 18 Nov 2019 12:41:19 -0000
Content-Type: multipart/alternative; boundary="000000000000aa469b05979e4329"

--000000000000aa469b05979e4329
Content-Type: text/plain; charset="UTF-8"

Unfortunately this broke 'devtool upgrade' functionality, where 'devtool
finish' erroneously rewrites SRC_URI to no longer include the path to the
remote tarball.

I will have to send a revert for this.

Alex

On Thu, 3 Oct 2019 at 01:10, Jaewon Lee <JAEWON@xilinx.com> wrote:

> ping
>
> > -----Original Message-----
> > From: Jaewon Lee <jaewon.lee@xilinx.com>
> > Sent: Thursday, September 19, 2019 5:13 PM
> > To: openembedded-core@lists.openembedded.org;
> > paul.eggleton@linux.intel.com; Manjukumar Harthikote Matha
> > <MANJUKUM@xilinx.com>; Alejandro Enedino Hernandez Samaniego
> > <alejandr@xilinx.com>
> > Cc: Jaewon Lee <JAEWON@xilinx.com>
> > Subject: [OE-core][master][PATCH] standard.py: Not filtering devtool
> > workspace for devtool finish
> >
> > All devtool commands right now are filtering out the devtool workspace
> > bbappends in build/workspace/appends when calling parse_recipe. While
> > this may make sense for devtool add and modify, we need devtool finish to
> > include those appends.
> >
> > A specific breakage that is caused because devtool finish filters devtool
> > appends is the cmake/cml1 flow where a file is created in the WORKDIR
> that
> > finish needs access to, to commit those files. Particularly for git
> packages with
> > SRCPV in PV, SRCPV is only changed to 999 when using external source,
> > hence when creating the cfg or cmake config files using for instance
> bitbake -
> > c diffconfig, these files are created in the
> > git999 workdir correctly (as in the devtool bbapends, we are inheriting
> > externalsrc class). But when devtool finish is run, the devtool appends
> are
> > not parsed, hence SRCPV is not changed to 999 and devtool is looking for
> the
> > fragment files in the wrong WORKDIR.
> >
> > Changing the parse_recipe call just in devtool finish to not filter out
> the
> > devtool workspace.
> >
> > Fixes [YOCTO #13533]
> >
> > Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> > ---
> >  scripts/lib/devtool/standard.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> > index 9eeaefb..e87b433 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -2011,7 +2011,7 @@ def finish(args, config, basepath, workspace):
> >      no_clean = False
> >      tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
> >      try:
> > -        rd = parse_recipe(config, tinfoil, args.recipename, True)
> > +        rd = parse_recipe(config, tinfoil, args.recipename, True,
> > + False)
> >          if not rd:
> >              return 1
> >
> > --
> > 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000aa469b05979e4329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unfortunately this broke &#39;devtool upgrade&#39; fu=
nctionality, where &#39;devtool finish&#39; erroneously rewrites SRC_URI to=
 no longer include the path to the remote tarball.</div><div><br></div><div=
>I will have to send a revert for this.</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, 3 Oct 2019 at 01:10, Jaewon Lee &lt;<a href=3D"mailto:JAEWON@xi=
linx.com">JAEWON@xilinx.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">ping<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Jaewon Lee &lt;<a href=3D"mailto:jaewon.lee@xilinx.com" target=
=3D"_blank">jaewon.lee@xilinx.com</a>&gt;<br>
&gt; Sent: Thursday, September 19, 2019 5:13 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a>;<br>
&gt; <a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pau=
l.eggleton@linux.intel.com</a>; Manjukumar Harthikote Matha<br>
&gt; &lt;<a href=3D"mailto:MANJUKUM@xilinx.com" target=3D"_blank">MANJUKUM@=
xilinx.com</a>&gt;; Alejandro Enedino Hernandez Samaniego<br>
&gt; &lt;<a href=3D"mailto:alejandr@xilinx.com" target=3D"_blank">alejandr@=
xilinx.com</a>&gt;<br>
&gt; Cc: Jaewon Lee &lt;<a href=3D"mailto:JAEWON@xilinx.com" target=3D"_bla=
nk">JAEWON@xilinx.com</a>&gt;<br>
&gt; Subject: [OE-core][master][PATCH] standard.py: Not filtering devtool<b=
r>
&gt; workspace for devtool finish<br>
&gt; <br>
&gt; All devtool commands right now are filtering out the devtool workspace=
<br>
&gt; bbappends in build/workspace/appends when calling parse_recipe. While<=
br>
&gt; this may make sense for devtool add and modify, we need devtool finish=
 to<br>
&gt; include those appends.<br>
&gt; <br>
&gt; A specific breakage that is caused because devtool finish filters devt=
ool<br>
&gt; appends is the cmake/cml1 flow where a file is created in the WORKDIR =
that<br>
&gt; finish needs access to, to commit those files. Particularly for git pa=
ckages with<br>
&gt; SRCPV in PV, SRCPV is only changed to 999 when using external source,<=
br>
&gt; hence when creating the cfg or cmake config files using for instance b=
itbake -<br>
&gt; c diffconfig, these files are created in the<br>
&gt; git999 workdir correctly (as in the devtool bbapends, we are inheritin=
g<br>
&gt; externalsrc class). But when devtool finish is run, the devtool append=
s are<br>
&gt; not parsed, hence SRCPV is not changed to 999 and devtool is looking f=
or the<br>
&gt; fragment files in the wrong WORKDIR.<br>
&gt; <br>
&gt; Changing the parse_recipe call just in devtool finish to not filter ou=
t the<br>
&gt; devtool workspace.<br>
&gt; <br>
&gt; Fixes [YOCTO #13533]<br>
&gt; <br>
&gt; Signed-off-by: Jaewon Lee &lt;<a href=3D"mailto:jaewon.lee@xilinx.com"=
 target=3D"_blank">jaewon.lee@xilinx.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/devtool/standard.py | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/sta=
ndard.py<br>
&gt; index 9eeaefb..e87b433 100644<br>
&gt; --- a/scripts/lib/devtool/standard.py<br>
&gt; +++ b/scripts/lib/devtool/standard.py<br>
&gt; @@ -2011,7 +2011,7 @@ def finish(args, config, basepath, workspace):<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 no_clean =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tra=
cking=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rd =3D parse_recipe(config, tinfoil, args=
.recipename, True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rd =3D parse_recipe(config, tinfoil, args=
.recipename, True,<br>
&gt; + False)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not rd:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
&gt; <br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000aa469b05979e4329--
