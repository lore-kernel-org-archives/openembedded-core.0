Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8399677AA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 07:41:48 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id i203so26871943ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=40AZ9VSAf7PR0NMivV1IwIH0I+i7LymvdNcEAJ9Afec=;
	b=HXMy5c3B1LQZvbu6GBtefpR6Gw9UUOfYIaC7JKI4rRnFUTS4DYoTZ6Hwfbm0/4xRrI
	jgFY08/fXsOxsnsVsqfQJlYcnYasINfqgGxXtRo3L7pkhbxUaYwz1TVFlRXmKCzrGd8m
	ciwZ0XeKtxaK37q1mePZ4HEgzqH7XXWnE0xwNvSjyfDOuH3HqFLPpp9x2dh22QHEj/PF
	Z0VTmWTBTzX4YRflKFUCivGmaViyNsVr4SwgWRKXUT00uhbslnJ3YkL2SN3/K5Um/8Bn
	bHZvpHaAtPHxSpHifM1QxF2cMIGaRtzQAWnU9WE+pEAU+JdYyo3woGqR+JDjVQxu4Oqu
	TQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=40AZ9VSAf7PR0NMivV1IwIH0I+i7LymvdNcEAJ9Afec=;
	b=EKQTVuwLswQJJpv+7SgtZfq6ai/TkLNrza7Q+rhCn5tTmG7gD2pWmC9Z5ZTnxSayA5
	kU61NGk6ua2JmlJ5KUT/1BD+KcF21ldOz7VxLuLtZwzEpgPxTdnJbE8gF3Fs/KZqjQaq
	dlWEl/0FkJrKS0PMHbwW2VlhzBkgQmVMQUCTIcAaq/T3tHUfmTwypdCQVoSXsAH25a1i
	N+shHx/+zKfJbXN4AjS0AmkxTDIgg/X+sjLFPhuGgFvC3JTDt8rvKzjGdY1hDtnzq6hq
	JEU+YLyzSnA2QmxF8xlgFnd6tsHCEzxtWzZoW/S/0X9NsOHAFoPVXPqjLfuj7NJ5jlY5
	gmhw==
X-Gm-Message-State: AFeK/H1KtRjiFvHeyUGH2i/aWcS9pY14fDUKfDZ7IOJ3tAiZldFstOLdbiApQzP807R6UCu1iBLMR11G8ra+EQlD
X-Received: by 10.129.87.132 with SMTP id l126mr780062ywb.167.1490254910336;
	Thu, 23 Mar 2017 00:41:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Thu, 23 Mar 2017 00:41:19 -0700 (PDT)
In-Reply-To: <CAHiDW_GZuxuq9JHmsQ4aHM8M6iiFbz3-5yg9fhimD+LmC=xq1Q@mail.gmail.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
	<CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
	<1490213829.15509.26.camel@intel.com>
	<CAHiDW_GZuxuq9JHmsQ4aHM8M6iiFbz3-5yg9fhimD+LmC=xq1Q@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 23 Mar 2017 09:41:19 +0200
Message-ID: <CAHiDW_EZKcJt=+KQR09EstGzqQn4ckbKa--y+=FwMtkq3SmnVw@mail.gmail.com>
To: "Patel, Vedang" <vedang.patel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Thu, 23 Mar 2017 07:41:49 -0000
Content-Type: multipart/alternative; boundary=001a1146269a8e350c054b6102cf

--001a1146269a8e350c054b6102cf
Content-Type: text/plain; charset=UTF-8

On 23 March 2017 at 09:37, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> On 22 March 2017 at 22:17, Patel, Vedang <vedang.patel@intel.com> wrote:
> >
> > Hi Jussi,
> >
>
> Hi Vedang,
>
>
... and somehow I only received the rest of the discussion (where all my
points were already handled) now: carry on, sorry for spam.

Jussi

--001a1146269a8e350c054b6102cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 March 2017 at 09:37, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mail=
to:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">On 22=
 March 2017 at 22:17, Patel, Vedang &lt;<a href=3D"mailto:vedang.patel@inte=
l.com" target=3D"_blank">vedang.patel@intel.com</a>&gt; wrote:<br>&gt;<br>&=
gt; Hi Jussi,<br>&gt;<div><br></div><div>Hi Vedang,</div><div><br></div></d=
iv></blockquote><div><br></div><div>... and somehow I only received the res=
t of the discussion (where all my points were already handled) now: carry o=
n, sorry for spam.</div><div><br></div><div>Jussi</div></div></div></div>

--001a1146269a8e350c054b6102cf--
