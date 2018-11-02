Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9902279F7D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:48:55 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id d6-v6so2217209edi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xm67yt+9mByMuAQIBF9aIyuhjxJ/tqqSb25OZB0MPFg=;
	b=BzBhJgtz1RnsnwAfPKP/5181USkQ+M0RIbg2E8GULSMGDOPfqccucI03FOcyrYoIaj
	yV70OjH37EkgUt9jnSh22KukzxQP3HQENUHmSFrU6TqhtjHzZeWNk45+USUIyq7vTZam
	CKL6EGHkuajQDczRxH+WLc1DiOFYcejqbufrbwkrEoon+DEuE95/twdt+MMfFKNrRVVI
	yhIeGD5EPuR65E2W/X7ircQD+NIl6m8Su2C1niQAPFyjLA3jxS8NtmDROOJUSTjT4M2T
	eiSzRzyg1zqpQkUU3Rf/HuRlasXV9VoOt5BKpfzPm7yfWiO0xqvS0PExy+4bVUJWITq4
	wg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xm67yt+9mByMuAQIBF9aIyuhjxJ/tqqSb25OZB0MPFg=;
	b=PSO1imiYW9KTTqNXUGalM97eQ6F/1IISEII1YQ5kPEtAKJZ7Pii9OKY3u5L22EfWkj
	Ts/U1x//DsMYMT8n/uYPojbDbZwIeB5U3SDNFIsvTQ/leneVmjxbNn0ZNMH0zrv2lTXq
	Q937BNPRHAumi12AvFuzJgwiNkn5Q50Zt/dGMTQllmLrTIW8AYkI1zh8zRP/c11uQkCI
	iYe94H0qTY35uUWbPYKy+TOIVh5iBCmfyo4Y7ZC7DcZHzcKwtDpjdcTPlTvz4k/8Mfvz
	0EZFJSo2HLQ53Mv6IGyl5U8Tr5bOs6roK6HtZ/snzgt9PLluEmthTCKyustDCWFTf8hi
	LQhg==
X-Gm-Message-State: AGRZ1gIg1MgqCsC2ppcRjh0GzoEDr5Hx2fLiXD3QN5V+JlCv25bbnL4Q
	j/6LtMKflOB+4SnUazqTi3KP8Gep57vYEabDSg4=
X-Google-Smtp-Source: AJdET5fqioeY+4iay3Ve6zlH70KEuN97PIrv6KcZWdhgEKm6+1xZV/5YtHWY16h8xAzJcz+mKveQPmf02+6ELqFGm+Y=
X-Received: by 2002:a50:a2e7:: with SMTP id
	94-v6mr5808046edm.221.1541173736216; 
	Fri, 02 Nov 2018 08:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
	<59badcade81f4c09bc8d71210d2e7019@XBOX04.axis.com>
In-Reply-To: <59badcade81f4c09bc8d71210d2e7019@XBOX04.axis.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Fri, 2 Nov 2018 08:48:44 -0700
Message-ID: <CAFNP8OsyG+oNK-q_5GVpiCtUrwypTWOGH_2qOKtkPtDEVz2=JA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: 2.6 migration guide
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
X-List-Received-Date: Fri, 02 Nov 2018 15:48:55 -0000
Content-Type: multipart/alternative; boundary="000000000000159c940579b07956"

--000000000000159c940579b07956
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter,

Thanks
Scott

https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#migration-2.6-=
openssl-changes
https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#migration-2.6-=
security-changes

On Fri, Nov 2, 2018 at 8:10 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> In =E2=80=9C4.14.2. OpenSSL Changes=E2=80=9D, change =E2=80=9Cboth versio=
ns their dependency
> chains=E2=80=9D to =E2=80=9Cboth versions in their dependency chains=E2=
=80=9D.
>
> In =E2=80=9C4.14.4. Security Changes=E2=80=9D, change =E2=80=9Cfiles=E2=
=80=9D to =E2=80=9Cflags=E2=80=9D (twice).
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org <
> openembedded-core-bounces@lists.openembedded.org> *On Behalf Of *Scott
> Rifenbark
> *Sent:* den 30 oktober 2018 23:07
> *To:* Paul Eggleton <paul.eggleton@linux.intel.com>
> *Cc:* Yocto discussion list <yocto@yoctoproject.org>; openembedded-core <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] 2.6 migration guide
>
>
>
> Paul,
>
>
>
> Thanks for sending.
>
>
>
> Contributors....
>
>
>
> I have an initial section at
> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-th=
e-yocto-project-2.6-release,
> which is based on Richard's input.  I am sure there are more items.
>
>
>
> Thanks,
>
> Scott
>
>
>
> On Tue, Oct 23, 2018 at 2:14 PM Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
> Hi folks
>
> When Scott prepares the migration guide for a release, he usually looks t=
o
> me
> to collate the notable changes for it (those requiring user intervention)=
.
> I
> haven't prepared anything yet though and the 2.6 release is fast
> approaching.
> Can anyone who has been involved in or is aware of such changes in master
> for
> upcoming 2.6 (thud) make a note of it on the wiki in raw form on this pag=
e:
>
>   https://wiki.yoctoproject.org/wiki/FutureMigrationGuide
>
> Scott and I will take care of cleaning it up, so things added there don't
> need
> to be perfect.
>
> I will also be doing my usual trawl through the commits in the release fo=
r
> the
> more general changelog, so most things will get picked up that way, but
> it's
> really helpful if people with first-hand knowledge of the implications of
> some
> of these changes are involved in how they get documented.
>
> Thanks,
> Paul
>
> --
> Paul Eggleton
> Intel Open Source Technology Centre
>
>

--000000000000159c940579b07956
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Peter, <br></div><d=
iv><br></div><div>Thanks</div><div>Scott</div><div><br></div><div><a href=
=3D"https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#migration-=
2.6-openssl-changes">https://yoctoproject.org/docs/2.6/ref-manual/ref-manua=
l.html#migration-2.6-openssl-changes</a></div><div><a href=3D"https://yocto=
project.org/docs/2.6/ref-manual/ref-manual.html#migration-2.6-security-chan=
ges">https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#migration=
-2.6-security-changes</a><br></div></div></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Fri, Nov 2, 2018 at 8:10 AM Peter Kjellerstedt=
 &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple">
<div class=3D"m_6505188101295984849WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">In =E2=
=80=9C4.14.2. OpenSSL Changes=E2=80=9D, change =E2=80=9Cboth versions their=
 dependency chains=E2=80=9D to =E2=80=9Cboth versions in their dependency c=
hains=E2=80=9D.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">In =E2=
=80=9C4.14.4. Security Changes=E2=80=9D, change =E2=80=9Cfiles=E2=80=9D to =
=E2=80=9Cflags=E2=80=9D (twice).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">//Peter=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.=
org" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a>=
 &lt;<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Scott Rifenbark<br>
<b>Sent:</b> den 30 oktober 2018 23:07<br>
<b>To:</b> Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.co=
m" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;<br>
<b>Cc:</b> Yocto discussion list &lt;<a href=3D"mailto:yocto@yoctoproject.o=
rg" target=3D"_blank">yocto@yoctoproject.org</a>&gt;; openembedded-core &lt=
;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] 2.6 migration guide<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Paul,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for sending.=C2=A0 <u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Contributors....<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I have an initial section at <a href=3D"https://yoct=
oproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-projec=
t-2.6-release" target=3D"_blank">
https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-=
yocto-project-2.6-release</a>, which is based on Richard&#39;s input.=C2=A0=
 I am sure there are more items.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks, <u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Scott<u></u><u></u></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Oct 23, 2018 at 2:14 PM Paul Eggleton &lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi folks<br>
<br>
When Scott prepares the migration guide for a release, he usually looks to =
me <br>
to collate the notable changes for it (those requiring user intervention). =
I <br>
haven&#39;t prepared anything yet though and the 2.6 release is fast approa=
ching. <br>
Can anyone who has been involved in or is aware of such changes in master f=
or <br>
upcoming 2.6 (thud) make a note of it on the wiki in raw form on this page:=
<br>
<br>
=C2=A0 <a href=3D"https://wiki.yoctoproject.org/wiki/FutureMigrationGuide" =
target=3D"_blank">
https://wiki.yoctoproject.org/wiki/FutureMigrationGuide</a><br>
<br>
Scott and I will take care of cleaning it up, so things added there don&#39=
;t need <br>
to be perfect. <br>
<br>
I will also be doing my usual trawl through the commits in the release for =
the <br>
more general changelog, so most things will get picked up that way, but it&=
#39;s <br>
really helpful if people with first-hand knowledge of the implications of s=
ome <br>
of these changes are involved in how they get documented.<br>
<br>
Thanks,<br>
Paul<br>
<br>
-- <br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000159c940579b07956--
