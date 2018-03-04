Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD7A78A3F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:24:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id h21so10967762wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Cq519aDiQa9iNaW93uv/9giRRmlBqnnmC3a1orZS5E=;
	b=VJ1WAsTDtFI40C70VDYUBcm2ckyVJffiekd0fAACD7fUptxFniW0NsmfI/fQc88Qez
	vT9cl0jVO+Z+4o8ZSLc4T1I84a+nN7YMxJGyV/QRWqzfSREtKHbr+9nKJAH2KyJfGLub
	PrpgIAx1lzTf/C3UiOKJNslDNLx5zwhN10JDoWEPvqRJOjDG5HXcWC+RwULm6KT7QtWV
	3HWZVk8lUDb3p8lpNvIlwatbHiqbUuu0TPQ7+2G6T10o/CJELK/N04cbrdBbDGh4VaQF
	Bpp4M/ZjHlcKYPzGNMH7ApgUg2Jqd4ehC4aTIglt8edUA8vp1AO38JfsA4Pn+nQRS/wL
	7BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Cq519aDiQa9iNaW93uv/9giRRmlBqnnmC3a1orZS5E=;
	b=goKPwu3zaKjGQNpWxSRZl4DMF1uF1xGFO0otPvbSTFQKTS6C5bbeJwx8aXq56V+7ec
	UwNso6xOaeqhC44VjZfLdHH2FyHyjXlVkRss8JlMnKowoT89cG8MFzx5/NI9p+eibgRt
	gruOWatyGKWcOVzlVLSECR8tGuvDFFBpCStKj7lI4NXjYgZZnpwuCF1N/Uz9auey69Jb
	Xk9sVNc5O1/FHmNyc3Vb/I2DmSGG1Mc38miu+m1SLUO6uBMCjcW06Nerq9+Kzqefo1fT
	vmGfCigHNmGkLRUjTYvywDy7GMDnKM3l0bp0GADRe1tQ2xbsC2MoG9r90ocx1nGY/ugq
	AaJA==
X-Gm-Message-State: AElRT7Eew2n947/VnVugKgwqtWTlSwY02Vc830xxXLQxy+uRpkF4glLR
	WudGTJMUqfTjPj8P2VplFgz4rr5EBar0/PNRO5I=
X-Google-Smtp-Source: AG47ELtVbSa90xriMnn9dAcpny4KgC9migPnEoXznUqA74nqi5W+46lOZgZh27znIPQtxk1H/fch7qb8Q25g04SXHiY=
X-Received: by 10.28.3.68 with SMTP id 65mr1048698wmd.17.1520169844233; Sun,
	04 Mar 2018 05:24:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 05:24:03 -0800 (PST)
In-Reply-To: <1520169610.3436.63.camel@linuxfoundation.org>
References: <CA+chaQcQztFnFJjZhXVYQeTZuv4qJ41j5cNca0NJhHPz4R6x7A@mail.gmail.com>
	<20180212101918.228-1-Martin.Jansa@gmail.com>
	<CA+chaQcHJ=x+j+5tSpdCW-QC_wOuqNNwO2TVTCPMHC--qNROkA@mail.gmail.com>
	<1520169610.3436.63.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 14:24:03 +0100
Message-ID: <CA+chaQfJHnh+N88VPS4GRe-Y=p4Xi+eAq3MBXJRWo5QcgGA7SQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Sun, 04 Mar 2018 13:24:03 -0000
Content-Type: multipart/alternative; boundary="001a114527ec905c3e0566961f20"

--001a114527ec905c3e0566961f20
Content-Type: text/plain; charset="UTF-8"

Thanks,

please don't forget to include
[pyro][PATCH] bitbake.conf: add tools required by testimage to HOSTTOOLS
conditionally
as well (currently missing in pyro-next).

On Sun, Mar 4, 2018 at 2:20 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2018-03-04 at 12:41 +0100, Martin Jansa wrote:
> > ping
>
> I've merged this.
>
> Cheers,
>
> Richard
>

--001a114527ec905c3e0566961f20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks,<div><br></div><div>please don&#39;t forget to incl=
ude</div><div>[pyro][PATCH] bitbake.conf: add tools required by testimage t=
o HOSTTOOLS conditionally<br></div><div>as well (currently missing in pyro-=
next).</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Sun, Mar 4, 2018 at 2:20 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Sun, 2018-03-04 at 12:41 +0100, Martin Jansa wrote:<br>
&gt; ping<br>
<br>
I&#39;ve merged this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a114527ec905c3e0566961f20--
