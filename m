Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC65F766E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 12:37:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p63so1861569wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 04:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yWGNEfhCktlAAYIv/X4QlLKKZAJGdDp+3bG+I+Sr0nA=;
	b=jKCxMGpSU6NJZIG2HLb+OaSPkG4Sg/sMK75XzxbvaHQXVi9sAqiOICuyP9D/uVH3dA
	+W/K8jEhdXmqOS+cs5c/rjjNOWBgajxIRNSRKcpqY5nUJ+S6JKzMENifQZ8/iaaFpTHV
	cTZzsAlU6Cqv8NNt1Qic49/H7YfCfRswh9V7XdZXJhiLrD/UfK8oqywsPMSIAtG+rV7s
	lHGIW0GJacxHEW7erwM5BnYw1uZp8VghSZc3fgRX4SuKZZARcGY+2rDnOHnlS+yrZtHD
	1h7YAtsxTKniEHrZ4tr6VKSj3/TTfo+IjB5pAw7pZnLqVxyHQZGYD//c1HkzwnKQgucq
	75Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yWGNEfhCktlAAYIv/X4QlLKKZAJGdDp+3bG+I+Sr0nA=;
	b=TtPDjGsNAh8XS94AjPr0/hcKj99MhFCfme/xA5Xvah4oBShfj3P8MSDgCpFMH1ot0X
	7wQMlaMKKwaQFT1Bd2230TrotcbdMc+Y10wYfbCVwfOwAIGE1fO4NWHGgkdOeQ8f3JMi
	uhn9c9WTIAUwPQePmW8Wy3HMCwNVXg98OM3MPqkKr2fixPdV1GvNHrotP/PCs5nuvuSV
	cb5DdjiDhFlz+oKavK89T88UP4wuMVCJUjFf6Lq6ZJwXP4iasNwo3/Qpdd02OyQST+IA
	JoYqN4K3M9KV8warMT1XuGBC20DYE0fM9635jQirNONZH5PCfeJEGGg6byve8T8xvWzq
	2Q6A==
X-Gm-Message-State: AG10YORnslj1d/oZAgvIlJjj4mlqmZ8+UptdQVI0vSEn7kKWK7SaOFwHjF1jkAOXJPRMD2U80Tcp6ICYyhyJeg==
MIME-Version: 1.0
X-Received: by 10.194.250.39 with SMTP id yz7mr15404368wjc.92.1454157428794;
	Sat, 30 Jan 2016 04:37:08 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Sat, 30 Jan 2016 04:37:08 -0800 (PST)
In-Reply-To: <1454155589.27087.3.camel@linuxfoundation.org>
References: <cover.1452385571.git.akuster808@gmail.com>
	<20160121115752.GA2603@jama> <20160127113311.GA2574@jama>
	<56AC2396.8030707@gmail.com>
	<CA+chaQcaWoZE_Cru1YZGd+AahFx7y_jBapZFG9rxuKcJrE=aXg@mail.gmail.com>
	<1454155589.27087.3.camel@linuxfoundation.org>
Date: Sat, 30 Jan 2016 13:37:08 +0100
Message-ID: <CA+chaQd0AZmhdbL=ApHfNM3nohv3GMMPSn6f3hYkB5rXy_N94w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/20] Dizzy-next pull request 2016-1
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
X-List-Received-Date: Sat, 30 Jan 2016 12:37:09 -0000
Content-Type: multipart/alternative; boundary=001a11c29d82fdb7d3052a8c6889

--001a11c29d82fdb7d3052a8c6889
Content-Type: text/plain; charset=UTF-8

> I have merged this to dizzy though.

Thanks!

On Sat, Jan 30, 2016 at 1:06 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2016-01-30 at 10:08 +0100, Martin Jansa wrote:
> > > that was a patch from the patch queue and affect glibc below 2.21
> > so
> >
> > glibc/wscanf: CVE-2015-1472
> >
> > looks like better subject
> >
> > > Dizzy 1.7.4 is  not planned yet.
> >
> > I don't care about point releases, I care only about contents of
> > release branch, can it be merged to dizzy branch?
>
> I was hoping the branch would get corrected so I could then just pull
> the correct commits. I suspect Armin didn't realise I was waiting for
> that.
>
> In the interests of expedience, I've reworded that commit and merged
> the branch.
>
> There are a couple of tweaks that would make things easier for me to
> take these:
>
> a) Could you in the 00/XX series header in future confirm you've
> checked and that these issues are addressed in the later stable
> branches? I do worry that for example there may be unaddressed issues
> in fido.
>
> b) If you could share an oe-core contrib branch with these in, it does
> make it easier for me to merge them. I can deal with that comparatively
> easily though.
>
> I have merged this to dizzy though.
>
> Cheers,
>
> Richard
>
>
>
>

--001a11c29d82fdb7d3052a8c6889
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=C2=A0<span style=3D"font-size:12.8px">I have mer=
ged this to dizzy though.<br></span><br></div><div>Thanks!</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Jan 30, 2016 a=
t 1:06 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Sat, 2016-01-30 at 10:08 +0100, Martin Jansa wrote:<br>
&gt; &gt; that was a patch from the patch queue and affect glibc below 2.21=
<br>
&gt; so<br>
&gt;<br>
&gt; glibc/wscanf: CVE-2015-1472<br>
&gt;<br>
&gt; looks like better subject<br>
&gt;<br>
&gt; &gt; Dizzy 1.7.4 is=C2=A0 not planned yet.<br>
&gt;<br>
&gt; I don&#39;t care about point releases, I care only about contents of<b=
r>
&gt; release branch, can it be merged to dizzy branch?<br>
<br>
</span>I was hoping the branch would get corrected so I could then just pul=
l<br>
the correct commits. I suspect Armin didn&#39;t realise I was waiting for<b=
r>
that.<br>
<br>
In the interests of expedience, I&#39;ve reworded that commit and merged<br=
>
the branch.<br>
<br>
There are a couple of tweaks that would make things easier for me to<br>
take these:<br>
<br>
a) Could you in the 00/XX series header in future confirm you&#39;ve<br>
checked and that these issues are addressed in the later stable<br>
branches? I do worry that for example there may be unaddressed issues<br>
in fido.<br>
<br>
b) If you could share an oe-core contrib branch with these in, it does<br>
make it easier for me to merge them. I can deal with that comparatively<br>
easily though.<br>
<br>
I have merged this to dizzy though.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br></div>

--001a11c29d82fdb7d3052a8c6889--
