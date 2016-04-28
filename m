Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0427165C5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 16:11:26 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id rc4so4820482igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=2oaowknEihGSwPd5xUh63VzUHr1X/B/WYMJNzuDuU/0=;
	b=H4+rgxi1cbibgi6jBzzbTPHguRXqQFI5sIEvEnWvdfrp/7hTVhEJleZwQEGetaafjQ
	doILCABE40bnFVRAQfD3li2TLbBvHUkhfzhfmGS6bi3/NQ9p6C194Ea5Y69eP/wNZeXl
	bxcWls5Y8NQ+ggjM/Wz1V9zdY2I6HLMbNYyM82L8VSoS3yey+5RZ8Kh0ThqDrH0OUu6p
	ZasvUxs7sIrsYlU0EoR6NgBBqjdVmKSpy9kAkW03IP3nHNJcAXcnNje0ngGEnQKwYXuu
	rh9/DqlIhSbddSvy/IFZE80NsigHjvReTQH7SEFDPXULVaVISm9tQ09ShH0YMKrHBMBK
	YUWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=2oaowknEihGSwPd5xUh63VzUHr1X/B/WYMJNzuDuU/0=;
	b=soj23cZEezUIA6kFZ87Tyfmhe27Jb3HQ7WFjWNx+PnLcUlPDEZFmACc/tC61oOqaN+
	dVezZiP1zi63z0lvYK7omK3GHphsU4jNiNxbUkNfN3DZPana3gACxan4NnqajOGo/UO0
	TLN6hh6hqpr9fHWnrx/DVQWgCbYQrWB9Y46vE4F5l9LzUc5kxrSIPrL2cQcA8GebYIsC
	B4Gm+Ylsai0/W6Es2WDKk4clKivFd26NfVumsknRSfSa8P9qmo7i2oN7Ixk0pbWi8MNY
	NzDydcNbHDOvJHIa04ww3fgCLerMYWOLVcFunHgatIww8MoXGtzyp6HQ1Inan/h0nGXk
	MjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=2oaowknEihGSwPd5xUh63VzUHr1X/B/WYMJNzuDuU/0=;
	b=dpMnTnbAGQYCyipdL0UP9LH08YmMsFhYSd4+6QJ+Hsyv49iMgIzIyy9nmjStnwzbeu
	sjI2XYum8ONYVwy8bEqGDVMyXxkvFO1Wg/8qRxUEoVtLri957fw5pHFu3dl1dm2J6ES8
	cEFQsxZRYCxShiSIDKUrxR5xqNrhELaNrrglcIHo55tJOJWvTsx+ewRGXqRwhy4V84SA
	sp+N6JLGQEVMUnEjbb0vipIUSLTQNljk4a9q+LRwXcRpoNuhqQaDzPxG7ItC583jm3wk
	J1R3nO4fT2XqFLAIVYtY1yh58vC2umv65NTx8aUo4ikxLNiWsophSWyso179nObxS2cN
	4O1Q==
X-Gm-Message-State: AOPr4FXjJeZ27evJP2JVlvBwmVdJQEHW9wrt6BclGe84HFgiaLO9hnndsx8Zu7NS87clc8p0r8uKYUzmw6m58Q==
X-Received: by 10.50.3.66 with SMTP id a2mr35883403iga.87.1461859886261; Thu,
	28 Apr 2016 09:11:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Thu, 28 Apr 2016 09:11:06 -0700 (PDT)
In-Reply-To: <fe76014a152542ac8ef2113f0406524d@XBOX02.axis.com>
References: <cover.1461700116.git.pkj@axis.com>
	<80df31c476967370f13a104cc5a777cd5127ef1b.1461700116.git.pkj@axis.com>
	<CABcZANmw0D1xZsFQZYYxyQDwbj3P_8Ab1CO0k52f2XpKbUUwFg@mail.gmail.com>
	<fe76014a152542ac8ef2113f0406524d@XBOX02.axis.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 28 Apr 2016 09:11:06 -0700
X-Google-Sender-Auth: ck3Kik1W3yHyFgClvAp5l5QP9E8
Message-ID: <CABcZAN=gOTC06DM5jAntbt6iPaf35J5ydy9gHtw8ZRpR7BCGxw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo
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
X-List-Received-Date: Thu, 28 Apr 2016 16:11:29 -0000
Content-Type: multipart/alternative; boundary=089e013d06e63b714805318dc72e

--089e013d06e63b714805318dc72e
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 28, 2016 at 7:34 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Yes, it was intentional. I mentioned this in the cover letter. I can of
> course add something about it to the commit message as well if you like.
>

That's what a commit message is for, yes, to describe why something is
being changed. The cover letter isn't going to end up in the git history.
If it hasn't yet been merged, I think it'd be nice to get it improved, so
someone looking at the logs later understands the intention. Thanks.


>
> -    scms = [base_get_metadata_git_revision, \
> -            base_get_metadata_svn_revision]
> +    scms = [base_get_metadata_git_revision]
>
>
>
> Was this change intended? Because it doesn't match up with the commit
> message, as far as I can see.
>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013d06e63b714805318dc72e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Apr 28, 2016 at 7:34 AM, Peter Kjellerstedt <span =
dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_b=
lank">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><div class=3D"gm=
ail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#943634">Yes, it was intentional. I mentioned =
this in the cover letter. I can of course add something about it to the com=
mit message as well if you like.</span></p></div></div></blockquote><div><b=
r></div><div>That&#39;s what a commit message is for, yes, to describe why =
something is being changed. The cover letter isn&#39;t going to end up in t=
he git history. If it hasn&#39;t yet been merged, I think it&#39;d be nice =
to get it improved, so someone looking at the logs later understands the in=
tention. Thanks.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex"><div lang=3D"EN-US"=
 link=3D"blue" vlink=3D"purple"><div><div style=3D"border-style:none none n=
one solid;border-left-color:blue;border-left-width:1.5pt;padding:0cm 0cm 0c=
m 4pt"><div><div class=3D"h5"><div><div><div><blockquote style=3D"border-st=
yle:none none none solid;border-left-color:rgb(204,204,204);border-left-wid=
th:1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm"><p class=
=3D"MsoNormal">
<br>
-=C2=A0 =C2=A0 scms =3D [base_get_metadata_git_revision, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_get_metadata_svn_revision]<=
br>
+=C2=A0 =C2=A0 scms =3D [base_get_metadata_git_revision]<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Was this change intended? Because it doesn&#39;t mat=
ch up with the commit message, as far as I can see.</p></div></div></div></=
div></div></div></div></div></div></blockquote></div>-- <br><div class=3D"g=
mail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div>
</div></div>

--089e013d06e63b714805318dc72e--
