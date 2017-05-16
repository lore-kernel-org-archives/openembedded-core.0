Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8788B77D49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:19:21 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id f55so75397416qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YWNv/G4I1kVQniKU3U01CwiNi9huyyzlXqKUNbTcOBo=;
	b=z2k+1RkSrEarJwaOMMNQ7hnTnEHv85mlXW9gvOlfmXqcYr+zCUqwPD/Th52a9HYh5C
	Z9JaZICpqcmgL++4I9gEcICVAl56j9KV8x9GNcGAdtgGJgYVGGDxbIeLp6J4hPQ0lNvw
	a9OrmP1wPW5PsZmuG8AA17IoFQBLR4MpPmb3cbEEe880EKJ3kxgrDTNyoyucPZa/sasK
	IvKWL/mbgCr7uGOHgAV5lqpeNogG0lWBl5Gc9sIQ3j0c/pNT+/1kBO/pVH1dDURXt0Dt
	kS4itdn0DXdoF2JHQnL8dpK6tEdB4uZsxY1we5vIF+J5J7UU82cjD4UtOd3fjrqeSY3e
	Y/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YWNv/G4I1kVQniKU3U01CwiNi9huyyzlXqKUNbTcOBo=;
	b=qfzYigrv4AcDiWFJV84ffLOFuV0gqYRF3/MORyCySF/7ZbOsE807e+iYAIj54OGHLr
	7zOHEGjhfZ42WznGiqSwSC+8RiNzrwGDpaguJLRnzXUp+EdgZ0dYyr3hIvvTERcnM0EA
	/BJ9RfquPLQz1k0T1x5kR2FYySEWfBb/L/E2DhHr/YucA9r8UP1D8imKG4IYmtEaNI+o
	4AxYuMBw+rLCGVlFiovUXr58ts5mIm/lJGVMUv683hLfg5Bv2mUa4FzJsn7y4/XbHEGj
	lCYfr2foyyAqqGNAf+zLt9LHwaGmGFz8SkbtdkDkm1f7eHUlpYe+DaBl52NlWJ5TPKn0
	ovvQ==
X-Gm-Message-State: AODbwcDJJYXmGwiQdLfU1/3c0yEgLgJZCkfiZtad/fNhJhCln9ll3zrE
	TCQQiWL75cYTfTeFqp5P8VqH9CA3slXV
X-Received: by 10.237.36.219 with SMTP id u27mr10804223qtc.197.1494937162052; 
	Tue, 16 May 2017 05:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 16 May 2017 05:19:01 -0700 (PDT)
In-Reply-To: <CAMKF1spBOuOq0yvQ2v4GaKXX4b7mi+o+B26YaHPaK0jtP4kwXw@mail.gmail.com>
References: <1494839116-32279-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAHiDW_FuoagmNjK=XV3OeaYSq+AAR6NvcZ9RnKFabN0=DUFHGQ@mail.gmail.com>
	<CAMKF1spBOuOq0yvQ2v4GaKXX4b7mi+o+B26YaHPaK0jtP4kwXw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 May 2017 13:19:01 +0100
Message-ID: <CAJTo0LZ9vD21YSPJQNiw_nMv_gHtVtuERVkvJvnEomWY=taapw@mail.gmail.com>
To: huangqy <huangqy.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Tue, 16 May 2017 12:19:23 -0000
Content-Type: multipart/alternative; boundary="001a11406ef0819e77054fa32e0a"

--001a11406ef0819e77054fa32e0a
Content-Type: text/plain; charset="UTF-8"

On 15 May 2017 at 16:58, Khem Raj <raj.khem@gmail.com> wrote:

> >> +SRC_URI_append_libc-musl = "file://musl-header-conflict.patch"
> >
> >
> > Does the patched version not build with glibc or why is this only patched
> > for musl?
>
> this should be generic
>

Yes, please always apply patches which despite fixing build failures on a
specific libc are in fact safe for all libcs.

Ross

--001a11406ef0819e77054fa32e0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2017 at 16:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=
=3D"">&gt;&gt; +SRC_URI_append_libc-musl =3D &quot;file://musl-header-confl=
ict.<wbr>patch&quot;<br>
&gt;<br>
&gt;<br>
&gt; Does the patched version not build with glibc or why is this only patc=
hed<br>
&gt; for musl?<br>
<br>
</div></div>this should be generic<br></blockquote><div><br></div><div>Yes,=
 please always apply patches which despite fixing build failures on a speci=
fic libc are in fact safe for all libcs.</div><div><br></div><div>Ross</div=
></div></div></div>

--001a11406ef0819e77054fa32e0a--
