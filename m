Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
	[209.85.221.170])
	by mail.openembedded.org (Postfix) with ESMTP id D40E261813
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 20:25:15 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id b2so131721vkk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 12:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5abkP/uDZUuZwcTyumVGlCVkuTa3Kg9S8GKAActtbZ8=;
	b=NODtFTND0adGfHdB1kC9RMhy+bg7N2U/K5sP8w9jwN4N4og1nHIS7LIeA9HwbTyKL9
	Xrof5NzCTHLZF+uj1B2Q/IuM/P2MtpxvEXr3D3s7FmYE9TTpEyu+s7tASgJIk0epCdEy
	AwncqM2FsTUxos3FqsQmQqaNU8HdtuJBgcoBSxn9e5o59YuUgtPlp/2flpQQ1QIOgpYp
	Q8+5iS6nNP9BiwpIS/bDeQR9MO/4ZBtBmIOGMnK1XFnceHwyU1pnlW/FbVztSAwZf+ao
	raK2UAPYalQrWEIyig3yTlKrQLyRxMSDXOhE6Lk1yX6SCIvkaES4iaCbgbbgl9siWRzh
	X1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5abkP/uDZUuZwcTyumVGlCVkuTa3Kg9S8GKAActtbZ8=;
	b=koKuz3Ogkbw0UrOldN2Voy1c3KHcSna05oMIx0yc3lOteDMygtl7ZyLWw06yg0rEPH
	RnQ54SRkaAnSvCg+N3IFQ+yT+4XM7s7xQttti1ZNj4yVs55q5FXLbUvgsWalA9tg3Ghf
	6VQvNyD4fa18kpaIWp9LJSstQFaqtObu5f2ervk1sgc3jayTs7e6sZDuL7Vb7YCkfwhg
	J99AAb5oCVjQg/7y5VjDWe1YaD9R+6vKyTBL9dLqYjxa9W8E/p8FC1B+sW4wDqvyfTDl
	eNoRSvW19ZIkj/gHjzK91NF0yq7+7uiKfFeKyIYXIVcyu7Aglxg9eIsjuQ2F9FHfiP2l
	KI/Q==
X-Gm-Message-State: APjAAAWad7ceH6kf+T/0fiNsgfqaXEAYgnhtuvAtfODPDT14C2oWnesK
	mm7napIYM4QWtam2c7dmDVmQHq+ionN5UD2Ph0Y=
X-Google-Smtp-Source: APXvYqzevTE0yXhJ0+Tck6U8wuNRnZeJdEbVZ2JuFSaL9irWNf21u2bzDhO1opTMj5e2uHiEvtdSBQk6/7SBvtdbDOs=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr663461vkc.1.1582662316711;
	Tue, 25 Feb 2020 12:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20200221224537.4052134-1-raj.khem@gmail.com>
	<20200221224537.4052134-3-raj.khem@gmail.com>
	<CAJ86T=WpKBfD119m1G5jgW4Y1UA---WWSc0UkMfRzi8oEiwPTA@mail.gmail.com>
	<CANNYZj9XLm-OyAzMHCDauggbpUVBfnCLq1VXFZjw1eaWM0YyQg@mail.gmail.com>
	<CAJ86T=W1n2GoOa7wSdKzZ1rPOr1RkMgAH7b+CKZypXBi66HQag@mail.gmail.com>
In-Reply-To: <CAJ86T=W1n2GoOa7wSdKzZ1rPOr1RkMgAH7b+CKZypXBi66HQag@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2020 21:25:05 +0100
Message-ID: <CANNYZj94dRzpG+VcHEOwtgsYjm-wKj67eVmEvDNEUDL+j8gxAw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] ninja: upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 25 Feb 2020 20:25:16 -0000
Content-Type: multipart/alternative; boundary="0000000000002fe531059f6c49cc"

--0000000000002fe531059f6c49cc
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2020 at 20:57, Andre McCurdy <armccurdy@gmail.com> wrote:

> Thanks. The maintainers sometimes forgetting to reset the author was
> the part I was missing. Maybe the patch checker could be updated to
> check for that?
>

The patch checker already does this too :)

Alex

--0000000000002fe531059f6c49cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 25 Feb 2020 at 20:57, Andre McCur=
dy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Thanks. The maintainers sometimes forgetting to reset the =
author was<br>
the part I was missing. Maybe the patch checker could be updated to<br>
check for that?<br></blockquote><div><br></div><div>The patch checker alrea=
dy does this too :)</div><div><br></div><div>Alex<br></div></div></div>

--0000000000002fe531059f6c49cc--
