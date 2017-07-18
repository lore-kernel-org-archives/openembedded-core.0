Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id DDDA57807A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:12:35 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v127so11120979itd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uAibEgciCjNXHL0kpT0yAxlpe+Vr9Nyh+yNKPaLNcRA=;
	b=J3MLy4BHkiiik/n3XdPhCqFbtMPQxkCYaWuNARKEKQP46ggfyEuqi/Of/lDI7ETeDn
	exAzhcAu+RSwEFgtpo/eAnBWB/ln5CmOY8tgUpTbscsKUkez/dC3Hp8shE62VQOv58ft
	L/lfQ1/KVl3jBv98+3L/zL+JMGoO7LyfRvBBYB6Tsli1sAi8VENqajN3jEInnevcGQ9g
	2JFo0unAXAAgIQrLL7MUARQMzhF/QW2W9PlITjSubXeeaArQ4FvscB6hAwRYku8Tz1B7
	ZfAvP+NM7xfdtZkRNKyV24GRqFLU/pUTJifq0ieDBvBVhan8IKE0DLPkjVT3mOJCJnPL
	M1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uAibEgciCjNXHL0kpT0yAxlpe+Vr9Nyh+yNKPaLNcRA=;
	b=sjf5YshKcoQLg2rRLJubN2osN0BwA6xCvR0CrBfODK/kYyfdC99eDA05onquj8IYyL
	U/+HbNVy6sryZJx/ksA/DBISGXiZ9yTZA2dCOwVPmD7XH/7DZdEeTytdjtD5xkcD8y0R
	SmFFLPwr0+iZyuraw1CoW1nn+JvXTTz57wwRf60frsJngD3ZrwcDKAJtwDHgM2iJ19WQ
	c7nwP632d52h1ILHh+Zvv88SPuaCbPli1nT+caDOcgHqRaEqwGeWLcCoGENigBlqPPAW
	S/Dy6bOgmKpiUc1tYX3ojzLEUyqGA367W8A7ZvRm1cHxwNkIEQyxCMHwt7BIO2wRpgDm
	OOYQ==
X-Gm-Message-State: AIVw111Mc9cyOiC/0qznHuYNN1OU90ZrV1yy3kHqK8Nx5nQZG7zlV6cB
	dqVrwtlo1rWkaxc2hWMnIgEPT3cjaPAu
X-Received: by 10.36.40.196 with SMTP id h187mr4339236ith.43.1500415956902;
	Tue, 18 Jul 2017 15:12:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.143 with HTTP; Tue, 18 Jul 2017 15:12:16 -0700 (PDT)
In-Reply-To: <cf77abfd-b4d4-cb57-2cc9-f8ab6a7d9835@gmail.com>
References: <20170718220735.6547-1-ross.burton@intel.com>
	<cf77abfd-b4d4-cb57-2cc9-f8ab6a7d9835@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jul 2017 23:12:16 +0100
Message-ID: <CAJTo0LZ8zKiXAAXbKvQQYMSrN_0LR_rktcXhONcJ-BSfFMnzNA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty 1/2] libgcrypt: fix CVE-2017-9526
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
X-List-Received-Date: Tue, 18 Jul 2017 22:12:36 -0000
Content-Type: multipart/alternative; boundary="001a1143f65a20b3fc05549ed000"

--001a1143f65a20b3fc05549ed000
Content-Type: text/plain; charset="UTF-8"

On 18 July 2017 at 23:09, akuster808 <akuster808@gmail.com> wrote:

> is this version 2 or resend?
>

See I thought I had already sent it but didn't see it in my outbox, so I
sent it again.  It's just a resend.

Ross

--001a1143f65a20b3fc05549ed000
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2017 at 23:09, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1nj" class=3D"a3s a=
XjCH m15d57bf8b1bc7ae2">is this version 2 or resend?<br></div></blockquote>=
</div><br>See I thought I had already sent it but didn&#39;t see it in my o=
utbox, so I sent it again.=C2=A0 It&#39;s just a resend.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143f65a20b3fc05549ed000--
