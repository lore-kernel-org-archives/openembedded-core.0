Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvVSt-0006Jn-QP
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:03:56 +0100
Received: by mail-lb0-f180.google.com with SMTP id gj3so1153454lbb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 07:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=823YW0TP1nVJcunnjsqveVdfOrO/XxUgtugH6QFc1kU=;
	b=f4wRDsIaz0ZU5/D5/9eCy45pvUErDxSbh1CPDjh+Lsvti//6caPhVU8cRsDTl4kYNb
	V8Nyir6sQJLu2bpDHQwBGPrB35QNe0v5io8vy44AmsKZ7q+XoN9t08HQOFRVrz/gKvkD
	5BVEnJCVBNiKF+u3N7+vbDxXkO9Fmy9eJ9EpjgSGK+j+FUAj8d0V4eXCo1JVv3dHIx+Y
	+lorKqzRfscIo465BiEhE09M1jA5zQ0E2FA7xMBEiYkZCJwEM8eFG7lFWY5MgoZTq2U8
	bUvRQ588C87pd65m4u5pi1NpqDsStINKDoCTTQkTEOq13Xawkq7Qvigky8k+FTto3Ftf
	5qPg==
X-Received: by 10.152.144.103 with SMTP id sl7mr1594636lab.23.1358351305997;
	Wed, 16 Jan 2013 07:48:25 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 16 Jan 2013 07:48:05 -0800 (PST)
In-Reply-To: <d0ac33caf983e8a3eeb8c596587e9ae29c4edc88.1358350661.git.paul.eggleton@linux.intel.com>
References: <cover.1358350661.git.paul.eggleton@linux.intel.com>
	<d0ac33caf983e8a3eeb8c596587e9ae29c4edc88.1358350661.git.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Jan 2013 08:48:05 -0700
X-Google-Sender-Auth: 0sJtrC4M-NC2Tu8LhKjHSyZUrDY
Message-ID: <CABcZANn7NKY2zQa2trx4DfGQuJCN9KokxK+Vnh80o=5ve2gkqg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] classes/image: improve debug-tweaks ssh server configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:03:58 -0000
Content-Type: multipart/alternative; boundary=e89a8f22bec112fd8b04d369cf96

--e89a8f22bec112fd8b04d369cf96
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 16, 2013 at 8:38 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> +
> +       if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
> +               echo 'DROPBEAR_EXTRA_ARGS="-B"' >
> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
> +       fi
>  }
>

Slightly concerned with this, in the potential case where a layer provides
its own /etc/default/dropbear, this will blow it away entirely.
-- 
Christopher Larson

--e89a8f22bec112fd8b04d369cf96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 16, 2013 at 8:38 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":29l">+<br>
+ =C2=A0 =C2=A0 =C2=A0 if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then<=
br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;DROPBEAR_EXTRA=
_ARGS=3D&quot;-B&quot;&#39; &gt; ${IMAGE_ROOTFS}${sysconfdir}/default/dropb=
ear<br>
+ =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}</div></blockquote></div><br>Slightly concerned with this, in the po=
tential case where a layer provides its own /etc/default/dropbear, this wil=
l blow it away entirely.<br>-- <br>Christopher Larson</div></div>

--e89a8f22bec112fd8b04d369cf96--
