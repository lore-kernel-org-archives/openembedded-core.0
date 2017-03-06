Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 556447765C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 11:17:36 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id p64so28850852qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 03:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gjIINGME850yMxc/5UlDTSftwGEjvIqwyxs2PXjrMXA=;
	b=PIURuefWQuoseCwOpetvOB3thfKSoHlgu+NbPGL+jYaG83Rjx7Ia1oDCme2gmAKoCA
	6SxG6STT4d+U4GZqzxKpQz9fqtlKJwSlIVEVLoLUGsop8TPYFI0xzAnyxqj83Zbi2xHh
	n85VjpKKc1Mi9uWNpVDSa4WkxbaidDgmYPrHJEMamlyhnmXXQy6/8pzwoyzcyZWfWMTl
	Phd1QSJ3UMgUPD8ueH1cHa/p7VyBdjroSFex+vQV1bSEHgEgJ3R7XBsW38TTVyTrnkt2
	bRe480NiprzETKKjmLEGcHpNRU6Y78E1ycsSXxpUAAWPk5TTZgZLKRGPKUsz5iqwj+3b
	qARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gjIINGME850yMxc/5UlDTSftwGEjvIqwyxs2PXjrMXA=;
	b=IM5BR5awTkIDwSNGrSdtZitV3W31AtrkzagtN/H+JpqIKt032aclNxnN8ZzGGOGyxt
	dO1aO6J5KzxjejIkVoHvAcq7dUxvmFdq6yG2VBWSUtXt5hyw1Kcnjnp1qa9wBkm4aQAj
	ANwpV/jnVkuGHT2u8OiJisL9FOdXoO2zODOOLgYmDyF56kHL4asI36yGHc2OQzcZA4yW
	LwxnjqWcGPPSuT8AsPbBNLIPbj7/qyVyWl/wC+vGQMvwl8FxeD/YdkpFoK3I8y28Oyfs
	KR4FJc5VWbGI5CDy78bjaxlCNBA/YO+J/OLae5CYIIPUq255M+O4/gvV8rH2O9mPg8n2
	APNw==
X-Gm-Message-State: AMke39lVQaPlsxTLSfh3F6Klh/YIfqyAkd/dkCDGgCnsw13BywXcwsiQQoPro3MF+vmb5JNaZsobpXrABPSXnipk
X-Received: by 10.55.175.195 with SMTP id y186mr14493369qke.26.1488799058308; 
	Mon, 06 Mar 2017 03:17:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 03:17:17 -0800 (PST)
In-Reply-To: <15d293df-8055-f696-ee22-4489e249d490@huau-gabriel.fr>
References: <a94ef9bf-da82-b236-6911-7bfb595797d5@huau-gabriel.fr>
	<CAJTo0LZs7MyM0jRwcnkxjOM7Lbg8zXgOKinrpYcVapEb4RURgg@mail.gmail.com>
	<15d293df-8055-f696-ee22-4489e249d490@huau-gabriel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 11:17:17 +0000
Message-ID: <CAJTo0La23XmQn-zFGZKFf1dd+0YTTBHS6WvAmyi1tyQA-it=4g@mail.gmail.com>
To: Gabriel Huau <contact@huau-gabriel.fr>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libglu: dependency on x11
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
X-List-Received-Date: Mon, 06 Mar 2017 11:17:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c0363fb054a0e0bcb

--94eb2c06093c0363fb054a0e0bcb
Content-Type: text/plain; charset=UTF-8

On 5 March 2017 at 18:35, Gabriel Huau <contact@huau-gabriel.fr> wrote:

> I thought it was possible to have an implementation of libGL.so without
> X11, for example by using Wayland or any other Window System, I didn't know
> that the libGL was tied to X11 (on Linux). Also, I didn't see any specific
> X11 code in the libGLU so I was a bit confused by the dependency on both
> OpenGL and x11.
>
> Non-X11 OpenGL implementations are generally EGL, which has an abstraction
for the display type.

I guess you can try removing the x11 dependency in GLU and see what
happens...  there may be no X specific code but X assumptions if it's using
the GLX API.

Ross

--94eb2c06093c0363fb054a0e0bcb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 March 2017 at 18:35, Gabriel Huau <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:contact@huau-gabriel.fr" target=3D"_blank">contact@huau-gabriel.fr</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p>I thought it was pos=
sible to have an implementation of libGL.so
      without X11, for example by using Wayland or any other Window
      System, I didn&#39;t know that the libGL was tied to X11 (on Linux).
      Also, I didn&#39;t see any specific X11 code in the libGLU so I was a
      bit confused by the dependency on both OpenGL and x11.</p>
    <p></p></blockquote></div>Non-X11 OpenGL implementations are generally =
EGL, which has an abstraction for the display type.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">I guess you can try removing =
the x11 dependency in GLU and see what happens... =C2=A0there may be no X s=
pecific code but X assumptions if it&#39;s using the GLX API.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c06093c0363fb054a0e0bcb--
