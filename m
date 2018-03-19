Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1097899E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 22:38:29 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id b20so6068429iof.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qN2BQaYcf2fXWfZwkxFepubrAEFIaFNCNLUDv4/vhfo=;
	b=MPmtTHlqLFVCNw08UWWybLm7JJ3N+yKU0SEFfqginX9jRnNO5RrIRt78UVGL6nODBa
	ji2FC3wR5UQ6Qvo0v8egiqgPTxwnzMBW1JNQ9AWdn83ossht/5zHTzKzKc2G7/IybJgK
	83qYk09K10V9SNc5BCUDiDz+ppg0FYBIoV6bvQ5snAwdsSYzcWtWEghPZGVhWsh2IBtW
	fyaZWTT/cShnpEc4SbFP/7Z7Kabv7NZmb82JrARJLlkZpLuOMBsshhycMEPstIa5dEYy
	xKfdg7HYrx8p7gCp4OEpDjtlwuKPALcPw2ygufAE7sqFD1S8UWmvEmjSc7kzRUWk7mBG
	b8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qN2BQaYcf2fXWfZwkxFepubrAEFIaFNCNLUDv4/vhfo=;
	b=QBNpiFPe4fc43WzYJ26opF54PO3NOFAjlK80jXPLdk1uddKjJuqqm+uqsOa6XzSiX5
	si17qCpz+ymw8mzB1Dmje34lcwjM7jesP0x0VSq6/aRsSQpr8w7VuyvjpxUS3mIxhe8c
	zG8zm6OLW/i8uC/htzUQVHEJ1Kyz9XCe7XrqoRcZ1xZIhNHeP/ibRf2fw49GU/kcljpD
	cUkMs98RreE7s1ON82V+z9iashJdJAW/D+knfoZXFXXzZ9nlJ7Ip2H9h4eFLAlSF9s0O
	kpixegsrg6t5WZ+nx5gqafu4C/HqWPHzAyWGew+nKQbA0UpwPWDrE9SlyjRN7f+jFf+f
	/40Q==
X-Gm-Message-State: AElRT7GejxehF4T9jtfaYyBWfQ/E+/5e0cOR8/h6TcIBi0rcQs82GVCw
	UuzJOKJESIYBi9WSP708vqvU2SwthZht4Z8aQn92nA==
X-Google-Smtp-Source: AG47ELul2ZDYG7CBWM56XW2pXhfR9M7jatpy7Q6+wm3Y6t71loYQtc5fS/tF9hOEETdcCUOlb4comDyIuVdjNfZxQmE=
X-Received: by 10.107.28.203 with SMTP id c194mr14591461ioc.30.1521499111238; 
	Mon, 19 Mar 2018 15:38:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.161.136 with HTTP; Mon, 19 Mar 2018 15:38:10 -0700 (PDT)
In-Reply-To: <CAPGMVzHgUcWV3TFaTeV40+P=SO2zV-4cjw2oWnB2KsBrozk9Sw@mail.gmail.com>
References: <CAPGMVzHgUcWV3TFaTeV40+P=SO2zV-4cjw2oWnB2KsBrozk9Sw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 22:38:10 +0000
Message-ID: <CAJTo0LYDmdGjrixdE21h_V-8PvnbZEJ5kPqxSL3F72eofm6cFA@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: system lock down in middle of build
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
X-List-Received-Date: Mon, 19 Mar 2018 22:38:30 -0000
Content-Type: multipart/alternative; boundary="001a11409fe20d70a90567cb9e15"

--001a11409fe20d70a90567cb9e15
Content-Type: text/plain; charset="UTF-8"

Depends on whether it's literally logging out, or rebooting.  Neither of
which would be caused by Yocto directly.

If it is logging out then that is most likely the kernels out-of-memory
handler killing your entire X session to get some memory back.  Turn down
the parallelisation options, or buy more RAM.

If it is rebooting then this is normally overheating or bad memory, both of
which are hardware problems triggered by a Yocto build being more
power-hungry and sustained than just browsing the web or using a word
processor.

Ross

On 19 March 2018 at 20:35, Rajath C S <rajathcs.1996@gmail.com> wrote:

> Hi,
>
> so i am workin gon yocto development on my PC as well as on my laptop.
> I have also worked on it on others systems, but the strange thing is only
> on my PC & laptop the systems gets logged out automatically in the midst of
> target build.
> Is this a bug?
>
> PS: both my PC & laptop are of high-end configurations
>
> Thanks
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11409fe20d70a90567cb9e15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Depends on whether it&#39;s literally logging out, or=
 rebooting.=C2=A0 Neither of which would be caused by Yocto directly.</div>=
<div><br></div><div>If it is logging out then that is most likely the kerne=
ls out-of-memory handler killing your entire X session to get some memory b=
ack.=C2=A0 Turn down the parallelisation options, or buy more RAM.</div><di=
v><br></div><div>If it is rebooting then this is normally overheating or ba=
d memory, both of which are hardware problems triggered by a Yocto build be=
ing more power-hungry and sustained than just browsing the web or using a w=
ord processor.</div><div><br></div><div>Ross</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 19 March 2018 at 20:35, Rajath C =
S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=
=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div><div><div><div><div>Hi,<br><br></div=
>so i am workin gon yocto development on my PC as well as on my laptop.<br>=
</div>I have also worked on it on others systems, but the strange thing is =
only on my PC &amp; laptop the systems gets logged out automatically in the=
 midst of target build.<br>Is this a bug?<br><br></div>PS: both my PC &amp;=
 laptop are of high-end configurations<br></div><br></div>Thanks<br clear=
=3D"all"><div><div><div><div><div><div><div><div class=3D"m_340732174245537=
8585gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><b=
r></div></div></div>
</div></div></div></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11409fe20d70a90567cb9e15--
