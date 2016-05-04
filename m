Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 160F97017D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 11:52:32 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id u185so58645450iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MZa3c3XPm4ah5clI76Fox4gjpzfjHegmZBTvY7QKEdw=;
	b=lyoE6TQEsmZYY5nsO9sfk/A2aYYe3SM7hlB+BqM0AMw3+pQBdFRszlkS5bcRFBS0jK
	gij2JQxnlQuI/fD28Pu4KnwC7vWgx5IlVCMxn5wFJMZBNyklgyFVDG/6TxDWuOkS8sM+
	vWnbM/GrRDmnAbCtvKko+sV8YwTh+fwhVfgLdK6m1yscX/eJV6VnGE1jUqXHEOFG7w0T
	n3I3wKzQtT5rkXyN+IGwgh3KV5Ad3AqCh7a+oKaT7W3ItNdD4QtqVq+Gu0HxX2T88PRq
	Wa5nWyIbLoQQiOPCvVXn5WHhOUaR4vpjOhGocN38MLHGaFJvHeCwf3iZGHd5qCjzGMrQ
	qTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MZa3c3XPm4ah5clI76Fox4gjpzfjHegmZBTvY7QKEdw=;
	b=nNPovPaiinZuBQ/gtSQodm3WYLVxY8+1hCLC+dq0a5/zdolfcx9iKqgkWGLs9UGoq2
	6zJ3/ENqH4BL8xV6wIjQ1wwlp+nw4Qt5vDIVh13YD/bZnCpf8WavE9rF7HuvZ9bwUvsd
	soidYnNr623CTMawOAp7ZOtpxiMAX9pzWIf+wdXRu0u5D2BqM+Myctht/kZ9/MLx309z
	s0kmonyJCOdv12uD6HwIvNuSMp6Jh8qv372EyZZjyhI5lhF6DLzDKC438pJvlO0SeMt5
	L8iWw9CXMrdD6m6n5Sh7P0RPj88R9bJCIe/u+CINYgMF3jCM/GKMAvkc0mHvr5u1td99
	xs5w==
X-Gm-Message-State: AOPr4FXgEBOWT88G0E6ZHiNGY9OQqHjcObQrGzQbyN/2kil+uaWkhPMe0CvHINu2BjdzViAXXmugqKpDPlz1sVLE
X-Received: by 10.107.179.136 with SMTP id c130mr9506594iof.99.1462362753082; 
	Wed, 04 May 2016 04:52:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 04:52:13 -0700 (PDT)
In-Reply-To: <1462358118-14378-1-git-send-email-ismo.puustinen@intel.com>
References: <1462358118-14378-1-git-send-email-ismo.puustinen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 12:52:13 +0100
Message-ID: <CAJTo0LZJc8ZsWNiLjv+FXKD7V+AS4fDPPWE3=Dszo9CF=nS+cQ@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcre: Fix CVE-2016-3191
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
X-List-Received-Date: Wed, 04 May 2016 11:52:34 -0000
Content-Type: multipart/alternative; boundary=001a1148578c6e3bce053202dc30

--001a1148578c6e3bce053202dc30
Content-Type: text/plain; charset=UTF-8

On 4 May 2016 at 11:35, Ismo Puustinen <ismo.puustinen@intel.com> wrote:

> Upstream-Status: Accepted [8.39]
> CVE: CVE-2016-3191
>
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
>

These bits belong in the patch header.  Basically the patch on its own
should have a summary of what it's purpose is, a CVE tag is relevant, and
Upstream-Status / Signed-off-by tags.

Ross

--001a1148578c6e3bce053202dc30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 May 2016 at 11:35, Ismo Puustinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ismo.puustinen@intel.com" target=3D"_blank">ismo.puustinen@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":r4" class=
=3D"a3s aXjCH">Upstream-Status: Accepted [8.39]<br>
CVE: CVE-2016-3191<br>
<br>
Signed-off-by: Ismo Puustinen &lt;<a href=3D"mailto:ismo.puustinen@intel.co=
m">ismo.puustinen@intel.com</a>&gt;<br></div></blockquote></div><br>These b=
its belong in the patch header.=C2=A0 Basically the patch on its own should=
 have a summary of what it&#39;s purpose is, a CVE tag is relevant, and Ups=
tream-Status / Signed-off-by tags.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1148578c6e3bce053202dc30--
