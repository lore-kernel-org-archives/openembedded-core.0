Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 59FFA787D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Feb 2018 22:46:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1519598790; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=kYbt6R8OZ8o6CbOLkbDmd3zf2MxMDEFF4M69t7spjRI=;
	b=fq423HfIHCj2vRIYyQ0oJD/8QqQVALsHsaECxEh2bQ5Gc3hfb7niYR5Jnf0JgFeqtpN211i1
	o1XaUx8gdk9Fgxu2OeDVPY/7ScQwDUMP+KTRdgVSwhEEalcC6ada7VT9koQkKZgPFcWeFV55
	FgQAqQwOAUbllE9mDt6HbXWLjak=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mxa.mailgun.org with ESMTP id 5a933cc6.7fcbb818b730-smtp-out-n02;
	Sun, 25 Feb 2018 22:46:30 -0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id m13so12036715qtg.13;
	Sun, 25 Feb 2018 14:46:29 -0800 (PST)
X-Gm-Message-State: APf1xPDrwRfo2TmjbRHixJQEOd5a6z3VgYTfEGcnGA3A6IlcqWTKhiqW
	x4CqCeJVvs1Q2tJyzS2v15UKol3UOxSJbDVRdxY=
X-Google-Smtp-Source: AG47ELsWOIzGSZJANSs/Tq9zxh4M2+VBaVL9oM8nfy9FgWABXAB/6v8PZfYB/b9ZVEl3ajTVZK43YZG5efEeZ1Gjaok=
X-Received: by 10.200.6.5 with SMTP id d5mr14971934qth.205.1519598789098; Sun,
	25 Feb 2018 14:46:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.75 with HTTP; Sun, 25 Feb 2018 14:46:28 -0800 (PST)
In-Reply-To: <CADNbA1rnfQfQJ-78WFXdJHeZKGQXPnQ+hUY1zFi0SEDRiew4ig@mail.gmail.com>
References: <966e95a6-4401-5c12-b69c-9bd37bb236fd@gmail.com>
	<CADNbA1rnfQfQJ-78WFXdJHeZKGQXPnQ+hUY1zFi0SEDRiew4ig@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Sun, 25 Feb 2018 17:46:28 -0500
X-Gmail-Original-Message-ID: <CADNbA1q9b5+ehN=d=p+ymLYKnRBWR6SwgVaqfU=hNhiwxU4WFg@mail.gmail.com>
Message-ID: <CADNbA1q9b5+ehN=d=p+ymLYKnRBWR6SwgVaqfU=hNhiwxU4WFg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: [RFC] meta-openembedded/meta-oe re-org
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
X-List-Received-Date: Sun, 25 Feb 2018 22:46:29 -0000
Content-Type: multipart/alternative; boundary="f403043b00f80681dd0566112a93"

--f403043b00f80681dd0566112a93
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 24, 2018 at 12:56 PM, akuster808 <akuster808@gmail.com> wrote:

> Hello,
>
> I am planning on moving some recipes to new locations that are more
> in-line with their function.
>
> Also, I plan on adding *-shells, *-dbs, *-security and *.crypto and
> moving the appropriate recipes there.


I can take maintenance of *-shells and *-dbs once you merge things in
unless someone else wants to take them on.

-Derek


> This might help facilitate folks signing up to maintain a grouping like
> recipes-crypto if that is their thing.
>
>
> I will be sending out patches later today for review.
>
> I have staged the changes @
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?
> h=akuster/meta-oe-reorg
>
> - armin
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403043b00f80681dd0566112a93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Sat, Feb 24=
, 2018 at 12:56 PM, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akus=
ter808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I am planning on moving some recipes to new locations that are more<br>
in-line with their function.<br>
<br>
Also, I plan on adding *-shells, *-dbs, *-security and *.crypto and<br>
moving the appropriate recipes there.</blockquote><div>=C2=A0</div><div>I c=
an take maintenance of *-shells and *-dbs once you merge things in unless s=
omeone else wants to take them on.</div></span><span class=3D"HOEnZb"><font=
 color=3D"#888888"><div><br></div><div>-Derek</div></font></span><span clas=
s=3D""><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
This might help facilitate folks signing up to maintain a grouping like<br>
recipes-crypto if that is their thing.<br>
<br>
<br>
I will be sending out patches later today for review.<br>
<br>
I have staged the changes @<br>
<a href=3D"http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3D=
akuster/meta-oe-reorg" rel=3D"noreferrer" target=3D"_blank">http://cgit.ope=
nembedded.org/m<wbr>eta-openembedded-contrib/log/?<wbr>h=3Dakuster/meta-oe-=
reorg</a><br>
<br>
- armin<br>
<span class=3D"m_4250717216032953116HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></span></div><br></div></div>
</div><br></div>

--f403043b00f80681dd0566112a93--
