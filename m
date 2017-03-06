Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id D60E0719B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 12:23:45 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id v125so88644733qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 04:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UIZ2n20f0EsJmHv5rM4SaITZcB3rvBzA9uWJLeFniCw=;
	b=o8RHqsz7zxxKZXgW9RslfGZdGa2Wr+C6UcxgxwgOufb84oSpBmN12eAFRVQ6f86aTJ
	cHyKI8C1MTSnCffzOGgl6dazlnHKQM80/hB7T7zUl43W9XgCM/cS4GhzFDipHPZiToS4
	1YWo+FwNcAS1ECjO2N6mVnfwZqV1NxQjcShYW68nfW/SJekfX0Zu3sWUmHOtDRG2Qi0X
	zLrt112l1GLMrvLFbiH69x1/j5jY5HIKQYm7vldOth71P4PxfosAGFk8LaIXUTE9tg0a
	IK0oO1IXH7m0OJr91ncDKVdbC+MhT2Z9Z27G1Q7ulNNi5ikT799iKFLty9l1+ySujahG
	OTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UIZ2n20f0EsJmHv5rM4SaITZcB3rvBzA9uWJLeFniCw=;
	b=YCkEEoD5Ri9DFLI/yXQ3zId8WgQQtW9OIQ4kbVQK453NvwjKJfA3DnJ2nOPaUxYiz7
	5tA32ZOPCfgmOm6ZaP8ydCjN6L4HKdBX2w72kZtoaYItr0gnJk4hI+fR++XM7KHI95CR
	Srkisz+FeDyOGXNV17IDfpZKXpQYGuVuoEw/r00YQowKwbq//5zO9OwUTnqD8Hb4mnaB
	HStoHggKNsaVfYk0+jT+RHhMwMr0zz3UW8iyIvwGKOd1CDLAsq6Hu7mvKqSOzsKfax3q
	v1vSVUN2kagkKZxBXBICBGCZ8rIsExBh8ZX8RDXi6WRT/MDAc4xImDZ31P8FlYJPl4P6
	34ag==
X-Gm-Message-State: AMke39krHZupMIkojLy2fikdUQJ4YL+jUUbrdrBDbpXFjDPmT+sE1umnChJkKGDbQBdSBqmezp7jJqzoEoObXcQx
X-Received: by 10.55.183.133 with SMTP id h127mr15921786qkf.121.1488803026859; 
	Mon, 06 Mar 2017 04:23:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 04:23:26 -0800 (PST)
In-Reply-To: <1488644775-25405-1-git-send-email-moritz.fischer@ettus.com>
References: <1488644775-25405-1-git-send-email-moritz.fischer@ettus.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 12:23:26 +0000
Message-ID: <CAJTo0LbZ5Ld2QaSic-6cUJ-CwABC9A6F0Gm6y=N1RbECsL2SPQ@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: mdf@kernel.org, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC/PATCH] boost: Fix issue with python-numpy
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
X-List-Received-Date: Mon, 06 Mar 2017 12:23:46 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600568e97c4054a0ef73c

--94eb2c0600568e97c4054a0ef73c
Content-Type: text/plain; charset=UTF-8

On 4 March 2017 at 16:26, Moritz Fischer <moritz.fischer@ettus.com> wrote:

> Maybe making it another PACKAGECONFIG[numpy] option
> would be desirable?
>

Making another option would definitely be desirable.

Ross

--94eb2c0600568e97c4054a0ef73c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2017 at 16:26, Moritz Fischer <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:moritz.fischer@ettus.com" target=3D"_blank">moritz.fischer@ettus.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1le" cl=
ass=3D"a3s aXjCH m15a9a2586fd568fb">Maybe making it another PACKAGECONFIG[n=
umpy] option<br>
would be desirable?<br></div></blockquote></div><br>Making another option w=
ould definitely be desirable.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--94eb2c0600568e97c4054a0ef73c--
