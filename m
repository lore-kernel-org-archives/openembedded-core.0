Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 508F07D41E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 10:52:00 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id v9so9960956ion.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=SLGLAzsGbDUhEoOUTjr1ZjovpxTBqkR2P76Srj/9oEM=;
	b=pVm5JZTPw1JTJb4MC8w3MFzcxv199lvyPig/J9paxCiu9kDfg0lk0AgARX5kRAXiG1
	vSuy8HolrOlbMH8MNipy7e2cmLNFiVPSlrKiykS0ZXgYEzjYZp2q4yKKWcK5Z8Czizpl
	bdH3d4HEY2Id2pT1AFavb7wZRmQarV0bZdYXJBjhnZqTxO5e42HhAqFsv3wzjlCliLGY
	UU6sOb3w2p4G+3CskyIB1d6TCNGhrtuvxrQMCQPMtAGzl+Hq5IRfPvffLIkLPJ95cuhx
	ZPJ7f9hbEbseimpL7XXw00Of5Uv3cdPuddSoqrJYaSbSdTVzbCAyE8Iq/d3MlK834lc5
	qzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=SLGLAzsGbDUhEoOUTjr1ZjovpxTBqkR2P76Srj/9oEM=;
	b=Gcp9HKPd5eA4GHYDRHEyoH/0EfGg09iImAnyfhxsmW6+vaS98tLY9o9ZRDFA+tenNL
	FXVVdhUAb8rLjGkuBtnvgbNat965/cDCU6tVyyXGbZPXCigsF6iFqvuiD1RzoZlxBvxP
	W6BB/ekylyOG6WDTt2PSaEkGiMn0JxChO/CSx4NzhZihlSLoRZ5v3QEggawmdWRzhRHL
	Sn0I7zZJ+WN3ePM5AOvr6fxwDF8fD2QPuYjUSVV7ZPgxjce97hF+3Ikol/flH2NhRgz6
	oimTPZ5lUdD84j21qFjdR1ykXsfayCnecBUR9lOs4ozwH1ndM130fWQTz3UD1n+B4/DR
	L9lQ==
X-Gm-Message-State: APjAAAX3GiEHGl1r39xeT8x+Hl9GjwqF1SHjiTuI/5oqCrcSKqi/pL0N
	gXXglIPE90oOcJ0Mbv+OAZUX3pmCxCZqKHgN5EGmlg==
X-Google-Smtp-Source: APXvYqwRcDjMt9xj1rse7LDjvvMWcMjE2lgnDz1mUsyzp0WWPNaDRUpcJcX/Fi20Ca8BgbvM3foKYDlNTIqO9QJHT+U=
X-Received: by 2002:a5d:9cd0:: with SMTP id w16mr4268634iow.272.1557226320855; 
	Tue, 07 May 2019 03:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190417133941.31087-1-schnitzeltony@gmail.com>
	<CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
In-Reply-To: <CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 7 May 2019 12:51:45 +0200
Message-ID: <CALbNGRSC=NjtUg=JxzmaZbjEj8BhH1NGPTRTs=iU34ftM8s=JQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 May 2019 10:52:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 8:20 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Apr 17, 2019 at 3:39 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > This fixes:
> > * gtk-icon-browser: for symbolic view almost all icons were missing
> > * xfce's thunar: 'home' and 'up' icons were missing. Had a long discuss=
ion with
> >   XFCE-people [1] and asked here [2].
> >
> > How could I overlook the most obvious...
> >
> > [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14443
> > [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-Nove=
mber/275815.html
> >
> > (From OE-Core rev: 0911e7d2f5443210b594a198ada8465af7a2fc78)
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ping?
Something wrong with this bugfix?

Andreas

