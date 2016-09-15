Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id A2FBB7016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:12:39 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id o3so1640898ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jWvZtmaRSs1DimdNaJJvRlF+fHIhxDdMsjUKsCX/xRU=;
	b=PGm5TyycUG6zzUSj+UB+yqzjpXhZTLfKyDQzikJDD7t/2+7yPTcmca7dFgsxzDsuFY
	93PIghfFuP74JCrGgQ7tZRsgZWbXpqnYHqAWxm1WctnSQnnrPwA6IeHzmjTZX0XDw+UC
	wpOsFoirT6OzjWiYeniYhLbsgKUoiNSG9v75Ya/TfmnCcs26oPIpTTccl+GsH+SJykaa
	irF3WzU1TkdMOn8FZP+Ppm9OQy+50D0pz84sStvI5dEE//lD+UHF9CQgyzw9StHsVBfh
	2o/yeJ4l11zDheY30xQxmy/SPmByontdJxDc3lOnwlHTDPu2XHvzTDbs4iOgkNNJwX22
	KCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jWvZtmaRSs1DimdNaJJvRlF+fHIhxDdMsjUKsCX/xRU=;
	b=TPj2scku+Vnme5Qep7iO3OMj1futuSHcMwjPOo1SgVQa5BYdqKb6qLwe90j6+JSSPX
	Bn3KcvdE+YFTTmBo4TTHTJAbIraw69E17CnM5t5Ian32WutAb1GYSOg33kqFmz/YnTFY
	m6b7+AlOnkdgvJ0bEnfeDfeZ/xB9vM/AxEwAPIq3tYA5hrQDGwGzAG4IydJLeLf88s8b
	XX6YxDmGROPCOWQTpMqK0DQRszXQ4z3zH8/1A5Xn8wg1ACOXAfTdLgxhvVNkLq/JkMSi
	q8EssNxGfv3+BpMmSzy5f7iidYhEo3RL0AOOHLhRWEzDsabgUJ03Yrmq+/UjyqvpkJtN
	vnRg==
X-Gm-Message-State: AE9vXwOPInonHn/zWIfDgxVKCyDf7covC9RBEuZ/O8WkGNfbzCaZsUOCHi7kzBoBWViKBNHwwRwuH1qcdCBjbMw2
X-Received: by 10.36.192.9 with SMTP id u9mr1712561itf.86.1473970359535; Thu,
	15 Sep 2016 13:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Thu, 15 Sep 2016 13:12:19 -0700 (PDT)
In-Reply-To: <2762804.COdzxK9n1p@peggleto-mobl.ger.corp.intel.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<CAJTo0LbuVqOsjMUix-ntx67a6PVEcLFeYrAN8XnCh7eJzBQgdw@mail.gmail.com>
	<2762804.COdzxK9n1p@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Sep 2016 21:12:19 +0100
Message-ID: <CAJTo0LaeKEUKKheg2Grgc5SKoANQbRKT8TX-F2e7aL6ozdd+Eg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Crazy display
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
X-List-Received-Date: Thu, 15 Sep 2016 20:12:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c05aa2ab0d602053c9177bd

--94eb2c05aa2ab0d602053c9177bd
Content-Type: text/plain; charset=UTF-8

On 15 September 2016 at 21:03, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Are you guys perhaps using the same terminal application? Using screen /
> tmux
> / anything similar? (I'm using screen here and haven't experienced problems
> though.)
>

I'm using iTerm2 on a Mac to run normal SSH to my Linux box. No
screen/tmux/etc.

Ross

--94eb2c05aa2ab0d602053c9177bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 September 2016 at 21:03, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":3ag" class=3D"a3s aXjCH m1572f72b1848f46a">Are you guys perhaps usi=
ng the same terminal application? Using screen / tmux<br>
/ anything similar? (I&#39;m using screen here and haven&#39;t experienced =
problems<br>
though.)</div></blockquote></div><br>I&#39;m using iTerm2 on a Mac to run n=
ormal SSH to my Linux box. No screen/tmux/etc.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05aa2ab0d602053c9177bd--
