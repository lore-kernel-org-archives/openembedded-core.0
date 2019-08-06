Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail.openembedded.org (Postfix) with ESMTP id 70AE57F34B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:57:02 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id v129so58089519vsb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P8/TIhRE/SZSJx2MC5m4iJF3VieMD3xtCi/S9ZXYibU=;
	b=ELkcp0jzF3T051fYWs/6YI9hZAjMhs3CORvfSD8ZvR6bYFQomLFSTqeOOzJMsFieSa
	Un//+vamzD31NClh1g4fVFGMP2fitZazMmPNIC10MAD5Hfeh8V6p85vJJ7RifaW8hhWe
	s8C13GrIh/Zk6dXxFvLKOU0Ex4L/uXTxqhAkxH4h/UdVhRVITDfce5bPJX0MnCDWQcIs
	qDEayMrf27UWfxFPipnLzYLPioqGHAakLkW0TN8kfCq9lvIiTAGhJq2ulMVA9f7IOgG/
	ObY/A2Nd3wjRmR0wva2eudhlQf0bXLQeGzZZ/nrKIIiOHvpJAwJYDVVoZoVI/XrGiBUF
	QPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P8/TIhRE/SZSJx2MC5m4iJF3VieMD3xtCi/S9ZXYibU=;
	b=YwbeVLQHAdCrglRu99x0q59k1DMRqIVuZa7C6p1g9c/ArGy+/zg2jS+QvwNRvUK4Wx
	ZvIWa17/aPGhISAg435ZxeJTyoitP5nT6xCT3o4e7/CShR33ajCMwztydyuMncj2SW0I
	fDoj1FSfrGTzThuY7UZrktejvp3weYj8axcLj4VBtOLw7kU3Ttk6GdGzJGEhX+HJMGuO
	X7f7rryABiKpwl9ke8Aqt4D49vLG1VpMXjo1sqqMdlpykxRdKkWptSQoUtzfKdIMdbZS
	mNEF+9aR4nzWL6izWnTBUJR0RbW9tNP2q5CyFZArQkhkLmqyVkn6ZZqJt2BYzptiPv+I
	MN0A==
X-Gm-Message-State: APjAAAXQpqKLzLD1gPogrGtRL1YzzEcQ26Yb/4fRTUUiRo83QNY6Ui9t
	htj+Ii+uVuoFV5juplZIvv3Rr6JCeUJw/ecj/ms=
X-Google-Smtp-Source: APXvYqw0MB+b2hKJwOvJNl+/TuoWtiDgYfDwuDx3qXQnfQEwrJuEr2yhmjZgSchvB1qBGIrKumDaTzYPycsp/i5/PXw=
X-Received: by 2002:a67:8042:: with SMTP id b63mr2080486vsd.23.1565092623615; 
	Tue, 06 Aug 2019 04:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
In-Reply-To: <eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 13:56:52 +0200
Message-ID: <CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 11:57:03 -0000
Content-Type: multipart/alternative; boundary="000000000000df0a55058f718575"

--000000000000df0a55058f718575
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 13:18, Ross Burton <ross.burton@intel.com> wrote:

> > Note that bash-completion files are not executable, and we do not
> > observe this with other recipes. We might have a false positive here -
> > can you look at the actual contents of the package please and see why
> > _qa thinks it needs /bin/bash?
>
> Also I don't see this with master.  Do you have some local patches or QA
> changes?
>

Actually there is a determinism problem here. I have reproduced it with
master, and the error happens if and only if bash's do_package task has not
yet run. If it has already run, then the package_qa for stress-ng passes
fine. I'll poke at it to see if it's a recent issue.

Alex

--000000000000df0a55058f718575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 13:18, Ross Burton =
&lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">&gt; Note that bash-completion files are not executable, =
and we do not <br>
&gt; observe this with other recipes. We might have a false positive here -=
 <br>
&gt; can you look at the actual contents of the package please and see why =
<br>
&gt; _qa thinks it needs /bin/bash?<br>
<br>
Also I don&#39;t see this with master.=C2=A0 Do you have some local patches=
 or QA <br>
changes?<br></blockquote><div><br></div><div>Actually there is a determinis=
m problem here. I have reproduced it with master, and the error happens if =
and only if bash&#39;s do_package task has not yet run. If it has already r=
un, then the package_qa for stress-ng passes fine. I&#39;ll poke at it to s=
ee if it&#39;s a recent issue.<br></div><div><br></div><div>Alex<br></div><=
/div></div>

--000000000000df0a55058f718575--
