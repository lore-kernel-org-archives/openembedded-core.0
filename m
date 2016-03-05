Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 69777731A2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 01:10:31 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m184so80264551iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3o67erbBlD2ijgAHAyW2/oJeBDN2F6SuM7MD4uoE8j4=;
	b=uJiyQe9XxY4wlPh+6a9ENZX3+OXPeTBVfW2RWM/6YVCJC835GNr49jJQNpak5ZcKAz
	i2UuwOvNk3v9RDZ+JG6Wv9xDFUs3KzC2w6As4DZCr1F0qH7Qf/0ZcC4B2g5ys49iOTtM
	IlWThUD/GT/M0WVI/8cUVGhkG5BC+0ZjWprE7Pxb2OitdACbnwSLL138iKV7GBXXaUqr
	6pV+FJXSKX71Yu4oZL9Job7g/eX2OriWopb4dklSvx1BgHYwX5bRCNsZrCGQ6GxSwIp0
	dGiFtlhJzXqj5AGrqKl9I2l5Iux4+Xh14UdrEbpFYO0Wtikw4lRJKUkV8+Yv3goh283m
	u+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3o67erbBlD2ijgAHAyW2/oJeBDN2F6SuM7MD4uoE8j4=;
	b=UVWji5LtgLtKBZNTAvWBraexYO+GOaSQZx3p0PexYEGXSyWGiss25UCkRnfKJkow2m
	EwA9cqLsLUDs3m5tPLiR67orrNQyT6B3Wx24RQTmitL4DzqJZp9uQVgkoRTvHYq61RNI
	Mjd9kaPnlYddca6HS6nD1V0AvMzLZnGwpYcpKY7Ayp5TVpHEDIVDTCdF4zTekbQiGT51
	BKNKoVlb88r8dc/VEPVJDeBZfe/GCSgXuJo5gSajqo2YBld45T/2B1VxS71bhzPYXW0S
	sgc9tyyykQ4Ka4vukQ+C5swry4UFDpy+HJ0sxVeVbBUWjry/qwwzZMZfDoFF57K3ReiL
	gchw==
X-Gm-Message-State: AD7BkJKkFGdQwyIHs1yVBaRMsbDtogQBQ1giGwE4jTxsxaYp3PNJLV8G0II3K79lxPXLQrZVcmMuIAI6b/Fy9m5n
X-Received: by 10.107.10.30 with SMTP id u30mr10471920ioi.99.1457140231675;
	Fri, 04 Mar 2016 17:10:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 17:10:12 -0800 (PST)
In-Reply-To: <CAJTo0LZNbYcQ-6QP9XQaEPsYxWQizvezy3XXdRrfxmMUD02iuQ@mail.gmail.com>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<1457131877.2804.65.camel@linuxfoundation.org>
	<CAJTo0LZNbYcQ-6QP9XQaEPsYxWQizvezy3XXdRrfxmMUD02iuQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 5 Mar 2016 01:10:12 +0000
Message-ID: <CAJTo0LZ3zWTyOYzGw81_P2Z05W8VOqr=79LP3m2MSJ0v+g8Aiw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Sat, 05 Mar 2016 01:10:31 -0000
Content-Type: multipart/alternative; boundary=001a113f92c0e5b863052d42e53c

--001a113f92c0e5b863052d42e53c
Content-Type: text/plain; charset=UTF-8

On 5 March 2016 at 00:09, Burton, Ross <ross.burton@intel.com> wrote:

> * a codepage issue with mcopy (uninative)
>>
>
> My hunch is that we need to add the utf8 gconv module to the tarball?
>

My hunch was probably wrong.

stracing the mcopy shows that it's trying to open the gconv files from the
proper native sysroot and not the uninative sysroot, but the files don't
exist in the proper sysroot at all as they're meant to be in the uninative
one.  We also strip the uninative sysroot right down to just one gconv
module which we probably don't want to do now we're trying to use it for
more than just eSDK but it does contain the index at least.

(The strace says this:

13648
open("/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib/gconv/gconv-modules",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
)

Presumably it's looking in $libdir which seems reasonable, so I'm not sure
how best to solve this.  Remove gconf from uninative and generate it as
part of the native sysroot?

Anyway it's now gone 1am so I think I'll stop now...

Ross

--001a113f92c0e5b863052d42e53c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 March 2016 at 00:09, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div class=3D"gmail_extra"><div class=3D"=
gmail_quote"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div style=3D"overflow:hidde=
n">* a codepage issue with mcopy (uninative)<br></div></blockquote></span><=
/div><br>My hunch is that we need to add the utf8 gconv module to the tarba=
ll?</div></blockquote><div><br></div><div>My hunch was probably wrong.</div=
><div><br></div><div>stracing the mcopy shows that it&#39;s trying to open =
the gconv files from the proper native sysroot and not the uninative sysroo=
t, but the files don&#39;t exist in the proper sysroot at all as they&#39;r=
e meant to be in the uninative one.=C2=A0 We also strip the uninative sysro=
ot right down to just one gconv module which we probably don&#39;t want to =
do now we&#39;re trying to use it for more than just eSDK but it does conta=
in the index at least.</div><div><br></div><div>(The strace says this:<br><=
/div><div><br></div><div>13648 open(&quot;/home/pokybuild/yocto-autobuilder=
/yocto-worker/nightly-x86/build/build/tmp/sysroots/x86_64-linux/usr/lib/gco=
nv/gconv-modules&quot;, O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or =
directory)<br></div><div>)</div><div><br></div><div>Presumably it&#39;s loo=
king in $libdir which seems reasonable, so I&#39;m not sure how best to sol=
ve this.=C2=A0 Remove gconf from uninative and generate it as part of the n=
ative sysroot?</div><div><br></div><div>Anyway it&#39;s now gone 1am so I t=
hink I&#39;ll stop now...</div><div><br></div><div>Ross</div></div></div></=
div>

--001a113f92c0e5b863052d42e53c--
