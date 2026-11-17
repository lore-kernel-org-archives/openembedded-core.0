Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.517.1794935649532606358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 09:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XXzI4D2x;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da69e7c31so3651193d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794935648; cv=none;
        d=google.com; s=arc-20260327;
        b=SCxDlc+cUIk5iiA1aWIFCla0T6pG1BjNcd/DseO5tav6EWD9ClbPlZMZX20xXYVu0u
         x2uWi7aAr0157AxdgAGQbVO8o1gpyoDiCtHBX9N0+hANhYlS3RhfVPafQBvsA6ZIF1TU
         V1VlEBMV09KVBncyWFuPo7wQl54sbjr4tWqYuWCzq415jJbxb2tPQlOdI+33bb1EX4ZX
         yewxuow3hMEgfbdjoVlyuWCxYsDM8efIYCFLnSmAkgptyMHdSVEFSPyU7FXZ2Z2AM/jJ
         J+duJO6MeHzfykxAESZMr63HW+wxHFF5BUvZAo0mRK0bg/EBKe+jiAz/fwa9rx+zL5rN
         j0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/fHoNptln//MWvlq9RFuO1L1oc+JET83zAh6l+MfQpw=;
        fh=/sTkXmBDUxdUscKDWpZvQGvURinJNfilrg5jiWT2PyQ=;
        b=XM3MvuhCcX8ge+DxQDUdYfpjj4lzXgFKugMC1hExYRhy02QtUV9sfSw2S/GaCb/u+6
         yM5CgUDzcIHozCK1gbWfKfXxSJgg3jPCoTl7S5rOMGBEBVGDhzCxL+iF06zYzTvXTSic
         wxKHEJo4YsJqHsJtowgu6ft8otuHvRFCQGu3cNQdYOZ5ROL3UKVTh2YdlTW+fpEF6H97
         VwxyrjfdjmLvwu2QWhVXwSfQGpOe7W7SvOXfZMVPOtta5A3AwPTiV8gVFoR+Q2OmNvSW
         6TZTYbPBh+3OUq0XHApUuM69RB6w/fPfGvxRYHgG2lso7FXStUY1aj5SEdWjGN2FXU4q
         O3Ag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935648; x=1795540448; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fHoNptln//MWvlq9RFuO1L1oc+JET83zAh6l+MfQpw=;
        b=XXzI4D2xsTGR71a07lAdSPouCzoiVXJxB8NBvnYFx7JYfnB5D0wrMYLR3D3dD6zLVi
         TcR2pk/fhuhykLZvthVEl0qk91IvqNOjkDERXHqO7JUI8wt4IwOZzJnXKoigs7rf5TVV
         ZjuRQFCk7q+ClXfbwu2Ic3aRAlp2xqdqyD7GUvRiIfKCOVqUncCqSQz3EyTnIntXBj0a
         sbZEpVJ6yncVJUxg0r3ByjQYrqRoaiQMqmw6LQMp7tUgBTJn2WCoM5e1fnRbEEBCO/yH
         4HJDLyqqFtFLv6Wzq9knFLputDNCO9KzF+RfKg0jg3JHg78Nfz/gTwnEVTE6fBurZea5
         2SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935648; x=1795540448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/fHoNptln//MWvlq9RFuO1L1oc+JET83zAh6l+MfQpw=;
        b=k3k/VvJw8NNKllXt+kETLXc7FDu0tkprH9ooiqwIXvFcnEBnLJCVEHQhpOiiPvqY7F
         6yUNTPCyrYWkAdcvHWI/QTB3F7bAjB8zH6iEsMJqQ2mxG7s34becYPqlTvTpq/PsVX8z
         fNvQvpOuA0tyRgay2KSVU2NLggQWrJIKtoi19tuGb4byG5tkaTSw8m/Ewc0b2OVKPqOl
         bOz8+WcsWecMlra2VDtyd5LR7gSoJPgd1JVTQHra6CfBkiiYN3oVo4GsD1mMtjV2KQYv
         xrQtNAIiJED//WUL7csRgmtCvbxBYz8N01i6iQmwkJ7eKoPiUEs3nGBaAcdaOSyifLhE
         pF/w==
X-Gm-Message-State: APuU4Z9tKgoNk7F6UQXzvYi+PQn5ob5DGHg4GQGuWO4JkDOSOx/csSyQ
	VKZVyD/7eVHxL9ZG8eO4IerI4J8cIChBoIi0WINV/Nn6p/T1MSmkBbickP7Av0HctHAJ/auF5Fx
	SG8e17EI0bpWGWEgg2JIUCnsrOMgjjYw=
X-Gm-Gg: AZFdTZfT9Rq47/KtzGwOSTJEPMV01AbkKs+NjtZxAwqEIThjX4CjlmrI0Zd9L+f47+f
	J6y5WN52YnNdmfRS/rITp/EApsx2IgwIGtbyPVK8qtCQl83+TZdPvM3fg6JdjXYnV6B++tyn5HJ
	ozK/7EhlI55axuJmcf/pgBYe34ZeXhv3JAiwFvX1XSwEyTHM+J5eMrYR/6QXL119IWoQrkMYe6H
	pyvDRC35ZWoq2ruX3hwOdI8shoBucidQdjs9SmHMRHIxET5P1K2zhQ1k8ar5yfKDmBDUHY2Rcsb
	2aZ8euyL2S3lhCj3+laawU44GGGplPNeljAhbsiAQkChgAGzy/FCZ8J9vbi9ZnXCG07S2nTTbBn
	wzZS+BQU6AOua8HB8xNHTBIO+2ZObMkWQ3UrogUR8ZMl4i2P/Ji9C4414kLOq2csIuH8N7LlKpG
	Ar1n8fWgcMR4kaaezH
X-Received: by 2002:a05:690e:1387:b0:67d:adb1:f165 with SMTP id
 956f58d0204a3-67dd454174amr31114d50.47.1794935648548; Tue, 17 Nov 2026
 09:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20261117164151.1362220-1-yoann.congal@smile.fr>
In-Reply-To: <20261117164151.1362220-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2026 18:13:57 +0100
X-Gm-Features: AclHuK-a3bzFpafY_lGEH-ZF6PEc5k7RRxeZIGXGKZCJSzrS37R1ewyfd9otf4I
Message-ID: <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pseudo: inherit upstream-stable-release-point
To: yoann.congal@smile.fr
Cc: OE-core ML <openembedded-core@lists.openembedded.org>, mark.hatle@amd.com
Content-Type: multipart/alternative; boundary="000000000000b9fd6306607c05ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 17:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250463

--000000000000b9fd6306607c05ef
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 17:42, Yoann Congal via openembedded-core
<yoann.congal=smile.fr@lists.openembedded.org> wrote:

>
> Pseudo now has a stable branch pseudo-1.9 with pseudo-1.9.x tags on it.


Is this branch collecting only bugfixes (or fixes needed for continuing
operation of yocto release branches)? Is this going to be a policy for any
future point releases, or is it a one-off just for 1.9.x? There should be
confirmation of these questions, in addition to the existence of the branch.

Alex

--000000000000b9fd6306607c05ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 17 Nov 2026 at 17:42, Yoann Conga=
l via openembedded-core &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists=
.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; wrote:</div><div=
 class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
Pseudo now has a stable branch pseudo-1.9 with pseudo-1.9.x tags on it.</bl=
ockquote><div><br></div><div>Is this branch collecting only bugfixes (or fi=
xes needed for continuing operation of yocto release branches)? Is this goi=
ng to be a policy for any future point releases, or is it a one-off just fo=
r 1.9.x? There should be confirmation of these questions, in addition to th=
e existence of the branch.</div><div><br></div><div>Alex=C2=A0</div></div><=
/div>

--000000000000b9fd6306607c05ef--
