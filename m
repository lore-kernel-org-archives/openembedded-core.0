Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id B075D787D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 16:19:10 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id p124so5533098ite.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PD+HpdJy0eZMdT/XIGOmyQKAB/HYREsP9Uny3ynvWjY=;
	b=SuZriFjnirFKZVYRb/cxPdrLJwq4YArFGteEsl4SP+FzJcb0B8UH0mpBy7A7lum3BT
	gdG+Z9bbFWd1yl5W7qeMwciGhgyQx1g0IKld6TkdU959NDw+xxNXkbjRJjCuq1tDo4+r
	hDPL5tKCzAK7/Zw9GV1baSN+ZbHJhvo6WQN+Cpge9EZDnkr9WqymsbUEEToJV5Ljx8OK
	fMaZpl9pvVg/6Ip9iiHdn8r4i7uM3/Mn58VI331qM8yPy16M91rs5M1/KwbZCCQHAyh3
	rRY8QWiKt0BT5OSkCMi39nDqKPn5cEeGttXPdEY67TCJfB2Tg9zZ52fMysR5sBs9BqPP
	UiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PD+HpdJy0eZMdT/XIGOmyQKAB/HYREsP9Uny3ynvWjY=;
	b=eaJXvYWCPMEIEGO6hrRRM/EDy7fb9Uf3/O/vA+Y5AluaWiC90TLJ+g044erTTm3Y3N
	1FgRS+LrD0vE0AJNsv0lg873zEOYkEla07rUGn2R/R2uGRY7191sZ8nYSg5c1jA6Hp4y
	oBSzwH/vOv9cHaITFODPUvD0ZxkixynyJeBCpVqyRZ+4sALU59RnvWKhonac1PUBtpSl
	Jd+ZqqivoiqR6ugSyiKWnDbPtnGRTE26ngxRhktEYVP2gwI0E5RbUTLmqb/V2IrFgJyM
	N3G1futQxsny4vtXtQjtlyc/3Nhw2BEtuTw0j1n4wz/K1SsgZ9V6ARMNgHfqPeIgNCJQ
	cE1w==
X-Gm-Message-State: AKwxytfe8pt9AGZsv0qApADbxB2SO8u06PJD2ILdFL73gQeS9CoLnLge
	7FAni5P4xOdOS2RCRTJ6Y+pdS/QRtuLnRSwZ/LsN7g==
X-Google-Smtp-Source: ACJfBovZvMTV/UFK5W40TGRyVUikjzwVroy3BF9VeoX9cVg9zONAmBQJj74Pf8y/D0Cc5uIQlHAvN90BwX3mYcl4C44=
X-Received: by 10.36.145.143 with SMTP id i137mr1907619ite.6.1515687551926;
	Thu, 11 Jan 2018 08:19:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.147.193 with HTTP; Thu, 11 Jan 2018 08:18:51 -0800 (PST)
In-Reply-To: <a320979ef8fb138981c66b8c0ead607a9804cee0.1515461823.git.Qi.Chen@windriver.com>
References: <cover.1515461823.git.Qi.Chen@windriver.com>
	<a320979ef8fb138981c66b8c0ead607a9804cee0.1515461823.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jan 2018 16:18:51 +0000
Message-ID: <CAJTo0LayZCc=psjBv7QjsXNi3drktBT4wmZcXd37cVGHYbAJcg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Thu, 11 Jan 2018 16:19:10 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ef16e1f9939056282825a"

--94eb2c0ef16e1f9939056282825a
Content-Type: text/plain; charset="UTF-8"

On 9 January 2018 at 01:40, Chen Qi <Qi.Chen@windriver.com> wrote:

> * hostname is explicitly enabled to keep the same with previous recipe's
>   behaviour.
>

But buildhistory-diff:

packages/corei7-64-poky-linux/coreutils/coreutils: FILELIST: added
"/usr/bin/hostname"

So the old coreutils wasn't building hostname at all (we use /bin/hostname
from busybox).

Ross

--94eb2c0ef16e1f9939056282825a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 January 2018 at 01:40, Chen Qi <span dir=3D"ltr">&lt;=
<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windrive=
r.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex">* hostname is explicitly enabled to keep the sam=
e with previous recipe&#39;s<br>
=C2=A0 behaviour.<br></blockquote><div><br></div><div>But buildhistory-diff=
:</div><div><br></div><div>packages/corei7-64-poky-linux/coreutils/coreutil=
s: FILELIST: added &quot;/usr/bin/hostname&quot;</div><div><br></div><div>S=
o the old coreutils wasn&#39;t building hostname at all (we use /bin/hostna=
me from busybox).</div><div><br></div><div>Ross=C2=A0</div></div></div></di=
v>

--94eb2c0ef16e1f9939056282825a--
