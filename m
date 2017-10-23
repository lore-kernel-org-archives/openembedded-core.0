Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 048EA606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:54:28 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id f187so5222134itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DPl0sZ6pecd/1IG9X9SCFqAlz8JSphjdfveGXl3Naho=;
	b=UaX0m06XUg0XQVSA6JZP8ZL6sIQqk3CB/l/atOocG83xUh7KFDCg8vpDCjRPp5LreA
	dWYPVHjv7uyw4GPwnWqU2AFAoqVvbvgd/5qUiX66OdeG7HSmGn3kyUou4Ybf2nUryIoI
	VrlI3kyVSUDuz9t6BQ/Oli2ciNfKd44ExJVpthlfqBiClkajhDNu5ViHZy0qqf+LpsGl
	Uszxq9Cax+HQgoG+qTSw62bVKx6+AJzxveA90VOd2QekGyCEvX8Dfi6l3+RMc3rYHmgV
	2kebPq37FDPHmbxUwYeBbUVYiBezVB8YEt3GkBaKOkuAiySB3REshZCWon3lBQnC1iIc
	d08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DPl0sZ6pecd/1IG9X9SCFqAlz8JSphjdfveGXl3Naho=;
	b=E6Hf/wVpoEfZh7/xIWQJjnIdj0YRRgG6xirCh+3Pgk0nVvKygPmCUjfV2ecsHQutFH
	Mb6MA1SUCATBw9GN5pzy7KrOX4NHVt3bBTVnDGLI5xKfoPsQFLoCrXqNHSRCkQ5JAucB
	wvjZkxalbDVQnYcqDRf5dXT+rpcyjoziY6Dp3VR1LYOPbEMoXgNxn7Sl+SNFMYw2uIob
	80CIIJ+VIzuLZpxwbffUtAS5UY3k6y3JwenvM0IGR+3kqrdClUe1F+1qZoLWrQAVyFRv
	z8ef0w3QNdTQ06EYLC6DesXMq+aE7ZS59y/78Btn1TqKGUDMH5Er94+DtcFJRHXSh9+w
	rcZQ==
X-Gm-Message-State: AMCzsaUPbRO5UFrH5j2d/QWxskPcdx4M4EmRt/nkmTlK8cQROmUJADrD
	S5Js0UNYihA0pVquoSMQAkOpSgnWpBf7TclreoAXlw==
X-Google-Smtp-Source: ABhQp+SyykRD5g069cSxV7781VAlzYRnC36/cnQrwZ/NVCnIYjpFvXrkDlFVY/PmCJLRptpjTfxTbP7B1TZBxdDrOJA=
X-Received: by 10.36.4.67 with SMTP id 64mr7901952itb.94.1508752470102; Mon,
	23 Oct 2017 02:54:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 23 Oct 2017 02:54:09 -0700 (PDT)
In-Reply-To: <1508748359-20879-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1508748359-20879-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Oct 2017 10:54:09 +0100
Message-ID: <CAJTo0LY9ZyVypgmtYExhk4ypko9yUus_W-KUzCVO29sJ8=gLng@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libnl: 3.2.29 -> 3.4.0
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
X-List-Received-Date: Mon, 23 Oct 2017 09:54:29 -0000
Content-Type: multipart/alternative; boundary="001a1140ad4e08ea25055c33cf72"

--001a1140ad4e08ea25055c33cf72
Content-Type: text/plain; charset="UTF-8"

On 23 October 2017 at 09:45, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> +SRC_URI_append_libc-musl = " file://0001-PATCH-fix-libnl-3.
> 4.0-musl-compile-problem.patch"
>

Generally speaking patches that fix musl builds are also the "correct" fix
so don't need to be applied in a musl override which often tends to be
neglected on the next upgrade.

Please always apply the patch and adjust it if required so that it works
for both musl and glibc (and add the missing upstream-status, hopefully
Submitted).

Ross

--001a1140ad4e08ea25055c33cf72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 23 October 2017 at 09:45, Hu=
ang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.co=
m" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+SRC_URI_append_li=
bc-musl =3D &quot; file://0001-PATCH-fix-libnl-3.<wbr>4.0-musl-compile-prob=
lem.<wbr>patch&quot;<br></blockquote><div><br></div><div>Generally speaking=
 patches that fix musl builds are also the &quot;correct&quot; fix so don&#=
39;t need to be applied in a musl override which often tends to be neglecte=
d on the next upgrade.</div><div><br></div><div>Please always apply the pat=
ch and adjust it if required so that it works for both musl and glibc (and =
add the missing upstream-status, hopefully Submitted).</div><div><br></div>=
<div>Ross</div></div></div></div>

--001a1140ad4e08ea25055c33cf72--
