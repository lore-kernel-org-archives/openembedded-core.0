Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E984971AC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:31:12 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4so2367329qtk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=934XdEf1EiM7Cn5kAjfxp+cTKBJPjVTspSXpdQ3ubUc=;
	b=NF2bPwD4fNbUsLgMoKHlH5K9qViw7DhC9tF2x//VnulPl+qK611Fs1KOv6zksVjqie
	1dpPrcso5kQ7u/mVCMUWPyVVorcAI9qA4o0/DG1vG1H+bTkCBQCon3i0dKtr/3SgGbXE
	iHm/HFhSE9+MW7ga62Tq3knIvNOSNyY4yIY8jvog5ll3D0e3vmiWnub1mCMq3zmxJGYF
	AbYrOOat7/Oco46EEyOFJEpK8j3dTxgXztsXENinyCE1uVW4e04aB10bq8hI85aq56lY
	sN8ZB15l/4igfOTQRo1b5/G5HSKhV4XAYM0Y2Il9/axuy8xlPKkuG6qXD5lRoMd0Lt0s
	snOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=934XdEf1EiM7Cn5kAjfxp+cTKBJPjVTspSXpdQ3ubUc=;
	b=c0mjDyADvpKpWVi5ZhiCtqqelShSKIEZWhwNs/hVI/JB/Q6qBtEqQ2J5uQL0NMjR4/
	xKpVP2UjuGeK9D5/lpqSt4/80nTcWAMqVcAa9jsK/AhcBh8jk1aJLPluIfUN1YhXpwyN
	3v20j5iUeGFdLjc+dV96E2NZ4ekelSjdOvMQs4Iuvu8ttS0qlg5asYagx27/sv4HuxoP
	1H7JOdnw7YoPEkinm6IAe413b4Mka3mgKEXIS9MtTQlHtIiKeeTa5KhG/GEfCQ1uKhxW
	o5YiGYIXhds6i5qE6/3iG54wWP5zFK9i34/QthHOEjeJnuNNoagSMiMw358ZSJbPdtyz
	TkUA==
X-Gm-Message-State: AMCzsaV+abw3rdBu5CWwVXMIJrokW/A7b2c45EgtBDs1y5RBK8ROvtkX
	cenHjwM79Emqwi96HpqRWtIvYqll
X-Received: by 10.13.223.141 with SMTP id i135mr2211609ywe.452.1508236273613; 
	Tue, 17 Oct 2017 03:31:13 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	r11sm4607914ywr.13.2017.10.17.03.31.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 03:31:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id v9so1893368oif.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 03:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RNGLdrDOyf6lS6MqeFouG2i7LEpCaTvnSW5KHLHgZDeS1n17FOkvMeGXQTbMCVtrUwWqg8zR/y8wk+vm/kcfA=
X-Received: by 10.157.21.54 with SMTP id u51mr2041273otf.215.1508236271958;
	Tue, 17 Oct 2017 03:31:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Tue, 17 Oct 2017 03:31:10 -0700 (PDT)
Received: by 10.157.56.216 with HTTP; Tue, 17 Oct 2017 03:31:10 -0700 (PDT)
In-Reply-To: <1508228478.12731.1.camel@collabora.co.uk>
References: <20171016172158.22773-1-fabien.lahoudere@collabora.co.uk>
	<20171016172158.22773-3-fabien.lahoudere@collabora.co.uk>
	<CAP9ODKp4-ohZnA6tkDBaQKqUE_YDTLOQeGNpUTzV5zHH294quw@mail.gmail.com>
	<CAJTo0LbsxAbhK=XnqB0fMQXbju7gDGhu_9vnB5tg_0uCNhEnow@mail.gmail.com>
	<1508228478.12731.1.camel@collabora.co.uk>
Date: Tue, 17 Oct 2017 08:31:10 -0200
X-Gmail-Original-Message-ID: <CAP9ODKobM2qGirCLFrM-sNV=-LgbHWMFCGba_U2Wq4ckY8L7+A@mail.gmail.com>
Message-ID: <CAP9ODKobM2qGirCLFrM-sNV=-LgbHWMFCGba_U2Wq4ckY8L7+A@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 3/3] weston: Bump version to 3.0.0
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
X-List-Received-Date: Tue, 17 Oct 2017 10:31:13 -0000
Content-Type: multipart/alternative; boundary="94eb2c191f403a4263055bbb9f6a"

--94eb2c191f403a4263055bbb9f6a
Content-Type: text/plain; charset="UTF-8"

Em 17 de out de 2017 6:21 AM, "Fabien Lahoudere" <
fabien.lahoudere@collabora.co.uk> escreveu:

On Mon, 2017-10-16 at 21:34 +0100, Burton, Ross wrote:

On 16 October 2017 at 18:30, Otavio Salvador <otavio.salvador@ossystems.
com.br> wrote:


> +          file://weston-gl-renderer-Set-pitch-correctly-for-subsampled-textures.patch
\
> +          file://fix-missing-header.patch \

Those should be documented on commit log



Agreed.  The missing header one should say what platform causes it to be a
problem (in case it never gets upstreamed and someone tests it again on
just glibc).  And is the pitch patch sufficiently broken that we need to
backport it?


Without the pitch patch, all applications generating YUV420 will not be
displayed correctly. For example "gstlaunch1.0 testvideosrc ! waylandsink"
fail.
I can keep this patch in a bbappend if you don't want it. Just tell me.


Please keep the patch. It fixes a issue and it is not BSP specific, so it
belongs to core. Just explain it on commit log.


For the header patch, I will improve commit message.

I see there is an OVERRIDE libc-musl, should I use this patch in
SRC_URI_libc-musl?


No, just mention it on commit log...



Ross

-- 

Fabien

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c191f403a4263055bbb9f6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">Em 17 de out de 2017 6:21 AM, &quot;Fabien Lahoudere&quot; &lt;<a=
 href=3D"mailto:fabien.lahoudere@collabora.co.uk">fabien.lahoudere@collabor=
a.co.uk</a>&gt; escreveu:<br type=3D"attribution"><blockquote class=3D"quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div><div class=3D"elided-text"><div>On Mon, 2017-10-16 at 21:34 +0100, Bur=
ton, Ross wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr">On 16 Octo=
ber 2017 at 18:30, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:=
otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossyste=
ms.<wbr>com.br</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote type=3D"cite"><div class=3D"m_60926715088678=
37162HOEnZb"><div class=3D"m_6092671508867837162h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://weston-gl-renderer-Set-<wbr=
>pitch-correctly-for-subsampled<wbr>-textures.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-missing-header.patc<wbr=
>h \<br>
<br>
</div></div>Those should be documented on commit log<br>
<div class=3D"m_6092671508867837162HOEnZb"><div class=3D"m_6092671508867837=
162h5"><br></div></div><br></blockquote><div><br></div><div>Agreed.=C2=A0 T=
he missing header one should say what platform causes it to be a problem (i=
n case it never gets upstreamed and someone tests it again on just glibc).=
=C2=A0 And is the pitch patch sufficiently broken that we need to backport =
it?</div></div></div></div></blockquote><div><br></div></div><div>Without t=
he pitch patch, all applications generating YUV420 will not be displayed co=
rrectly. For example &quot;gstlaunch1.0 testvideosrc ! waylandsink&quot; fa=
il.</div><div>I can keep this patch in a bbappend if you don&#39;t want it.=
 Just tell me.</div></div></blockquote></div></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Please keep the patch. It fixes a issue and it =
is not BSP specific, so it belongs to core. Just explain it on commit log.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div><br></div>=
<div>For the header patch, I will improve commit message.</div><div><br></d=
iv><div>I see there is an OVERRIDE libc-musl, should I use this patch in SR=
C_URI_libc-musl?</div></div></blockquote></div></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">No, just mention it on commit log...</div><di=
v dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><block=
quote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div><div><br></div><blockquote type=3D"cite"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></d=
iv><div>Ross=C2=A0</div></div></div></div><font color=3D"#888888">
</font></blockquote><font color=3D"#888888"><div><span><pre>-- <br></pre><d=
iv style=3D"width:100ch">Fabien</div></span></div></font></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div></div>

--94eb2c191f403a4263055bbb9f6a--
