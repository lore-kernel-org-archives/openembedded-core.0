Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 067586067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:24:41 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m101so28777025ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d4+DOyFHhaErbOARdQD6BttKgqEJRqHmLirOTqESTls=;
	b=XrCJmSJTaiMNI4OS0qYBw7jaba+MsWCCeMZtdCUEi+m1fFaczG5afhtqeGqYEaYXZu
	YoUUMzzuYviJAg1pNhTBdonfKEqPfwENpk1Y6maE5SbD9wRXnWZ7fcrjODUT7tkyp3be
	UEgPlsPwF/3qh9Gsno+Nu4OSQm4gr2Q3uXjjzlMFgiu8tSQi+h2hT4JCgJycctJ0GNnj
	GzHSHzhgv4UhXAC2s7onsXPFHZ78K18vTCfJ8fU39cpTJHIBII90VMLWSp8gm86Kf2Pp
	tvw6amgZ2tRD6MruO3CVVh/Ek4/qXaY4qp5BAu+nfXgbqTTgeaNeV+Jpqy1NlAS/nAFc
	1qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d4+DOyFHhaErbOARdQD6BttKgqEJRqHmLirOTqESTls=;
	b=IGuvDEC0fuZYiNZmFtlzqhh6Sf1vWP97X/HXeCT+v4zNTYpejKtIrgoiRKkliQpBeq
	gv/pQg4D2XUJiRXLfZeK3zI42Jt8am0G3a4tJHSir1J0Y8IieeYNu9j7Nk9Pb5+As8JU
	8XamGp3RnMxRaumJj5fle6Lzn2bSiqNkmMH8W55cANYesPGfApPQBKEJhsNadXsxN7Xq
	/+0lxk2pzX78CWmijljxkvW3mfY8NB0HjihIlo9YYFN7VVVt/kUt355OZAFyFzWmmADv
	XqrizouUDUvBmDx+Tak5LW4YQ0EH7V3n6jvQkK7hjh5Z5SNNTkxU48xD3K/m9RddQqtL
	13zQ==
X-Gm-Message-State: ALyK8tLeJTrVHpTSUDvusEyBw4hXkUbJpjAyxxMjvNoke92tPBP+fhfh93mSI0W6po3mZeQmdVtrU8qocqBsSU25
X-Received: by 10.107.154.210 with SMTP id c201mr4989092ioe.99.1468358682306; 
	Tue, 12 Jul 2016 14:24:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 12 Jul 2016 14:24:22 -0700 (PDT)
In-Reply-To: <57855DCA.1080807@gmail.com>
References: <5784A2D0.9030902@mlbassoc.com>
	<CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
	<57855DCA.1080807@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jul 2016 22:24:22 +0100
Message-ID: <CAJTo0LbJfZSNr5U9G8rBLXfqWfjf3R7uSatEwuQFSA9SfWh+xQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Future of GCC
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
X-List-Received-Date: Tue, 12 Jul 2016 21:24:42 -0000
Content-Type: multipart/alternative; boundary=001a1140fab6a9801a053776e5e1

--001a1140fab6a9801a053776e5e1
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 22:14, akuster808 <akuster808@gmail.com> wrote:

> > Personally I was thinking that gcc 5.x and 6.x should stay in oe-core for
> > this cycle, and then drop 5.x after the release.
>
>
> Wouldn't that be dropped iff GCC 7.0 is release? or are you saying we
> should only have one GCC version?
>

Well, depends on the adoption and migration problems.  I don't think we
should carry three versions, and ideally one, but two is acceptable to ease
migration.

Ross

--001a1140fab6a9801a053776e5e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 22:14, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; Personall=
y I was thinking that gcc 5.x and 6.x should stay in oe-core for<br>
&gt; this cycle, and then drop 5.x after the release.<br>
<br>
<br>
</span>Wouldn&#39;t that be dropped iff GCC 7.0 is release? or are you sayi=
ng we<br>
should only have one GCC version?<br></blockquote></div><br>Well, depends o=
n the adoption and migration problems.=C2=A0 I don&#39;t think we should ca=
rry three versions, and ideally one, but two is acceptable to ease migratio=
n.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1140fab6a9801a053776e5e1--
