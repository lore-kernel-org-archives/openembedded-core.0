Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 609B271BC4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 13:28:24 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id o68so96570784qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L6ryUmMiYsxvCWEWH8j3hSjqCgrtaKg0mU5ObFeKAj8=;
	b=I282odO/9y6hxA0/wO/w0uppzDfRxz/eMFtQ8cgJdbMIstBtFGbHdsrwgHc6tiiwtx
	21JMbWHOSnNQgMuoXH+UoKmEV8gFDNcXunjW9hYsYg/ankX0f9f1b6KutZ9StiZwmcAF
	lvt2eNueKNv+eg+QI31FBIbL59oRYsVUcSGVks25hLojmj1lHZQWIxuxlkz3EEOc9J8L
	WNkXSVpyphLysmxjEDoKwyBQ4f+KEuF+Ylhl8RobGbJxrB1ZFvTPqmyH78eN467HxrHg
	cABGX2/B7guVSfMc8LnwG7JiA/q8nIVyQuvVhBwZuuBx6XMsixe0NRGnoRH/ONelr4BY
	Jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L6ryUmMiYsxvCWEWH8j3hSjqCgrtaKg0mU5ObFeKAj8=;
	b=gKu7Wohr3Q9MWM3hYt6D8jEqZfiHV1qjM+/6zzB8eGrjPneqTKYV5gdv5wwZPTxg68
	3XXt/4mak8UqmQWtqeErQmS8Mys82Xq9KhBJlCyNxpx/BNQIu8cYkD+TzpYYh3odlJtm
	h7w5upYmuumgiktjfgb23qa7fdxhYez24AdCLM3pakLSN3yUPKPWvjhhSwyG96SKRzVL
	sE9wQ/6up/m0aq1Oy7OPsudah6PfS4m91QcySQO2gi6HMeSaVeLRWoTPOidsZg9s6AJU
	dicVjj2AfhJfjIFvN0CL5oVaFIQEGcjGOSX92isYxtifCCl2ajtjAQeHhS9UtEwp7Suv
	v6eg==
X-Gm-Message-State: ABUngvdCSIw7CcFNTON6sh02wmH2km3hpZb++GWKWT9nDdEX+SAKeE8AgGaBkRcoZ3X1B54aOogkkRjcQrWIoYL6
X-Received: by 10.55.75.17 with SMTP id y17mr13120730qka.26.1478266105549;
	Fri, 04 Nov 2016 06:28:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 4 Nov 2016 06:28:05 -0700 (PDT)
In-Reply-To: <1478261520-4125-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478261520-4125-1-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Nov 2016 13:28:05 +0000
Message-ID: <CAJTo0LYyfnzJGmxspcEGV3cfX5QT03idm=uZyYvCJmbo2Hj87w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH]] libpcap: Update to version 1.8.1
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
X-List-Received-Date: Fri, 04 Nov 2016 13:28:25 -0000
Content-Type: multipart/alternative; boundary=001a114a88c81ae2cb054079a6b4

--001a114a88c81ae2cb054079a6b4
Content-Type: text/plain; charset=UTF-8

On 4 November 2016 at 12:12, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

>   - Update patches libpcap.inc and aclocal.patch to work with version
> 1.8.1.
>

This is legacy and aclocal.patch can be removed, we're improved the
autotools class and you can now stop aclocal from running at all.

Add EXTRA_AUTORECONF += "--exclude=aclocal" to the libpcap.inc and then you
can remove both aclocal.patch and the copying of aclocal.m4 to acinclude.m4.

Ross

--001a114a88c81ae2cb054079a6b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2016 at 12:12, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossyst=
ems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1m2"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m1582f5a618ca4f3b">=C2=A0 - Update pa=
tches libpcap.inc and aclocal.patch to work with version 1.8.1.<br></div></=
blockquote></div><br>This is legacy and aclocal.patch can be removed, we&#3=
9;re improved the autotools class and you can now stop aclocal from running=
 at all.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a"><div class=3D"gmail_extra">Add EXTRA_AUTORECONF +=3D &quot;--exclude=3Da=
clocal&quot; to the libpcap.inc and then you can remove both aclocal.patch =
and the copying of aclocal.m4 to acinclude.m4.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a114a88c81ae2cb054079a6b4--
