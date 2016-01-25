Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A4C38601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:14:23 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id g73so163907537ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vML4/AW0XFSBX/EuAlzn+tFoiC+2YBKwpwz8uXKuVns=;
	b=EFagzNHIr7Wp/P6cJN4XHtdFqul5/WTtsgVj5c1yEhiXVbAlcg3AO3xP1RMNhfhKXu
	EDcNMMyqhl2xQVw+dZvwo+/kzNmpiCWx3CnAr9nQwdNy/MnjMXg7u7Qp8PcBi5GleTq6
	rI7uU08tHAnJ/OWmtsN7LfegXXfHmFYFAGdLhXnqOCJNnEC1y0jSOR479NLnN4umFI4f
	N5F1PycoNuHbunTiGs9/vsewaxHiO4S5lRCqAu1xrv+xsCAbRhUiipjPO/DDSUKwi02p
	oBasVeIq09CMl88HpFcnntzZ96o5FayMwKEh8cO3qpEd9Bql/O0T3d551+sQ3b8LDfHx
	eHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vML4/AW0XFSBX/EuAlzn+tFoiC+2YBKwpwz8uXKuVns=;
	b=QxZGS8y0CYR1XqjKKN/0UvNwUHm8EYJTsg8RJpj/pdnL35qDAbycWPmuab/f58zQdC
	2lP608Rf5BPF/riK6ZSiLCVx2V5SvN9v/pFLuVvKZN3ARLh1pbssXTK5v4gu1aGUG02c
	XZkZL4lHag632r+ZP0Hfzx2aLsrd38s//P1gHiXDwXmZavgg1Xa6xppqnWSHc3eAyKHO
	nskWtWzeBRvA577kNeoDiPQ+MoAn0o8G7cB8oSpCNmWvDJUlO/DqKu60kqudaENUH/w7
	bP2zPV5ygZU+P2wHjKsHut81R2vCE8lA1c+NzIhxv2hSyXe2lhkEPTDwcSNQQETffwbl
	Hcnw==
X-Gm-Message-State: AG10YORJpr6k4CnYvJrWaLnIso69Vr4aTGwfoJR5j3nBTGc+Gk+Dmgu9/h3wxdO2aWhMHnfLBDmnTjhq4duZ8i0H
X-Received: by 10.107.3.154 with SMTP id e26mr16912028ioi.99.1453745664688;
	Mon, 25 Jan 2016 10:14:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 25 Jan 2016 10:14:05 -0800 (PST)
In-Reply-To: <CALbNGRR-p420-Ot8Qy6KNpUnc1VvWTKy+uCz7b7xSVWmzBX7TQ@mail.gmail.com>
References: <CALbNGRSZ+edCEyGJzWbkniTkds6M=PqF3_gD65=fO0JiYOELBA@mail.gmail.com>
	<CAJTo0LZbDJS6MCjsXqaBE7krYiR9toB=VoxaXGx+2J45hw+jKQ@mail.gmail.com>
	<CALbNGRR-p420-Ot8Qy6KNpUnc1VvWTKy+uCz7b7xSVWmzBX7TQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jan 2016 18:14:05 +0000
Message-ID: <CAJTo0LbFsW0iSagKop1EvT67VyrCZBzZq0cfCH88DskDThM+aw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg pkg_prerm on package update
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
X-List-Received-Date: Mon, 25 Jan 2016 18:14:24 -0000
Content-Type: multipart/alternative; boundary=001a113ec10af02772052a2c894c

--001a113ec10af02772052a2c894c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 January 2016 at 18:04, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> As you know of "i'm being deleted" or "i'm being upgraded" - you have
> a pointer for this? To find a common solution: Do package managers
> share same behaviour here - or is there a common document package
> managers should comply with?
>

The dpkg reference explains how dpkg works, which is generally how opkg
works.

Annoyingly I'm not sure rpm behaves the same way...

Ross

--001a113ec10af02772052a2c894c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2016 at 18:04, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":12g0" class=3D"a3s" style=3D"overflow:hidden">As you know of &quot=
;i&#39;m being deleted&quot; or &quot;i&#39;m being upgraded&quot; - you ha=
ve<br>
a pointer for this? To find a common solution: Do package managers<br>
share same behaviour here - or is there a common document package<br>
managers should comply with?</div></blockquote></div><br>The dpkg reference=
 explains how dpkg works, which is generally how opkg works.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Annoyingly I&#39;m n=
ot sure rpm behaves the same way...</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10af02772052a2c894c--
