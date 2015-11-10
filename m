Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6715875EE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 23:40:37 +0000 (UTC)
Received: by qgea14 with SMTP id a14so11981146qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7ItOeA74hAfZ2bX2+kfYVfvCZKFmxkhH5zyzxZ3AtKQ=;
	b=SUCq7vAmyEjC9S0MVaetzP8Sriq8xVwYPTi7CtU/1seOsgRdrIu2lnaJCCHh7HfRLJ
	+pS7cNrY0mVvGljI+hvdxEVcaIDgnVMh5Xxx/N5O9d3mnIXWPF06+uTPFimzDkvqwlby
	6OzzbECOYMqbVlLkz7tv5saDPOZ4/B+tnJCxXiun850wKMCbVj+C/TvzY+ZXVjBO6mwT
	AfWv5m2NB1XHH16r40u16GE0rkhR7btYbjin5vi8Fghp0yRtmvGJO3rqieNP6XOD1pEE
	jqVC1xsuq8Ywb+AWFPD6ZuJlUR4MYyRCDXda9Shy0M2fg3P7QCOZ4g405zEdhlc8FGOk
	7tQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7ItOeA74hAfZ2bX2+kfYVfvCZKFmxkhH5zyzxZ3AtKQ=;
	b=nAVE012aU1av8p5a+HzfGSUcJstyw2kNYqBIHlm6j+RmXqXJ/oMgL9ZT3I8U1unZvs
	FwvmjcjfKPrXOkgRkpVD6hCeuOV6evIYO1DxBr1J6ZqXnKdld/wo2HuQOmpcaIifPpfL
	7UKijyEq4eB44UXu3HYnk2YIS6Xb06nUQnaX2RWvy8xU5E6Nxi98qupGXlQ8jnpiL0Qv
	dXrxRUO8bzP5FvTQ5rq62ZiWb9/z2dZph7zGp/yUQwFlw0BdlTwxzjbVKr6n+8eXyYV6
	Tj84mo3mDduCjAn9WmeHil67r53uoAsAbt3CpywsNPb6RQKKORDfBTUJay5qyfqMMdy5
	bkWA==
X-Gm-Message-State: ALoCoQnlw7BY5mC0rb4OFsbQ1P9Z6rzQf7jAcWl50SCoj2/lFNLU6F7q2myTYbvnWlbcKCMaUidc
X-Received: by 10.141.23.20 with SMTP id z20mr8276784qhd.52.1447198838079;
	Tue, 10 Nov 2015 15:40:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 15:40:18 -0800 (PST)
In-Reply-To: <1447197016.2907.2.camel@pbcl.net>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <1447197016.2907.2.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 23:40:18 +0000
Message-ID: <CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 23:40:39 -0000
Content-Type: multipart/alternative; boundary=001a11423c80a9da5d0524383c07

--001a11423c80a9da5d0524383c07
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 23:10, Phil Blundell <pb@pbcl.net> wrote:

> Why does gobject-introspection (presumably giscanner, right?) need to
> run binaries on the target at all?  I thought it operated mostly on the
> source code.
>

Same reason gtk-doc's scanner executes code: vast amounts of relevant
information can't reliably be extracted from source but is trivial to
introspect at runtime (GObject hierarchy, properties, signals, etc).

Ross

--001a11423c80a9da5d0524383c07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 23:10, Phil Blundell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":5kh" class=3D"a3s" style=3D"=
overflow:hidden">Why does gobject-introspection (presumably giscanner, righ=
t?) need to<br>
run binaries on the target at all?=C2=A0 I thought it operated mostly on th=
e<br>
source code.</div></blockquote></div><br>Same reason gtk-doc&#39;s scanner =
executes code: vast amounts of relevant information can&#39;t reliably be e=
xtracted from source but is trivial to introspect at runtime (GObject hiera=
rchy, properties, signals, etc).</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a11423c80a9da5d0524383c07--
