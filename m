Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
	[209.85.221.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1983960071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 20:07:52 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id w67so2437815vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 12:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D3jovKLrpL0BysDH4iBFRY+PJgDnStZxgXoI6cCBq5U=;
	b=I6pXHTV5QAxMEfoKge1mtH531idhDoO0xHPPo0JBhVwepAO7Md0YVPuJZi6xOcbnsJ
	UQ4IIpFdczf0O6UgOzozAhguNrGnYbRtQwcsVK3oUNsYWZh9utgz92UUxEydB2If+g0N
	/ydjU4zBUvxDgrdR8i18hqLG42MpoPfD+1s90Y7hJbOuE+A2I6bpGuYZ5lKWt6LIAZRS
	7rat2Bd93v2qjl4H+I8z41dTbkEb7Zl/n7ipzQdc7QZuevnpQkYb9LMSEsYqNE46u3h1
	BfSNtz+Er8VkdzUreDxNxZ8q2N2izOeKNVFDOKZnqvc534J+DJhzW8t8Ja+PMp6Fi1eF
	/1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D3jovKLrpL0BysDH4iBFRY+PJgDnStZxgXoI6cCBq5U=;
	b=fdjOTl384UxmO0xps4XR7v5tDpnJQTA41G5FkbB68VUBfnHQBpCA/KjuirAOncxFxR
	bU3x5VaFMviKzHuDRGO7U1Mf+WuIyIR6ksIOGKvCPucmbmddY95mItGFqIVnK54NqkEj
	Zp+EChckA1yQDfV7HP8O+Ld3n5WUJQYQa0mjOdHRgBCO474jWN6ygYP8g+uvxRSaBUf/
	JpbBo367UQJtRycbfRpBGncYKpMtSb/JSj+urVHCrfxrRMIRe7KYlS8kYY0YCjlJSA8M
	+nF2wVoewKcrfYGCgI0aJztOv2pdPa4wWiH9LnVDojdDfjg4p/fjv4NEqZ61zFLDro6T
	GZrw==
X-Gm-Message-State: APjAAAUpKZmd6IYaQySfktQ2Ysx1XZS0tvyMH3G1aKEYTvkiAj9AA+j1
	60ro0HuGHi+VXhurWRATFz36Go7+f3CXo/eq9nw=
X-Google-Smtp-Source: APXvYqwHZM38gMAlrgV4kUkN+VDQ+bRazLIbcPxG+wr8Ns8ghcLYzT8QZPg0+Bi1NSIfuwP2QUk/sF3j0Ji3OmXM0y8=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr7189648vkq.49.1580501273711; 
	Fri, 31 Jan 2020 12:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20200131184935.2484-1-alex.kanavin@gmail.com>
	<c3fc71d8-57a2-ec67-bcab-cf6a94893f91@gmail.com>
In-Reply-To: <c3fc71d8-57a2-ec67-bcab-cf6a94893f91@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Jan 2020 21:07:42 +0100
Message-ID: <CANNYZj_NKc8a7+c1ZpRwAW5CxG8Z31M8vfK5qogJJiRmR4=m4w@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: drop pod2man from hosttools
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
X-List-Received-Date: Fri, 31 Jan 2020 20:07:53 -0000
Content-Type: multipart/alternative; boundary="000000000000fc97de059d752017"

--000000000000fc97de059d752017
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2020 at 20:01, Joshua Watt <jpewhacker@gmail.com> wrote:

> There has been some reluctance to dropping pod2man from the hosttools
> and requiring perl-native as a build time dependency due to the negative
> impact on the build time.
>

In typical builds perl-native is already built fairly early as it is needed
by rpm-native
(which in turn is needed by do_package regardless of package format).


> Is this the only recipe that needs pod2man?
>

No, but the rest of them including binutils should get it thorough
opkg-utils dependency. I ran a successful world build to confirm that.
(there might be corner cases which the AB will show, but the basic build is
covered)

Alex

--000000000000fc97de059d752017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 31 Jan 2020 at 20:01, Joshua Watt=
 &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@g=
mail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">There has been some reluctance to droppi=
ng pod2man from the hosttools <br>
and requiring perl-native as a build time dependency due to the negative <b=
r>
impact on the build time.<br></blockquote><div><br></div><div>In typical bu=
ilds perl-native is already built fairly early as it is needed by rpm-nativ=
e</div><div>(which in turn is needed by do_package regardless of package fo=
rmat).</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Is this the only recipe that needs pod2man?<br></blockquote><div><br></div>=
No, but the rest of them including binutils should get it thorough opkg-uti=
ls dependency. I ran a successful world build to confirm that.</div><div cl=
ass=3D"gmail_quote">(there might be corner cases which the AB will show, bu=
t the basic build is covered)<br></div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000fc97de059d752017--
