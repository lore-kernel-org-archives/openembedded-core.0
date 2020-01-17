Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
	[209.85.217.42])
	by mail.openembedded.org (Postfix) with ESMTP id D26E37E467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:35:23 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id x123so14563232vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ekv72qr7nGI4tJHcIHSljI5cJ/b93Ub7qTjfaFfrcqA=;
	b=OQ/ysTpIjX0L5FhEPlGtV7tGTfwP1/6kIrOJC0eLmqcNnUAwN+dS9K/RWdEoNYkw3M
	QGvwO8lQFf97m1a8+yCUqOfpo8/Ro7Eu1eF6k2Eds7OD6iSOcP1C3TtH+wrQQ9QJ9Peg
	Y4IGM1GeTcvVRDRkRuaOGC1n+ZHKE5CxhryyO2W1CFpRgRNxSWNCbCOzSgiXDF34d2W9
	z8QzoFt3B20V8LjS8mqXS81TsV+HzTELczZ5wRwIznYcTXyeEftNVP2Hy9IwSxQAU7Dv
	QIssN04H9w8g5Cw0DgYviAJp2Q9cJorsUDSM3CY5v/PPWlqMEG0R05vrBYDE2T5jmdte
	A01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ekv72qr7nGI4tJHcIHSljI5cJ/b93Ub7qTjfaFfrcqA=;
	b=R2q3Ayzfk7KI7NzYsuYPcreVAnbxd+6sUIKRedl/W4tmkdxNP7yJ6yiSK54tBPtCOq
	IQ+jjtbS8fDK6iHLs6jZTFE9ErLwDmFGNofFRSQ8fVRcB+zXKEr2wOzttYaLFFSBvwPr
	zzoVhABZtJdCuW/x2FGZ15P/sM6loeee43btTAa5fVajFBRd4n3flZNibrSxA9m9ajED
	zi9enup7w5dYVApc7lw0aC7sHkhrPSZNVfIw68lCHSLzGVfkey4YeNmwKpCnxt0YolAT
	lDD2hL70O7hZ3AZhU71iHz4RC7h9CWRxetyraSvUVB7w17nn/jivh8DKa4b7PJenauuE
	BSdQ==
X-Gm-Message-State: APjAAAUKf5lhzztTpLDlBADkj4hbuJebdsHywcNAXPHxETxcno3vHznP
	l1Jq3AAGhh0kX3o7/bCQGij0r+27hewG6Xvt43g=
X-Google-Smtp-Source: APXvYqzLwlhmEbI0+MZSuJSGQSmJUy7ZF0X2696WP62/UCPkfzZv0IefvXxR9iXdyLWFlEDM6WJtI+OeOksr5zIYbe4=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr4314278vsq.94.1579257324475; 
	Fri, 17 Jan 2020 02:35:24 -0800 (PST)
MIME-Version: 1.0
References: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
In-Reply-To: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jan 2020 11:35:13 +0100
Message-ID: <CANNYZj_oWBNs853PyxD+Uhy8KyL9c-bm9a7LQh=fXNATd47nWA@mail.gmail.com>
To: Vladimir Molokov <vladimir.molokov@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: attr dependency on linux-yocto
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
X-List-Received-Date: Fri, 17 Jan 2020 10:35:24 -0000
Content-Type: multipart/alternative; boundary="000000000000d598a3059c537fbc"

--000000000000d598a3059c537fbc
Content-Type: text/plain; charset="UTF-8"

Those are indirect dependencies; this means you can't install all of the
packages coming from the attr recipes without also installing packages from
linux-libc-headers and linux-yocto.

Alex

On Fri, 17 Jan 2020 at 00:22, Vladimir Molokov <vladimir.molokov@gmail.com>
wrote:

> Hi,
>
> Question about attr. I'm not familiar with it.
>
> On a clean poky is it normal(not a bug?) to have deps such as
>
> "attr.do_build" -> "linux-libc-headers.do_package_write_rpm"
> "attr.do_build" -> "linux-yocto.do_deploy"
> "attr.do_build" -> "linux-yocto.do_package_write_rpm"
>
> How they are appear? I didn't find anything in attr which could be the
> cause.
> It's just a clean poky from a repo, after . oe-init-build-env and
> bitbake -g attr.
> Appreciate any hints.
>
> BR,
> Vladimir.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d598a3059c537fbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Those are indirect dependencies; this means you can&#=
39;t install all of the packages coming from the attr recipes without also =
installing packages from linux-libc-headers and linux-yocto.</div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, 17 Jan 2020 at 00:22, Vladimir Molokov &lt=
;<a href=3D"mailto:vladimir.molokov@gmail.com">vladimir.molokov@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
,<br>
<br>
Question about attr. I&#39;m not familiar with it.<br>
<br>
On a clean poky is it normal(not a bug?) to have deps such as<br>
<br>
&quot;attr.do_build&quot; -&gt; &quot;linux-libc-headers.do_package_write_r=
pm&quot;<br>
&quot;attr.do_build&quot; -&gt; &quot;linux-yocto.do_deploy&quot;<br>
&quot;attr.do_build&quot; -&gt; &quot;linux-yocto.do_package_write_rpm&quot=
;<br>
<br>
How they are appear? I didn&#39;t find anything in attr which could be the =
cause.<br>
It&#39;s just a clean poky from a repo, after . oe-init-build-env and<br>
bitbake -g attr.<br>
Appreciate any hints.<br>
<br>
BR,<br>
Vladimir.<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000d598a3059c537fbc--
