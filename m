Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 116076FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 08:46:53 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 38so70232632iol.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EDOxP3+IIetPGudXR5SDAMVhbAgWaBt/51uaxd+MqkY=;
	b=OfeRo8Zsj30qVgRWnHkkpWjd7jQrnfI4xHFtWeeCH5YrHfLZIvG/NBHucyiQ2bZB/u
	JAlXAwTvhQMys3+Gi0qRgQd0SWNkUE62vH5q9jkotwOHAj1BoEXE5vyvoZL+jXSaUJqG
	xeq4AX8nXyoV4L5oBY2G2VrYKBmxgbre2wr7FUWPLKwrbpIsCYgv7NzYAPtk2Nndk2yW
	58UgtbwaSAQlTyilR8Mm18T6eao6FUNzNzysb9kipqa55iH76XNnhcnJWMng4WLuz+Eh
	YwH7qkeS3eTxMrm2I6X7h9ssvVSkgexxRf/wAdrenfaBxugHiVbw0MKHZ/Fh213+4SCT
	JU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EDOxP3+IIetPGudXR5SDAMVhbAgWaBt/51uaxd+MqkY=;
	b=A1r8v5ZNdTRwLJUrMCYhGD0qx5gIfgO9zn+wmnH1zzMbSlC3k29cfiQ+G95JysqLbe
	+9t9zWWU+fqIr2zL4JfwhWAyev4Nox9migNu2WX9Mv5l1zIjMnNmrS7fMPTyBJ0IHkfz
	jwRqcl5VYOfZnnrgnDAEv89x0iu7QYIuXFCB10hSLsg95EcpThhJcWA5y3NJ4ddlpaQM
	FnRQa7KJZ7u7duKGIzaizEaRI3mSqby/dsjIt7fWWUNvGkikFgkThJUpygLK+4qaklt4
	XmrNQmhBHgTsdUlmk4k45H9WVGqj4/P6A+qv6qRq0c47jdBRCT7wGWcwYhdcT86T4mKU
	X51Q==
X-Gm-Message-State: ALyK8tK6xJ+QSFx16S0t4Gl6elih62V7EYqXTYGrAMorpYv6yc4iWaUb8GMKuw/Og81i/iJ+w2SFfKfXGEBwTa3e
X-Received: by 10.107.154.196 with SMTP id c187mr19242724ioe.99.1469090814230; 
	Thu, 21 Jul 2016 01:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 21 Jul 2016 01:46:34 -0700 (PDT)
In-Reply-To: <579029B1.8030102@windriver.com>
References: <cover.1468994042.git.liezhi.yang@windriver.com>
	<6dc817964ba46c0263b3b07cccf84a9917b72121.1468994042.git.liezhi.yang@windriver.com>
	<CAJTo0La07P1tsmf_trC0Gj+WQHVYwM=QiASRjBS8fFaBUjSaAA@mail.gmail.com>
	<579029B1.8030102@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jul 2016 09:46:34 +0100
Message-ID: <CAJTo0LZV214ESWaX+c6aRHofKGjKgkw1nK9-JF_xivKDP+Hj6Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: fix installed-vs-shipped
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
X-List-Received-Date: Thu, 21 Jul 2016 08:46:55 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e203e910538215c38

--001a1140e81e203e910538215c38
Content-Type: text/plain; charset=UTF-8

On 21 July 2016 at 02:47, Robert Yang <liezhi.yang@windriver.com> wrote:

> Thanks, I was misleaded by eudev, whose udevlibexecdir is ${rootlibexecdir}
> which is ${libdir}/udev, so it is /lib64/udev. It supports /lib/udev and
> /lib64/udev as the code in eudev-3.2/src/udev/udev-rules.c shows:
>

Well thanks to eudev for introducing incompatible changes for no reason.

In that case we should fix the FILES definition in bitbake.conf which
packages the udev rules into PN.

Ross

--001a1140e81e203e910538215c38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 July 2016 at 02:47, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4se" cla=
ss=3D"a3s aXjCH m1560b23584e8f820">Thanks, I was misleaded by eudev, whose =
udevlibexecdir is ${rootlibexecdir}<br>
which is ${libdir}/udev, so it is /lib64/udev. It supports /lib/udev and<br=
>
/lib64/udev as the code in eudev-3.2/src/udev/udev-rules.c shows:<br></div>=
</blockquote></div><br>Well thanks to eudev for introducing incompatible ch=
anges for no reason.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">In that case we should fix the FILES definition in bitbake=
.conf which packages the udev rules into PN.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81e203e910538215c38--
