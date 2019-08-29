Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2857D7F2A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:39:03 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id b184so745507vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PO+DpkLFSEmKGbdl+QbxIzB+nYYo6tXAPiR6S+bMs+o=;
	b=nhJk62PkyNLyAN2W4/MgUFuaoTZG+VT1mWVqRRznHAKAZYNY2YA2jqa8WJzdvRJQmJ
	3bgSqpiWgFqDg7vzyX5yKT+RP4TycfBULBS2bFXYDLfd2530M4JOc4E6i3IjxuD+BP8n
	4H0F/aqCJS4qNJ7t8QWrnmp5XMUCDpmg3KFufhSse5kRQTt+QDwCkewKaikjjldeLhu3
	whXJv+o5gBZnTNRAO8QIQklJjj/QysoGWHXWUJZXFxKZL4WaOp8DVoRjQX+IKB14uIoz
	yMn99gqbHLwaMJiRA01j5FRMvU/CV2Sh4JzditFo1zxbdpvmlMyUYgjIDbNRu5Of3Y5a
	IQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PO+DpkLFSEmKGbdl+QbxIzB+nYYo6tXAPiR6S+bMs+o=;
	b=SDzDdIJSaAPhfTM3bExv2ARlsFt2yG+qCUpA7BKxTbQY1O+OYYqnzl5vOmBnvxMoFO
	xNKvcbQwnbKFYxgbkRM27BeGgoSI5CRazDAUTS0LxhnXDWNmIwcA2HohpK+EKYYWLbSk
	CgreS6Xdx8lxJkMaqXiDovwYCqKZ3YiHbylrdE2I2CSlgE8TFylY6lpy6fnq3xLHX3Ox
	RN358COsb3i3h+U68ACaqXgmqaWy1t6kSBkJ+Wajr0lGeSFiE+R62VN2vYLha/5+y9AP
	/MzmF8HPS++8uObONcg1ckbFhVZrH33uu1GxvSJy5YTAflRh1slmKyVTEQbFUcH2Dd6r
	DFTg==
X-Gm-Message-State: APjAAAUpQxa3dRLg+DA4W7ZgHdI3B8SWjPrVCpPtkSuLcef5MiWGSBmY
	rbFC4bd4fpZFvTX3K2tJpBJXFIzKP3ikCb9miTo=
X-Google-Smtp-Source: APXvYqyY5O6890pIdJphzeQAOtu0n367HR+JaUPHa8FGhTuSZgb8xZp2Vh4p1kxv9N18M4JC5bUAVa0rWsF8P7Rx/s4=
X-Received: by 2002:ac5:c290:: with SMTP id h16mr4946695vkk.59.1567082343955; 
	Thu, 29 Aug 2019 05:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190828201025.35999-1-bruce.ashfield@gmail.com>
In-Reply-To: <20190828201025.35999-1-bruce.ashfield@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Aug 2019 14:38:52 +0200
Message-ID: <CANNYZj-tU58835fwd0+YXMY=nfjo-AqbU+M4MCA=odJMm2+xKA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Thu, 29 Aug 2019 12:39:03 -0000
Content-Type: multipart/alternative; boundary="000000000000720143059140caa0"

--000000000000720143059140caa0
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2019 at 22:10, <bruce.ashfield@gmail.com> wrote:

> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>

The new kernels are missing the drm-bochs tweaks done recently to previous
kernels:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master&id=0e0589f81a66f92519e1fbb0d0ab6db22e0e591e

Perhaps we should put them into a common include?

Alex

--000000000000720143059140caa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 28 Aug 2019 at 22:10, &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">+KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&quot;<=
br>
+KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kvm.scc=
&quot;<br>
+KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt_kvm.=
scc&quot;<br></blockquote><div><br></div><div>The new kernels are missing t=
he drm-bochs tweaks done recently to previous kernels:</div><a href=3D"http=
://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster&amp;id=3D0e0589f81=
a66f92519e1fbb0d0ab6db22e0e591e">http://git.yoctoproject.org/cgit.cgi/poky/=
commit/?h=3Dmaster&amp;id=3D0e0589f81a66f92519e1fbb0d0ab6db22e0e591e</a></d=
iv><div class=3D"gmail_quote"><br><div>Perhaps we should put them into a co=
mmon include?</div><div><br></div><div>Alex<br></div></div></div>

--000000000000720143059140caa0--
