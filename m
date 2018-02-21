Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3F4786E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:05:59 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 30so3456872iog.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CUOJ8HreqTmh2P7Je56/Akh74iJ8BhdUEhHzEwAPWVo=;
	b=hKDAQAlpRIiIQ02JP96Elsj3dW0ETYEsy1cFDk+yVfP3K/ymXf4twMvI9AuR73Ft1Z
	9YkvHyEtIxY/JJJ9Cc59aHv5q718oEHts/t41ZaVkFvk0RaXMQ+Fn4e0+4irOgfWoBSR
	/ia/jq+qqkW1hs48UI6gJgOK08bWq+/tTd/0cXRVroNIgJvW6xf3uEbvTyn5PTZDctyQ
	KEGE3yGvtrbHEYsLKtFbyRtv+J3CQwW/Osrwd7hX412JkmfXPV5RS0EZh90KJl42O9xn
	NeW8p+QCPQ0hEj6Eo2eC6KR8TrJQ5X+iAm+5VfxQrawY0JxwDMkl6qPC6pCS5I4MW7gm
	uPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CUOJ8HreqTmh2P7Je56/Akh74iJ8BhdUEhHzEwAPWVo=;
	b=a3fQgmyPyi0SJSCLWvpUQALDeM6iZQ8JIdYs6ikroI3qT+adO+izbs1tTEduy5FFUq
	ktahNvJ+u8lc1SBnVpg725eNsNGSr/GTGwlSdseMt2LJ63NPctDoCuWGum0iJAJNTsdi
	2LvSCVxQNvAy29fN8czial3WqBRDSFWu1AaFNPzS4qdgoJKffV5QNlgVN+Stg/YpYtLz
	8bnpzb/xdffFLcoMeRLM++AJc4oLffHSZH/RpCxSnLtEDprdDowXFLYJNFe5wwmFr62e
	0GoExfTAoQgdrZpnLnzGvdHyYuR2TGC1RnURmTK4K6u6FQF7BJZvAZGqW/MoX01b1guz
	ZhyQ==
X-Gm-Message-State: APf1xPDPyxW8IgQbbtG3Iby8iWRWjvDM7DhQrgWAy5CPtv4N3BBFaIpb
	gXf0hPJb/8pTzrWR9NsF/qZG8ZWK4l21c0tICiwNkg==
X-Google-Smtp-Source: AH8x227zlfCg5ZQQV8rJBrv0DX5wU2PWD9luCCvlqg2Omqdp9FyqVGa6fXsKbo0Iz94M/OzpO99+I8fOOItvcTjVBOc=
X-Received: by 10.107.7.87 with SMTP id 84mr5846232ioh.216.1519243560587; Wed,
	21 Feb 2018 12:06:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 21 Feb 2018 12:05:40 -0800 (PST)
In-Reply-To: <1518719422.24236.164.camel@linuxfoundation.org>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<7224a2768d18f72afc37cea4b47718510d54c8b7.1517798422.git.liezhi.yang@windriver.com>
	<1518719422.24236.164.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Feb 2018 20:05:40 +0000
Message-ID: <CAJTo0LatSYS0fCPcAcPYseFFtUPxAm78q9BKMe2St-SAcbqJ6Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] time: 1.7 -> 1.8
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
X-List-Received-Date: Wed, 21 Feb 2018 20:05:59 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf4c1b3730565be74e6"

--001a113ecdf4c1b3730565be74e6
Content-Type: text/plain; charset="UTF-8"

Hi Robert,

Will you be able to send this meta-gplv2 patch?

Ross

On 15 February 2018 at 18:30, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2018-02-05 at 10:41 +0800, Robert Yang wrote:
> > * Remove debian.patch which is already in the source.
> > * The license is changed to GPLv3, I will add the v2 one
> > (time_1.7.bb) to
> >   meta-gplv2.
>
> Could you point me at that patch please as we'll need to merge this at
> the same time to avoid test failures.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ecdf4c1b3730565be74e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<div><br></div><div>Will you be able to send thi=
s meta-gplv2 patch?</div><div><br></div><div>Ross</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 15 February 2018 at 18:30, R=
ichard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, 2=
018-02-05 at 10:41 +0800, Robert Yang wrote:<br>
&gt; * Remove debian.patch which is already in the source.<br>
&gt; * The license is changed to GPLv3, I will add the v2 one<br>
&gt; (<a href=3D"http://time_1.7.bb" rel=3D"noreferrer" target=3D"_blank">t=
ime_1.7.bb</a>) to<br>
&gt; =C2=A0 meta-gplv2.<br>
<br>
</span>Could you point me at that patch please as we&#39;ll need to merge t=
his at<br>
the same time to avoid test failures.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a113ecdf4c1b3730565be74e6--
