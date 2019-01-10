Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 30F226B7C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 13:45:06 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r200so8933480iod.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ThNmsBpoqHMa1dRGoSiDC0XWztn4mPhYGOB3UW7kcr4=;
	b=kyoMWZGfB7K/PBm9rQSy1CCBHnUpJsHuQ3+/6mr1hpe3KT6/i8oq0lzurfXBl4iDx1
	x2kME4Vo2keNKZlTBCKgw1hkVWwYfOjGjApzriRNX61zYxOlZQXWDVpSn2V+d5+ntZIl
	CK3XQE4CRhZtm5UlHRGU1JwtJvbQR1keCQ+pHxcFKVz9BdszO8mdPAt4F3GaAWjYlWNL
	SO2IhNWv5iqXG7Y7/EnwAvR5U8N+qYru2yocFiK6TKpIDE4/VWyGt9IiyyqerEFVjnsp
	GW6lUv8cdAw5jH2ywCJ0DVBbuChdRDURr2N30zgDjeEyiAb7tyEGiUjMQ6XzIeQfmdpi
	MYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ThNmsBpoqHMa1dRGoSiDC0XWztn4mPhYGOB3UW7kcr4=;
	b=R9kSuh1QuvPXfI7ORPeA3OQQL73KjqU9s1O9VO8RAOie1EJ9a9aUmfk4epiPA7V6Vq
	/CwR58SCkF3Cg0UhfiTUaqAQZQJVUldHwFx5LXj+pTbqbr68B3F3sYS3/L1jwL1PdrZx
	txGv0iG3I3iBk6mzCv++pZ9S7N6Q/zDa/6Z/41+6yiCZZiWzvEtgmOUQLQ0EYzUDwAw0
	hh1q3lUTQ3/ZRG85DUAbWyJQPoISPhXe43u+tE+kQWLhXmrkKmBIRVtl196DVC+f0Wch
	W3XsgW9D9AVjqG7nB904V+g3FBQ+tyaTgrDQJ7pHcI2DlubeIXXQ1Ji0bK3fjJhSVNKL
	svsw==
X-Gm-Message-State: AJcUukcGx+sKoiKsjhrRQXJjh5O7mOBf6ygST0RxCQBhEcWbKXfdHIOG
	760nPUXQ76P9D4OQ6JLZOkBWHRrc49Lf35uGITK73Q==
X-Google-Smtp-Source: ALg8bN6LC0VzTUHp5fMj1L+Dvc3sE+21dEoXgsiAxjuLwPKArLr5+acgRh/hGQo5pyBAYZ1j+BnCEJbAGMJoNfhiFQ4=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr3610539iom.201.1547127907994; 
	Thu, 10 Jan 2019 05:45:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545101991.git.liezhi.yang@windriver.com>
	<73748ae8-f16a-43f9-0fac-d62e43b471cf@windriver.com>
	<6ec99815-8bef-18ad-b8c3-e10858a332ec@windriver.com>
In-Reply-To: <6ec99815-8bef-18ad-b8c3-e10858a332ec@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jan 2019 13:44:56 +0000
Message-ID: <CAJTo0LYQm3WQ9=2E6xmRcquczsK0g8uuoZN+BF_yMW6ibrfGLg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] package.bbclass: Don not hide cpio's error
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
X-List-Received-Date: Thu, 10 Jan 2019 13:45:07 -0000
Content-Type: multipart/alternative; boundary="00000000000060e6c6057f1ac9c7"

--00000000000060e6c6057f1ac9c7
Content-Type: text/plain; charset="UTF-8"

Queued in mut already.

Ross

On Thu, 10 Jan 2019 at 07:48, Robert Yang <liezhi.yang@windriver.com> wrote:

>
>
> On 12/18/18 11:13 AM, Robert Yang wrote:
> > Sorry, the subject should be:
> >
> > package.bbclass: Do not hide cpio's error
> >
> > Fixed it in the repo.
> >
> > // Robert
> >
> > On 12/18/18 11:00 AM, Robert Yang wrote:
> >> The following changes since commit
> 20aea61385e1a53ac245353899277ba20104ed2f:
> >>
> >>    gcc: Drop 7.3 since 8.2 is working fine for us (2018-12-15 17:10:44
> +0000)
> >>
> >> are available in the git repository at:
> >>
> >>    git://git.openembedded.org/openembedded-core-contrib rbt/package
>
> Ping.
>
> // Robert
>
> >>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/package
> >>
> >> Robert Yang (1):
> >>    package.bbclass: Don not hide cpio's error
> >>
> >>   meta/classes/package.bbclass | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000060e6c6057f1ac9c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Queued in mut already.<div><br></div><div>Ross</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 10 Jan 2019 at 07:4=
8, Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang=
@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;border-left-color:rgb(204,204,204);padding-left:1ex"><br>
<br>
On 12/18/18 11:13 AM, Robert Yang wrote:<br>
&gt; Sorry, the subject should be:<br>
&gt; <br>
&gt; package.bbclass: Do not hide cpio&#39;s error<br>
&gt; <br>
&gt; Fixed it in the repo.<br>
&gt; <br>
&gt; // Robert<br>
&gt; <br>
&gt; On 12/18/18 11:00 AM, Robert Yang wrote:<br>
&gt;&gt; The following changes since commit 20aea61385e1a53ac245353899277ba=
20104ed2f:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 gcc: Drop 7.3 since 8.2 is working fine for us (2018-=
12-15 17:10:44 +0000)<br>
&gt;&gt;<br>
&gt;&gt; are available in the git repository at:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 git://<a href=3D"http://git.openembedded.org/openembe=
dded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.or=
g/openembedded-core-contrib</a> rbt/package<br>
<br>
Ping.<br>
<br>
// Robert<br>
<br>
&gt;&gt; =C2=A0=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-=
core-contrib/log/?h=3Drbt/package" rel=3D"noreferrer" target=3D"_blank">htt=
p://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Drbt/package</a=
><br>
&gt;&gt;<br>
&gt;&gt; Robert Yang (1):<br>
&gt;&gt; =C2=A0=C2=A0 package.bbclass: Don not hide cpio&#39;s error<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 meta/classes/package.bbclass | 3 ++-<br>
&gt;&gt; =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000060e6c6057f1ac9c7--
