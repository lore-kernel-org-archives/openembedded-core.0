Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 00C6A60750
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:27:57 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 20so1264681uak.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9x39N9VbJ6ZNlYjalPvtit43k3AcdEtrwxc5orZagPo=;
	b=T2v0oy6tJ0sH2TsY90q4oRSftZ+6R7rmNciF9j7hbhSVWjshZ5ICeCRCzR+74TPX+P
	ByWgBzfGjAsdf0Rja5ceoQagMWn6zinTwUTOsj68GXm28TicxGgJDrdOuItotGv3QD6M
	OvK/kAzfEDcluSuHDq5OngfkR4ghUBS9WPSXyZRUV+YAi1vm3jj/x8GjD8JW026sHixT
	A5/kqvB1FPXO89wEPGqWVrpQkexaUZHyzaQY5HYFzGARLQQr11I9zAyXjhcQg84HNohN
	zgVIxTv2g5WZgEldK3iWdagtw1OozkyCPRxX2Cj/Zf0FBiS49Ir036E+MZJ9M1Ag7lmb
	SA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9x39N9VbJ6ZNlYjalPvtit43k3AcdEtrwxc5orZagPo=;
	b=cVpGKP6KyQX8KRLLX9BVE2ybtPz1pFgUlo6HfV6VOohnq+3cl5sDD79m3zcln03qRK
	YgsH9WFlwuHLbEcEFVulklbLe81kV/O+Z7vJUbnH9CTkReWuqdQIs2BiYGvCJP0x3DR1
	Fs1+k/XsOglhTeEYu55pY8mk7pS6AneVtowdE3LaS43Rk6yJvlJepsJVtG+FKzK9T2ZR
	bsI7JUaprXgFo9i9qxZjk45630JW1cWAmQNB6cJgGyr3Xe9deLxNlShqfUAeCOy9TccI
	zI1f4mI/VLzQE67X6QrmSdyCwzw4YrMntBIjWyo0y5GUv6varfsih4tWwygq6TgZGogl
	5YOg==
X-Gm-Message-State: ABUngvey5e8gfxNg2oWTVGc+v49s+HHxLI60wpV81ih3hrSElkn8R0Rzwjoe3AWhJMJxs13XZAjMI2YBsx3/lA==
X-Received: by 10.176.84.2 with SMTP id n2mr5184948uaa.29.1478132878711; Wed,
	02 Nov 2016 17:27:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Wed, 2 Nov 2016 17:27:57 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Wed, 2 Nov 2016 17:27:57 -0700 (PDT)
In-Reply-To: <CAMKF1src9Pw2=6T7V3J7vmrccFkU5-POCukerpZYFQDxj8we+A@mail.gmail.com>
References: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
	<CAJTo0LZdGvZ2wvuwQR6v-daF8yHyq9+hTrNNAgxj2GHwMEZnBA@mail.gmail.com>
	<CAMKF1src9Pw2=6T7V3J7vmrccFkU5-POCukerpZYFQDxj8we+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Nov 2016 17:27:57 -0700
Message-ID: <CAMKF1sp2Bft-bhJqT_C0siXFiHJyT8ouqoNQ2vmt-XGnJqw9Wg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: version of gdb in morty
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
X-List-Received-Date: Thu, 03 Nov 2016 00:28:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c1b2e702aa38c05405aa19c

--94eb2c1b2e702aa38c05405aa19c
Content-Type: text/plain; charset=UTF-8

I think doing an upgrade to 7.11.1 and Backporting that to morty is a
reasonable option here

On Nov 2, 2016 4:15 PM, "Burton, Ross" <ross.burton@intel.com> wrote:


On 2 November 2016 at 20:41, Andre McCurdy <armccurdy@gmail.com> wrote:

> It looks like morty (and master) are building gdb from git (ie cloning
> a ~660MB repo) with the git revision set to a snapshot mid-way between
> the 7.11 and 7.11.1 release tags.
>
> Was that the intention? Or is there a patch somewhere to switch to
> building from the official 7.11.1 tar file?
>

That was introduced by Khem with the commit message of "gdb: Upgrade to
7.11", so clearly we should have validated that the hash matches the tag
and that there wasn't the option of a tarball.

For master we can obviously take a 7.11.1 upgrade, for morty there is a
case to be made that a git clone is sufficiently huge and inconvenient for
users who are not tracking master that an upgrade to get the tarball is
reasonable.

Ross

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c1b2e702aa38c05405aa19c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I think doing an upgrade to 7.11.1 and Backporting that to m=
orty is a reasonable option here</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Nov 2, 2016 4:=
15 PM, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt; wrote:<br type=3D"attribution"><blockquote =
class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote"><div class=3D"quoted-text">On 2 November 2016 at 20:41, Andre =
McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=
=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div id=3D"m_-3093411951722753255gmail-:1pb" class=3D"m_-309341195172275325=
5gmail-a3s m_-3093411951722753255gmail-aXjCH m_-3093411951722753255gmail-m1=
5826ca1830035d4">It looks like morty (and master) are building gdb from git=
 (ie cloning<br>
a ~660MB repo) with the git revision set to a snapshot mid-way between<br>
the 7.11 and 7.11.1 release tags.<br>
<br>
Was that the intention? Or is there a patch somewhere to switch to<br>
building from the official 7.11.1 tar file?<br></div></blockquote><div><br>=
</div></div><div>That was introduced by Khem with the commit message of &qu=
ot;gdb: Upgrade to 7.11&quot;, so clearly we should have validated that the=
 hash matches the tag and that there wasn&#39;t the option of a tarball.</d=
iv><div><br></div><div>For master we can obviously take a 7.11.1 upgrade, f=
or morty there is a case to be made that a git clone is sufficiently huge a=
nd inconvenient for users who are not tracking master that an upgrade to ge=
t the tarball is reasonable.</div><font color=3D"#888888"><div><br></div><d=
iv>Ross</div></font></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--94eb2c1b2e702aa38c05405aa19c--
