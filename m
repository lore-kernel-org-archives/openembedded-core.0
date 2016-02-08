Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB16731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 13:20:01 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ba1so151784106obb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 05:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WQKkwq8lznodpp7fMDUOeYyQ82pknEdgWcZynWcvJh8=;
	b=zw/8Dh4amV9xia3u/wxNR2GKSmZJo1mZNaca4Nc1kmGDtGnQKKJqjnJcu1/ydMmbjD
	c3r9jBlZgYdxsB1vPcJry7Q+YeaogXQlqmABqdeyV4wK1VUkyXIEsapSSYFQcCxj2stD
	qqwZX2BPPi7IsBw4tsf9Q601667jK5ss3ywTjr176oTtUmi5e8yD2iI/SemTEf1aObGn
	Gq0d1qrKm9bdIemaw8QIYP3ryKzc9Ud+Z/WKj9iMXAf6tNwQbFJX+VppLv739k2KQFif
	pYjLM2nDwv9rwb9PYEARHQ7PpSviD/xYRLheYfHtmBKkSeX1FCrlvGtBdQaRNRmxwP08
	2G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WQKkwq8lznodpp7fMDUOeYyQ82pknEdgWcZynWcvJh8=;
	b=N6xyPrtufI6zlzGx5mL/2qsDbb3JiJbqGr4GHBHrnnfBeAUgUMZnGDZwMl2L5v6246
	PXHN/d+cBgTGdaqlVqeXtmY7HKbr3hVz4yVp0FHpsG8tpf4SetYmQRAG2kKWRVRvtLNG
	j6i4rz+htUMBLcwOkABUtxudE9cSiSjJNmN2/1zipijmKYKmXKdw0PVtKL+q15ZVtekR
	sQSVxfh3KgwvfMFKqsP92krd9J6kzRKftKNWTHRoA5h5zY4LUp3P9mfEByWQvlBh5mHe
	ZZuHxZxnCHHXOF1FfKK/nAlDr+21b4+eEnQ2sJtPAUqUonlnOHixVUUaDGIxl9Q6h/4K
	aX0Q==
X-Gm-Message-State: AG10YORr3JAdE9y2EQEVYDGnziQUDGqVsQO3rDa7Xd1CM2RvqrvB1UghpGbUOHNXKzzsVdxWlkPdkJ+4hBvk5dAb
X-Received: by 10.60.117.233 with SMTP id kh9mr10769310oeb.23.1454937602178;
	Mon, 08 Feb 2016 05:20:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.224.68 with HTTP; Mon, 8 Feb 2016 05:19:32 -0800 (PST)
In-Reply-To: <CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
	<CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
	<CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 8 Feb 2016 15:19:32 +0200
Message-ID: <CAHiDW_GNTgkDtBjk8XRFsD-FLnZakBCjMoNOVQO+EqHkwxnpuQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Mon, 08 Feb 2016 13:20:02 -0000
Content-Type: multipart/alternative; boundary=047d7b3a92a0f2d9ac052b420ef6

--047d7b3a92a0f2d9ac052b420ef6
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 22:55, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> On Fri, Feb 5, 2016 at 9:46 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 5 February 2016 at 20:44, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> its added new to this version. May be packageconfig is better place
> >> for --with-sha1 stuff
> >
> >
> > Agreed - some may not want openssl at all and being able to switch it for
> > another alternative would be useful.
>
> sure. but, then I have some questions..
>
> 1. which one we default to? openssl?
>
> 2. which one we support, from configure.ac:
>
>         [choose SHA1 implementation])])
> case "x$with_sha1" in
> x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto | xlibsha1 |
> xCommonCrypto | xCryptoAPI)
>   ;;
>

Thanks for looking at this -- I was updating mesa last week as well and
fell into the same maze of crypto choices, all alike. Currently OE-Core is
pretty unorganized here: It's easy to end up with three big libraries just
for calculating SHA1 hashes.

If you do this patch for mesa, I'll follow up with one for xorg: we should
at least default to the same choice. Currently Xorg uses libcrypto for
SHA1, I think that's reasonable for mesa as well? As Andre said, the
maintained version of Nettle has the problem of being "LGPL3|GPLv2".

In addition there's quite a few unneeded crypto dependencies that I intend
to remove: It's possible that with some smart choices we may be able to
drop some libraries from the core images (see
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=jku/mesa-update
for a start).

If you don't have time to do the mesa-packageconfig patch, let me know and
I'll do it.

Jussi

3. is there a good way to handle 'multiple choice' with PACKAGECONFIG?
> How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b3a92a0f2d9ac052b420ef6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 5=
 February 2016 at 22:55, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><span class=3D"">On Fri, F=
eb 5, 2016 at 9:46 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel=
.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 5 February 2016 at 20:44, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; its added new to this version. May be packageconfig is better plac=
e<br>
&gt;&gt; for --with-sha1 stuff<br>
&gt;<br>
&gt;<br>
&gt; Agreed - some may not want openssl at all and being able to switch it =
for<br>
&gt; another alternative would be useful.<br>
<br>
</span>sure. but, then I have some questions..<br>
<br>
1. which one we default to? openssl?<br>
<br>
2. which one we support, from <a href=3D"http://configure.ac" rel=3D"norefe=
rrer" target=3D"_blank">configure.ac</a>:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [choose SHA1 implementation])])<br>
case &quot;x$with_sha1&quot; in<br>
x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto | xlibsha1 |<br>
xCommonCrypto | xCryptoAPI)<br>
=C2=A0 ;;<br></blockquote><div><br></div><div>Thanks for looking at this --=
 I was updating mesa last week as well and fell into the same maze of crypt=
o choices, all alike. Currently OE-Core is pretty unorganized here: It&#39;=
s easy to end up with three big libraries just for calculating SHA1 hashes.=
=C2=A0</div><div><br></div><div>If you do this patch for mesa, I&#39;ll fol=
low up with one for xorg: we should at least default to the same choice. Cu=
rrently Xorg uses libcrypto for SHA1, I think that&#39;s reasonable for mes=
a as well? As Andre said, the maintained version of Nettle has the problem =
of being &quot;LGPL3|GPLv2&quot;.</div><div><br></div><div>In addition ther=
e&#39;s quite a few unneeded crypto dependencies that I intend to remove: I=
t&#39;s possible that with some smart choices we may be able to drop some l=
ibraries from the core images (see <a href=3D"http://git.yoctoproject.org/c=
git/cgit.cgi/poky-contrib/log/?h=3Djku/mesa-update">http://git.yoctoproject=
.org/cgit/cgit.cgi/poky-contrib/log/?h=3Djku/mesa-update</a> for a start).<=
br></div><div><br></div><div>If you don&#39;t have time to do the mesa-pack=
ageconfig patch, let me know and I&#39;ll do it.=C2=A0</div><div><br></div>=
<div>Jussi=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">
3. is there a good way to handle &#39;multiple choice&#39; with PACKAGECONF=
IG?<br>
How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?<br>
<div class=3D""><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--047d7b3a92a0f2d9ac052b420ef6--
