Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5AA75868
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:52:36 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so101669716qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2SlJm8G7RX9U9q5gEWr1Azh902eVmCxG/5/y5ujum+g=;
	b=UUJe2tDYKuksXR6DEChPndIjZd4pg/gstzFWpwflqohxtKzjrkUZpwFijiuqGKIB5p
	XK0ptJajjPluIPDz3gw0P8PzY+ktmGnFZrFUwDjqFmttgIEqxkrCkHE2XT2w+qobtBvF
	1fJ0OfsGmMHYlYV3TftOvLU079tyw+ry8AeIyGnib0x5D/masaX8TjYzd9YhlBhtX/4w
	N9tZEC/aZE6kbbjqiTOpP4IlsNGBZd6fz1lm2twkO/0N5LMG27sIunuW4QSdxjSSbXcL
	mKcNfr1NqyVaOaFRZdH/H5R487EZVdod8TEU6VwhTjgJX7FnaeGRn9/I8ZqqViWkkACK
	iiRA==
X-Gm-Message-State: ALoCoQmSRKrIBcf1a3uK6QtHCuN1q7Q0eHi3pwQSxq0eZts/lMohvpMs2msu8VYCKPw/VpVvhDvZ
X-Received: by 10.140.150.142 with SMTP id 136mr4976141qhw.17.1437580357172;
	Wed, 22 Jul 2015 08:52:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 22 Jul 2015 08:52:17 -0700 (PDT)
In-Reply-To: <1437566326-9093-1-git-send-email-george.l.musat@intel.com>
References: <1437566326-9093-1-git-send-email-george.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jul 2015 16:52:17 +0100
Message-ID: <CAJTo0LbqxPy=ntYAyG6YS8OurHh2bOZuOwMqBy3_iULP_cgaBg@mail.gmail.com>
To: Lucian Musat <george.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ptest-runner: Added timeout per tests.
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
X-List-Received-Date: Wed, 22 Jul 2015 15:52:37 -0000
Content-Type: multipart/alternative; boundary=001a11357d4a8692c8051b78c2b7

--001a11357d4a8692c8051b78c2b7
Content-Type: text/plain; charset=UTF-8

On 22 July 2015 at 12:58, Lucian Musat <george.l.musat@intel.com> wrote:

> +        timeout 10m ./run-ptest || ANYFAILED=yes
>

I'm pretty sure the glib test suite takes *way* longer than 10 minutes to
run...

Ross

--001a11357d4a8692c8051b78c2b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 July 2015 at 12:58, Lucian Musat <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1pw" clas=
s=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout 10=
m ./run-ptest || ANYFAILED=3Dyes<br></div></blockquote></div><br>I&#39;m pr=
etty sure the glib test suite takes *way* longer than 10 minutes to run...<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11357d4a8692c8051b78c2b7--
