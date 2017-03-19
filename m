Return-Path: <avery.brian@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A73A47798D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 17:32:17 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id p189so33082841pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Mar 2017 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rx1iyKMx5AxgPUOpBdVuQdiId6S+LZkbVwTe8f0aEp8=;
	b=VKW3n6HdSCwbNoqyjO7PDZtfYg4TDv16RDP/85ljcYHl/RUDoZ2/hQHaaCd5M6FkYr
	h1uTWl/o+dsRtkJifMCY6jUaYDcfWo8XtY+xc3i3/5xsOyxsJ5ibxLl7eXd2XmGQJrlI
	Oct1xJcdM24s5EgUiy70Y8dmoJwOJReIO/pC/WrnIimWGiEGGb+LjuIv62VbfPmTrsud
	tpBsa9/XFbOksJKpYxpi/a6IsYKbBOPtOuTyy0zvcgZc+4/PCJKrfivgvPo9688oBmjI
	x5V52VaA6kjGiOwItYiDTyOxwfjs7L17DgSsv5a2zoXEd+08z1aDsq3nyxli+MAd4BW/
	oSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rx1iyKMx5AxgPUOpBdVuQdiId6S+LZkbVwTe8f0aEp8=;
	b=R+I/BeDajM5N57kN9Tq8dsEDiiEwFXMjnDsiQiDc9xfUv/1ZIcUZueSOM7BHzDZa4q
	lOj+ceYQe0/eyJA5XKZb2AoVm82+uUrd2R84Xr1O6PMsl2yccleD5AfAgr4NboxTHH1s
	Xd+FATgKhp0BywH+GrupTGsD1M4Y/M5UF8LmKgH4wvwW1cFk/1cafy0nNK90r9Q7w1gq
	AHBw0mJp7JNU5G0jk6CEarFEBjKguHktW4I5cWMpOcBaqxBNx/54rSUjWF2DlAViyp6P
	fQoTjsqmfD+9K8B3G59AVB5cUOlAoKzcya7ykcM2BT/eJ6EYSNoQ95bCY76f3Ey2QZ3Q
	ne5Q==
X-Gm-Message-State: AFeK/H0VQJmzrUcPL1Ewg1XgW0IiqUzMOZ5WioaHxKge8IrSvRJ4a256Q++60dmXUR3u5IC0ckFzwSUNl39Wdw==
X-Received: by 10.99.185.91 with SMTP id v27mr16655750pgo.65.1489944739599;
	Sun, 19 Mar 2017 10:32:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.176.228 with HTTP; Sun, 19 Mar 2017 10:32:19 -0700 (PDT)
In-Reply-To: <2585804f225c47279417a3859f6cc305@XBOX02.axis.com>
References: <cover.1489754655.git.brian.avery@intel.com>
	<2585804f225c47279417a3859f6cc305@XBOX02.axis.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Sun, 19 Mar 2017 10:32:19 -0700
Message-ID: <CAKV_0ej9O+Y9WNi1mej6eASEjjakn6QOrcRDPCoxhvUSGxAz8Q@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] gen-lockedsig-cache: catch os.link error V2
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
X-List-Received-Date: Sun, 19 Mar 2017 17:32:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c1bad32f05b61054b18cab7

--94eb2c1bad32f05b61054b18cab7
Content-Type: text/plain; charset=UTF-8

Thanks!
resubmitted as [PATCH V3 x/y] .
-b
an intel employee

On Fri, Mar 17, 2017 at 2:32 PM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > brian avery
> > Sent: den 17 mars 2017 13:50
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 0/1] gen-lockedsig-cache: catch os.link error
> V2
> >
> > If your sstate-cache directory is on a different filesystem from the
> > one your build is on, gen-lockedsig-cache fails which causes the esdk
> > creation to fail. This catches the hard link failure and does a copy in
> > those cases.
> >
> > This is a V2 because I took a copy/paste shortcut when I sent in the
> > last one and that went as well as I should have expected. This one is
> > sent from the machine it was tested on... My bad :(.
>
> Do not make the "V2" part of the subject, make it part of the PATCH
> prefix, e.g.:
>
>   [PATCH v2 0/1] gen-lockedsig-cache: catch os.link error
>
> Otherwise it will become part of the commit message where it does not
> make any sense (since there obviously is no V1 committed...)
>
> > -brian
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1bad32f05b61054b18cab7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks!<div>resubmitted as [PATCH V3 x/y] .</div><div>-b</=
div><div>an intel employee</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Fri, Mar 17, 2017 at 2:32 PM, Peter Kjellerstedt <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=
=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><span class=3D"">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; brian avery<br>
&gt; Sent: den 17 mars 2017 13:50<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH 0/1] gen-lockedsig-cache: catch os.link erro=
r V2<br>
&gt;<br>
&gt; If your sstate-cache directory is on a different filesystem from the<b=
r>
&gt; one your build is on, gen-lockedsig-cache fails which causes the esdk<=
br>
&gt; creation to fail. This catches the hard link failure and does a copy i=
n<br>
&gt; those cases.<br>
&gt;<br>
&gt; This is a V2 because I took a copy/paste shortcut when I sent in the<b=
r>
&gt; last one and that went as well as I should have expected. This one is<=
br>
&gt; sent from the machine it was tested on... My bad :(.<br>
<br>
</span>Do not make the &quot;V2&quot; part of the subject, make it part of =
the PATCH<br>
prefix, e.g.:<br>
<br>
=C2=A0 [PATCH v2 0/1] gen-lockedsig-cache: catch os.link error<br>
<br>
Otherwise it will become part of the commit message where it does not<br>
make any sense (since there obviously is no V1 committed...)<br>
<br>
&gt; -brian<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
//Peter<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c1bad32f05b61054b18cab7--
