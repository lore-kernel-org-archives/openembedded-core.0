Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 027B17FCA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:12:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id c4so8218443edl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oFSJcq/93znA4GwlmfaASOjSgSk1LkfjDuASaIjuc2o=;
	b=LFKZ9UAyDmLXKIXxloB8Dvju4AinVA4eL/Jcz9qr6hYFP7npjvfnb2TMTnXtQ7mgWG
	LNOdhKoCn/9O3kIDXilpXpSqlEni+4lcOoxjjtx3OhjuvePAbuvUBbO4xGHQcoHJNLy0
	kkkJlh/Z09ZkjIkRUnwuZF7a+ry8xGD9Af1YtS1fsVd/tVDYeMekUjRfx56a9cMgSOId
	9ZUxbdwWHTX5KgF+o88SpOO4AJwh4vvL5lzbv8BdvPeVOK/HUdRkn5F5zQwA15DUTuo3
	CDEs3JNMp0qoSoNenp7Cn++Ibd0eyee75wa+1Pdo5kZMm4D6nVw7x7fVUINfC48GGOCo
	e57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oFSJcq/93znA4GwlmfaASOjSgSk1LkfjDuASaIjuc2o=;
	b=nc1ZplR17JM7SPn/B+Tor45ghtc7q8xEp5w30xddGivEZ3A3DFxHiRGLpzA4rzc6Ep
	WJy96hjI98NNS9hGuhxj6Cldzg5N8opOuokzHxcfaqfsSz80leNDm2mV/07SzDGT2tRR
	IDJ8PTqnrKvrMU3TldC+NJhThXPIXcI/9ds05PkAiKwQIcrwcc+0b3bozEcrHduXTnBL
	ylKJKQXypphB/Ls13xYIDyWG5wvfTRHlYfTX/9KzCTFNKzyuIf2hvKESCe3joEEMEsZT
	3mQ8775qeYkzG8N5k53FLrF2WB9yAwTLrWtOnYrU5MNriULqNNz/dr0cQxWc4wejC5dd
	vmEQ==
X-Gm-Message-State: APjAAAVD2dJQYzDawbmjYXxvDtoFrtYQndnLawJoZ7tqWYkISnWlP5MI
	Rg6L5tI/4pJbmX8xoKGVoRgzy9IcumIZKPPNFnfI7u16
X-Google-Smtp-Source: APXvYqwIfGsB8LIMk5QF/2AqWUoVysmU3NHMYYy3+SArXbnUcQ4upabsb4ptEO5vUlg6S/vS6xPJqtM2Ir3YJ8eAU5w=
X-Received: by 2002:a50:fb18:: with SMTP id d24mr14217067edq.216.1572631928559;
	Fri, 01 Nov 2019 11:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1572341125.git.akuster808@gmail.com>
	<ba94d467df1cb0b67842408de3db193612aebdcd.1572341125.git.akuster808@gmail.com>
	<CAHtQpK501hXXF_iwe=SHVQkUvpvj4iPoym45CxD_piWfygEHEg@mail.gmail.com>
	<CAMKF1so_jt85yTaTznmBFreOEfB=E_-E_7T7i_rdVnb4-1ge4Q@mail.gmail.com>
In-Reply-To: <CAMKF1so_jt85yTaTznmBFreOEfB=E_-E_7T7i_rdVnb4-1ge4Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Nov 2019 18:12:00 +0100
Message-ID: <CA+chaQdtZNA0+RQFSv0MQg63PNXjnDe2taOFcbJz0ko3kM+Gxw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior 18/19] go: fix CVE-2019-16276
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
X-List-Received-Date: Fri, 01 Nov 2019 18:12:08 -0000
Content-Type: multipart/alternative; boundary="00000000000076deb405964ce7ec"

--00000000000076deb405964ce7ec
Content-Type: text/plain; charset="UTF-8"

I've reported the same yesterday:
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288638.html

and sent upgrade to match the minor version used in warrior to the one in
zeus (which resolves the patch to apply cleanly):
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/288656.html

I don't use go for anything, but go 1.11 was also updated in thud:
http://lists.openembedded.org/pipermail/openembedded-core/2019-October/287724.html
so I was assuming that this minor upgrade in 1.12 should be safe enough for
warrior as well.

Regards,

On Fri, Nov 1, 2019 at 6:40 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Nov 1, 2019 at 10:33 AM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> >
> > Hello Armin,
> >
> > On Tue, Oct 29, 2019 at 10:50 AM Armin Kuster <akuster808@gmail.com>
> wrote:
> > >
> > > From: Chen Qi <Qi.Chen@windriver.com>
> > >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > (cherry picked from commit e02e8fa2e82cceaaa6a433466f52f97b0984762a)
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > ---
> >
> > This  patch didn't apply clean on warrior, but same patch on master
> > seems to be OK. I got a hunk in transport_test.go which has been
> > resolved by build, but since this is security-related patch I wanted
> > to bring some attention here.
> >
>
> if its failing in testcase as a last report we can drop that if that
> hunk is not backportable.
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Regards,
> > Andrey.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000076deb405964ce7ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve reported the same yesterday:<div><a href=3D"http:=
//lists.openembedded.org/pipermail/openembedded-core/2019-October/288638.ht=
ml">http://lists.openembedded.org/pipermail/openembedded-core/2019-October/=
288638.html</a><br></div><div><br></div><div>and sent upgrade to match the =
minor version used in warrior to the one in zeus (which resolves the patch =
to apply cleanly):</div><div><a href=3D"http://lists.openembedded.org/piper=
mail/openembedded-core/2019-October/288656.html">http://lists.openembedded.=
org/pipermail/openembedded-core/2019-October/288656.html</a><br></div><div>=
<br></div><div>I don&#39;t use go for anything, but go 1.11 was also update=
d in thud:</div><div><a href=3D"http://lists.openembedded.org/pipermail/ope=
nembedded-core/2019-October/287724.html">http://lists.openembedded.org/pipe=
rmail/openembedded-core/2019-October/287724.html</a><br></div><div>so I was=
 assuming that this minor upgrade in 1.12 should be safe enough for warrior=
 as well.</div><div><br></div><div>Regards,</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 1, 2019 at 6:4=
0 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Fri, Nov 1, 2019 at 10:33 AM Andrey Zhizhikin &lt;<a href=3D"mailto:andre=
y.z@gmail.com" target=3D"_blank">andrey.z@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Armin,<br>
&gt;<br>
&gt; On Tue, Oct 29, 2019 at 10:50 AM Armin Kuster &lt;<a href=3D"mailto:ak=
uster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; (cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d=
3f)<br>
&gt; &gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmai=
l.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt; &gt; (cherry picked from commit e02e8fa2e82cceaaa6a433466f52f97b098476=
2a)<br>
&gt; &gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmai=
l.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt; This=C2=A0 patch didn&#39;t apply clean on warrior, but same patch on =
master<br>
&gt; seems to be OK. I got a hunk in transport_test.go which has been<br>
&gt; resolved by build, but since this is security-related patch I wanted<b=
r>
&gt; to bring some attention here.<br>
&gt;<br>
<br>
if its failing in testcase as a last report we can drop that if that<br>
hunk is not backportable.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt; --<br>
&gt; Regards,<br>
&gt; Andrey.<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000076deb405964ce7ec--
