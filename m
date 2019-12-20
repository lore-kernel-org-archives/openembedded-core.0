Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail.openembedded.org (Postfix) with ESMTP id 793647FDD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 12:12:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id v12so5898499vsv.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 04:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dL5UILRH+hGHgaFVD0IamdwtVbnQtHTqq7XRQB7d4kY=;
	b=i8ojxUz4iNl/WmZVW0TrGyz/spBt+Jy18rBDWLoYAqlt2zo16MW8twh6Weq0iQHH/X
	RYGdOgwkKjGU5XJimH+zceEvZNQfzX5UIIZsqV0Bs578YXT5n9Jftt789gz7H7CGWoqj
	cKTFWi4KeAAcGL+CDccv7whMc52YBRng2qSRpBdvbuqLKG9teV7RRjH1XR6/iw/ToPVa
	rER6YIZLYfsMSW7kWdfOpGkPgaJiIgd+oaXKMePZyP5EjkY+vhPxMoO1KTRA9TlZjRdb
	94m85aq4xc5xl2KcI69s1shcplZhrWCkji65WsnJNVKC4fcVGUvGoT7mFsdz5Qf4M2hC
	6Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dL5UILRH+hGHgaFVD0IamdwtVbnQtHTqq7XRQB7d4kY=;
	b=a0z170PZzJztfWoBPArb0Lkak1dE8bNoCb7JJycIaA9sezpLMBxjXtRHeQMuQH3tda
	tVqYJFp1U2Yf+dYDCMkmFdzC4Sk4azRfBpMoGFbTCNhVUeO8HbkQwU8+l9FGu6AOATrS
	df+uCTm9XRkaNYcyn5RE78G30SjgmFaExhKiqYMQC3F603lTTj4wNBNCZzpK7KtswP2l
	vVGnm2f+N6ANjMb7nmo3oP1u2TpG6qxxkM5htb4Y9VYDt5AybEVp5z/tDidPM8pXAzbC
	CJEJNNilb8fWOSB0o4J4qJcBlD5EgsP2UJVQu5f2RCvVhf9t8gsCBwQJJ+1RvAnygR7H
	nc1Q==
X-Gm-Message-State: APjAAAWDR/n3dyPqRRIkDvVWLjEGiJffzxRlB1JFRJPalotHg5drK8DJ
	JWSQCNCy9VF8Jejj7Q7aPC6wzXbS552qVqGAR1o=
X-Google-Smtp-Source: APXvYqx17TAjtCcWV6+EK8S00LYOpJxU3A69+ylLVRsyyenM+jLaEZ0mg09qZGsDNgRPru3bOB2beIN7AV7KikFrfAM=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr8125042vsq.94.1576843980291; 
	Fri, 20 Dec 2019 04:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-20-alex.kanavin@gmail.com>
	<ca5b077a-b7a5-f443-fdee-0951eb29b35b@intel.com>
In-Reply-To: <ca5b077a-b7a5-f443-fdee-0951eb29b35b@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2019 13:12:48 +0100
Message-ID: <CANNYZj_t7V8h2-7Zve5XV8jJuH0DF1hXo4TPcB8aJbqa3Rw_pg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/25] ltp: update to 20190930
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
X-List-Received-Date: Fri, 20 Dec 2019 12:12:59 -0000
Content-Type: multipart/alternative; boundary="0000000000004fc297059a219954"

--0000000000004fc297059a219954
Content-Type: text/plain; charset="UTF-8"

Thanks, will send a followup patch.

Alex

On Fri, 20 Dec 2019 at 12:02, Ross Burton <ross.burton@intel.com> wrote:

> http://errors.yoctoproject.org/Errors/Details/299060/:
>
> TOPDIR/tmp/work/core2-64-poky-linux-musl/ltp/20190930-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld:
>
> /tmp/ccGG6bI5.o: in function `main':
> /usr/src/debug/ltp/20190930-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling/../../../conformance/interfaces/pthread_mutexattr_getprioceiling/1-2.c:57:
>
> undefined reference to `pthread_mutexattr_getprioceiling'
> TOPDIR/tmp/work/core2-64-poky-linux-musl/ltp/20190930-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld:
>
> /usr/src/debug/ltp/20190930-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling/../../../conformance/interfaces/pthread_mutexattr_getprioceiling/1-2.c:51:
>
> undefined reference to `pthread_mutexattr_setprioceiling'
> collect2: error: ld returned 1 exit status
>
> Ross
>

--0000000000004fc297059a219954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, will send a followup patch.</div><div><br></d=
iv><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, 20 Dec 2019 at 12:02, Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"http://er=
rors.yoctoproject.org/Errors/Details/299060/" rel=3D"noreferrer" target=3D"=
_blank">http://errors.yoctoproject.org/Errors/Details/299060/</a>:<br>
<br>
TOPDIR/tmp/work/core2-64-poky-linux-musl/ltp/20190930-r0/recipe-sysroot-nat=
ive/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc=
/x86_64-poky-linux-musl/9.2.0/ld: <br>
/tmp/ccGG6bI5.o: in function `main&#39;:<br>
/usr/src/debug/ltp/20190930-r0/git/testcases/open_posix_testsuite/conforman=
ce/interfaces/pthread_mutexattr_getprioceiling/../../../conformance/interfa=
ces/pthread_mutexattr_getprioceiling/1-2.c:57: <br>
undefined reference to `pthread_mutexattr_getprioceiling&#39;<br>
TOPDIR/tmp/work/core2-64-poky-linux-musl/ltp/20190930-r0/recipe-sysroot-nat=
ive/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc=
/x86_64-poky-linux-musl/9.2.0/ld: <br>
/usr/src/debug/ltp/20190930-r0/git/testcases/open_posix_testsuite/conforman=
ce/interfaces/pthread_mutexattr_getprioceiling/../../../conformance/interfa=
ces/pthread_mutexattr_getprioceiling/1-2.c:51: <br>
undefined reference to `pthread_mutexattr_setprioceiling&#39;<br>
collect2: error: ld returned 1 exit status<br>
<br>
Ross<br>
</blockquote></div>

--0000000000004fc297059a219954--
