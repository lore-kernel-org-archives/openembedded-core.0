Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8C96E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 16:08:51 +0000 (UTC)
Received: by iofh3 with SMTP id h3so164536348iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8Cb1KgGszzsRo8F5yGvuKqQFlcNqQtCEzfNc+uQffOQ=;
	b=NmFD9bX+d582Re4xAlq073rTw7SaWbfkZcwb8mMrmuYEtxcfdohKeMxJMuafhsW852
	xQxKp2BLs+R7qxz+GHO709dccBJ8g2jzCpCi1dAgKn9I+86bV6onc6N7DGOlT5TnTjky
	JvtnSzHV843kYqr1QZJk9YdEwsbw1vB6jxeyC/DachDfTgiAfaJSAH/K25WDdMqYIKTn
	Q0Guqihd0ogupaIRbMGuHC4P/qIWXjdKVWmwMXBugCL8ZerXyNYCwuJ7IDLXQ+Zzp/KH
	Yn7I1BjqWuUYmBfQMzbdCpn0ZkP0Ajj+roNvapHOhyXvrPpAUbs+DMc0KiLLv9cg1z4w
	Uuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8Cb1KgGszzsRo8F5yGvuKqQFlcNqQtCEzfNc+uQffOQ=;
	b=B3hokB4MNzhep1CRzYo64jP8AkvJdiXVCuj47zeOy/REDwx2j/4J9XQ5jhdQ/eYPNX
	kujPXhTl74umKZfJqnNSrYqCJ1WjWABVK8B2UN/p/B/fVYQoc6mcKy3QJgLoW56rRfkV
	9ufZUEwQ5674dDpo+eVBU3OLA6SnBP39XAkfJlFeWOHGVM0mNvakACkK+68GkDnGPgvg
	8LPjX6QVl0jDdo7zJjrWMd20Q7mLnIdlwBCKhpdosW2GAF4YcEG6/2zo8Qdm3GoYF5Tm
	HWYtVhxkria4o5JbHXMaYLv//3mFCrjaYhL0Hb7oNerULb78RjldTjpdbzg1Lls89rqU
	7BRw==
X-Gm-Message-State: ALoCoQmrZ0iFz3SlFGQP9g6jSdT5zL+EOv4QmOLDCc6nw66Wstl4kZyV3893NFKl7vcMMYklwL9e
X-Received: by 10.107.135.30 with SMTP id j30mr30635498iod.148.1447690131859; 
	Mon, 16 Nov 2015 08:08:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 08:08:32 -0800 (PST)
In-Reply-To: <cover.1447401669.git.jackie.huang@windriver.com>
References: <cover.1447401669.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 16:08:32 +0000
Message-ID: <CAJTo0LYJ19n9vgH_p+dLi-cNrnmDbYqweXJbGwjnaEhj6351XA@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] libav: fix 5 CVE issues
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
X-List-Received-Date: Mon, 16 Nov 2015 16:08:53 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a0e12d30524aaa0e3

--001a113ec64a0e12d30524aaa0e3
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 08:03, <jackie.huang@windriver.com> wrote:

> Jackie Huang (4):
>   libav: fix CVE-2015-3395
>   libav: fix CVE-2015-6820
>   libav: fix CVE-2015-6823
>   libav: fix CVE-2015-6824
>
> Kai Kang (1):
>   libav: fix CVE-2015-1872
>

I'd tend to lean towards squashing these int a single "libav: fix CVEs"
commit which adds all five of those patches in a single operation (but as
separate patches for tracking), but it's hard to have a strong opinion
either way.

However is the Pending upstream-status appropriate?  Is this the right time
to bring up swapping libav for ffmpeg again?

Ross

--001a113ec64a0e12d30524aaa0e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 08:03,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jack=
ie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":e3" class=3D"=
a3s" style=3D"overflow:hidden">Jackie Huang (4):<br>
=C2=A0 libav: fix CVE-2015-3395<br>
=C2=A0 libav: fix CVE-2015-6820<br>
=C2=A0 libav: fix CVE-2015-6823<br>
=C2=A0 libav: fix CVE-2015-6824<br>
<br>
Kai Kang (1):<br>
=C2=A0 libav: fix CVE-2015-1872</div></blockquote></div><br>I&#39;d tend to=
 lean towards squashing these int a single &quot;libav: fix CVEs&quot; comm=
it which adds all five of those patches in a single operation (but as separ=
ate patches for tracking), but it&#39;s hard to have a strong opinion eithe=
r way.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>However is the Pending upstream-status appropriate?=C2=A0 Is this the righ=
t time to bring up swapping libav for ffmpeg again?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec64a0e12d30524aaa0e3--
