Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E48336069C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 11:43:08 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id h21so3038164wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pHTHDu3IH9qys/FjX0nKseoQ1EkdeDWM3HTQTvlqrvk=;
	b=OJVLpc+YGQtQ2UDz6CnpPmo1Ir9TVyTOHoK2u6iDjWaFLXyLoouy9fL75wjdAVaHjE
	4R1bZ7PvNgpIUK3qbcv5qqGPjE7kAFDiTbunBJczFFT/3dZHdlK9r+lX4nNOyVtdt0vw
	CwODbZGEUdDXjKcWmSILKR01CqhO8GN47qFKNEKfevwXHMGxhzqaFa3SQjDfeoL3Z+bU
	n7Tn/A7XrdAaoqoh2cmM8RIdt11zyDGKtKa3U35sEIiurT9oL2v7IcpmuOWydiQuTFL5
	S46QLSrqpGCU7jT8afrSHuNC2KDValPWKXmhsFp9WfP7L+saH67tDH0Mya9u68M6fvmR
	fmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pHTHDu3IH9qys/FjX0nKseoQ1EkdeDWM3HTQTvlqrvk=;
	b=l8RC57nJSCU6079w5MxnKH5Jw6mKRQlb4hwE8gXg0V8kMgQRX7Q8T8d9fyBXou9ZPY
	PpQKmGTtYJmLzZ6wqdr0YHA67QLpZIOpXf/ThSrdvH8YDJOr72Qs+DTR1Lsxowf3iIvK
	Jkp7Nrls9c/hyWR2inycYt8gsl19FfFCL8ZS1duoSkQOy6+0bGvnXPKs6UtpDeGjDE5V
	W6TTAy1taZT2W0TeskyFVelLIR/N6FyyToRXNxzS2vqVbK2DVoOXzw0U+mrdbnGbdQnl
	gaSgYwnsBrJr06rV904bYAD+npyMZvzWGbYg8hSnkmDOO6XHPcEuwlAlwpR6pC3WDc8G
	V/JA==
X-Gm-Message-State: APf1xPBw/YR7lC+9b29DA8mlkYv/4kxx0UWhJz2Oa0Lr/FjobkgLbzMD
	CHYDjTeIobuSfg+OzZnVjX2Fr/dqbB7yTiRYg2c=
X-Google-Smtp-Source: AH8x22730E91my1AXtIB7k6vk8Bk/0Q0BeOccy5Yxjsotz/NAMM8M/Uk496Ji10KseuLxT2ilEFOqacLHccvvnYfsTo=
X-Received: by 10.28.8.137 with SMTP id 131mr9529369wmi.79.1518954189335; Sun,
	18 Feb 2018 03:43:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 18 Feb 2018 03:43:08 -0800 (PST)
In-Reply-To: <20180217141701.229759cf@seebsdell>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Feb 2018 12:43:08 +0100
Message-ID: <CA+chaQcw7brjMVnfxf5uC=O80y1-uPsiuVCNfRV1xkWdOqqT-A@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Sun, 18 Feb 2018 11:43:09 -0000
Content-Type: multipart/alternative; boundary="001a11442600e2bdbe05657b14e3"

--001a11442600e2bdbe05657b14e3
Content-Type: text/plain; charset="UTF-8"

The do_install tasks failing with exit code '134'/SIGABRT were caused by
left over pseudo processes from previous builds still holding the
pseudo.lock.

Manually killing those (still spinning at around 90% CPU for last 2 days)
resolved the do_install failures.

It also explains the lack of log.do_install files, because do_install
failed before it even properly started.

Regards,

On Sat, Feb 17, 2018 at 9:17 PM, Seebs <seebs@seebs.net> wrote:

> On Sat, 17 Feb 2018 15:28:55 +0200
> Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:
>
> > For me, with epoll enabled:
> >
> > b6a015a works
> > 23f089f and 26e30fa both lock up
>
> Huh. It's possible that the initial "don't try to close fd 0" was
> correct, and the real problem is that the attempt is getting made
> mistakenly. I'll study that more; the epoll code was a contribution and
> I may not have fully understood it.
>
> -s
>

--001a11442600e2bdbe05657b14e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">The do_install tasks failing=C2=
=A0with exit code &#39;134&#39;/SIGABRT were caused by left over pseudo pro=
cesses from previous builds still holding the pseudo.lock.</span><br><div><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline"><br></span></div><div>Manually killing those (sti=
ll spinning at around 90% CPU for last 2 days) resolved the do_install fail=
ures.</div><div><br></div><div>It also explains the lack of log.do_install =
files, because do_install failed before it even properly started.</div><div=
><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Sat, Feb 17, 2018 at 9:17 PM, Seebs <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">seebs@seebs.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Sat, 17 Feb 2018 15:28:55 +0200<br>
Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">=
alexander.kanavin@linux.<wbr>intel.com</a>&gt; wrote:<br>
<br>
&gt; For me, with epoll enabled:<br>
&gt;<br>
&gt; b6a015a works<br>
&gt; 23f089f and 26e30fa both lock up<br>
<br>
</span>Huh. It&#39;s possible that the initial &quot;don&#39;t try to close=
 fd 0&quot; was<br>
correct, and the real problem is that the attempt is getting made<br>
mistakenly. I&#39;ll study that more; the epoll code was a contribution and=
<br>
I may not have fully understood it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-s<br>
</font></span></blockquote></div><br></div>

--001a11442600e2bdbe05657b14e3--
