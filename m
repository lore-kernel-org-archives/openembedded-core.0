Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D9F476FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 23:15:04 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b205so86501289wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HSfE/VWBTm2fLywCOgvc3636CO9dKHJjvZmKQQSzvfQ=;
	b=dHLkfmVmAaqUiOuq7HLGzeEyilTGydmVFqoBnrfnng/uEuJblDU24CE2PcZ4AkpXUd
	DQVRb1SmGw7x22BxbIh12QbtqhWn5jwPH3BXGQlkoRLL2e/wnbs0L6+WgEyijrbQUKkD
	Tt18xt94NxRoMB8qwZ7odYjEycTkPr65j5wXUWXZyYAm8iQRiVVTkGxoiNG5y8XCrF76
	pj6Yf3votYdiPYWw3IKrEe8+ngusc1KYv2OmMST4zjiuaj4WzBitDOGbuRFAc6OMKR8s
	Ow8Ikh5SEX3QhyzmUKK54FfdMC2SQT8NHCgjpaLIiwJUWDJecESmVzz+fHgYf+u/xEO/
	78wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HSfE/VWBTm2fLywCOgvc3636CO9dKHJjvZmKQQSzvfQ=;
	b=YGAYt38mA1hyr4xzMLP5WqhTNSxYdFeZtiiG0LQ3KwOj5vkTPN2l/DoEMye6LridUT
	D08QU78jzXQeHEHTo42tkJClFeB/8kKwtQSniMX7Yl/6ytOLQfA6z+ISUDtj5SxDzNz5
	a9j6vyuoNigACVL32ing+V12SYWyAs8HTGx8sh2jiuxeqkWMrt1z4CsyVi0pvvOZ09nU
	KGRoz2ElxT434an69t/p+a/fmjI/z/9rNjd6yiMSn5KJxn+fi17Qk7FtoOX9F5biiwGE
	V3fXlKAXjIxYpXUuuopXBysTOoKIW1oWB4E2HbiYm+Wrs4TlBcGLm2HUGnSiV1Kzzfxk
	v49Q==
X-Gm-Message-State: AG10YORyv/TcmhFMiZXEQatAFq3Sz8uUe4G22jUP/Q4q3E9/tplJgnOuYIB+UNJavp4KWJMylfaMlGJokKLOKQ==
MIME-Version: 1.0
X-Received: by 10.194.5.36 with SMTP id p4mr18802160wjp.167.1455578105016;
	Mon, 15 Feb 2016 15:15:05 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Mon, 15 Feb 2016 15:15:04 -0800 (PST)
In-Reply-To: <CAJTo0LZ6Kuqiqi-AmihXKy7DWxc9e2+V4QS3VmVN=rfOFVCFng@mail.gmail.com>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
	<20160214115245.GC3028@jama>
	<CAJTo0LZ6Kuqiqi-AmihXKy7DWxc9e2+V4QS3VmVN=rfOFVCFng@mail.gmail.com>
Date: Tue, 16 Feb 2016 00:15:04 +0100
Message-ID: <CA+chaQeKD6yo1bih1pimJ7P2F1OPsT0B70Ew3ETQuwH8H6nRfg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Mon, 15 Feb 2016 23:15:05 -0000
Content-Type: multipart/alternative; boundary=047d7b5d9c3be477a4052bd72f42

--047d7b5d9c3be477a4052bd72f42
Content-Type: text/plain; charset=UTF-8

I'm sorry it looks like it was caused by bbappend in one of our layers.

We were using this bbappend with older mesa version and it set
PACKAGECONFIG[dri3] to empty, because of unrecognized mesa options in that
version.

On Mon, Feb 15, 2016 at 10:45 PM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 14 February 2016 at 11:52, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> It looks like non-x11 builds gained X11 dependency and mesa fails to
>> build in DISTROs without x11 in DISTRO_FEATURES:
>>
>> mesa-11.1.1/src/loader/loader_dri3_helper.c:28:27: fatal error:
>> X11/xshmfence.h: No such file or directory
>>
>
> Just had a look at this.  The dri3 packageconfig explicitly depends on
> xshmfence and if disabled then --disable-dri3 is passed.  Can you replicate
> this, and if so can you share the configure log?
>
> Ross
>

--047d7b5d9c3be477a4052bd72f42
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry it looks like it was caused by bbappend in o=
ne of our layers.<div><br></div><div>We were using this bbappend with older=
 mesa version and it set PACKAGECONFIG[dri3] to empty, because of unrecogni=
zed mesa options in that version.</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Mon, Feb 15, 2016 at 10:45 PM, Burton, Ross =
<span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_b=
lank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><=
div class=3D"gmail_quote">On 14 February 2016 at 11:52, Martin Jansa <span =
dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank"=
>martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div style=3D"overflow:hidden">It looks like non-x11 builds gained X11=
 dependency and <span>mesa</span> fails to<br>
build in DISTROs without x11 in DISTRO_FEATURES:<br>
<br>
<span>mesa</span>-11.1.1/src/loader/loader_dri3_helper.c:28:27: fatal error=
:<br>
X11/xshmfence.h: No such file or directory<br></div></blockquote></div><br>=
</span>Just had a look at this.=C2=A0 The dri3 packageconfig explicitly dep=
ends on xshmfence and if disabled then --disable-dri3 is passed.=C2=A0 Can =
you replicate this, and if so can you share the configure log?</div><span c=
lass=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--047d7b5d9c3be477a4052bd72f42--
