Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E44A6B6F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 17:05:11 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id v138so78779338qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g2CMV/1XS7it7WNYAqBrSVrtcPFD2cByGicOFw/K5oI=;
	b=Hf3J0psalXB0ookWYJBN81svyBAwgFvx9KIkouc9d4Elww7aXiIUsDRlwd1mQnFZT1
	EbLuKnpBqji6PqFu7EWtodaRS70yzT5OuWQW95WSy4g6E2vXdbVStnH3buDyj/1F3Ezt
	0ydat5JdlxlgBsa9VIBmPbBT8AHcp27OW6R9bTt/amwkArK+B309PRRnizC+WZUs5hUq
	RmD4jee/K83JKStsC5MiqUE8zFcOkTPGLjCwK/P9Cfh7T/M6x+6unLA+lbNacmoXQmIo
	jPd7DqYDv8ddIrY6oMSkgX7Iz7Tx4uOa7fjF/eHo+zJdmUNrx9lxDl1W9+qB5d9oX6yR
	26yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g2CMV/1XS7it7WNYAqBrSVrtcPFD2cByGicOFw/K5oI=;
	b=V3nwcdx66sI2ykoPKNb7Xbpuk3y15IU8dj9qEtf5sInddEBSxGJRbClRPqTJOQmZ+x
	IVej5UFWId7iMjzqWI2cGkL7v/YVp9WDqfjmcJhYq+Z3E+85XDmJ97hiBmZmohSt2yiN
	+SF6kXjlYt6MmcQuHtJ5D0iEJl7YfU9pFHdxZSoSrhk5QFC1VliaMICjkW+NOjt45qaq
	OWieHklRw5zcVGssD8osM7+mvvRsNcvcLc7DTxEDRhwQlQXUZqIbXyrhF1K7D+PAN9fI
	v6lS9tnkqcGxoKpXSm4JUOTL3XyxWR3lKyghNXvd/uxu3Tn+bqKG/o+1xqFTH1BJCLW1
	xsCA==
X-Gm-Message-State: ABUngvfpR8GXsmYpTRUjKrAVJEQSESuWKNDCmxeCqf9S1Coqe9a+1oc62YAKMUm2NTGkd0chgbntV/I8KRdQ11IY
X-Received: by 10.55.130.7 with SMTP id e7mr28217007qkd.121.1477933512895;
	Mon, 31 Oct 2016 10:05:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Mon, 31 Oct 2016 10:04:52 -0700 (PDT)
In-Reply-To: <1477503544-13794-2-git-send-email-ulfalizer@gmail.com>
References: <1477503544-13794-1-git-send-email-ulfalizer@gmail.com>
	<1477503544-13794-2-git-send-email-ulfalizer@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Oct 2016 17:04:52 +0000
Message-ID: <CAJTo0LZ6tiZGsTZ1WSRPa2wyY4oRY+5wLkisLN4cd6f1wmor1w@mail.gmail.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] package.bbclass: Remove unused variables and imports
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
X-List-Received-Date: Mon, 31 Oct 2016 17:05:13 -0000
Content-Type: multipart/alternative; boundary=94eb2c074bda09c7f805402c3647

--94eb2c074bda09c7f805402c3647
Content-Type: text/plain; charset=UTF-8

On 26 October 2016 at 18:39, Ulf Magnusson <ulfalizer@gmail.com> wrote:

>              # Skip it if the target doesn't exist
>              try:
> -                s = os.stat(fpath)
> +                os.stat(fpath)
>              except OSError as e:
>                  (err, strerror) = e.args
>                  if err != errno.ENOENT:
>

Urgh, why not just use os.path.lexists()...   Can you change the code to do
that?

Ross

--94eb2c074bda09c7f805402c3647
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 October 2016 at 18:39, Ulf Magnusson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ulfalizer@gmail.com" target=3D"_blank">ulfalizer@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":15c" class=3D"a=
3s aXjCH m158022896582464f">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Skip it if the target doesn&#39;t exist<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D os.stat(fpat=
h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.stat(fpath)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(err, strerro=
r) =3D e.args<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D e=
rrno.ENOENT:</div></blockquote></div><br>Urgh, why not just use os.path.lex=
ists()... =C2=A0 Can you change the code to do that?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c074bda09c7f805402c3647--
