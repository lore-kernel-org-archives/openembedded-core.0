Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id EEA227422C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 14:08:49 +0000 (UTC)
Received: by qgx61 with SMTP id 61so62737920qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 07:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e9uPBRtZsIoCFaOWqaLFwmHaofYNWuPQgfg4yQO7Jg8=;
	b=jz594vhvUXmkW8pgzpaCwSm5HEeSvgssQSSrnk0kouKAJQ15VisEAovKE68JOXOLgG
	Wi9jJebUZJBHYYfzyp7ZlF6ISHpV8tvjbM8AQQvqglHi6WDM0LI1jh2T26MoYOmrNQhM
	2oLuliOPwjZ9hyGsKKN3494E59qDN2/siW6Zv7sySpix0w/D94LFJkyFbSNQeUbDA0Rc
	HbtGo1jXfFHn89RJzYxt15uaQCwxlJIx0LZ4D8c+tJT56nVKoZQIfIzQyDSAVaQwBAim
	RPKuRhJkhDe8+rXFfPOhpDO4l7iHin/1OVRaJI8tgYY8sxxjB/iZzRWo6WWSHCcmke6s
	JjoQ==
X-Gm-Message-State: ALoCoQk0AR+K9yEorAFSHcydUFsmJi++XYG9oirZyOoF+9wGzaBw1zx7hjEBR2nVO38Cyx1bv4qW
X-Received: by 10.140.89.10 with SMTP id u10mr27004918qgd.15.1441634929672;
	Mon, 07 Sep 2015 07:08:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 7 Sep 2015 07:08:30 -0700 (PDT)
In-Reply-To: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
References: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Sep 2015 15:08:30 +0100
Message-ID: <CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Mon, 07 Sep 2015 14:08:50 -0000
Content-Type: multipart/alternative; boundary=001a11c1211ae138b0051f28c9d0

--001a11c1211ae138b0051f28c9d0
Content-Type: text/plain; charset=UTF-8

On 7 September 2015 at 03:19, <wenzong.fan@windriver.com> wrote:

> +  > Note on targets where the @ character is the start of a comment
> +  > (eg ARM) then another character is used instead. For example the
> +  > ARM port uses the % character.
>

Is the documentation badly written or does this now broke the build on x86?

Ross

--001a11c1211ae138b0051f28c9d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 September 2015 at 03:19,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenz=
ong.fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1d4" class=3D"a=
3s" style=3D"overflow:hidden">+=C2=A0 &gt; Note on targets where the @ char=
acter is the start of a comment<br>
+=C2=A0 &gt; (eg ARM) then another character is used instead. For example t=
he<br>
+=C2=A0 &gt; ARM port uses the % character.<br></div></blockquote></div><br=
>Is the documentation badly written or does this now broke the build on x86=
?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a11c1211ae138b0051f28c9d0--
