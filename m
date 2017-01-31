Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4A13B71D4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 02:38:17 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id 65so40457618otq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 18:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BIMt0nuhxQ4+k4aCaHHNBwOfqJg5Ay6dgYKUHhBeAPI=;
	b=T4Z8Iui4izAskKge9cxJerbIrfPads4ypkiQse3fOOCDN5K+zQPY5q/ezXvU6Uu4GG
	s4x6HXUp4+io1Msp/jteOW71HiWVyMbinu/lnS+sFZJLWs1tNPjy/Xad2A55kivigs/w
	qqPNuil4kiTUKm78W67kH2EWtTyTxTJKzo5tTc+jYxYwsJUbqZRqJ69jJWwaOMTSDBhX
	XPR63T9/sEXkjY6x6rjx9+WPSAHgvf/ykiJbMF4tCVtaYCGW0abbJrO4SIerAfq/i0vl
	M+HMjNZ4s9h0PcSKc/lqO8IkevYHIgOfTl4fMWgMsbc3Nd6klUJUrZtvbYgKPwn95vq6
	OV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=BIMt0nuhxQ4+k4aCaHHNBwOfqJg5Ay6dgYKUHhBeAPI=;
	b=bPwZzT7JzcEVtCSESwD1G9zwpZuHlyqpWc1Qh3G0dGq4nzebJEUg1R3pDLw4IP/bNo
	peDP+lAanrfZULbS1T3TayUMjh9WhrCOg4QJBzLlPca6MjDJt1DzlNS+Z7xjsXeaZUav
	IcBjwYg9zf1h6OipF1Ru8xrHRbLRpnFptjsG9Xw6Kj9BvwYLpIjenOXOD91Qs7amLRGS
	Z3iyo8L5EGpUvk6Cb6WVgFVHIzkTdc8YWVdnMYgzyZ4kl6ij10/x4zIpRm2DDOmmW47l
	BeGgXFxagC+39mbNUCys60fuGOjUw7e/9cGSVvE2yPul0y0UZ5Gsg6uB/8fmnYrhdnFs
	v0CA==
X-Gm-Message-State: AIkVDXKeYRkNMICME7KMxR8TkEIIxK9yqwJr9xPe21tDbyqs5ABDI/Cb1P37llJSrXep6eKTQLbvSsrjSFSc+Q==
X-Received: by 10.157.53.16 with SMTP id o16mr11201542otc.50.1485830297824;
	Mon, 30 Jan 2017 18:38:17 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.5.8 with HTTP; Mon, 30 Jan 2017 18:37:57 -0800 (PST)
In-Reply-To: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485821667-27436-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 30 Jan 2017 19:37:57 -0700
X-Google-Sender-Auth: dfcK56TWtz6kjwhRKMIkAKCn8Xc
Message-ID: <CABcZANmbtSZ_LRnAfx3EPH25+hDRjidQ5t82i6urMEm13uX3Mg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] utils: Avoid need to relocate wrapper scripts
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
X-List-Received-Date: Tue, 31 Jan 2017 02:38:21 -0000
Content-Type: multipart/alternative; boundary=001a113dff2c19348a05475ad339

--001a113dff2c19348a05475ad339
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2017 at 5:14 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Whilst the path to the executable is dynamically determined, the passed in
> environment variables or parameters are not relocatable and rely on the
> sstate
> remapping code. In the recipe specific sysroot case this has become more
> costly.
>
> This patch translates such paths into relocatable entries which means that
> a sed replacement at final installation isn't needed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

Nice.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113dff2c19348a05475ad339
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jan 30, 2017 at 5:14 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":qz" class=3D"a3s aXjCH m159f1e07bc646cec">Whilst the pa=
th to the executable is dynamically determined, the passed in<br>
environment variables or parameters are not relocatable and rely on the sst=
ate<br>
remapping code. In the recipe specific sysroot case this has become more co=
stly.<br>
<br>
This patch translates such paths into relocatable entries which means that<=
br>
a sed replacement at final installation isn&#39;t needed.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;</div></blockqu=
ote></div><br>Nice.<br>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Christopher Larson<br>clarson at=
 kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior S=
oftware Engineer, Mentor Graphics</div></div></div>
</div></div>

--001a113dff2c19348a05475ad339--
