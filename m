Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 49B48771D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:01:29 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id l7so134842219qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JKexv3awlwWrA5nY/NNixfFNIjSP8QpblB6UkQ8tEr0=;
	b=q550Ciix13dDBnaAP32b2tmrm/CwDjsNMBk2mPgcYpdk+FdcazI1aj0+2oFrIGJSAr
	qNFi62fmC0wq79qw01GLrYj5xEKHCUfJkdAql1Z8iuGywOuXzOJ6zs+js/ewc+p3O6BS
	2aZklAdz+zxRQwuPaGR1U7JBu85QBs0NSjJlzGEILnX6nkzyU3uLJMilX1DvWWM2diVE
	yGW7Y8BfmYaLjF2HWqz6KBDRvaQMb/wXXWleSY7YM9dGbqwd94jlDmoQZAeI87tNk5vK
	VYkpkJb5LI2SUPRBU8R/z2KpOgM7dxZVTdJqeQuQr4CxXsKech+4PTRtiuR6jRteCwXt
	KoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JKexv3awlwWrA5nY/NNixfFNIjSP8QpblB6UkQ8tEr0=;
	b=loA9LQDHifkyrfQfkZB1PvsHUgBUp1UM4jPVexLggcOhNK3xj+rDD/AgDmFgKz/fRV
	9KE181wz/nAbttlkGrRKGh5uDr0GkeHYpovY5CG/gGm4joXiA4/FWBKVqe9ZFO83Cdc3
	guZ+EIsj9Owt7bgMdXzS1pLgGS7YXpXFDb67LRyX7eT5OlictR3rm7shwt4UO0op0nhs
	h4qm1MNUQz8KL4BGVluIK/Yyt6eiaGjywa6QcVutkiW5rhs1OApyQYA6WsvpTPwujuy3
	4EGV8pD/KgJzCogQ1n8eIyal8TefOZHHB8JJ7DMBGV8MX90/KGu5h9V2EGn5nxEClm5M
	SIfg==
X-Gm-Message-State: AIkVDXIZe1pYJUnvuzgftN70BheXQz1oRBZQgL70t9+XIjL39EEIRvK5lT8c5TERY/MSn++R1yeucvbkGyFh1VLq
X-Received: by 10.237.62.232 with SMTP id o37mr23908304qtf.188.1485190889692; 
	Mon, 23 Jan 2017 09:01:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 23 Jan 2017 09:01:00 -0800 (PST)
In-Reply-To: <CAMKF1so7OY5b8eQaQmgyL0ktNkT2kR=JGfMtxEsusSMR=5zH+w@mail.gmail.com>
References: <1485178169-27145-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYogrcREAzmPUdBwcP6Yx5e-oZEBOTL1EnpVD9jwg=XiA@mail.gmail.com>
	<CAMKF1so7OY5b8eQaQmgyL0ktNkT2kR=JGfMtxEsusSMR=5zH+w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jan 2017 17:01:00 +0000
Message-ID: <CAJTo0LZawp0OUSUCZ89nmqqjw7e5Se_acuT-q71CsmiNxXtJjQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 23 Jan 2017 17:01:31 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e6772b60546c5f37c

--001a11406f0e6772b60546c5f37c
Content-Type: text/plain; charset=UTF-8

On 23 January 2017 at 16:59, Khem Raj <raj.khem@gmail.com> wrote:

> shouldn't shlibs notice and add this dep automatically ?
>

Yes, but it's the incorrect dependency on PN that is the problem.

Ross

--001a11406f0e6772b60546c5f37c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2017 at 16:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":1aa" class=3D"a3s aXjC=
H m159cc45200868c3f">shouldn&#39;t shlibs notice and add this dep automatic=
ally ?<br></div></blockquote></div><br>Yes, but it&#39;s the incorrect depe=
ndency on PN that is the problem.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11406f0e6772b60546c5f37c--
