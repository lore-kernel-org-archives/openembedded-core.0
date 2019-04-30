Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD16A60116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:21:03 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id w130so2865284itc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Dch8ICz3jjZfyo1EDw7jX8vb1Gq+JVDDjI86vWHNlv8=;
	b=ufu7wsngr3NIYtfncqHJ1CddUmuWxqgz+e16WN/DW2JCjciG26ut26z3Jc539SImHq
	CFqldyNptYyirW+f9Bsueoh3fW3ESj7hHRHz0ZcZbtIqnENXwQUIXDvc9+fVQWiNE29G
	cTGuTXqu11Atn9baUm5HTVVTnHGGEcoRdwuwdMtZTm9hGSipZoMUIBo0m7irfaJ5tpNF
	9RAdEeYks8YH2drLVlbMdatsS0tUCysmj9UgdypMzPI17k9Yc+lcdJf29zX5jSiP3K4L
	9AxJMpGpH6o+ZIpAiTOyOVx2NosFQdINjl6Mr1yjyPCcvOpS1f7pLnZkOCymFqMvdYEr
	VgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Dch8ICz3jjZfyo1EDw7jX8vb1Gq+JVDDjI86vWHNlv8=;
	b=FbT96P2UnGdTMTBvspzlPyn8x1bAOxIIDOiGhbsfjZwbrmWXhvHyB/56ZRr6w/MM5E
	iAtHDrA1/KlT2fAacFjn2U5tmDrYxb9E4i7Ht7Itpm4RJMImH1tzgkjmsWkuA0NhIXNy
	xOAeAa47Min9ztb+gy6k2/kkRyZ+9bG4gSGozAkM7Pt0orNj/JfRZmZPfDMUEoeDUljE
	3W1vhTHpuAKtaYIZsZrzbbN979ovcrUigSJlbuEIX7CDtvnb+qKNfPCKaOaOam6u9ZSG
	D6NuV3JOZNBBIUU8Yj1Oy0Pon5Uk42CmTC6VM76tP736k8geJsqnKecOjRMARRzBNFBW
	8edw==
X-Gm-Message-State: APjAAAVJmewVad4CnqLZrjtV3vb0fuJI9Oe7+n3IVWJ8SPc7H3O5doMk
	v2Mfpjjl/fWAwGRxevwhY2TUF6ynvCe+lEpCGOuBdGLE
X-Google-Smtp-Source: APXvYqxymRj1JOXWlD1aKlKyQpwWwY/sK02IZbuK8rHs3BwXwVs780groi96VB676oS73vzm3Jgsyjes1lhUoWe47kM=
X-Received: by 2002:a24:4094:: with SMTP id n142mr2442590ita.1.1556605264806; 
	Mon, 29 Apr 2019 23:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190417133941.31087-1-schnitzeltony@gmail.com>
In-Reply-To: <20190417133941.31087-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 30 Apr 2019 08:20:53 +0200
Message-ID: <CALbNGRSJs_KncbefGSSPN_u_KYOrCnEsfSTeLJKLXeFQ7guEPQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Apr 2019 06:21:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 3:39 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> This fixes:
> * gtk-icon-browser: for symbolic view almost all icons were missing
> * xfce's thunar: 'home' and 'up' icons were missing. Had a long discussio=
n with
>   XFCE-people [1] and asked here [2].
>
> How could I overlook the most obvious...
>
> [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D14443
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-Novemb=
er/275815.html
>
> (From OE-Core rev: 0911e7d2f5443210b594a198ada8465af7a2fc78)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
ping?

