Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id A69A37F7B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 16:20:56 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id z17so1259926uac.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=18+Mg65aqRvkaCb9Ln2wMlJnex8mx+SZ7oiIAl38eaY=;
	b=Gzy8nRB87v/IHhVNMCOmCDJ2/8zhhjuRTGS4EXX72X1aa7JYE8nIqcLhk0ebKRJOT/
	uiY7SytJ8M8ZVVjE9yfViIRdQ9ps3sURE7BxnqkO6FIBFwpZ1HDdADnFIOauJxyo6ihB
	4AoL+Mnhy6NSNuZKk0r4dHwEpHBrufVeu58Xjp9LrecxJHKkCBlYKD7SSizCqLAv8mBY
	BudqlNEMJq33RCeIBmVUXktZlJYDGHxQ/PZlUijzvxERYNU92T0ztDRIufgiv6AmO5w3
	7ApxmmQnhVSvFb61Bic3226exI49JwnVNLwSwk7xwFAH0sD+3ZrgbVfYf31pCdOWAHhU
	CYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=18+Mg65aqRvkaCb9Ln2wMlJnex8mx+SZ7oiIAl38eaY=;
	b=mx9Gs+FPNnYRchQPxl6VB3B302oz9RgBL+JF7w/e4wvNeUw4n1IrJgW1B0PYR2xmpP
	6iGpHsKp9iOJHfkquA6CzHUSuHaSxt9gIe8AIwrf18CoTfRzIpe6SOP+ZGJKx57Xkv5j
	J9hyMOLudJqmW7uHslEzO1qECEm4dHLoGikr3BzidGOkPviq0u7r1737cLtBvXyNhcrn
	NIziOJW9CTAZqrgnbOGEXtBKXd6L5T1o8IXRiRAkp6x/rSmPRfNd5fznrIptO1CQHRET
	Ut0TbcS+40AcgqfFPpF2eUfEho8RDxhhTMajEmeHNqHU+zZlIuh6URxe+a4tCHhHy2rn
	n6Qg==
X-Gm-Message-State: APjAAAUkyGuNr2SYcNGVW+290JhfFaB0g7DlmDQLJg2nfVF86rDfgx80
	XGDCOUxcU8JJeiaPBysIh+IUPl6yTR9U9zIUU98=
X-Google-Smtp-Source: APXvYqwT2mhj5twu5xxyIv30lkJeh2z1Z2k9Fu7ISGoPXOH/CyHw0X4Runnm8Vni8cYFVuxAKHQpU6mayRwb4Owr3lQ=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr19637870uak.22.1576426857370; 
	Sun, 15 Dec 2019 08:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-20-alex.kanavin@gmail.com>
	<e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
In-Reply-To: <e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 17:20:46 +0100
Message-ID: <CANNYZj_Fj1KZoTDxsVzyJ_4Ya9KHOys9LsY1OQgm4UogC_xd-A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 16:20:56 -0000
Content-Type: multipart/alternative; boundary="000000000000d919440599c07ace"

--000000000000d919440599c07ace
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Dec 2019 at 13:53, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> > Removed the bleeding-edge variant; if it is still useful please
> > maintain it separately.
>
> Its needed due to people using varying kernel versions and in
> particular by Bruce for testing of new kernels.
>

The bleeding edge variant has been introduced for the first time by Zhe He
of Wind River 6 months ago, and hasn't been updated since. If I had kept
that in, it would actually be providing an older version of the component
than the main variant. So I am not sure if it's actually being used; if it
is, then it should see more frequent updates.

Another problem is that devtool isn't able to upgrade the main variant
properly with this included. I'd rather split it it into a different
recipe, if someone confirms the need.

Alex

--000000000000d919440599c07ace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 15 Dec 2019 at 13:53, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2019-12-12 at 19:14=
 +0100, Alexander Kanavin wrote:<br>
&gt; Removed the bleeding-edge variant; if it is still useful please<br>
&gt; maintain it separately.<br>
<br>
Its needed due to people using varying kernel versions and in<br>
particular by Bruce for testing of new kernels.<br></blockquote><div><br></=
div><div>The bleeding edge variant has been introduced for the first time b=
y Zhe He of Wind River 6 months ago, and hasn&#39;t been updated since. If =
I had kept that in, it would actually be providing an older version of the =
component than the main variant. So I am not sure if it&#39;s actually bein=
g used; if it is, then it should see more frequent updates.</div><div><br><=
/div><div>Another problem is that devtool isn&#39;t able to upgrade the mai=
n variant properly with this included. I&#39;d rather split it it into a di=
fferent recipe, if someone confirms the need.<br></div><div><br></div><div>=
Alex<br></div></div></div>

--000000000000d919440599c07ace--
