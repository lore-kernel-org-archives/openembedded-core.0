Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id CAB48731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:46:36 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id u25so1157686qki.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=keKou5GQIiZ4cU1Q5zJjh0Ui8+78O58bi7bbv5SX34M=;
	b=Rsgud3FpEtVisPXg0Kk6gEXi2/Ot4gjZ3NBRpyJJIBRsMMNVOWrKVgJxlEgvXivyhd
	BItnn83mpmvigW5Cv2nvlgsdDZFwt9Xr+fQTdtiw/ALPErGHgHAbOMdzwNIEk7yoc74W
	xQeuZ6+yiQ9eBGJpWXB3+1fJazJ/2t/knyxKBWz/MuP/NvqNPPomPE+v/fkGrzRjf46y
	y5IZgxLlhz8db0VJ0hX2/QcjtOiDOv/olP9ZRfK1wuixfWZ96MRNAP8dvg3ARNikmW8O
	GBgyCfdgsPk64lOvB6md5EnoV1zQAa/f7l+4Ue7bUDlu5pvyorS9bm/w3gkwNu9k8+Hk
	iUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=keKou5GQIiZ4cU1Q5zJjh0Ui8+78O58bi7bbv5SX34M=;
	b=nHcviG++U6t0Eo6X6Be2iowEBhH4skabXd3I/Mo26OcBtzk2LnrEG52pXhFLEctxKr
	NQLz5kN/Mz7tGeFxkg96AUC1VILtixWlROxrVjQfQhEQ6//kGN7Rfn916Ryj40XmwtU+
	Si4KpzoFmyMkSr6/iYAwEIQeGNG+vNfio/zr+an0rVuPsyVbSnJP6PqyRGOYdS3RSgP7
	7d77jYhYrI2uWxT0JZt4EjgcvMRRGG1nfZvTzdAKcOp7lRUeg34hV+hVgwRDKF2clT9P
	xjaVHE3UFbkJFRDOVdmSGfIYQ32UMQFbTH7XBIHYf/7+NjLrXuF8J5cfglOyXOuBcIiY
	iaeQ==
X-Gm-Message-State: AIkVDXLJhqSP3zDaXXqgLhnsslXULNRWwH8tT/1rm3Xq8E2d5Ctl6XSHM2v3+y48wX9LVysnOtPcRN/57IhSVVLz
X-Received: by 10.55.31.24 with SMTP id f24mr2266187qkf.221.1482147997734;
	Mon, 19 Dec 2016 03:46:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:46:17 -0800 (PST)
In-Reply-To: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
References: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:46:17 +0000
Message-ID: <CAJTo0LZvF2qQphCO+CFZ9jUHqgwoEVXrjOgaGe1kAF_+5D07jg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: build for EGL in non-X11 distros
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
X-List-Received-Date: Mon, 19 Dec 2016 11:46:37 -0000
Content-Type: multipart/alternative; boundary=001a1147e2bae8faba0544017813

--001a1147e2bae8faba0544017813
Content-Type: text/plain; charset=UTF-8

On 18 December 2016 at 17:02, Andre McCurdy <armccurdy@gmail.com> wrote:

> Add PACKAGECONFIG options for 'opengl' (ie the previous default, with
> dependencies on opengl and X11) and 'egl', which depends on EGL only
> and allows glew to be built for non-X11 distros.
>

Can it build both or is this definitely a build time choice?

Ross

--001a1147e2bae8faba0544017813
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2016 at 17:02, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":26e" class=
=3D"a3s aXjCH m15912e3c58cb7f14">Add PACKAGECONFIG options for &#39;opengl&=
#39; (ie the previous default, with<br>
dependencies on opengl and X11) and &#39;egl&#39;, which depends on EGL onl=
y<br>
and allows glew to be built for non-X11 distros.<br></div></blockquote></di=
v><br>Can it build both or is this definitely a build time choice?</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a1147e2bae8faba0544017813--
