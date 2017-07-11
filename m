Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6F83B73115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:43:43 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i2so92984226qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PmeFL1p9epZPec9PvRVgFootcfP1CNKNgVLjhl2ZaII=;
	b=TfCLvo6OOxYQMonPWLa7FsG8WWD2mqbFC1JU62AafEg3z6Ml0sToJpKHy82QnbT8/j
	DD2ClVk/5QK1c4OqFMcNHiS7hdoczGGwpmhzNlpxi4mKMNB10J6yBQJdN/PL8TAygnjT
	K3pMN7sIP1yMeyZwSO1WdUWARPISojFXT095fcclRT6jypVY7J1iYageDx7vT6SePzXg
	o2Nxhqryy5dTjrlOsIvyMvJvIhf04Di+Nj6PRN+mrIVvPAmWZErO3ehnEO7ZrD/7qWyP
	1HRkwpH8lRhhVqKhfCBhlA1MN503mBNzwXBuw5f9oFGd6qgl2s61qzHG9EvuG4QloixF
	ha0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PmeFL1p9epZPec9PvRVgFootcfP1CNKNgVLjhl2ZaII=;
	b=WWq1DdOu6nEIrThdnBjpiukWbS+9ZHwJNhU9+g/fQAGX/P5lf4PRaYdEv7iKikGbnF
	CjZ3zlYl00pPYfTXGqKuIXZ2sZFjfF8cT8M+ZxwOFS4yqTN8WmLbQ7OOVZeGYsONcvKL
	MR8vE43JLSuPna/2v9oTU9opuDCBgXKIEry9jiV53BMvRgVuaJ6hIjcc6QeeTtfG0jXC
	XGMsPcH1cRvkQQgdSeTyZ6sadT2QMkLElREznml/ahvTEJghSp4OQoT8SY366rv4zzL4
	8YmriKxurzTmnw2tk5iV9bCQBGezyPlV2DQOWLJnTrWg+/I5zWWHsx3NSa1wB1dCfERr
	SJpA==
X-Gm-Message-State: AIVw1122qmDhE3EcmMX4/j/A20GcfMbBpvvmU8JoQLQ//4CHKJMsKu1H
	g8rl0c7dsDAttcDq6fimOTQ8XemiPGkV
X-Received: by 10.237.41.71 with SMTP id s65mr8956709qtd.222.1499762625231;
	Tue, 11 Jul 2017 01:43:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 01:43:24 -0700 (PDT)
In-Reply-To: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 09:43:24 +0100
Message-ID: <CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 08:43:44 -0000
Content-Type: multipart/alternative; boundary="001a114dd722865a2e055406b231"

--001a114dd722865a2e055406b231
Content-Type: text/plain; charset="UTF-8"

On 9 July 2017 at 08:35, Soren Brinkmann <soren.brinkmann@xilinx.com> wrote:

> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> v3:
>  - rebased onto latest master branch
> v2:
>  - no change
>

Fails to build on PPC if ptest is enabled:
http://errors.yoctoproject.org/Errors/Details/147237/

Ross

--001a114dd722865a2e055406b231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2017 at 08:35, Soren Brinkmann <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:soren.brinkmann@xilinx.com" target=3D"_blank">soren.brinkmann@xilinx.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:3hs" class=
=3D"gmail-a3s gmail-aXjCH gmail-m15d26481ae6626fa">Signed-off-by: Soren Bri=
nkmann &lt;<a href=3D"mailto:soren.brinkmann@xilinx.com">soren.brinkmann@xi=
linx.com</a>&gt;<br>
---<br>
v3:<br>
=C2=A0- rebased onto latest master branch<br>
v2:<br>
=C2=A0- no change<br></div></blockquote></div><br>Fails to build on PPC if =
ptest is enabled: =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/De=
tails/147237/">http://errors.yoctoproject.org/Errors/Details/147237/</a></d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114dd722865a2e055406b231--
