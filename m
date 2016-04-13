Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 460956018C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:53:54 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id j9so24453837obd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 19:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2P3+1IE0E9X5jABhimx71qsApW+7tucYGzU0CIMvae8=;
	b=CgcRcy4tNmgd0D5IATK55ZeQNXOzEj1xLeq/bBzbzHjvPBdYDLW8qAH4Zb28jOS+cD
	NOLN2cAjP9AMIvFHVmAjSFoxiiGOLLvUHHlQ0erpGnSEdk7Cl1MkEOHWnZn6ieEz5+SD
	Nq7+5tq7gKBvVAEWsIpqnSFCJ3pY34PXtMDrUaB8w3HqP+BPQZvIXPEIXDQH0dOAzeqf
	hMbGW4ArFLq/BABO69h6SdMHNXgrPzceoHm2ZjcrMlo6njctxe7pfMlFwwrnjnz4o7hp
	PBbpjKGoMA4UG7LZUvOezlDdjZOkmtwe+0pt286nLpdk8ES92yZXZXKsj0AKisf4cbF9
	zebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2P3+1IE0E9X5jABhimx71qsApW+7tucYGzU0CIMvae8=;
	b=ZXdyw5uiBgea3fh6SSi11jQhrHidwz1eQlDYlXY8ezQeDhm1EcyOxdFjdMhQsKIieQ
	h2pAYQu3X44TzLjXsSto+nzq0udrS0UeXcvePnnB+H5k1YTZogu+N0DrektodmkKSn0H
	Pj/foODfoX842hiTcn7kgUiTQbcrgKGHkgxIgVtfGhzBzgInMjyzlBWqdg2tys5f5HGg
	Vc+NASKp8WexpASrA9Pt15m77KM6yM7D3NX8NT6ajgRwxeeLTSTyYF6yREbngVEabFYN
	51q3eIv1zpHQC3Ywd2MBBla/FVOSjWLZShTe239hqT653LPUpcLwGPXpzACrlCywG7pv
	wPlA==
X-Gm-Message-State: AOPr4FUZsf4L5KpBEhDrABAPVAFy3u2KOAGPliRrI20SQuaOptMx8ihadsjuJF+ywI8CdCrtzkbg4Xpg6TgTiw==
MIME-Version: 1.0
X-Received: by 10.182.110.198 with SMTP id ic6mr3288125obb.15.1460516035285;
	Tue, 12 Apr 2016 19:53:55 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 12 Apr 2016 19:53:55 -0700 (PDT)
In-Reply-To: <cover.1460513113.git.liezhi.yang@windriver.com>
References: <cover.1460513113.git.liezhi.yang@windriver.com>
Date: Tue, 12 Apr 2016 22:53:55 -0400
Message-ID: <CADkTA4PH7Vw8hGjpkBi0rsSgTXZf0KGZXR3XfiQAKyftBdV3ig@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-yocto-tiny: update SRCREV_meta to support /proc/sys
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
X-List-Received-Date: Wed, 13 Apr 2016 02:53:59 -0000
Content-Type: multipart/alternative; boundary=089e0112c0da78de27053054e3de

--089e0112c0da78de27053054e3de
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 10:07 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi RP,
> I'm sorry to say that I didn't send this yesterday was because I have to
> wait until the kernel's part get merged (now it is done), otherwise I
> can't have the correct SRCREV.
>

You shouldn't be bumping the SRCREV at all. That's something that I do when
queuing
changes.

In fact, I already have this done and have it under test.

So please, don't merge this. I have it here and have it stacked with other
commits,
which will all come out tomorrow when my testing completes.

This SRCREV bump is for more than the single change .. hence why I need to
do
the update.

Bruce


>
> // Robert
>
> The following changes since commit
> b3afe7d9bd25a943e947de3ec064ea245173c5a8:
>
>   archiver: Ensure sstate-inputdir directory is created (2016-04-12
> 22:46:48 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/sys
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sys
>
> Robert Yang (1):
>   linux-yocto-tiny: update SRCREV_meta to support /proc/sys
>
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e0112c0da78de27053054e3de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 12, 2016 at 10:07 PM, Robert Yang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi RP,<b=
r>
I&#39;m sorry to say that I didn&#39;t send this yesterday was because I ha=
ve to<br>
wait until the kernel&#39;s part get merged (now it is done), otherwise I<b=
r>
can&#39;t have the correct SRCREV.<br></blockquote><div><br></div><div>You =
shouldn&#39;t be bumping the SRCREV at all. That&#39;s something that I do =
when queuing</div><div>changes.</div><div><br></div><div>In fact, I already=
 have this done and have it under test.</div><div><br></div><div>So please,=
 don&#39;t merge this. I have it here and have it stacked with other commit=
s,</div><div>which will all come out tomorrow when my testing completes.</d=
iv><div><br></div><div>This SRCREV bump is for more than the single change =
.. hence why I need to do</div><div>the update.</div><div><br></div><div>Br=
uce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
// Robert<br>
<br>
The following changes since commit b3afe7d9bd25a943e947de3ec064ea245173c5a8=
:<br>
<br>
=C2=A0 archiver: Ensure sstate-inputdir directory is created (2016-04-12 22=
:46:48 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> rbt/sys<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Drbt/sys" rel=3D"noreferrer" target=3D"_blank">http://cgit.o=
penembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Drbt/sys</a><br>
<br>
Robert Yang (1):<br>
=C2=A0 linux-yocto-tiny: update SRCREV_meta to support /proc/sys<br>
<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.1.bb</a> | 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.4.bb</a> | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--089e0112c0da78de27053054e3de--
