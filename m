Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rfqln-0006Do-3T
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 11:30:04 +0100
Received: by vcbf1 with SMTP id f1so8994619vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 02:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0GK/hBdbEdPvGBJrYVEh+MFQutpc3mEgkrYsNye7oH8=;
	b=AnDfMe+i2c3+ckC8Jcwi9Jy184e5WPGyvxw7VoYuX5VmxtprXuVssOfG2mJB0LOQgC
	BDRqKpGelAeLI5KsAy5sqBx2GEiJq78xjkozmt9EcoxWeqi6p7qTcDP1DulUI/xXKs54
	IAJGRJJD2z2QiFzBFir/VKu7+iYxVGV1EGvJc=
MIME-Version: 1.0
Received: by 10.220.106.138 with SMTP id x10mr8926996vco.64.1325067769352;
	Wed, 28 Dec 2011 02:22:49 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Wed, 28 Dec 2011 02:22:49 -0800 (PST)
In-Reply-To: <1325033289.4637.23.camel@localhost.localdomain>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1325033289.4637.23.camel@localhost.localdomain>
Date: Wed, 28 Dec 2011 11:22:49 +0100
Message-ID: <CACW_hTa517Yi=BoPmrfEk6=T1+pnc2kXEg59CEFZBt9XykKrKg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: niqingliang@insigma.com.cn
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: improved DESCRIPTION, fixed HOMEPAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Dec 2011 10:30:04 -0000
Content-Type: multipart/alternative; boundary=f46d042fd88ab2121a04b52461fd

--f46d042fd88ab2121a04b52461fd
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit

2011/12/28 Ni Qingliang <niqingliang@insigma.com.cn>

> I have just done a seperate env tools bb for my project, but use the
> config file to assign the env size and address (which is generated on
> booting from /proc/mtd).
>
> in the fdt, the u-boot env has a seperate partition identified by it's
> name "u-boot environment"
>
> and have some problem:
> 1. the fw_printenv will exit with 0 even though can't read the env (CRC
> error).
>

Apparently the author of the program did not consider this as an error.
See tools/env/fw_env.c


>
> 2. the default env vars in fw_printenv(used when CRC error) are not same
> as it in the u-boot.
>

If I recall correctly this is addressed in the 2nd patch I posted.
From memory:
Issue is that fw_env.h redefines CONFIG_BOOTCOMMAND. This gives you a
different boot command.
By putting #ifdef's around it the default one is taken

Enjoy!
Frans

--f46d042fd88ab2121a04b52461fd
Content-Type: text/html; charset=GB2312
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/12/28 Ni Qingliang <span dir=3D"ltr=
">&lt;<a href=3D"mailto:niqingliang@insigma.com.cn">niqingliang@insigma.com=
.cn</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I have just done a seperate env tools bb for my project, but use the<br>
config file to assign the env size and address (which is generated on<br>
booting from /proc/mtd).<br>
<br>
in the fdt, the u-boot env has a seperate partition identified by it&#39;s<=
br>
name &quot;u-boot environment&quot;<br>
<br>
and have some problem:<br>
1. the fw_printenv will exit with 0 even though can&#39;t read the env (CRC=
<br>
error).<br></blockquote><div><br>Apparently the author of the program did n=
ot consider this as an error.<br>See tools/env/fw_env.c<br>&nbsp;</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">

<br>
2. the default env vars in fw_printenv(used when CRC error) are not same<br=
>
as it in the u-boot.<br></blockquote></div><br>If I recall correctly this i=
s addressed in the 2nd patch I posted.<br>From memory:<br>Issue is that fw_=
env.h redefines CONFIG_BOOTCOMMAND. This gives you a different boot command=
.<br>
By putting #ifdef&#39;s around it the default one is taken<br><br>Enjoy!<br=
>Frans<br><br>

--f46d042fd88ab2121a04b52461fd--
