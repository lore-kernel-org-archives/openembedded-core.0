Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id AD475600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 10:02:15 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id 12so3257785uas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LUdjozYQ2bEJdnGpm8CtG4bCjI72ZJ8aZaUJmnoWS1k=;
	b=EsfC9s0T8D/wPqX0LDxsNifWwzyWX7ucq4JzYNg2YT9CWljpKe+DoHWe5IsVpXRiPv
	erIgYdNi38dDM925sspE9pZeG7Q7GRCEZKvTb2C6n+baGb8jQj4bh3cyIC2pLPD47h4b
	zAP4PFjvwQYtEtrEKWnF09tABCy8nsDFvYM+sWd3ZLv7rQGeZl0ND3Yn9gyt3gcpAW/w
	Z0d0eZ7WVl6NNIoqKaYuklGPBP0FFly5aJKFU3FuDY28ctXaiPIEI574eDnFy+JPoAx8
	t5mRUNODz5bpbMoJmk6Y/B9f1GinPiqDkCaHOSxDyFpE6gNOxl9qmoZpgAtFsIfhXvgH
	2dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LUdjozYQ2bEJdnGpm8CtG4bCjI72ZJ8aZaUJmnoWS1k=;
	b=IdCZwoBghbfeAA9OhuISkKgfcQnWAYYMwT+krcVYJoa18URYPo8jz6/pOX1duB/dMR
	Z+5xklKo1aiP+m6bOvGzJyv/Q4eaboKFBgAscud66uVgdgKe6qHPGU5HP0XkmvCGfSQT
	gtjUGCPClFkLVm4hkJWl3y4InuBNvH9cAMSYKaSDebgNnLzhwpoKEuQyrg2xNX9Jw8hB
	ug9hAwIKMgCjz5JoZEOP4X5j0Z4aMpiu03SV1GQr7H15HYDEjdyjrYzOjfwRooq/PAcS
	FogAM/NUFRZG9vx6pOtA7PNlVGg+P5M436qG4dJQt+ipS/19v+dWfc2DKOj7Pv+h0Lt4
	S7cA==
X-Gm-Message-State: ABUngve6ZiiVZyaLzPJZO+wjfKMD+wVH90sfwtTc1Ca8ovRnGr0A/NHkrU+1cj71ZSQyMg1t+v1jxB8+EuhrWg4x
X-Received: by 10.159.38.52 with SMTP id 49mr6969501uag.14.1477389737110; Tue,
	25 Oct 2016 03:02:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.74.195 with HTTP; Tue, 25 Oct 2016 03:01:46 -0700 (PDT)
In-Reply-To: <1477387924.20929.1.camel@ts.fujitsu.com>
References: <1477387924.20929.1.camel@ts.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 25 Oct 2016 13:01:46 +0300
Message-ID: <CAHiDW_HLiPEOXC6FgaenUr1s0sByoG6Zn1X-u6Q2D439A8rOXg@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Howto find the providing recipe for a specific package?
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
X-List-Received-Date: Tue, 25 Oct 2016 10:02:16 -0000
Content-Type: multipart/alternative; boundary=001a1141b91279d0a5053fad9aa0

--001a1141b91279d0a5053fad9aa0
Content-Type: text/plain; charset=UTF-8

On 25 October 2016 at 12:32, thilo.cestonaro@ts.fujitsu.com <
thilo.cestonaro@ts.fujitsu.com> wrote:

> Hey!
>
> How can I programmatically reverse lookup the recipe which provides a
> specific package?
>
> e.g. kernel-module-xfrm6-mode-transport is produced via the recipe
> linux-mainline, in my case,
> but the packagename doesn't tell this anyhow.
>
> Is there a way to get the recipe?
>

This should work after the recipe has been built:

$ oe-pkgdata-util lookup-recipe kernel-module-xfrm6-mode-transport



HTH,
  Jussi

--001a1141b91279d0a5053fad9aa0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
5 October 2016 at 12:32, <a href=3D"mailto:thilo.cestonaro@ts.fujitsu.com">=
thilo.cestonaro@ts.fujitsu.com</a> <span dir=3D"ltr">&lt;<a href=3D"mailto:=
thilo.cestonaro@ts.fujitsu.com" target=3D"_blank">thilo.cestonaro@ts.fujits=
u.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hey!<br>
<br>
How can I programmatically reverse lookup the recipe which provides a speci=
fic package?<br>
<br>
e.g. kernel-module-xfrm6-mode-<wbr>transport is produced via the recipe lin=
ux-mainline, in my case,<br>
but the packagename doesn&#39;t tell this anyhow.<br>
<br>
Is there a way to get the recipe?<br></blockquote><div><br></div><div><div>=
This should work after the recipe has been built:</div><div><br></div><div>=
$ oe-pkgdata-util lookup-recipe kernel-module-xfrm6-mode-transport<br></div=
></div><div><br></div><div><br></div><div><br></div><div>HTH,</div><div>=C2=
=A0 Jussi=C2=A0</div><div><br></div><div><br></div></div></div></div>

--001a1141b91279d0a5053fad9aa0--
