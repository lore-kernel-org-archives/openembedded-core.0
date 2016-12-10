Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8F28965CBB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 18:40:57 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id w63so51050925oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8VohAKy1cFd55jHnDkkbNKtyhB9p+gwo2I+xzEmPhpM=;
	b=lDIeRbjRToKGfQ6o4hOCkzp1HqxLsdC+GuDzN0lcKVjzNYknxDDfPrYah0AcGd5Ebt
	Dt2GYz82Fvf64uXJBLurylj/zR27d6oSfQn13AmPEVSZRPwizWgsez5vzyEAh0+ZC1PS
	ufTQsp9xFLYOE2oll39+QjrMWEEd3HKcGwyZGmvP8mlI3hTLXZd7ej6qc4nSWt53r9/D
	2oGJBWXPk3dzDrvNyVN8sUlK8NwvvNw0wLnd1+lFe0JkG21Sp3SdAMkSx2WVvulFqB+I
	UQNn3bS/9WI37CUnB3Zrv9jrRLJyc6P/eKVw+/b75EEWrW3hP1fcE62x7G/BtlL5rZrz
	rWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=8VohAKy1cFd55jHnDkkbNKtyhB9p+gwo2I+xzEmPhpM=;
	b=Ai3NxsWsQhNk+pOERvacwfc8ZIjPjO/7mvmA4kjgYL3mbSxRfoS3rB4n/OKWGw5zlr
	TnmERHIP29bllY4tUudIeRjwCy6UDsfxhChY+KpAkhe63fJrq01WMXbD++/i1ftIK3Vl
	OGnayp2V2SiGSfi8yDmq7K2HjBfUHr/lQJPzKwGtfVz9LgZfbjaivEAGOiSPKCyxaEI+
	47+LKBLGwYoPKhEeJsv7isEyCQFJeA4GwC+5EuAh1ermWQn/EOIuPK7v3eZ95nVDOmLJ
	0RBvnbzs59PbxPagvwyCb2ijBKzAXGI21/EgUg9n5nW6edcyDuVASrp4ZwXTn2MEp1Bq
	WKbQ==
X-Gm-Message-State: AKaTC00cVAnV6wRVpHzIdTOTJnYtB3qB0pv8ZrmB4qbaP5FHz254uHCqUmFrs8LA59IK3mfGEK5pyaIbRAnJew==
X-Received: by 10.202.231.68 with SMTP id e65mr45421381oih.200.1481395258489; 
	Sat, 10 Dec 2016 10:40:58 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.14.20 with HTTP; Sat, 10 Dec 2016 10:40:38 -0800 (PST)
In-Reply-To: <1481305586-11873-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1481305586-11873-1-git-send-email-ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 10 Dec 2016 11:40:38 -0700
X-Google-Sender-Auth: jTaDxJSO3V9AfQTMVE_XeCY1njE
Message-ID: <CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] edgerouter.conf: enable generation of wic.bmap
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
X-List-Received-Date: Sat, 10 Dec 2016 18:41:03 -0000
Content-Type: multipart/alternative; boundary=001a1141ba2427805605435236a7

--001a1141ba2427805605435236a7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Enabled generation of block map(bmap) files for wic images
> built for edgerouter machine. This should simplify flashing
> images with bmaptool.
>
> [YOCTO #10621]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>

I think this is more of a distro decision than machine, whether they want
to support use of bmaptool for their users/customers. It=E2=80=99d be nice =
if it
was easier to control compression from the distro, too. For example, if we
want to distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be nice=
 to be
able to switch to that for all machines that use wic. I=E2=80=99m not sure =
how best
to pull that off, however. Something to think about for the future.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141ba2427805605435236a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2o" class=3D"a3s aXjCH m158e4b20acbcae73">Enabled generation of block =
map(bmap) files for wic images<br>
built for edgerouter machine. This should simplify flashing<br>
images with bmaptool.<br>
<br>
[YOCTO #10621]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;</div></blockquote></div><br>I think thi=
s is more of a distro decision than machine, whether they want to support u=
se of bmaptool for their users/customers. It=E2=80=99d be nice if it was ea=
sier to control compression from the distro, too. For example, if we want t=
o distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be nice to be=
 able to switch to that for all machines that use wic. I=E2=80=99m not sure=
 how best to pull that off, however. Something to think about for the futur=
e.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, =
OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer,=
 Mentor Graphics</div>
</div></div>

--001a1141ba2427805605435236a7--
