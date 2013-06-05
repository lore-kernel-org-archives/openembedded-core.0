Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id A1DCA6041D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 20:36:31 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so3360788obc.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 13:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=A0NIRHSpvwdyM7Uio6UjDpJ2XTZ1w9O7aIrXeW0j2HA=;
	b=JfJ+8cpIRjFGtJ4VJkP0Jrn6nikysATs/76lPtrrjO9RVOkR1R+22N+/BPXqFYK6G4
	+AscCDZX2G8wTHcf0q8HaYMF3JW5SP54RtJdrsQs4INn+2e9L4XrWRflILS2RhE/nMlc
	ZhwKjzqqMB4Y1NPQfUGPk12pH+IHJefvMh39g0/pvxKiGxy7Oc8TbgNbdcv+xkYWqxSd
	9nM+3P+FYbtq4X0D8pt6bm+ia17iWOqwROrlGIfqFe/9sawMIkIYoi+cGjPKreCQ5Y5Q
	4eSYHhEqb18C0e/FTjcxhx8hQreSub3S2LSeVjWQIGGG0XzrhxCHyUDmdkrmxiXTVN0k
	QzVg==
MIME-Version: 1.0
X-Received: by 10.60.125.201 with SMTP id ms9mr14487228oeb.65.1370464591929;
	Wed, 05 Jun 2013 13:36:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 5 Jun 2013 13:36:31 -0700 (PDT)
In-Reply-To: <20130605201227.GG10298@denix.org>
References: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
	<20130605201227.GG10298@denix.org>
Date: Wed, 5 Jun 2013 17:36:31 -0300
X-Google-Sender-Auth: EURTja6hphBHGf9HySE9zEWOPws
Message-ID: <CAP9ODKqf3D8580Ocr5iVKG5dY59az9VgR=PPAF2y-O+kGVZ+vQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Simplify tune-cortexa*.inc, and add cortex-a5 tuning
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
X-List-Received-Date: Wed, 05 Jun 2013 20:36:32 -0000
Content-Type: multipart/alternative; boundary=047d7b5d23922e37ec04de6e272a

--047d7b5d23922e37ec04de6e272a
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 5:12 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Jun 05, 2013 at 11:52:28AM -0400, Andy Voltz wrote:
> > This series puts the common tuning setup in an include and reworks the
> > tuning files for each cortex-a* series to use that include. A new
> variable,
> > CORTEX_ID is used to specify which processor is used.
> >
> > Add a tuning file for the cortex-a5 using this include.
>
> And what about 53, 57 and the newly announced 12? :)
>

One fix at time ;-) Andy is adding A5 as he will send the Vybrid for
inclusion in meta-fsl-arm.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b5d23922e37ec04de6e272a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 5:12 PM, Denys Dmytriyenko <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Jun 05, 2013 at 11=
:52:28AM -0400, Andy Voltz wrote:<br>
&gt; This series puts the common tuning setup in an include and reworks the=
<br>
&gt; tuning files for each cortex-a* series to use that include. A new vari=
able,<br>
&gt; CORTEX_ID is used to specify which processor is used.<br>
&gt;<br>
&gt; Add a tuning file for the cortex-a5 using this include.<br>
<br>
</div>And what about 53, 57 and the newly announced 12? :)<br></blockquote>=
<div><br></div><div style>One fix at time ;-) Andy is adding A5 as he will =
send the Vybrid for inclusion in meta-fsl-arm.=A0</div></div><div><br></div=
>
-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blan=
k">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projeto=
s.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><=
br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b5d23922e37ec04de6e272a--
