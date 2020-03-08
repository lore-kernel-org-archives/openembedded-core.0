Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id BA19D60C3C;
	Sun,  8 Mar 2020 22:08:18 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id t129so2054264vkg.6;
	Sun, 08 Mar 2020 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hBKUB03Fv128kRCbw6KflVIEec7q0VWfY1mkcCm4ec8=;
	b=gG8lm+WAWhTFgZzd9jUugvZfcob6BECHE6FoglUPoSZIWQRK380mlcvdg57hQyQD2i
	5s86PBF7O3X89GAc0LxvYCkZkKz0SqlQ8lGy38PLqJkWfgGaU3RIFmTMPmWUCGP2/Fx2
	5RmoV2o6jK1/dUTxEe0ViDZkshutDsoqajfKX0jK506Oi4SW3R04vRDWUvfAmBNXTxhq
	ly5HCeKafP/BM9Ffyp9r3HX1j6WHmWIJwzNy+jIqNf2iMCsNyMYFLDLNHhCHc+cacIuL
	c0hGdme8y99secaZMN3e5y273L0WWwzqOuRESpjRDnfYQoUG3xuW4SsFwG8UcAauSvwk
	mJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hBKUB03Fv128kRCbw6KflVIEec7q0VWfY1mkcCm4ec8=;
	b=A12cD7UfNQlUtldVjWML/prNeKVBkbbiL2WGRQI6BmydztCNWpHIR6QHzX+CQhL/GC
	SciiGSI3o2KqNnzJ7yAMqi2LIgvU/1Ci21KMbCZjCDQZvf5UDXe4o108x1Bxp6BGvsi5
	A5juXMgRjZ7Bm+FJmqbJ47sDvh3RakT+HJHJcqlJv4e/bV/0VsmXCYEFpZBn7+nd9X1R
	SaDNqvnnwVTlhZAgimoRN8Dij2A51fCJ4DNX1a+4FJIaouFoHxYhqitsDnSKV4tjyuPu
	b2MiWR+1ph3Ye+7ZWZIm6G+MEu8+1MLuPqFwZnNfpbLAllS/D8mg+vqsITkTL6boiukB
	AklA==
X-Gm-Message-State: ANhLgQ0hsRP1jm6oprChv0bHrxDoiQFn7Y0Rej4hHDWyG+aiPKY6c9JP
	YCpzPN6vlp86EhZxzElp2sPwYxgp/FOFLp5YAhg=
X-Google-Smtp-Source: ADFU+vt5iloIcwYSsWPcXziLL/hFwBlTjPQtRJvhM2hwDMegi2B58xTig5kbnteXNS3ZjMzVj4bTvShzec8h2ofBs8A=
X-Received: by 2002:a1f:f2ce:: with SMTP id q197mr3550892vkh.49.1583705299400; 
	Sun, 08 Mar 2020 15:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
In-Reply-To: <20200308214610.GB1425@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 8 Mar 2020 23:08:08 +0100
Message-ID: <CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Sun, 08 Mar 2020 22:08:19 -0000
Content-Type: multipart/alternative; boundary="000000000000ccbce605a05f1f10"

--000000000000ccbce605a05f1f10
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Mar 2020 at 22:46, Adrian Bunk <bunk@stusta.de> wrote:

> It is on YP to make it clear to users whether or not Yocto comes with
> the same set of security guarantees as distributions like Ubuntu or
> Debian.
> If it is the duty of every user of Yocto to track and fix CVEs,
> then this has to be stated clearly instead of implying the opposite.
> This gives users the opportunity to mitigate, instead of unknowingly
> shipping insecure products.
>

Do you have any actual evidence for actual users shipping insecure products
because they mistakenly believe Yocto takes care of security for them? This
has been the situation from the start of the project, certainly this was
the case 5 years ago when I joined it, and the only person ever to make an
issue out of it is you. Everyone else seems to understand the deal they're
getting by using Yocto without a commercial support contract.

Yes, there are millions of insecure yocto-based devices out there, but
there reasons they are insecure have nothing to do with what you say.

Alex

--000000000000ccbce605a05f1f10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 8 Mar 2020 at 22:46, Adrian Bunk =
&lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">It is on YP to make it clear =
to users whether or not Yocto comes with<br>
the same set of security guarantees as distributions like Ubuntu or Debian.=
 <br>
If it is the duty of every user of Yocto to track and fix CVEs,<br>
then this has to be stated clearly instead of implying the opposite.<br>
This gives users the opportunity to mitigate, instead of unknowingly<br>
shipping insecure products.<br></blockquote><div><br></div><div>Do you have=
 any actual evidence for actual users shipping insecure products because th=
ey mistakenly believe Yocto takes care of security for them? This has been =
the situation from the start of the project, certainly this was the case 5 =
years ago when I joined it, and the only person ever to make an issue out o=
f it is you. Everyone else seems to understand the deal they&#39;re getting=
 by using Yocto without a commercial support contract.=C2=A0</div><div><br>=
</div><div>Yes, there are millions of insecure yocto-based devices out ther=
e, but there reasons they are insecure have nothing to do with what you say=
.</div><div><br></div><div>Alex</div></div></div>

--000000000000ccbce605a05f1f10--
