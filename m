Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB206C0B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:01:33 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id s16so3121715vsc.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/0FPLdT73b8enTefljDXrAzxeDb0gEdHF2F6+4NPc7s=;
	b=SY4H83jOeN5YwY17g/LUDN/Clctjb6zTP/5/UaHhSBaBAkAagFUvTBGvXuJhEtJS9U
	ADx4r40AH+dnj1ioznV+odxw0iXDLkQIJ5Ci5EepW2xgh5xlxvzXUa9xNt2/UH831BHl
	Z/zTVogeb827woYmQWhUiMHyqPcEWsF1/qmVJbZOKrDvYBheAUyX9IKN5r8S3wPuzF80
	U0j5SP88Olyd0G1Jow68ZzFQb4ZsVeOR7nt10QXbJfzC1WhZ8OojVBvipsJi8b4AwlpJ
	XvfbDKsG1IuNW7IBKry8agsLycjTEsv9JXWTGVVp+e7l+YBo3Qn2n8V3w/fEhvtp/tiF
	m2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/0FPLdT73b8enTefljDXrAzxeDb0gEdHF2F6+4NPc7s=;
	b=LDENR/lWhOtE/eB65tUqCVbZpmi8wSaXSZIVLSpg2tHCDfmNrlPd48vFU/yV1VQ8k8
	jpTQLHz6ZTUDhwwRKmfFIe0Y/wgA4zMHrTil1iwhBlH8hulwsTVWcjRZ5lBfbJ7iU458
	scunDk+2636fTtcozQOx7yKvYS9vFIGpKBjvY7eDrzqrQhxWg0brFnp1oa1vOWYDaj46
	5XAEmNPN4EjpOzL+GmYI1GMpBl6c34VNIWuXTVd8zINFwnIUeD2fVTpuYNDjDnAMCWwl
	CW06QDUHIAua4SSA5OonxMS0hqIOzrqNaOwIDCB3g9/Gdb1XbHNJ8ly/EjFDQa8UVYU+
	9jgQ==
X-Gm-Message-State: APjAAAXRkjttoHTZ4X3BgpxZBNBoSbYQmyLX4Vm7Rl04+PSl3oUn90g7
	0k36WuLzFT4kTkVt/X7FJvdG/cKIuIox3ui9cPE=
X-Google-Smtp-Source: APXvYqwKsI5tcmt+6viDPqd96MuJCFzGuc8SbyO693wswxd71ODNEs5bbkRMsKclPpj3EdUeilCibuQPaIoKSeabEKw=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr6340545vsq.94.1576789294247; 
	Thu, 19 Dec 2019 13:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-12-alex.kanavin@gmail.com>
	<8c5d060d-c77e-d6ef-cd41-672724245cb6@intel.com>
	<1d5a83ad-7b87-9c13-0c10-c05fb52ea539@intel.com>
In-Reply-To: <1d5a83ad-7b87-9c13-0c10-c05fb52ea539@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2019 22:01:23 +0100
Message-ID: <CANNYZj8PXt_yqtusUTxO-gVs=tzBHa2bj2H-H40_ur-kkGB1dQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/25] acl/attr: update to latest upstream releases
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
X-List-Received-Date: Thu, 19 Dec 2019 21:01:33 -0000
Content-Type: multipart/alternative; boundary="000000000000c4f416059a14ddf2"

--000000000000c4f416059a14ddf2
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2019 at 21:56, Ross Burton <ross.burton@intel.com> wrote:

> > I don't think this was intentional?
>
> A more idiomatic way of handling this, although it would break
> dependencies, would be to inherit bin_package.
>

Yeah, the packaging was hidden under all the build hacks so I didn't spot
it. Let's do the inherit, library dependencies should be automatically
updated via shlibs.

Alex

--000000000000c4f416059a14ddf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 19 Dec 2019 at 21:56, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; I don&#39;t think this was intentional?<br>
<br>
A more idiomatic way of handling this, although it would break <br>
dependencies, would be to inherit bin_package.<br></blockquote><div><br></d=
iv><div>Yeah, the packaging was hidden under all the build hacks so I didn&=
#39;t spot it. Let&#39;s do the inherit, library dependencies should be aut=
omatically updated via shlibs.</div><div><br></div><div>Alex<br></div></div=
></div>

--000000000000c4f416059a14ddf2--
