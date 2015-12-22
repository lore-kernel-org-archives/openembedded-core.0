Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 93AA76E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 17:34:31 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id e126so193488291ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 09:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jLR2r+H1Fn6a9OaJLg5QJw7fBV8sy+LSvn2gZUsFiKM=;
	b=bbKua2UOhYqgezYmzE2r52OCUzOvUuJjCqnm3vqoQmbwUTm/ehs7dzTkFMzzmIJFHC
	HA50Em3NVkLjoAReoUck8kKu/6ZSTehnmJAb9562E+XLrM0oCuNC6yiIVr76IwHZ7v9G
	I4yoaaoWDQ6+6g704e89eefS2yn6XmqV8ODIAHb5/BNJJwCPU0Av+QcywPjSw4eQr6v0
	Lb2uH5VRl2LeJ2It3P+/NEoABoxCSnShluHUc2lngUS8gpAFVsGoNtUsGeqUUb8fYzXo
	abKJoqggbUGjOgxwSW+viVSe9TTmrboLlw/xv/k+qqP+h+oD7nNC4zCjOSAaDnCDvz2P
	nZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jLR2r+H1Fn6a9OaJLg5QJw7fBV8sy+LSvn2gZUsFiKM=;
	b=cEk1FD6Q4P37MCVaUfChrxaHeEmO8OfZXHq+pYzn5yW3HatjAQDhdcFlFSnuUwZTt3
	pLw6YQx/kBv1Rlsbl6CFISM4odWbmWZEvXznB29SGz+hCUrbeCob+kXUbAtXe0X5MLrZ
	q0WsFNpWOtZaAg3W9niBPvFtSZlxF2AUYfs3HR0UNJNupPKF58oBSMrd05mF946kD+t+
	Dv8TriN1yzx+MjifXNUeATC5pxoBSLaByksLhkDHvY89k2TuOUPqoIu6+rMtqGZQAt4l
	rgL28qub6CwuLodt5Es2uKCWJ0tY3Fd21k3VUSCDJlMOraPrAnZkxu2ymez+TacjMrZE
	qFbg==
X-Gm-Message-State: ALoCoQnp2EOOX/CJvODZAK8oAwaqW/YFLKtQ/i0Jij4oAFQBSzGywM+1QJIb2/6aw5nCjmtAkYibGrGFcmP34lYF7sXiMafsb0Ku3Qev4uy0iN8vFt6S01g=
X-Received: by 10.107.3.154 with SMTP id e26mr25070962ioi.99.1450805671921;
	Tue, 22 Dec 2015 09:34:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Dec 2015 09:34:12 -0800 (PST)
In-Reply-To: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
References: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 17:34:12 +0000
Message-ID: <CAJTo0LbnFsAVPv6r_vh8EX9m7Kir-WW-zq+24FJS1Cr4-vVKZA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH v3] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Tue, 22 Dec 2015 17:34:31 -0000
Content-Type: multipart/alternative; boundary=001a113ec10ab6983f0527800464

--001a113ec10ab6983f0527800464
Content-Type: text/plain; charset=UTF-8

On 15 December 2015 at 09:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> Split runuser into its own package (previously provided by util-linux).
> Since runuser is compiled only when DISTRO_FEATURES includes pam,
> the creation of util-linux-runuser is also constrained by this.
>

What's the rationale for pulling this out into a separate package?


>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
> 'util-linux-pylibmount', '', d)}"
> +PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> 'util-linux-runuser', '', d)}"
>

No need for conditionals: empty packages are not created.

Ross

--001a113ec10ab6983f0527800464
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 15 December 2015 at 09:49, Ioan-Adrian Ratiu <span dir=
=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adria=
n.ratiu@ni.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Split runuser into its ow=
n package (previously provided by util-linux).<br>
Since runuser is compiled only when DISTRO_FEATURES includes pam,<br>
the creation of util-linux-runuser is also constrained by this.<br></blockq=
uote><div><br></div><div>What&#39;s the rationale for pulling this out into=
 a separate package?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
=C2=A0PACKAGES +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#3=
9;pylibmount&#39;, &#39;util-linux-pylibmount&#39;, &#39;&#39;, d)}&quot;<b=
r>
+PACKAGES =3D+ &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;p=
am&#39;, &#39;util-linux-runuser&#39;, &#39;&#39;, d)}&quot;<br></blockquot=
e><div><br></div><div>No need for conditionals: empty packages are not crea=
ted.</div><div><br></div><div>Ross</div></div></div></div>

--001a113ec10ab6983f0527800464--
