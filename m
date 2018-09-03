Return-Path: <ticotimo@gmail.com>
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
	[209.85.222.53])
	by mail.openembedded.org (Postfix) with ESMTP id 977F771BB9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 15:14:45 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id m11-v6so638549uao.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=se/ngo91UJAttT0G6KdYM2RgwNJ7aEk5lAkbtDa6Fd4=;
	b=D4GDqqdAkCrCTELq+4rKJkKCfh/jC7/DmPWfrl/zgo8NGnwkOsayspd+NxuWMhhAP7
	EMbgH4lWXBhIPFe3hYqJFsmX8I891b43Q66JHfBne5h38/aU+bR950fpElpWUXQj0MMl
	7zGIRLDqns0fGsEh8W4LSKY71GbPakGbfggT8wIe545quEtBAiTyWx5iNBQaXR2iB+fi
	ckxDFQmSQEemx2hrAPbfThiP8P5UyjE9/JScWb3ZDrQA9BsWlBgnivmS/J00yD3wW6tw
	xX7QO35+YDJ2MHByJxUN41xD3oe8SuDnaiRpD0ID2SEInj3acLV7a2f+wYEqNkoMWV/9
	OP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=se/ngo91UJAttT0G6KdYM2RgwNJ7aEk5lAkbtDa6Fd4=;
	b=HtbW15OXE3JHu6pokg3RYTinVRjuwKBstAcHGnZopcx7QtzeiTI+07ICZ6i3o78OEW
	8mQJ/xy3Yls+W5MM/0ALEE5Zqy4voMsHxZR8aO5ABUil+iQLZO3RVHbwn583JnZ4G+v+
	S16ZqXa8w+qJQ0atuPQcSrx9rpkC8wloABGtaA9Gl6SujKbLJavDhSr8/JPyKFXToaLn
	s+gDy2R0Ido8Xje6BZHUu6Gqap/1F/QMvBFeLBfpVRvaZFDYm995V2hyyy9gKZYesj90
	ooBi9d4PRkjaCEYjl0+kmtUCHrNxB1sC/YUHYQS04tGyeYz4cNLdTfqtT0R5DuAs8nan
	U90w==
X-Gm-Message-State: APzg51Bg1TZjwg2tILReLyQ2qv7YlVbQqUSBjjiLVpLpMBEWf/xHm+qc
	hJst1AMqNOxcWfdLatYpFT0kufSI6AG9LcTEjBk=
X-Google-Smtp-Source: ANB0Vdb7pzV4N2qkQnlnoPrH9I8Ywebf5CTM0gA88Or4++J9k8geizbLyhIRAHlNk6Y9JHvn0DMQO+4mMIpEs4WYcdw=
X-Received: by 2002:ab0:6510:: with SMTP id
	w16-v6mr8899315uam.139.1535987686197; 
	Mon, 03 Sep 2018 08:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-3-git-send-email-lu.jiang@windriver.com>
	<20180831135324.GO26633@bill-the-cat>
	<e7261e4b-1d4b-afaf-7078-3884021878d3@windriver.com>
	<20180903025056.GE26633@bill-the-cat>
In-Reply-To: <20180903025056.GE26633@bill-the-cat>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Sep 2018 08:14:35 -0700
Message-ID: <CANx9H-A0SdVkXY-Nyb91WSJU4Xp9bWYwOtmep9Jgd2P-_hGiJw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic
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
X-List-Received-Date: Mon, 03 Sep 2018 15:14:45 -0000
Content-Type: multipart/alternative; boundary="0000000000006a4fb80574f9001d"

--0000000000006a4fb80574f9001d
Content-Type: text/plain; charset="UTF-8"

Also, what is the reason for the move? What problem does it solve? Why is
it better to move it?
On Sun, Sep 2, 2018 at 7:51 PM Tom Rini <trini@konsulko.com> wrote:

> On Mon, Sep 03, 2018 at 09:58:01AM +0800, Lu.Jiang wrote:
>
> > This patch simply move code from script/lib/wic into
> > meta/recipes-support/wic/files. I didn't touch code in this patch.
> >
> > Please see attachment for patch formatted with -M.
>
> Exactly, formatted with -M it's clear and a short patch.  A follow-up
> question now, are there any comment paths, etc, that should be changed
> as part of the move?
>
> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006a4fb80574f9001d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, what is the reason for the move? What problem does it solve? Why is i=
t better to move it?<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun,=
 Sep 2, 2018 at 7:51 PM Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">=
trini@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Mon, Sep 03, 2018 at 09:58:01AM +0800, Lu.Jiang wrote:<br>
<br>
&gt; This patch simply move code from script/lib/wic into<br>
&gt; meta/recipes-support/wic/files. I didn&#39;t touch code in this patch.=
<br>
&gt; <br>
&gt; Please see attachment for patch formatted with -M.<br>
<br>
Exactly, formatted with -M it&#39;s clear and a short patch.=C2=A0 A follow=
-up<br>
question now, are there any comment paths, etc, that should be changed<br>
as part of the move?<br>
<br>
-- <br>
Tom<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000006a4fb80574f9001d--
