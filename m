Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA2A77196
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:20:25 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id x130so1841793ite.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ksm6chBh2+d65OAsVLUyt5WqDGUCAyoZGGhOGd3VYaU=;
	b=X+1uvaazCI+QnXM2QC6NtBG8eHBDf/bmBnL2zM8T6D7IIxChTFO/P68MmHF4jPpPPv
	9/hUNnKD4iu97VOFxJezyHzYvzE54sHM0JYN6uoeqstGwilAYJzYTQ1gI2rIOyChhYaM
	Eg7Yg+mF8FCLJzzNVOZqkwXQxIFOYmSsWtQ7lNx5JqNdyWHjpBq29zdtC00R9cibEHGN
	w2TqW2/r/F7VRoDTpkc2vSiXRiJ58ou/t+mvBZCjmx/spbInEvHJR5L4JUuO39fRcmA6
	fOx/O7A68KZq66ZaH5kM+pNqxNT5X9BRU9SHrtz7sH+y4H+INiy10m/TO6/vZ/6P6lEC
	WsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ksm6chBh2+d65OAsVLUyt5WqDGUCAyoZGGhOGd3VYaU=;
	b=fafvXTdSuRihu4UZw+jCZFnzUQlmg9B6HKrubg+RiDJlzutf/MPHcEtr8JEb23ryMK
	ezbCVpyNLJNY5sKP7dXzCnS6ArlXAvGJwD7O9tKWKaYkNYWH7E+flICA4Qg2H3OPhKF1
	tS+97Q+hvArufUwGCAG6m/82QgdgcigswbpKh8ycJ2r3ovs8Z1MoEoGuV7k5OPn6e/HJ
	NaWPHe/UVushWcIzzxW0G7T/Px0gPKuTAXBtY0dwfnwhnN5kkE1xE+UEF74/CHdC3W+3
	Tc4ZjIs/jPJ+qCymw8bz+FPk4k0Y+25FXTUMih99co+rUQVm7r4ykl+ygahkNfcqGw1O
	ENEA==
X-Gm-Message-State: AEkooutb1q3JACq+lt168nc5J2UW4eCn0SjQehKmY5Z1q2VwTXYHC95FXIPLVjR/D41fGZRD4EXCjXW/lf7ZQmCI
X-Received: by 10.36.129.213 with SMTP id q204mr9027653itd.38.1470910826335;
	Thu, 11 Aug 2016 03:20:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 03:20:05 -0700 (PDT)
In-Reply-To: <20160811093906.353-1-adrian.ratiu@ni.com>
References: <20160811093906.353-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 11:20:05 +0100
Message-ID: <CAJTo0LZ_Ka0jK8HyaoutN9bw72mhOaO4qVnmS_s-0xLN0qsrpg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: fix emit_depmod_pkgdata() workdir
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
X-List-Received-Date: Thu, 11 Aug 2016 10:20:26 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc4ce6b80539c91d5b

--94eb2c08b1fc4ce6b80539c91d5b
Content-Type: text/plain; charset=UTF-8

On 11 August 2016 at 10:39, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> bitbake commit 67a7b8b02 "build: don't use $B as the default cwd for
> functions" breaks the assumption that this function is running under
> ${B}. This causes build failures because System.map is under ${B}.
> Fix this by using an absolute path instead of relying on cwd.
>

This failed to apply and I noticed that I fixed this myself in July...

Ross

--94eb2c08b1fc4ce6b80539c91d5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2016 at 10:39, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">bitbake=
 commit 67a7b8b02 &quot;build: don&#39;t use $B as the default cwd for<br>
functions&quot; breaks the assumption that this function is running under<b=
r>
${B}. This causes build failures because System.map is under ${B}.<br>
</span>Fix this by using an absolute path instead of relying on cwd.<br></b=
lockquote></div><br>This failed to apply and I noticed that I fixed this my=
self in July...=C2=A0</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc4ce6b80539c91d5b--
