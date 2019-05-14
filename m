Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB017DF0B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 07:47:56 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id i63so3204631ita.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 00:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=1Vpz3SwkAu6OtMuK8D/EyCDCP/rnkIc84b2aR7ZczXs=;
	b=ou5fWNnPf5cv8f64cEYybjnMM/MzqShWWiSOM42euqPiNQEVrAOCsZo+jyJa4QDpTe
	szqJqORdVS2ctFCmA/hIB6iU7PoVZYp1st0kElrfRaGmoOKwHMcsvRZAaQwg5CfB/3kq
	FGSGSOMKJ39h7l0ruxj+FK49eNEXYCDmN4RzNQGpLqWO3HMRvAlPKAHCbynO7u/vDNhw
	e/MgaqyLRt5768+/8/cH1fZLvEqI1+Pxwmbrvqdk5EVyWDt5PQCI7l4nbfBRnEvx/j58
	b+jKRsCC6EYAaANaZmiWucWwE5o+jzRWPpWWQyKhtbTtkgqZrJQS86qcjspZYkNE15YD
	Xr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=1Vpz3SwkAu6OtMuK8D/EyCDCP/rnkIc84b2aR7ZczXs=;
	b=JRcxgbHKWS4tYMsjqsPejStorzaIgcXBoKJY0i4txdT6BT+2QeV3nwTGWL+0A+UZyo
	2YgP3d8wNzX9SYRRRzjkUk/iKuCzoK8cjRNwG8vqML4VbYUrxr8rvS3QcLO0Jt6R8HJt
	B0L8v6dD7Wn2IvoW0z3FgPEQLRb9zLuWxd/TK+Z/3tyc+1hqOtVwJXrNmWJWflCoAkA/
	35H65kQxlPgoIhCT7dOcFitmVX9I8B9IxOrnOD7+gebgbUrb1M8cO3zGJYQEz1ndNWpj
	x8B9jvDBsxhavccEQ6FPLGddNR1cmZYwh7/wNsp0+RCEEH5wGTuq4tBc6XwbM0FmHI5h
	QL7Q==
X-Gm-Message-State: APjAAAVtWYMeVB4z5pQkWPYr4YURVAKJgqbCXizySyph2PyVkUtDd31D
	uBKwwQILY/+6KHbr6wV1oz/q1lp0V3fIRce1EI0NkA==
X-Google-Smtp-Source: APXvYqwtG9RU+1SHsZSdpDlHLo3BZY2ajtZe1pats0KwWvvxNPuk+xM3JzwzmOSA/+32qUddgwPNoANq8a0FOaXQ2bA=
X-Received: by 2002:a02:1a45:: with SMTP id 66mr20402990jai.124.1557820077338; 
	Tue, 14 May 2019 00:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190417133941.31087-1-schnitzeltony@gmail.com>
	<CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
	<CALbNGRSC=NjtUg=JxzmaZbjEj8BhH1NGPTRTs=iU34ftM8s=JQ@mail.gmail.com>
In-Reply-To: <CALbNGRSC=NjtUg=JxzmaZbjEj8BhH1NGPTRTs=iU34ftM8s=JQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 14 May 2019 09:47:45 +0200
Message-ID: <CALbNGRTCng3BDqz-Phy2chgUQJYuwHmcymmL0z+ad+YGy+nd-A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][thud] adwaita-icon-theme: do not delete symbolic svg but pack them in ${PN}-symbolic
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
X-List-Received-Date: Tue, 14 May 2019 07:47:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2019 at 12:51 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Tue, Apr 30, 2019 at 8:20 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Wed, Apr 17, 2019 at 3:39 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > This fixes:
> > > * gtk-icon-browser: for symbolic view almost all icons were missing
> > > * xfce's thunar: 'home' and 'up' icons were missing. Had a long discu=
ssion with
> > >   XFCE-people [1] and asked here [2].
> > >
> > > How could I overlook the most obvious...
> > >
> > > [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14443
> > > [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-No=
vember/275815.html
> > >
> > > (From OE-Core rev: 0911e7d2f5443210b594a198ada8465af7a2fc78)
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ping?
> Something wrong with this bugfix?
>
pingediping

