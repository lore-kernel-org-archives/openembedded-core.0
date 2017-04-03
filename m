Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBE777D31
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 09:13:16 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id x35so106336277qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jj3oN3qxKtUp8sQBA1lEKmBnQQbAqG1QU7fiFeqTAh4=;
	b=nybulWwbVzPEDHSBn3QN3/v68QAGUQLsQhbztB4Ivfxxd4FQmt9AxxJwfvEyKGWCOU
	HRqvFMDZrC2NBFXJWchGD/cnfn9TyWX9uEbLy2tFYyWfp3634nKTJTdamDRm4ipepSAz
	lpM2av31DPY6U9lp/9nO/hYX87biSZ6278kn/P3w0h3JK6ZeUFIWr1x27yralCpVkxx5
	t3YQI0wTS6gZReGHsQpf58t6CJkWIQ0ZvfovB8BzEh0pqfEGVz2UPE5Tf5ENtch3uSDI
	XZOspsMG4IHDvY4VXl66M85eADfP2XOrCWp2Kb8IXPmLFDuBGcrevNSe3FHVcu/kI7K+
	efXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jj3oN3qxKtUp8sQBA1lEKmBnQQbAqG1QU7fiFeqTAh4=;
	b=bOReBPEbXxUn6XG1xga+i8OJadTm1mlwreIwQVGG2q+7AUaehLAN9yP2ZQR4WuM5O6
	YBZl6MbQOMXdMkAcZl5u7zta0Unw2Ty1niRSnQqIcSuaq0v9GOcKgUp6mMOxi0MPs26P
	nqammFBlyLqsYnTuVw3wCyU/NyQyFWyfaeb71CKUYDWjpgRGSufe+A47IDnJk6uVf1NH
	3t89BQ0x5FU1aKVkFynx8x5pMX1S6/U1sTPqooq6ywSvkJUVjJ7BMNY1Oxs9ei7JuwMU
	QAm5AvM2b3XCmt2jBqbO9WSCFzBpB7WzyKyI3AMn8eIpTGJWUngehmrSYmJFPjGWIrq9
	7ZPQ==
X-Gm-Message-State: AFeK/H3g+3DKldERMXbCTgX4CadPYsy5Bpj2yt7TpGGcolCuAA6Mbwz5WRb6gSnYADmVABbZr6YpNf3MTTus2gvp
X-Received: by 10.200.33.182 with SMTP id 51mr16207216qty.65.1491210797887;
	Mon, 03 Apr 2017 02:13:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 02:12:57 -0700 (PDT)
In-Reply-To: <1491187907-5752-8-git-send-email-yin.thong.choong@intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-8-git-send-email-yin.thong.choong@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 10:12:57 +0100
Message-ID: <CAJTo0La=dCkggKyAVWQdMwJu-wGbocwTha1v3RE+YHWMqyc1tA@mail.gmail.com>
To: yin.thong.choong@intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] chkconfig: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Mon, 03 Apr 2017 09:13:17 -0000
Content-Type: multipart/alternative; boundary=001a113c6418e4d0c9054c3f9190

--001a113c6418e4d0c9054c3f9190
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 03:51, <yin.thong.choong@intel.com> wrote:
>
> fedorahosted.org was retired on March 1st, 2017. This is to update
> the SRC_URI to point to github.com.
>

Here you say github.com.


> -HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
> +HOMEPAGE = "http://downloads.yoctoproject.org/mirror/sources/"
>

HOMEPAGE is optional and this isn't the homepage, so we might as well
delete this.


> -SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-
> ${PV}.tar.bz2 \
> +SRC_URI = "http://downloads.yoctoproject.org/mirror/
> sources/${BPN}-${PV}.tar.bz2 \


This isn't github.

Ross

--001a113c6418e4d0c9054c3f9190
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2017 at 03:51,  <span dir=3D"ltr">&lt;<a href=3D"mailto:yin.thon=
g.choong@intel.com" target=3D"_blank">yin.thong.choong@intel.com</a>&gt;</s=
pan> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<a href=3D"http://fedorahosted.org" rel=3D"noreferrer" target=3D"_blank">fe=
dorahosted.org</a> was retired on March 1st, 2017. This is to update<br>
the SRC_URI to point to <a href=3D"http://github.com" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com</a>.<br></blockquote><div><br></div><div>Here yo=
u say <a href=3D"http://github.com">github.com</a>.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
-HOMEPAGE =3D &quot;<a href=3D"http://fedorahosted.org/releases/c/h/chkconf=
ig" rel=3D"noreferrer" target=3D"_blank">http://fedorahosted.org/<wbr>relea=
ses/c/h/chkconfig</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://downloads.yoctoproject.org/mirror/sou=
rces/" rel=3D"noreferrer" target=3D"_blank">http://downloads.<wbr>yoctoproj=
ect.org/mirror/<wbr>sources/</a>&quot;<br></blockquote><div><br></div><div>=
HOMEPAGE is optional and this isn&#39;t the homepage, so we might as well d=
elete this.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">-SRC_URI=
 =3D &quot;<a href=3D"http://fedorahosted.org/releases/c/h/chkconfig/${BPN}=
-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://fedorahosted.or=
g/<wbr>releases/c/h/chkconfig/${BPN}-<wbr>${PV}.tar.bz2</a> \<br>
+SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/mirror/sour=
ces/${BPN}-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://downl=
oads.<wbr>yoctoproject.org/mirror/<wbr>sources/${BPN}-${PV}.tar.bz2</a> \</=
blockquote></div><br>This isn&#39;t github.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113c6418e4d0c9054c3f9190--
