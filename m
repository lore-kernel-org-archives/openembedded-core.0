Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44147.1793197297306193635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 07:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qcPuKuQc;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab37e44643so7085517b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197296; cv=none;
        d=google.com; s=arc-20260327;
        b=aI0sVM1hPiYL9mxKPrii+YpJFkHdvqfbU2fwWLR3HsnChl7jcRWPwFn0BxLlJx0LAs
         x0ujvu0dAkGwI48thc+p5k8oVmjou7eEhLAb1arht1gOM5XPcoA07NL8qcBzBdQa0G1x
         M9W/W9cj2Zj7tfDdqJlf/fcdGGq4iVwbUBeEGiEpyKZtWCMy1Ne4LHVH7/JLqsHTtRUD
         MbT+JF2iTbs0y4OOk8IZUm5sRC5D3co66cvHwxMNnBgPpdK/gaN1gkkQ7dkQJiElzDKB
         Ly5I+S+ZuV97hWcdL4b/DDSx8RSuaIF5Z+N5xr+eru/Z5L2hmN70rv2lAu9e98ycJ5BA
         rzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WWPd/L01WeavN2mFyljKnYnArRgQdB6kYAfGWvTpY7k=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=WPTI+V0a1tw9vdSrvL4ss/1VLNWoz+7zX/u8EbjSGBe15rtibjds6s8qVsEq+bHy0Z
         BGGRBQTeFZglbG3IB9SQDwotb0xfp/+ZD6hrUvg284hgEmVS7Jf36zS4oZHPi1azX3gr
         4GR4PiSVf8yGzGKqQQ2/WcMKY0G4/CaGBZZNdnJM38PZUXBCUI2nxPM9lkfATDcbGPjh
         YnMP5RHvUp5W0j01t2YdaxOyAMLFghuC7bvWSAT7atYlPcYNMzmSmRQV0MbfN7MM4eI9
         +XKdEjyn0YjI3C8XeJTlaeFVAiSfXmlREjD1B1tpuKUfAgFVSPqK+o8DxrLMwF0GasGN
         VRTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197296; x=1793802096; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWPd/L01WeavN2mFyljKnYnArRgQdB6kYAfGWvTpY7k=;
        b=qcPuKuQcOeiat4buqJXmdb0hLzrnYyWRcGJ2JEuaIIAhVY1PS52DV/3irrSYTMpVlN
         3X7OMobSalgMpPP3BPx5NzP8iGmJZBskRn/7mRy6Aq8M1cy6J9j6C1fhUxK0LFeKyppe
         eGvYb7TeDVSgtbDDMnDQ1ikEsiNO02i5XCAIGtmzm4XdZbFdx2932kGG+SzMMQAwUG1v
         um4yBFuBIRDP+fYFrv7CVQcWlVqpEl6SW6rZ2lgSVsCsjO02EYZdZWrEyVW2/LPjq0sO
         LL4P1hsu1pDYj0e8dBHbOQo1gHW7vmn+ZiwlZ45c5ccHmhDTd/KzbMCm2j1KtNYuH6MN
         Rp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197296; x=1793802096;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WWPd/L01WeavN2mFyljKnYnArRgQdB6kYAfGWvTpY7k=;
        b=X82BM+ZJZnzcrSvWRuduSOcBxcSc9Q9mDk1K0OKmio6UqriJpAXca9kz6r5qbjc0Pg
         PuFnNgI9zmWA50Qb6nGSEg4I3xWxl1oweWqD7meBh4YNs+HqYxi6E6k0oov/e+U1hUel
         xRousGOJySfDi51cv2TKkUPRvCXTj9Us/oY9kZAPG6GOPxAEIKvo9uJDLvL0ZRDzYWod
         p5helZ9mtlYZoxia3OQnRlw5mjbyRuvzWtpYiuctmqjjbEo3qwLvKeAonTitGbjywNm/
         xqmWwZuqIGYMJfuA1hy0rTNnpNESHSoYYBu++uWrRm7f7ss9ZM066kSTQIyrqGONKynV
         PTgQ==
X-Gm-Message-State: AFq9FYKTEG5/upRqRrjossznRnJDRQ4+b/kwsmWUvZQUUvVE2NzjfVMJ
	+Janpa/JJ7xfvzS56efrCqZlu+O7ETQhMIwGjGNnA4WhTWhSFEQiYFw0cxZoDwyrHbH0e7QF6tG
	KXjjMZNfRxIeTFwAXUUPQSP9as9xkS4T/4A==
X-Gm-Gg: AYBFou3OOw3lM4HD1Fy2XEkGna2SflgdawApO5hWH4ozNEvY1excNznhNeOlfXSTF/D
	XQs1HHgEQuh8h8SR9xTBodwBtT/SogRHbl/m7qzVDrlCqXE9ni70JDy0LlF7uLZOda9+6TGp9vZ
	MvNL13IU7LYeZQtIM6vLA/eO5jGFK+/mHwcfKzvj0mj4ilv0cG78jWbXHS/s1pC0ohB20KUgKe0
	RqUgLeyTuVuXeAOq0n/z379DBJgrkkDbIrpE51/0kPOebAFRgzgVT6hMvHplV7Arzq1AqkKcKAv
	AAJ9kLWw3GuC0eL9t+ueL1WzReFK0Gl/JNfHQoeGaN/+ld+UEq9bZyvDyyHgRCZKYO/bllKAh+/
	5hnP9N1ptZBHXnbhpI9L7rbzWAytk+hMgqNrJlVbRJeT/eVSOiVnjPv7F8Nb86V4fmSa7z0le9X
	Bo+777TgcUkebEEv/7uvJmo91LulObb3BS01KfrZ/KIQ5tkKGb3BBD3JCkiHAiJuU2sPQ+Q0Wau
	J9tqYWg1GFKOtpwPOrpL4Vj+XoWXq4aNEU3mdr6eBV5aWkI25/u5PFnIG0+2zU6/WkmaShxOoYT
	VmgQX9eSXxEeD3s0W6eMi8WJyylpbnsDB5G22A6frR5q2vpXm+6PYzBK/350X7w7UxZNGuAxVcM
	5ykIgFAq8mj04SoZgP6cP0Q==
X-Received: by 2002:a05:690c:3502:b0:8ab:40c4:efe with SMTP id
 00721157ae682-8b1b59d18e5mr12581987b3.13.1793197296081; Wed, 28 Oct 2026
 07:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261024161033.4140130-1-raj.khem@gmail.com> <39540EC2-E240-4E32-A94E-24EA33DE0310@arm.com>
In-Reply-To: <39540EC2-E240-4E32-A94E-24EA33DE0310@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Oct 2026 07:21:09 -0700
X-Gm-Features: AclHuK_b9dTH0KdMPaDxdc4g1j7BTxgwgafV5DoormSGRSK3KTBNEYJ9qVD59t8
Message-ID: <CAMKF1soWija+eU3x0oK34cdankotbZbz+Z056eDKeyq2TzqG6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d86187065ee74799"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 14:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248814

--000000000000d86187065ee74799
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 3:40=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 24 Oct 2026, at 17:10, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> > Note that 2.0.0 changes session and seat IDs on D-Bus from object
> > paths to bare IDs, which needs a matching fix in polkit's ConsoleKit
> > backend.
>
> This makes me worry about switching consolekit -> consolekit2 in the same
> recipe. There are a number of recipes in oe-core and meta-oe that depend =
on
> consolekit so might be impacted, have these been reviewed:
>
> - pulseaudio
> - networkmanager
> - polkit
> - lxdm
> - xfce4-power-manager
>

I have patches for polkit and networkmanager, others did not show any
problems, ptests worked where applicable
and XFCE image came up on qemu as well.


>
> Ross

--000000000000d86187065ee74799
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 28,=
 2026 at 3:40=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 24 Oct 2026, at 17:10, Khem Raj via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt; Note that 2.0.0 changes session and seat IDs on D-Bus from object<br>
&gt; paths to bare IDs, which needs a matching fix in polkit&#39;s ConsoleK=
it<br>
&gt; backend.<br>
<br>
This makes me worry about switching consolekit -&gt; consolekit2 in the sam=
e recipe. There are a number of recipes in oe-core and meta-oe that depend =
on consolekit so might be impacted, have these been reviewed:<br>
<br>
- pulseaudio<br>
- networkmanager<br>
- polkit<br>
- lxdm<br>
- xfce4-power-manager<br></blockquote><div><br></div><div>I have patches fo=
r polkit and networkmanager, others did not show any problems, ptests worke=
d where applicable</div><div>and XFCE image came up on qemu as well.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div></div>

--000000000000d86187065ee74799--
