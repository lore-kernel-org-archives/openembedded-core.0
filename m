Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D74757017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 20:17:32 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q83so173675425iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 13:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E97BSNbZA2KgfVQXUrjbSCqjYOPkkgoN8EE/Mw2PdjU=;
	b=Iy45Ml0j84g6ewZQO3PWqGZRDcPpnMPNFARA+isSwr8Idp0dBXPMFypwpd27Y+dRhf
	x6TInqjTud5Nppd2wDaO49+BLHLeelLVPDYda9z5LkMI3fF/8J1W81+Riam7e9iOWBZy
	ky3mYUSQbpcimzZFK8CytXwLMcSohY1JBi2s3EU2U6E9wvFUXqEaA3ikqTSyEckz6Gun
	nbyHaKZ5WRPybfRpG4BzIzDzxfiQoAPiMG9yFyYjokyKJ3x3UtzjJhMUrjrWFi6eIkmC
	Sm5B8QL01+fS8NsyviekkTsLW4l7AczBG8vWLtjihp+VxY46O9BhWhrNr2OeVHyVdVkY
	Al3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E97BSNbZA2KgfVQXUrjbSCqjYOPkkgoN8EE/Mw2PdjU=;
	b=QdJahEXtab2ArK0eqJecWl87fzn0vCfDrIbURKBRItFB3Q/Yt8QFleiqvS6OHlFQlk
	zXcvRjfGF6oGyuwJET95+3j5sMdRWzBFIoLOc/x7hbo+0rRkWL7WZlydk59olKIJIEmN
	Kd3EOaNwkSGnCPymeLo6lxleMH9AJiaSFVO9wxMBTyn8jGzf661MdNm+iUgE1pt38Hl1
	Ktqscnm74R/fB475+nOenvNjzcEVFd5FCT7pXFNQLaWrTcGIBCDnsq9OY0aP+7a7oCh5
	4OSkU8mRE05wUY1xn5k4XJoJYsWLqRMQ9cYJ6RW10cGUnp7U6SlEvIvJswPJyTi5FZuL
	r1Bw==
X-Gm-Message-State: AEkooutmayl8jzJXwTGGi0OzZIdierNlHNbi0Ju/3y+RjqDokPwAF7nO/uV/tZG5Z7NJNj6YXGZ5B+Ha4BlRNkn8
X-Received: by 10.107.154.196 with SMTP id c187mr21258576ioe.99.1469477853268; 
	Mon, 25 Jul 2016 13:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 13:17:13 -0700 (PDT)
In-Reply-To: <20160724121138.i7fp26ateflny4kl@jama>
References: <20160708085912.13734.77555@opal.openembedded.org>
	<20160708085918.3A528501B3@opal.openembedded.org>
	<20160724121138.i7fp26ateflny4kl@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 21:17:13 +0100
Message-ID: <CAJTo0LZmRoRqmHeCuNbQptBvM+Z46oQPPVsYXneeGmRK7P1V6w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 21/28: rt-tests: move ptest to python3
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
X-List-Received-Date: Mon, 25 Jul 2016 20:17:34 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e73289905387b79e1

--001a1140e81e73289905387b79e1
Content-Type: text/plain; charset=UTF-8

On 24 July 2016 at 13:11, Martin Jansa <martin.jansa@gmail.com> wrote:

> Any idea why it fails now like this:
>
> http://errors.yoctoproject.org/Errors/Details/73086/
>
> ?
>

I've just sent a patch, can you see if that helps?

Ross

--001a1140e81e73289905387b79e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2016 at 13:11, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ei" class=3D"=
a3s aXjCH m1561cd1c3a78f129">Any idea why it fails now like this:<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/73086/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/73=
086/</a><br>
<br>
?</div></blockquote></div><br>I&#39;ve just sent a patch, can you see if th=
at helps?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1140e81e73289905387b79e1--
