Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id E531C606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 11:41:50 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id r30so25281283qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aa9ur4gIG6G/zHpp7IFHBSIat8mXtHXKBfCYNAzG7mQ=;
	b=Npp86aCKBqmRDJvEbYJUTHcnRgXUllqC/kzJwTLSIh9sMr/A8J4zQYbPaXHaWbmHYB
	zZMx3zyekDBSSztQF+/A/RusEAVPm1coTmzl8UU0cOqLgFpuEIjm12az431M8l7SqlLz
	5NcxDwieFLcdPy6Xrs28AmDcDxEVXYIzJ6rYOjkfn8ryNhAEzvKWcGej3Rnh3HmtIR2d
	gO1Y5xDVLMzipNeBn5zwnUpsuS1VuMS8hlW+55nyctMUOuZYY4cwZaXYCjnX2RHbSErU
	+IJ9RZb8A7lK0pQ7UMu44qNaveUuOMAMfiGnyQo9p3AkY+/xeAc3VDMCZUPWdVX1G/gq
	kUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aa9ur4gIG6G/zHpp7IFHBSIat8mXtHXKBfCYNAzG7mQ=;
	b=CnpXsnZu84oC38SQCYjA2cHCMue5tB4HDRHlTnj8nj/cCsrIc0+nn1xcd6zqaessz+
	rjPo/3de960j34SacxVFs2A1366I8cA0E6HJ1qVx6RsZDR4iVz+UWG73MeLEUXoef/K3
	GN+C1Asb1lerEdv66HoAwFPuuqLxDsq99IQQpXka3f/KIHgRtZVaWrbZmtjlAUAyYmgn
	Ow2dKtkQWX7/GIsvSh7RTXKnHe9+lYhZm4OuHpaTzM7GDucbFbBX1r/3WIZVwXebRZIY
	ihw4q4SM8PP4/60r8TuYDCQ8y17VzeVXw0/4DL4ZuavmJVjvKJ+bSjVH5QX2uj6+8lOg
	gj+w==
X-Gm-Message-State: AKS2vOyUUL78FOr4FSHCdcS8alUny8XXhySQ88PENOR9+ZCvWUjRs1j5
	vU4e6MXc4VYhwVNNI7gpghIJHN6HZ/a+
X-Received: by 10.237.48.45 with SMTP id 42mr22646908qte.139.1498477311486;
	Mon, 26 Jun 2017 04:41:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 04:41:31 -0700 (PDT)
In-Reply-To: <1498161858-21494-2-git-send-email-juro.bystricky@intel.com>
References: <1498161858-21494-1-git-send-email-juro.bystricky@intel.com>
	<1498161858-21494-2-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 12:41:31 +0100
Message-ID: <CAJTo0Lb7-5XapSWNeXKbm5H=t46Rz-ZgT0y40bNnxmnjMqjSxA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildhistory.bbclass: buildhistory_list_files: remove folder size
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
X-List-Received-Date: Mon, 26 Jun 2017 11:41:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c96eadb01960552db6f6d"

--94eb2c0c96eadb01960552db6f6d
Content-Type: text/plain; charset="UTF-8"

On 22 June 2017 at 21:04, Juro Bystricky <juro.bystricky@intel.com> wrote:

> Considering that the listed folder size is meaningless anyway (it has no
> relation to
> the size of the package/image), this patch addresses the problem by
> removing
> the directory entry sizes entirely from the generated text files.
>

The alternative would be to show the size of the children of the
directory.  For example we manually calculate the size of a package (for
the PKGSIZE field in pkgdata) by adding up the size of files instead of
using du for the same reason.

Ross

--94eb2c0c96eadb01960552db6f6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 June 2017 at 21:04, Juro Bystricky <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1h1" cl=
ass=3D"a3s aXjCH m15cd168dff71cae9">Considering that the listed folder size=
 is meaningless anyway (it has no relation to<br>
the size of the package/image), this patch addresses the problem by removin=
g<br>
the directory entry sizes entirely from the generated text files.</div></bl=
ockquote></div><br>The alternative would be to show the size of the childre=
n of the directory.=C2=A0 For example we manually calculate the size of a p=
ackage (for the PKGSIZE field in pkgdata) by adding up the size of files in=
stead of using du for the same reason.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c96eadb01960552db6f6d--
