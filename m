Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB767BDAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 13:10:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c14so4033227wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IQp43q9rhWomhDJSMCmie8FLsn33QFFFXxhshdfwP1w=;
	b=SAS9HN/1LwjQI6G0Thm8FUTi0sh5yTxTqRFHM+8I2pTzHmh24rLS3WE1eQzqR6vbKF
	SXR/9KQU5o5Sb5jJ/cIa398ePKom8w164qBIEpWoBHB7Kz4lL+ck/45+V9njvwZQ8KEZ
	zyK6oixBBr31yHpOegq3nzXZLmBJ6EzjrT1oMVn6VBNjJ01T0liwZ3cCUWaqxhloaa9h
	nFw5UJi2Bopvql1MvBWbNglyWwlHlayDw8JAyd64wdcQ248hAQ2HspmvH//7jSzwbw48
	xwln0b6QD3KwuzsY6dzZR7AjQ8Ew29ic7AKrv1k7kpQs5WBxF2wsPpqK3K6km+0K4YgH
	2pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IQp43q9rhWomhDJSMCmie8FLsn33QFFFXxhshdfwP1w=;
	b=rusQTqNsELvRZEcL+x4SYdRaClWxT41L/LDT1TYiQPp4a2qTXl6qr+3CFCFnlzGxmF
	06IGX02xoPb45gu/MGO+ZXVtA7lJUWYpFbXjbJeAkATbSKslSKjE3G7QIKZF5ulEksra
	2oLw0+wARrbcSTY3gKireZ3LuRF1EFqeufTHVDEmGLo/U+tZzkqHYzTJSpc/7C/GpvPk
	xIJW2uyZ/S5OFseA74jcPhYto/aYMek0Ien5GQNe1aNIsVVL0Kw+QMApK15D/VXaZtKK
	pwaPgoLsd/dTeoIrUbA/6zUy8WNwqANIZFaYyPYY6NysdFNVZllCSiVAVeaPWCByN3cO
	i/Kw==
X-Gm-Message-State: AJcUukdT94bjj2OIElYLcBJBne1Rj5gRMAJtIma14ssF0I2Gf4qXTluv
	oJyPWWP9M7F8pAgopbN0uQJULeqWtH0OuHfT4rc=
X-Google-Smtp-Source: ALg8bN5Xx1mrpEewyS86+CduHiPWbifT/+14Yvi0qalF9OWOio6GnJ6MiyL7ypEewEYWgP+QKWmoG1rsF72kNJ8iEFQ=
X-Received: by 2002:a5d:5351:: with SMTP id t17mr1422168wrv.288.1546953035564; 
	Tue, 08 Jan 2019 05:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20190107163823.31816-1-ross.burton@intel.com>
	<CAJTo0LZ__dsz_LuVUS6FPD+dkW7mkY+a5kMJJgTieUxwY0ZEHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZ__dsz_LuVUS6FPD+dkW7mkY+a5kMJJgTieUxwY0ZEHQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 8 Jan 2019 07:10:22 -0600
Message-ID: <CAJdd5GYp38NPZkF3Ouyj8oHiKEFfvPAeQ5x=ocXLf4iroOH39w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] toolchain-scripts: run post-relocate scripts for every environment
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
X-List-Received-Date: Tue, 08 Jan 2019 13:10:35 -0000
Content-Type: multipart/alternative; boundary="0000000000002b50d2057ef212b9"

--0000000000002b50d2057ef212b9
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019, 5:02 AM Burton, Ross <ross.burton@intel.com wrote:

> On Mon, 7 Jan 2019 at 16:38, Ross Burton <ross.burton@intel.com> wrote:
> > SDKs for multilib configurations have multiple environment scripts, so
> > re-arrange the post-relocate hook invocation so that it runs the
> post-relocate
> > hooks after sourcing each environment script.
>
> I think this change - whilst the right thing - exposes a problem that
> icecc doesn't work properly in multilib SDKs.  Can I ask you to
> investigate and sort this, as you submitted the icecc rewrite
> recently?
>

Yep, I'll take a look.


> Ross
>

--0000000000002b50d2057ef212b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Tue, Jan 8, 2019, 5:02 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton=
@intel.com">ross.burton@intel.com</a> wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Mon, 7 Jan 2019 at 16:38, Ross Burton &lt;<a href=3D"mailto:ro=
ss.burton@intel.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@intel=
.com</a>&gt; wrote:<br>
&gt; SDKs for multilib configurations have multiple environment scripts, so=
<br>
&gt; re-arrange the post-relocate hook invocation so that it runs the post-=
relocate<br>
&gt; hooks after sourcing each environment script.<br>
<br>
I think this change - whilst the right thing - exposes a problem that<br>
icecc doesn&#39;t work properly in multilib SDKs.=C2=A0 Can I ask you to<br=
>
investigate and sort this, as you submitted the icecc rewrite<br>
recently?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yep, I&#39;ll take a look.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Ross<br>
</blockquote></div></div></div>

--0000000000002b50d2057ef212b9--
