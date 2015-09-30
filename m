Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 67DC077027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:01:24 +0000 (UTC)
Received: by qgev79 with SMTP id v79so37360062qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3ydaRm+0/6PzFvhkh8a2cNrJObGCAVsc8TSM69bozKA=;
	b=KQYUQsOEr1SgX0OhARl/9c6Yd6jYxtfVXoK3q4LMSNjwA9SN7aNg4OnmS85OrXKc98
	SXlVpltBFJePebAczB5reTwboPXTAzBr5gRd+JM6Ix9Sog4w/ETR/u4w9AwsdeU3KerO
	/USf1U2Yl6pAAyFcNOpCbDtFjImqc+8iPCcBqOlf9Qf5pOud0dXXPcM3+geOHEf45EpM
	VWy4h1IGNiGlFGQSK+o7HSNtkqtEGofbQN6GF8SUgmp1TFRQ/Bze46Q7F2WUGzeD7LPX
	f94E7kcgaf9fvXt3S1lFvF8oyrEkQhot8PvmRys6JviGw+sH2jMMloWUPtXPZ5uzBuUd
	5Nbw==
X-Gm-Message-State: ALoCoQmIQ5oSgPJJ7bZEYfbKxTSJS0LRDgMMVtSko+bqvjqRTypGWQzB0NqxnsVIvWN7CMQnyNLs
X-Received: by 10.140.235.147 with SMTP id g141mr5019835qhc.22.1443625284307; 
	Wed, 30 Sep 2015 08:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 30 Sep 2015 08:01:04 -0700 (PDT)
In-Reply-To: <20150930144303.GC2405@jama>
References: <1443621275.5162.95.camel@linuxfoundation.org>
	<20150930144303.GC2405@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Sep 2015 16:01:04 +0100
Message-ID: <CAJTo0Lb+sOMG0ovH9+u6Xa7R+qQ2UWOc__MCxh8iUzJiD9R9oA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils3: Avoid MACHINE specific checksums
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
X-List-Received-Date: Wed, 30 Sep 2015 15:01:26 -0000
Content-Type: multipart/alternative; boundary=001a11376e6e42a81a0520f8345d

--001a11376e6e42a81a0520f8345d
Content-Type: text/plain; charset=UTF-8

On 30 September 2015 at 15:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> I'm still using that patch and still haven't found any issues caused by
> that, but I'm not using python3 recipes (except building them in world),
> so it's possible I've just overlooked them.
>

It's possible that you're installing eg python3-pip into a totally wrong
directory though, but I'm having a look at this right now and have a funny
feeling that a lot of this can actually be deleted.

Ross

--001a11376e6e42a81a0520f8345d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 September 2015 at 15:43, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":68f" c=
lass=3D"a3s" style=3D"overflow:hidden">I&#39;m still using that patch and s=
till haven&#39;t found any issues caused by<br>
that, but I&#39;m not using python3 recipes (except building them in world)=
,<br>
so it&#39;s possible I&#39;ve just overlooked them.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>It&#39;s possible =
that you&#39;re installing eg python3-pip into a totally wrong directory th=
ough, but I&#39;m having a look at this right now and have a funny feeling =
that a lot of this can actually be deleted.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376e6e42a81a0520f8345d--
