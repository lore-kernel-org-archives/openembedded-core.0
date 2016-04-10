Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 495C577112
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 17:31:00 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id u185so15884962iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=eNIAqyWA+WvP9rB/SehekD3mhAmKJJUui34kc+wHbJQ=;
	b=FgFlCxcc7OU0+ipXFnYUOt253eZKbuxlz+ZzOrhF6ZgOYj4S15AltQ282HvV1CqH7b
	tszGPfU+5gnaUd0x3iGz1AsnIWGRlR1r4r/bPgAoxb60/eez/F9julbOJZjjcUwtxGa6
	FSbiO50S7R1YCIFoOZVux2tYBKmCZQ1TPYV2gYYdHZcF35SZiARuh/IOSVbH7iZKPK1b
	1t+G8Nc9TKzFhBQlBDQqhpRPcgycwva4uiCw+tCZc9NssdpcQ+m5ziAGbqNEHWWu8hyA
	oH3IgbjnJb5yfru39Qjezh7sZ55EIAGs+yASeyGSeFZXlGL8wtUC/jXJbz0n4bBLAamp
	+oLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=eNIAqyWA+WvP9rB/SehekD3mhAmKJJUui34kc+wHbJQ=;
	b=chlwgWrWqFLDGCznonCiRKVdePsRU+RVvuNsBbJGY8smj4JhFWE0aziD2Cn4gZUAwc
	QSlI1daMOVJiMTdUrbbJG00Z/HaxhdeMCZPoehDOIYIUbC1X1+UeFHlVuo8S3/gv3yAs
	4meaya4/mApqd3wEh9J8UmXq8tColX9tHiVIpbzTizGjoJPOMP6M+DboGmF6Qr6kaJKu
	xRGnXOh+36WWjNXJNuBpb8URE/8MJd8sTiLEWKLDaDmmWxcAZmlwB/75OUugNQ3vv1Zb
	x93RFpzyDB4AtFT2j9Sr7HbGPte5GTaTtabuU26c0PFlFNiYjGhOWmTgM7nVeGKSEMHI
	N2tg==
X-Gm-Message-State: AD7BkJKphbZRdr0Er6WJgiMuQRdQD/c92n0MEGVX0Vpe9mDt6kFgpxHpvWbZ8qJMyS6orULd4Kz2ySwNOpajwA==
X-Received: by 10.107.12.224 with SMTP id 93mr20062867iom.70.1460309461263;
	Sun, 10 Apr 2016 10:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
In-Reply-To: <86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Sun, 10 Apr 2016 17:30:51 +0000
Message-ID: <CABcZAN=d3EAENtVr2XJm=rO8nNAy9B9NWcJh5b7mjcdV6wfGvg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Sun, 10 Apr 2016 17:31:02 -0000
Content-Type: multipart/alternative; boundary=001a113f91aeb38e7d053024cac6

--001a113f91aeb38e7d053024cac6
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 10, 2016 at 7:16 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> It mismatched such as qemux86 and qemux86-64 which was incorrect, for
> example:
> COMPATIBLE_MACHINE = "(qemux86)"
> But it treated MACHINE = "qemux86-64" as matched. The similar to others.
>
> This patch fixes the problem.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

Did you verify that no recipes are in fact relying on this behavior? This
variable has always been a regex, so this has always been the case. Also
the ^ is unnecessary, re.match always matches at the beginning of the
string, re.search is the one that does not.

--001a113f91aeb38e7d053024cac6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Apr 10=
, 2016 at 7:16 AM Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.c=
om">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">It mismatched such as qemux86 and qemux86-64 which was incorrect,=
 for<br>
example:<br>
COMPATIBLE_MACHINE =3D &quot;(qemux86)&quot;<br>
But it treated MACHINE =3D &quot;qemux86-64&quot; as matched. The similar t=
o others.<br>
<br>
This patch fixes the problem.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br></blockquote><div><=
br></div><div>Did you verify that no recipes are in fact relying on this be=
havior? This variable has always been a regex, so this has always been the =
case. Also the ^ is unnecessary, re.match always matches at the beginning o=
f the string, re.search is the one that does not.</div></div></div>

--001a113f91aeb38e7d053024cac6--
