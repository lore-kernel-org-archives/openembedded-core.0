Return-Path: <kad@kad.name>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2FC73285
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 15:38:22 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id e63so9740740ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZSyh1MNogF3tx3DZkulbA0xB3byz18khNAwt91TMSsU=;
	b=lgYCLSORR+2AOsYP6Fo1+jkYCkiCGfi7O5N3fhKkyeJooNRJKxw+7dOiHEpJ9CMDt9
	CeB1wwWSfWeUm5gao3r3hn1YAoHYqPR2rJRoSDA/75KewOR2GDJ26JNZqY6QmRXafxly
	gzB3Eb8Zf+TrQzvs3gOQzrGd4190S91tC92SOifkLFERzRnhPLw6X9YtU1RXPay4Pxw6
	tj7iXJW6FrlFrVBTHuxOgKsG5opBfF0cOx6srkEfkTdJcaGcresuT03hewDTkjHbORNN
	33LvoQ5OMkPwmlp6r/w4gfFJAnJpVvsr21VpD98Xg/E+wwschh7egXmdBYTO8lkBJQSG
	aQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZSyh1MNogF3tx3DZkulbA0xB3byz18khNAwt91TMSsU=;
	b=ZTpNqm087K5xalvPnXe6uTh3zVuFLBrrY+At2SsTmIdNzV8TRc8Swm600qhhmx/GNM
	tzFZMmyg3RFBaHNb0bk+Ie1GalCN5s2BoLLZVXgl+za0ZO6PWt8xtR3S+ldSYGOSUlRA
	o7kDZcs/XD4VUBBdt+DqpfxSwtjFFrzNjQNNjIvuM+5YXs7gaUrB9xu2c0iGxdrE8X7e
	z3z7BHQ4NT7aV7hYKFlvJcJjRran0sHwYPY39netBABuNEm/iap4liGzEhdbfPrXgqfE
	nvThhMnSnU4036tODvRZswhlwTGO0zU2RIGqVudyaGXuCWbuIQf7oPM33NquHJP/FO41
	5fRA==
X-Gm-Message-State: AEkooutJeK0SYn9vlYN7O7GQP/Bj6v4JhOLKWk9FLg+mfE8GXg2+l86DudAAR6kMp/B61aSqI1Zvw+YxR2GMRg==
X-Received: by 10.36.34.75 with SMTP id o72mr14919289ito.13.1471275503468;
	Mon, 15 Aug 2016 08:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.46.129 with HTTP; Mon, 15 Aug 2016 08:38:22 -0700 (PDT)
In-Reply-To: <1466322626.3319.86.camel@linuxfoundation.org>
References: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
	<0FCEA83D-C569-48F0-AFAA-2E9D5BD96820@dominion.thruhere.net>
	<32A5DABC-B911-4C2E-B9CD-A520BCA395EC@dominion.thruhere.net>
	<1465045799.13979.33.camel@linuxfoundation.org>
	<F5F5FC08-7E44-4648-A769-EC4D8F4D9EB7@dominion.thruhere.net>
	<1466274078.3319.0.camel@linuxfoundation.org>
	<24C09066-C7EA-47A6-8771-02E59FC60525@linaro.org>
	<1466322626.3319.86.camel@linuxfoundation.org>
From: Alexander Kanevskiy <kad@kad.name>
Date: Mon, 15 Aug 2016 18:38:22 +0300
Message-ID: <CANFkWp=d05PuRbZ6E2Rac83_OJJqmZj-CZzoS8JRQz4Zqb4p_g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
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
X-List-Received-Date: Mon, 15 Aug 2016 15:38:26 -0000
Content-Type: multipart/alternative; boundary=001a113f702cc05cb3053a1e05d2

--001a113f702cc05cb3053a1e05d2
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 19, 2016 at 10:50 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2016-06-19 at 09:46 +0200, Koen Kooi wrote:
> >
> > > > > It would be helpful if you'd cc'd the person who's patch you
> > > > > were
> > > > > suggesting we revert. I added Sasha to cc.
> > > >
> > > > Since the original committer has shown zero interest in
> > > > responding
> > > > here or fixing the problem in the past month, can you please
> > > > commit
> > > > this? This fixes a clear regression, which alone should have been
> > > > reason enough to commit this.


Koen, Richard sorry for not noticing that discussion earlier :(


>
> Ok. Let me paste the hash in "From OE-Core rev:
> 46bc438374de74af76d288520c6252c9b7840767"
> into a new url. I obviously have nothing better to do with my time.
>
> Did http://git.openembedded.org/openembedded-core/commit/?id=
> 46bc438374de74af76d288520c6252c9b7840767
> fix this?
>
> Unfortunately this  patch creates another issue: chaining compressions
doesn't work anymore. e.g. ext4.xz.sha256sum wouldn't work.
We need something better done here.

Koen, can you provide some test scenario that I can reproduce with Poky and
run some tests ?
I'd like to make another patch that both your usecases and our chained
compression usecase would work reliable.

Thanks.


-- 
br, Alexander Kanevskiy

--001a113f702cc05cb3053a1e05d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Jun 19, 2016 at 10:50 AM, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D"">On Sun, 2016-06-19 at 09:46 +0200, Koen Kooi wrote:<=
br>
&gt;<br>&gt; &gt; &gt; &gt; It would be helpful if you&#39;d cc&#39;d the p=
erson who&#39;s patch you<br>
&gt; &gt; &gt; &gt; were<br>
&gt; &gt; &gt; &gt; suggesting we revert. I added Sasha to cc.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Since the original committer has shown zero interest in<br>
&gt; &gt; &gt; responding<br>
&gt; &gt; &gt; here or fixing the problem in the past month, can you please=
<br>
&gt; &gt; &gt; commit<br>
&gt; &gt; &gt; this? This fixes a clear regression, which alone should have=
 been<br>
&gt; &gt; &gt; reason enough to commit this.</span></blockquote><div><br></=
div><div>Koen, Richard sorry for not noticing that discussion earlier :(</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Ok. Let me paste the hash in &quot;From OE-Core rev=
: 46bc438374de74af76d288520c6252<wbr>c9b7840767&quot;<br>
into a new url. I obviously have nothing better to do with my time.<br>
<br>
Did <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D4=
6bc438374de74af76d288520c6252c9b7840767" rel=3D"noreferrer" target=3D"_blan=
k">http://git.openembedded.org/<wbr>openembedded-core/commit/?id=3D<wbr>46b=
c438374de74af76d288520c6252<wbr>c9b7840767</a><br>
fix this?<br>
<br></blockquote><div>Unfortunately this =C2=A0patch creates another issue:=
 chaining compressions doesn&#39;t work anymore. e.g. ext4.xz.sha256sum wou=
ldn&#39;t work.</div><div>We need something better done here.</div><div><br=
></div><div>Koen, can you provide some test scenario that I can reproduce w=
ith Poky and run some tests ?</div><div>I&#39;d like to make another patch =
that both your usecases and our chained compression usecase would work reli=
able.</div><div><br></div><div>Thanks.</div><div><br></div></div><div><br><=
/div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e">br, Alexander Kanevskiy</div>
</div></div>

--001a113f702cc05cb3053a1e05d2--
