Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 511287706E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 23:11:24 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id n143so48767604ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vKeHABokFf/C6Jz4yUvqyX90jY7A3qBU3gG2CSRrnJM=;
	b=I7fktbVIj9cjEbXvW+WVV8anwhX8EYgj8Feinr0AcGs3vYXg18sunz3h8p7WWqiHet
	vhqsCyh7HeVYBxz58ZalZridtaYqgdRiwg+h9gbJ7wle8lG07xBJIyh/HqnQ2GvtDazl
	v22mBXDt7+AImV2JrpOj9q88rtCckG/pJGFFUQmCxXFV4jebecd5AijozGhIUbDvzgOw
	7KEx/ZfUYdr9WhWEt6PisyfwVkrdVoEgDIURZEoXB6KSAxD1ZZGun1TeiU+BjnSJsfFj
	tH7RRjcUDnLAbG9XYKN7siaCCDwZ2LnJoPt9nWUjFSKC/1KwFwWme8nrC6ZTl3WVoHBw
	hdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vKeHABokFf/C6Jz4yUvqyX90jY7A3qBU3gG2CSRrnJM=;
	b=RO3ABICT/rUQUrwMvAKD3zBgpfofcG4ootMMfs0Mijqmd2iTjXe65MMQchp7/VOOEP
	Qgq0efJ5ytn/phnPuJkNILmGzbkrGQSI5WBA5sagJGaxCyhgCLaPdZSWqxWmsYvR1D8I
	UGyTvZRfmUn3gZp8qntLEGJAfT7zum9MXObpu+ufBQRT3AqjglRjcnhCXT9VjwfZvu7Q
	e8WytHvQiIQFhsxo0gEWcZj8GR6vDpKOXZGGLFkvkz8NFZeiPK6E/FXuvE1DFlM3Gopk
	F6Nrq/Vpw5fezYmhxWFHM6dr61i2+UmAeYtjxswUm6i+6IjILNEYwDXVsZltIlR9McyD
	h+DQ==
X-Gm-Message-State: AE9vXwN218+k83cyI1GDH+QLeQMyfM81l0wfVYTyK2QiNe3nDrbnkl1S75hCLspk1J/zDQbjhiflKRR2jvvBDNhT
X-Received: by 10.107.8.165 with SMTP id h37mr10488794ioi.45.1473894685026;
	Wed, 14 Sep 2016 16:11:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 16:11:04 -0700 (PDT)
In-Reply-To: <1473660793-3296-1-git-send-email-sujith.h@gmail.com>
References: <1473660793-3296-1-git-send-email-sujith.h@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Sep 2016 00:11:04 +0100
Message-ID: <CAJTo0Lb-bsJNvxDyfkRraQ5-dQ+cJqigThm2CMBUSg5EJGOV7A@mail.gmail.com>
To: Sujith H <sujith.h@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP for cyclone5 machine
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
X-List-Received-Date: Wed, 14 Sep 2016 23:11:26 -0000
Content-Type: multipart/alternative; boundary=001a113f9154236db7053c7fd97b

--001a113f9154236db7053c7fd97b
Content-Type: text/plain; charset=UTF-8

On 12 September 2016 at 07:13, Sujith H <sujith.h@gmail.com> wrote:

> +# PIC can't be enabled for 32-bit x86 and cyclone5
>  INSANE_SKIP_${PN}_append_x86 = " textrel"
> +INSANE_SKIP_${PN}_append_cyclone5 = " textrel"
>

Can this be generalised or is it absolutely specific to cyclone5?  If it
can't be generalised then I feel that this should belong in the cyclone5
BSP.

Ross

--001a113f9154236db7053c7fd97b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 September 2016 at 07:13, Sujith H <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":22f" class=3D"a3s aX=
jCH m1571d07b68551783">+# PIC can&#39;t be enabled for 32-bit x86 and <span=
 class=3D"il">cyclone5</span><br>
=C2=A0INSANE_SKIP_${PN}_append_x86 =3D &quot; textrel&quot;<br>
+INSANE_SKIP_${PN}_append_<wbr><span class=3D"il">cyclone5</span> =3D &quot=
; textrel&quot;</div></blockquote></div><br>Can this be generalised or is i=
t absolutely specific to cyclone5?=C2=A0 If it can&#39;t be generalised the=
n I feel that this should belong in the cyclone5 BSP.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f9154236db7053c7fd97b--
