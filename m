Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id D922A71CCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:08:53 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id b16so42399057qte.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 09:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TW2YaovtrjxSYl3uIc+MtqhkdpJtui4+bQfUV7O9Bk8=;
	b=aJ24nxlTT/27/54wAf5qMS3UG14Q9sdUJw4yjr9uPiw27B/rXh0MAHa2whJQWKUv3o
	m7kiXj2/BUrJJ0W7DDn0rELalWeAQdEPtk0GAG4GzJ18j+XWzNxBHJVvzyluoFy5JMCf
	QdHei2sxaJ1Ayz7J8jjvaUsJS+wYYZRbt9f59Xc4Bb5I6k8NuRNebRXRPTe1UfdyNgla
	cQvVcd7iAvrbTPtFgXBoGpgiczqwvY/gKtNhs7TaS4NcvaC6PJ4bDNmX5EaOQ3F+bGr2
	nFxIdr4Rz7rVjO5sYyAOVCbcZJ+yBXwYJoMaRsJnICHuOawxDofyI9R7z6SduIR9lqOd
	Y3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TW2YaovtrjxSYl3uIc+MtqhkdpJtui4+bQfUV7O9Bk8=;
	b=dg/K8CbPgWYpchJ2IsT130hmYVE27KK7PtQjswm5q2OjGc5TaBI74WL73RnguLVnt2
	6WPStSoki3SR/oL2xf5lj05wGl/tYaCN8NNHKK0Cw43EyaAMqEtqCLbd4861+oGqxsqr
	BEKPpwSONub2JoVemz0UGZoJiKwknXsM5Twb6qZmYE4BUIs54A6tvU2DmH5z2kpIuvhZ
	N/1mi7nqOMFlj0G4km6PY9BjA7c8KVqkgFBUkZJ8qgM/Ac9JVxQ/Wx/yNRLC7ukzg2f8
	47cSCqFyLgJszsO6XDLrF4uMAlau82GbdKoAu2mOjA0cU6wGXUu7iqwE5fBIBIDnYgzY
	Ttlw==
X-Gm-Message-State: AMke39nRUNOJHUIn5jhbCQrjkWTVSoBVY7c4eqtF4XlB+DAp6KNzyzky2HdeBfN2IU7epdcbT3FY4IcdfIwInbro
X-Received: by 10.237.39.158 with SMTP id a30mr1747535qtd.65.1487610533340;
	Mon, 20 Feb 2017 09:08:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 09:08:32 -0800 (PST)
In-Reply-To: <CALbNGRQNaoktrh_Jk75DxkV-qVv4B9T57oCP3js5k=JApbO+pw@mail.gmail.com>
References: <CALbNGRQNaoktrh_Jk75DxkV-qVv4B9T57oCP3js5k=JApbO+pw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 17:08:32 +0000
Message-ID: <CAJTo0LbtbBawLavjDkbxo4xWpqZZMp=ACDmwiLP=ab2DRHZ7xA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroot: handling recipes creating same files
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
X-List-Received-Date: Mon, 20 Feb 2017 17:08:56 -0000
Content-Type: multipart/alternative; boundary=f403045f26a4677eb60548f95196

--f403045f26a4677eb60548f95196
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 February 2017 at 22:04, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> This needs love: One can guess that libldb is trying to install stuff
> already there - nothing mentions samba and the error pops up for gvfs
> which does nothing really wrong. I consider this as bug introduced by
> RSS.
>

Yes: without RSS this would result in a fatal error when the second recipe
wrote to the sysroot.  Can you file a bug?

Ross

--f403045f26a4677eb60548f95196
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 February 2017 at 22:04, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":2sk" class=3D"a3s aXjCH m15a58686b440f3b6">This needs love: One c=
an guess that libldb is trying to install stuff<br>
already there - nothing mentions samba and the error pops up for gvfs<br>
which does nothing really wrong. I consider this as bug introduced by<br>
RSS.</div></blockquote></div><br>Yes: without RSS this would result in a fa=
tal error when the second recipe wrote to the sysroot.=C2=A0 Can you file a=
 bug?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--f403045f26a4677eb60548f95196--
