Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0DD60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:21:19 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id x128so506857ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SDjOeBFdgL7Pa7ZzVqQon52IDFVzUx2Hf19WyyBm+6c=;
	b=ji04qtrl5fODsC1Bo7tfq0wPKuGJBXa6FThB8kcEZoJ2K9U4bYdz4Pb5mEftwT4M+7
	xl9HNMLphEQJtIkWIJ0wcqsgMOb3rYvA+iHhBfHxSCNWNfJWzP6yzmebshByxx8VTFjV
	HwdQEiRpE5vx2f6wIhBN3hNXBhA/JPg0W1So760TnULqlOLhTdMTxXy7C/5lNYVR5Ml2
	7VtWHn3pJNB5UHDsR7ANQNCqAFGGss8b1zoKLK69ym26s4tRWyjs+uFjLu8fR7nQjlKI
	gL2GUz0m9cz/Ofj74OYWw6wgWLMYfXLPqEUevfqQFm7eYl6t5AUl64tc99nv8mQu3HeQ
	rXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SDjOeBFdgL7Pa7ZzVqQon52IDFVzUx2Hf19WyyBm+6c=;
	b=Y7pZSfj/aiN7kHTO/cuaf5kEn/r998JLtPbAaPcdM8R0CBeTG1K/yUp1wl6s0O4UCq
	aUkBYmyLb2QOZ17MVQAhj2f2mC47ols3gQhc+WD1/fDvVWvLROSGkw7n7mss5L/ubIuP
	sZ4Dqm/zAP7P0taL7oyDl2UL10qjcIZkxQzLQ+KB1F8eeBVP0i3KarlKRy0uPYkCjJqj
	BMvP+gE3/Fehz3bHD3mB3dFqjtkAIcJGjZY8LX019o5EuVBqp0r4CNwqtmxtxO44rIg0
	YYRn6Dsy5iiNJnAFWx3woNa0c4ecQkisGqUhpwYAbFsdi64ODRM01tcsk4AZ37+meQ4D
	+M2A==
X-Gm-Message-State: AKwxytfdm5EqgwqpvBnjrr9t8TscG/62c75hhnjCbvVjZRwr7FtFao6d
	RPSDxAOVE1lK1HnAa4GZwXKbCICcTsIBsWmB8jEfYw==
X-Google-Smtp-Source: AH8x227XBRUckmy6i/m8FXdQswT/8NVibCUd/4O1NMQIHway76+UYAJTp/5qCEsjwuxg4SxbzEAsp8XLF/g/HUhYNt4=
X-Received: by 10.36.228.197 with SMTP id o188mr15541164ith.85.1517419281437; 
	Wed, 31 Jan 2018 09:21:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 09:21:00 -0800 (PST)
In-Reply-To: <CA+chaQex47NDXaeBFcFF-_fsa5QLSobP7xfavCC5d0DCoUEypA@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
	<CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
	<1517418291.31752.85.camel@gmail.com>
	<CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
	<CAJTo0LYe7qU66tBRbyDfWkg=PJm2aPXg5fhCVP5rp2PwbyFnfw@mail.gmail.com>
	<CA+chaQex47NDXaeBFcFF-_fsa5QLSobP7xfavCC5d0DCoUEypA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 17:21:00 +0000
Message-ID: <CAJTo0LaiWzpvTv_4HNT6THjPyNqctLSac1XbJVvGJ1oZj4+tRA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Wed, 31 Jan 2018 17:21:20 -0000
Content-Type: multipart/alternative; boundary="94eb2c1253d03ee12b056415b51d"

--94eb2c1253d03ee12b056415b51d
Content-Type: text/plain; charset="UTF-8"

On 31 January 2018 at 17:19, Martin Jansa <martin.jansa@gmail.com> wrote:

> But shouldn't it at least show different error message in case when
> ${S}/waf doesn't exist and when it fails to execute it for whatever reason?
>

Sure, first thing should be to check if S/waf exists and if not, abort.

Ross

--94eb2c1253d03ee12b056415b51d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 January 2018 at 17:19, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">But shoul=
dn&#39;t it at least show different error message in case when ${S}/waf doe=
sn&#39;t exist and when it fails to execute it for whatever reason?</div></=
blockquote><div><br></div><div>Sure, first thing should be to check if S/wa=
f exists and if not, abort.</div><div><br></div><div>Ross=C2=A0</div></div>=
</div></div>

--94eb2c1253d03ee12b056415b51d--
