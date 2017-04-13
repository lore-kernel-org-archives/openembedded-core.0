Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id B8ADA77E3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:34:03 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id v3so56385808qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eUY7ef2k9wyJlrMja/61miXvROLAeb6ZBmE/HkGV9kU=;
	b=VPEtlP0+YMQxNrxBFKBPiRmmxd1L91xxtgeEuHUwCQp+J5X2mSNuaDaR0jqCGEKqGe
	SGUhV4gOUNTm2uA9qYMdqoeQKDHjwcCGiYN5dMuc4InqoBH3OGjxwwqHJCuXZ6KX8+iv
	38sh2J1sTJ3uDymy5bu3jrA2PzxqDDPFiDVyJwTYcdviiuvQIyZJi4YtHXc848kdFt6I
	afRl96DWpz3HHLLgarLhlbQFCQllB2UUzSl1eE3wKW1ZBGjwIFg33jB7OzRz/EsdasCI
	3yVThntuvdk/U7ss6FVBHgYhxqUQUsdyRJK/AhSB+C8VJHiZIydmb6sZHzPCkkafpm8I
	lvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eUY7ef2k9wyJlrMja/61miXvROLAeb6ZBmE/HkGV9kU=;
	b=lWHm2YxMYEVVXDUgvNDL/hGVaQj1Ws3ONZUXPDLH2CaX+f8yjmTDA8cJDI3gN6NGtT
	bc8iLBjrDGnxWb0mALW+BvQ49t1YWvTW24TQYC8hmjyvBRyF40gAxjRol0K9B5XQoSrr
	T2+S2+JJAQz5yA1Eg4We0Jdr1eDA9KdzfVccQT260H28HMMIh0GSSijmUkyTalHVBSd6
	qJchM1EtkC5B+5Xw2bTf9mzK7WJHkDfP3XHPFlbnagHiXD/gCD1DWk0zZy9bNV0Abrud
	irgtbRRgPOVi3p3MfcDaIvPkIm6TVQLH2ez/SItBKrfVIlPXRGS7Xk0eQKF0IzI1LCWo
	L8ow==
X-Gm-Message-State: AN3rC/6LgZfi57cjcDCEhP3IVe1cHQpWihk/MOGG9NaVrFCuNDGvi7bm
	sWC7OhHWnPpYwGNwi/8xCe1lXVGhYsbG
X-Received: by 10.237.34.250 with SMTP id q55mr4876320qtc.144.1492122844566;
	Thu, 13 Apr 2017 15:34:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 13 Apr 2017 15:33:44 -0700 (PDT)
In-Reply-To: <CALbNGRRQevSS6-abd8NP-JCyD26kJ=XT8yd5RVR1nTa6jfL0jw@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
	<CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
	<CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
	<CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
	<CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
	<CAJ86T=VN2mDsMSA4O_AjB+6rg12-SPmh=Go6ZsjNu3cLpLxY7w@mail.gmail.com>
	<CALbNGRRQevSS6-abd8NP-JCyD26kJ=XT8yd5RVR1nTa6jfL0jw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Apr 2017 23:33:44 +0100
Message-ID: <CAJTo0LZMbPCs-g0PeLdJcNrj7B_O8CF82JvafTsHGJXPahghXw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 22:34:04 -0000
Content-Type: multipart/alternative; boundary=001a113eea5a1cad8d054d13ec59

--001a113eea5a1cad8d054d13ec59
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 April 2017 at 22:09, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> > base.bbclass doesn't test for .7z extensions, so won't detect this
> > dependency either.
> >
> Correct - but note that 7z extractor p7zip-native is not (yet) in oe-core=
.
>

There's plenty of prior for base.bbclass supporting extractors/fetchers
that are not in oe-core, so a quick patch to fix this would be totally
acceptable.

Ross

--001a113eea5a1cad8d054d13ec59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2017 at 22:09, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">&gt; base.bbclass doesn&#39;t test for .7z extensions, so won&#=
39;t detect this<br>
&gt; dependency either.<br>
&gt;<br>
</span>Correct - but note that 7z extractor p7zip-native is not (yet) in oe=
-core.<br></blockquote><div><br></div><div>There&#39;s plenty of prior for =
base.bbclass supporting extractors/fetchers that are not in oe-core, so a q=
uick patch to fix this would be totally acceptable.</div><div><br></div><di=
v>Ross=C2=A0</div></div><br></div></div>

--001a113eea5a1cad8d054d13ec59--
