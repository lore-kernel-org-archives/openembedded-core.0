Return-Path: <munagala.nareshbabu@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id E35C365D35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 16:23:14 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id y18so50791776itc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yzShizUbQytV7QgJ6KRywSTHsmQW1zZ73VHAUXrqRLc=;
	b=JBZ2SnVwjQ8azNaDOR6FQ8aL5SXoxtUTNKUsQMux7qJokBcAJLXedw79PDyeRJsBoa
	8x6/OHaG3/17oGiBGiBw6L7msMX9+RKT33Z6e1MaYvszl5LOthQS8zhCKwInysw05+fi
	65H+cWndatAYeC/lzU43R5jmgCM+uYC2Ea/tycwsiwsfsB6b92YQTr6e+VxBW7Bda1t5
	1DW//xG700aFkDRnbtz7dfMKtwy2ShLDDDHnHRX4z4lC3Ilwrh6EIcUryDLVBO2+uRyl
	5w2ffc2FExwED35caPycfr/DvQWLUFQkUQiJ8T+BUzn7bHcoLgnOXkiXFLQiAnA1qt3m
	vucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yzShizUbQytV7QgJ6KRywSTHsmQW1zZ73VHAUXrqRLc=;
	b=sGkaEkfe2HwFyLxzPVZk18f5apQfMdgGFykDhGwSm88EpKtSgSh65uB6A5dmqtBi2D
	LWdy9g5ezPcmcpS8/zUF/iyKgmnTJJhSYQUduCGdyLfsTrbrUknVcSqxev6gJDJBmwSB
	dAZ+vyHk0Bq6rV2jn59G+0M/wWP2p78wR+Ctm288fNtZKKrPasJmcPL2mwJ4f29MGB2q
	rb5KYvuoXAxt4rGWq/h6qjrIHmBZSNBDxOHpXOvI75bF+LaN1mWWMBcpJn1P8mDJvqKk
	yaRsUi1At4ufC50XQUfaPRAZVpqgYETdjunzA7MngVkRfu1qhUOP7gQVcTnwmIj9T3JH
	vZ3Q==
X-Gm-Message-State: AFeK/H1+GVfTpoROq0NJ9p13hKFYS9B8EFVqlA3Lr6aayjd28gdNjgEweldkQ8DspfUKmpf+LLl1lNB4DDzeDg==
X-Received: by 10.107.136.93 with SMTP id k90mr17034709iod.224.1490545395388; 
	Sun, 26 Mar 2017 09:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.159.212 with HTTP; Sun, 26 Mar 2017 09:23:14 -0700 (PDT)
In-Reply-To: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
References: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
From: Munagala Naresh <munagala.nareshbabu@gmail.com>
Date: Sun, 26 Mar 2017 21:53:14 +0530
Message-ID: <CACfW1NqCkzOxOuRMzJSqeRciQeEF7YmtjsQmg02T2rL-_-9cQQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: CPU profiling at thread level
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
X-List-Received-Date: Sun, 26 Mar 2017 16:23:16 -0000
Content-Type: multipart/alternative; boundary=001a113ed512d073ec054ba4a44d

--001a113ed512d073ec054ba4a44d
Content-Type: text/plain; charset=UTF-8

Gentle remainder.. appreciate any pointers on thread level CPU usage.

Thanks
Naresh

On Sat, Mar 25, 2017 at 9:44 PM, Munagala Naresh <
munagala.nareshbabu@gmail.com> wrote:

> Hi Team,
>
> To analyzes the CPU load consumption of a particular process, we need to
> find the thread level consumption. Default *top *and *ps *utils are not
> supporting all the parameters that are available in Linux/Android.
>
>
> Could you please suggest some alternatives which works in openembedded
> platform?
>
>
> Appreciate any pointers.
>
> Thanks
> Naresh
>
>
>


-- 
Regards
Naresh Babu
09900139337

--001a113ed512d073ec054ba4a44d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Gentle remainder.. appreciate any pointers on th=
read level CPU usage.<br><br></div>Thanks<br></div>Naresh <br></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Mar 25, 2017 at =
9:44 PM, Munagala Naresh <span dir=3D"ltr">&lt;<a href=3D"mailto:munagala.n=
areshbabu@gmail.com" target=3D"_blank">munagala.nareshbabu@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><di=
v><span style=3D"color:rgb(31,73,125)">Hi Team,</span><br><br><span style=
=3D"font-size:11pt;font-family:&quot;calibri&quot;,sans-serif;color:rgb(31,=
73,125)">

</span><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">To analy=
zes the CPU load consumption of a particular process, we need to find the t=
hread level consumption. Default <b>top </b>and <b>ps </b>utils are not sup=
porting all the parameters that are available in Linux/Android. <br></span>=
</p><p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><br></span>=
</p>

<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)">Could you pleas=
e suggest some
alternatives which works in openembedded platform?</span></p><p class=3D"Ms=
oNormal"><span style=3D"color:rgb(31,73,125)"><br></span></p><p class=3D"Ms=
oNormal"><span style=3D"color:rgb(31,73,125)">Appreciate any pointers. <br>=
</span></p><br></div>Thanks<span class=3D"HOEnZb"><font color=3D"#888888"><=
br></font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">Nares=
h <br><div><div><div class=3D"m_-2326427314974319741gmail_signature"><div><=
br><div><br></div></div><div style=3D"padding:0px;margin-left:0px;margin-to=
p:0px;overflow:hidden;color:black;font-size:10px;text-align:left;line-heigh=
t:130%"></div><div style=3D"padding:0px;margin-left:0px;margin-top:0px;over=
flow:hidden;color:black;font-size:10px;text-align:left;line-height:130%"></=
div></div>
</div></div></font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Regards<br>Naresh Babu=C2=A0<br>=
09900139337<div><br><div><br></div></div><div style=3D"padding:0px;margin-l=
eft:0px;margin-top:0px;overflow:hidden;word-wrap:break-word;color:black;fon=
t-size:10px;text-align:left;line-height:130%"></div><div style=3D"padding:0=
px;margin-left:0px;margin-top:0px;overflow:hidden;word-wrap:break-word;colo=
r:black;font-size:10px;text-align:left;line-height:130%"></div></div>
</div>

--001a113ed512d073ec054ba4a44d--
