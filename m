Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id EA3D671AFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 12:06:52 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id 1so244952224qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 05:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gJX8sH8xSYsHn7YXUUoTxdDSZzpXMGC9TwyPODbDMPM=;
	b=Na2x7Qk94oFz4ZhtLavxbi//2+batHXPEThjmT/ML5TuYs80daRIGPsL2aLbi6QbDD
	aNbZwXD2pU7+Xkys1CJ0eFfa47AMB8xLUqAMhvdWwmdxhK6Oyi+gI6E0lSrb/bc9M/j4
	OLRhRn7iNIA2ICLEAuqie6gchPEUbDiWXrCFRMN4R7pGsk9AMweUiXwWKWG6z1Si96dd
	arjFQzidWS5izs8OWlUaHHCqRGPyxrAgIZ2xniMfQrOlOZ361c4OrP81JB8W5HvcRerx
	A8qNj+Qosq0aVCCZAgep8JF8uFwFRpmHWSC6tcGPNJJ0Ahbs6dKuB73EClC6c8es7eBA
	ilWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gJX8sH8xSYsHn7YXUUoTxdDSZzpXMGC9TwyPODbDMPM=;
	b=H8dtU0x6qAcVMgoZsWaVx56O9LERC6gpw8pqtFyT/F4DuCreJ7WrHgVPoloyZhRn3G
	XflmZqTxTKi/JmF80v04N3lDVcDyCJruwftk60FJS8mcSr+wV9FXAp+Vb2zQJZk7mV5C
	2YygsOGaVQHyFgGAXnvpRL6hScXNNzhQPTSF4fX0VsW/Rl6Ra+OQ0ebX9+Hgrik4dASJ
	8/H2VKLfCKrzoTGnm8tU9sa1l9GjkQHQuA1C0SxaMwXYUX1XxuHeH9tQHGuUOfbLIoWF
	Ar4U4a0J5Sb6ZwtW8ia2twKvDG9KuRu6/phjHm1eYwSFg4BEMBpR7/dX1d7FX9HWP3Fx
	K1ZA==
X-Gm-Message-State: AMke39kzBlk2yi+QKuTB7hBH/plLK4569nkYCbTdyB+vn9WKDP6icPRTw2z1dZRWqQ3QdlJt5+kiwRigUpa6qQIE
X-Received: by 10.55.1.134 with SMTP id u6mr40299975qkg.36.1489493213709; Tue,
	14 Mar 2017 05:06:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 14 Mar 2017 05:06:33 -0700 (PDT)
In-Reply-To: <d4e6c7a11c3936ca2b30246c88452b441022c297.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
	<d4e6c7a11c3936ca2b30246c88452b441022c297.1489481108.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Mar 2017 12:06:33 +0000
Message-ID: <CAJTo0LYUhAOgDrOuB6FNwp2dPyxFFZCHHd5KjxvyUKz-+hdKmg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] guile: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Tue, 14 Mar 2017 12:06:53 -0000
Content-Type: multipart/alternative; boundary=001a114046c4e656e2054aafa9ef

--001a114046c4e656e2054aafa9ef
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 08:45, Robert Yang <liezhi.yang@windriver.com> wrote:

> +# Fix "Argument list too long" error when len(TMPDIR) = 410
> +acpaths = "-I ./m4"
>

If we're fixing this in various recipes, why not fix in autotools.bbclass
directly?

Ross

--001a114046c4e656e2054aafa9ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 08:45, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":se" cla=
ss=3D"a3s aXjCH m15acbffc915c16c7">+# Fix &quot;Argument list too long&quot=
; error when len(TMPDIR) =3D 410<br>
+acpaths =3D &quot;-I ./m4&quot;<br></div></blockquote></div><br>If we&#39;=
re fixing this in various recipes, why not fix in autotools.bbclass directl=
y?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a114046c4e656e2054aafa9ef--
