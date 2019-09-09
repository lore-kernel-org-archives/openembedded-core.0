Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id 25D987F37D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 18:41:34 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id m22so9463402vsl.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kafgjug94NrcuLUwuPVqbRUJM7MReuE8ebR23AVMTfY=;
	b=d9JMkZhMeMpSCUILF3ELKBqq3P8QSsw7JBcpzrYX6x2OBX3DlhbFlFbRWTq/5AtjeG
	A8IbPlOmkTGuDHW84WPqVEA7ESxepLCneh3U4maVkQGIJKg611GtFklBZKKGQxKVYY7w
	9yPM2KxAYr3m/90amLJTfDiH044UBzf6npsbreYES7sYveFlYIAKLQxoOXZyQmtl+i3g
	9XBhnm0MlFjDPzTF+CdJV9JKrSsfR8xSw3damMGyQG9O/aqD7NdMQlPLtcAcCYCpWUa/
	KmFmeHm8Qnv+AmaHiRwxB6Sf0LlFZbpjgT1f3+qC0xM1wsEoYV80knBzHvvHYcqksh5C
	iD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kafgjug94NrcuLUwuPVqbRUJM7MReuE8ebR23AVMTfY=;
	b=lYW783y85yF64BNHLl/qOtRPrXLpCfYV0D3nnd3vgg0/W/Tl0o9xDEYpTX8cKzRQFr
	bMpn3eKJJIYvg1RpROVEOXBN0a6Lxfjc5B3tKGWMVqUQIUGXXv1y8h36ZOrKRW3FS1ww
	FN8JpkhvzRxXoF3nkabtiABZcJ71pdYnpDqmhfEZv02UDTZFZDDvu7nT/BV5TmF7Lq+T
	RfSPFfsJxzn8nItr4WdPypowJeYFsEg0J4v8Otjr7QdEBx0OGACHq6SfuXoMY5dPOs+B
	8lJlArMdVRtowddBIQGbTk/7RSi2ztnQ7qs13yvb5GXmCRn8YrCT5Ql2Qwg+GToR5MI/
	SbOw==
X-Gm-Message-State: APjAAAWu2jk7DpjqegFoM9Lc78fst/bjeV+Yz4vezKy27aCtZQIEwKKU
	OELc4Aoy7VdAN6/zfnyzd3Wa0CExGYbHE4/fQ2k=
X-Google-Smtp-Source: APXvYqzb0XfUM8HCk2YwabWeOzv2NI4TByIxY1MKLz9bLIS8b4ihivu/O5EYF6EUp9FSQjmx9pr0wCjd/zSGO9mRvR8=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr13069386vss.94.1568054495865; 
	Mon, 09 Sep 2019 11:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
In-Reply-To: <a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2019 20:41:23 +0200
Message-ID: <CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Mon, 09 Sep 2019 18:41:35 -0000
Content-Type: multipart/alternative; boundary="00000000000036f039059223237c"

--00000000000036f039059223237c
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sep 2019 at 18:49, Ross Burton <ross.burton@intel.com> wrote:

> > As I had previously suggested... can you try adding 'python3' to DEPENDS
> > of mesa, and see if that helps please? I think that would allow avoiding
> > this patch altogether.
>
> So why does Meson need *target* Python to be present when building Mesa?
>

Because mesa does this:

prog_python = import('python').find_installation('python3')

and find_installation() method of meson does not merely look for the native
python binary, it runs the binary with a meson-supplied python script
designed to obtain all sorts of information, including target-specific
things that we patch native python to report. If the target python
installation is not present in sysroot, the script will fail, and meson
will declare that 'there is no valid installation of python on your system'.

Alex

--00000000000036f039059223237c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 9 Sep 2019 at 18:49, Ross Burton =
&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@=
intel.com</a>&gt; wrote:<br></div><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; As I had previous=
ly suggested... can you try adding &#39;python3&#39; to DEPENDS <br>
&gt; of mesa, and see if that helps please? I think that would allow avoidi=
ng <br>
&gt; this patch altogether.<br>
<br>
So why does Meson need *target* Python to be present when building Mesa?<br=
></blockquote><div><br></div><div>Because mesa does this:</div><div><br></d=
iv><div>prog_python =3D import(&#39;python&#39;).find_installation(&#39;pyt=
hon3&#39;)</div><div><br></div><div>and find_installation() method of meson=
 does not merely look for the native python binary, it runs the binary with=
 a meson-supplied python script designed to obtain all sorts of information=
, including target-specific things that we patch native python to report. I=
f the target python installation is not present in sysroot, the script will=
 fail, and meson will declare that &#39;there is no valid installation of p=
ython on your system&#39;.<br></div><div><br></div><div>Alex<br> </div></di=
v></div>
</div>

--00000000000036f039059223237c--
