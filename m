Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 20CE37FC8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:44:19 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y6so11243877lji.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+mFn0UF9ZwL+2CrPeV5q7xu0JSc8iZtQMHO6NY6d9CI=;
	b=cK59IdwAnZnseC8Iw0wycAlO4ggOf8CyZ/IPwLnZxaxHUABCkiYCtxw8G4qcG61j4T
	CzORbnjwsQq8+8vjZKPhZDJMMweMreKozGTsC1FiicL8qL8KtDi1ZZPCTA5v51bJqw8/
	nGEhd6nG2JjncaTyYJf8LctDycqVMjJICplyCZIgmvvYAtft0K+T+ryTCACWMmqIwNpH
	9PXHrZhUnNHBzqvLzqNYuQscTqBH39jhhgFgKV3/S3ouieu1z9TN4PL2xGXO4TWXBcX0
	OW0qofxvPEyPnN0qOFAPR0T9+kwopU8WtWU2XZM07u3FYJ04lmMKt7CJDexW1YQ2hApc
	enpA==
X-Gm-Message-State: APjAAAX8EtH0muRAg2CIdGMmOeRzx00dGbL1ry/Os1DDUMzHycZ2+hHA
	njD5MwgyUO6uRwYK97psnMR7lmq/
X-Google-Smtp-Source: APXvYqwHbR630UuYY3ZLafHTQwcNtaw0YcD4cfr0iWMJCWNm7QYNvFAuX8p2AOmFDitx0uFJhs6+aQ==
X-Received: by 2002:a2e:a408:: with SMTP id p8mr10931025ljn.145.1580139859680; 
	Mon, 27 Jan 2020 07:44:19 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54]) by smtp.gmail.com with ESMTPSA id
	n206sm8349333lfd.50.2020.01.27.07.44.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 07:44:19 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id f24so6531398lfh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:44:19 -0800 (PST)
X-Received: by 2002:ac2:5216:: with SMTP id a22mr8223923lfl.18.1580139859201; 
	Mon, 27 Jan 2020 07:44:19 -0800 (PST)
MIME-Version: 1.0
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
	<b97df9ca5093d9131ad82d2cb1250aeea368612d.camel@linuxfoundation.org>
In-Reply-To: <b97df9ca5093d9131ad82d2cb1250aeea368612d.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Mon, 27 Jan 2020 07:44:07 -0800
X-Gmail-Original-Message-ID: <CAHMutrazaW1euQ=R0VYYgTHTr=VTdxHTA=1bVfSg_+HkpUo-Rw@mail.gmail.com>
Message-ID: <CAHMutrazaW1euQ=R0VYYgTHTr=VTdxHTA=1bVfSg_+HkpUo-Rw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Mon, 27 Jan 2020 15:44:19 -0000
Content-Type: multipart/alternative; boundary="00000000000000d4e3059d20fbab"

--00000000000000d4e3059d20fbab
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020, 2:13 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-01-27 at 02:00 -0800, Alejandro Enedino Hernandez Samaniego
> wrote:
> > Create HelloWorld examples that run on several of the QEMU architectures
> > supported by the build system.
> >
> > This recipe can be used by anyone to understand how baremetal
> applications
> > can be built using OpenEmbedded and how the wiring to set them up could
> be.
> >
> > This should also facilitate creating/extending the OE testing
> infrastructure
> > to allow baremetal applications or RTOSs to be tested in the same way
> that
> > Linux currently is.
> >
> > This can easily be extended to work on other MACHINES in the future.
> >
> > To run this example:
> >
> > # Source the oe environment as usual
> > $ source oe-init-buildenv
> >
> > # Set TCLIBC to either newlib or baremetal
> > $ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf
> >
> > # Use one of the supported architectures (qemuarm64, qemuarm or
> qemuarmv5)
> > $ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf
> >
> > # Build
> > $ bitbake baremetal-helloworld
> >
> > # Launch QEMU
> > $ runqemu
> >
> > runqemu - INFO - Running bitbake -e ...
> > runqemu - INFO - Continuing with the following parameters:
> > KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> > MACHINE: [qemuarm64]
> > FSTYPE: [bin]
> > ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> > CONFFILE:
> [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.qemuboot.conf]
> >
> > Hello OpenEmbedded!
>
> Looks good.
>
> Should this be in meta-skeleton? That sublayer generally has our
> configuration example tests in as far as I can tell...
>
> Do you plan to add an oe-selftest for this?
>
> Cheers,
>
> Richard
>

Hey Richard,

I do, that's exactly the plan, I'm working on both oe-selftest and runtime
testing cases for this, I'm just doing it in chunks.

Cheers,

Alejandro


>

--00000000000000d4e3059d20fbab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Jan 27, 2020, 2:13 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 2020-=
01-27 at 02:00 -0800, Alejandro Enedino Hernandez Samaniego wrote:<br>
&gt; Create HelloWorld examples that run on several of the QEMU architectur=
es<br>
&gt; supported by the build system.<br>
&gt; <br>
&gt; This recipe can be used by anyone to understand how baremetal applicat=
ions<br>
&gt; can be built using OpenEmbedded and how the wiring to set them up coul=
d be.<br>
&gt; <br>
&gt; This should also facilitate creating/extending the OE testing infrastr=
ucture<br>
&gt; to allow baremetal applications or RTOSs to be tested in the same way =
that<br>
&gt; Linux currently is.<br>
&gt; <br>
&gt; This can easily be extended to work on other MACHINES in the future.<b=
r>
&gt; <br>
&gt; To run this example:<br>
&gt; <br>
&gt; # Source the oe environment as usual<br>
&gt; $ source oe-init-buildenv<br>
&gt; <br>
&gt; # Set TCLIBC to either newlib or baremetal<br>
&gt; $ echo &quot;TCLIBC =3D \&quot;newlib\&quot;&quot; &gt;&gt; ./conf/loc=
al.conf<br>
&gt; <br>
&gt; # Use one of the supported architectures (qemuarm64, qemuarm or qemuar=
mv5)<br>
&gt; $ echo &quot;MACHINE =3D \&quot;qemuarm64\&quot;&quot; &gt;&gt; ./conf=
/local.conf<br>
&gt; <br>
&gt; # Build<br>
&gt; $ bitbake baremetal-helloworld<br>
&gt; <br>
&gt; # Launch QEMU<br>
&gt; $ runqemu<br>
&gt; <br>
&gt; runqemu - INFO - Running bitbake -e ...<br>
&gt; runqemu - INFO - Continuing with the following parameters:<br>
&gt; KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bi=
n]<br>
&gt; MACHINE: [qemuarm64]<br>
&gt; FSTYPE: [bin]<br>
&gt; ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bi=
n]<br>
&gt; CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.=
qemuboot.conf]<br>
&gt; <br>
&gt; Hello OpenEmbedded!<br>
<br>
Looks good.<br>
<br>
Should this be in meta-skeleton? That sublayer generally has our<br>
configuration example tests in as far as I can tell...<br>
<br>
Do you plan to add an oe-selftest for this?<br>
<br>
Cheers,<br>
<br>
Richard<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><span style=3D"font-family:sans-serif">Hey Richard,</span><br style=
=3D"font-family:sans-serif"></div><div dir=3D"auto"><span style=3D"font-fam=
ily:sans-serif"><br></span></div><div dir=3D"auto"><span style=3D"font-fami=
ly:sans-serif">I do, that&#39;s exactly the plan, I&#39;m working on both o=
e-selftest and runtime testing cases for this, I&#39;m just doing it in chu=
nks.</span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><=
br></span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">Ch=
eers,</span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">=
<br></span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">A=
lejandro</span></div><div dir=3D"auto"><span style=3D"font-family:sans-seri=
f"><br></span></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
</blockquote></div></div></div>

--00000000000000d4e3059d20fbab--
