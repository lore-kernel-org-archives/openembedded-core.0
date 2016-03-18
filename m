Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id E2D9260761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:50:21 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ig19so17415129igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UNqTHnlhYBBuLX8VoAMUxyAi8/q0fE6Rom/HmMyoumI=;
	b=ZZlwUf6QU7lpo9BfpZK+Ua3Ik6cdOP3NGmqvilQMXVTCM/HiurMQtSSi9cg3LuSLQ6
	dlvwI8y7KYoAh0nOfzE9GvRyBJmpCjRnc1mzOK/jdO5MiQSe+o6NsV/v1MGg9oSNgjbl
	D+pFPtlZq0RMv3xydFqE0MxCf/EsFJ5dsMIK44PCP+MfqEaLUtI7BphFJMkMdOgWczes
	96IubJkiDizFLlrCSFSv4XJofYy6+WOWT62+a1R9OfE77lPvqXlqLjD/kcHZVE5+Ap4I
	q+RUL+YE8/76a6kvxootbSVUuKwaytlG0isy0ABQFoNnAaIGuA9aURc+v2RG1iJAsZc5
	UJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UNqTHnlhYBBuLX8VoAMUxyAi8/q0fE6Rom/HmMyoumI=;
	b=bhiRJARiVBeF4Ts7bcZ6w/qbDbfuL0yTfrEC4GG7h1+mb6nQpEyX2neiX5vtZ5o+4t
	cxfKLopZRJcVsh3mIoqchnTCMa4BvaTMnlRlnXpKemYOx7IJ4zZ8xsLvUXPMcwh9dfQT
	fwE1KgIIjPQNhnn8JcUEkDs6zr6+KQlMF/xHwqL3D534fwkoKZMUntEHpspFQqQCUkfU
	z/PA4OsgNd587qoBB/Lwp2Pttpv8KrFdSMZPqPHzABhCKbaTs6TMnqcE+CAG0cN3Oho2
	B/GuxPI8MedLVnwuyi6Tq2DiESsZGZolmVQx+ha9nfdRUk497is+5IFEjQSy3AfX+NzN
	KVUQ==
X-Gm-Message-State: AD7BkJLtb5SinrMfJFeP4x2kbqQj8ROHHjjfzDe+jghG5ONfgaIXRQaPsXFa9ETXQsLKOZtr3DJ8jZBxKq9Kf8x0
X-Received: by 10.50.97.71 with SMTP id dy7mr17245747igb.78.1458294622093;
	Fri, 18 Mar 2016 02:50:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 18 Mar 2016 02:50:02 -0700 (PDT)
In-Reply-To: <174AD7CFE5F468498ACCFE3FEE0EF1EB14328479@IRSMSX102.ger.corp.intel.com>
References: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
	<CAJTo0LYpmnCX9OckD=hgt18F46wFD-9RVDESJV930sy1jzjE6Q@mail.gmail.com>
	<174AD7CFE5F468498ACCFE3FEE0EF1EB14328479@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Mar 2016 09:50:02 +0000
Message-ID: <CAJTo0LaRmz_Hg5eZ3BdKf=czGgXo_a_vYWpyi7Lv=xSZRKfXig@mail.gmail.com>
To: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] oe-selftest: Updated --list-tests and --list-tests-by
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
X-List-Received-Date: Fri, 18 Mar 2016 09:50:24 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc1edff55052e4fac78

--047d7b10cfc1edff55052e4fac78
Content-Type: text/plain; charset=UTF-8

On 18 March 2016 at 09:25, Istrate, Daniel AlexandruX <
daniel.alexandrux.istrate@intel.com> wrote:

> We could gather all external python modules and we either verify if they
> are installed and ask the user to install them or attempt to pip install
> all of them when sourcing the environment (oe-init-build-env).
>
>
Can we not use any more external modules for 2.1, and then revisit this
once in the 2.2 cycle?  As this is just visual, the old code was fine just
not optimal.

Ross

--047d7b10cfc1edff55052e4fac78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 March 2016 at 09:25, Istrate, Daniel AlexandruX <span dir=3D"ltr">&lt=
;<a href=3D"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">d=
aniel.alexandrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font=
-family:&quot;Calibri&quot;,sans-serif;color:#1f497d">We could gather all e=
xternal python modules and we either verify if they are installed and ask t=
he user to install them or attempt to pip install all of them
 when sourcing the environment (oe-init-build-env).<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"></p></blockquote></div><br>Can we not use any more e=
xternal modules for 2.1, and then revisit this once in the 2.2 cycle?=C2=A0=
 As this is just visual, the old code was fine just not optimal.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b10cfc1edff55052e4fac78--
