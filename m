Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id BAA8A60616
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:07:02 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id f30so151555130ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eOTu8lz+2LvVyP56PjVQwx36gkcWMawBUcmzot29Oe4=;
	b=ybLZHAfnnBLeOYyEQNezzlz5V1ddFURjE31/lDOj0Pby4ZRx3lIRrAasJvGjqkEFwe
	b4SGcaPyD+7jQItj4PWRr3F9cxB9MkCjmYsc16FfPjDnmV5NLSF+Cbjt5+IOykOO5E9F
	uFaU2BW462BKWXOuS0cWoAazTXjkxFuueYciyEELA8S46L5shqm83O8FptfCvf+hXYw8
	5mrAGNNFXnlODUn6qqsFb666GaKRL2F5Er4Cy8IfNlm9iPMGlEG8V5w5b0LGBnMluY1M
	ZzprEPoOM5LPUgDnVJudHFI6OMPkKvxIsrrTUfygvcnxBnYbhq1PeWvSSvtPPPEgs9JR
	5qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eOTu8lz+2LvVyP56PjVQwx36gkcWMawBUcmzot29Oe4=;
	b=O6lHwI6VsC2mOUuwnJ48hKQF19Qh7UE0hmNdWjT93kJuVux22noH8xIlBYLPLA9lI3
	NL9wb+XvI+FUvGR8rzCSsEUipEcE95HRd0UPn2A4GFbJEV1cKx7UBieKOcuBxuderDkd
	K5pFnPivJONcbK4PktHsKt8I1hhf0LDzRdMDqPfdSUz3nPVtrH1JybslBr1xzobHaru9
	zO8vh6wu9tEZB5HG4kNTefTGXiBli7n881y8C+gqUh29iLdkg616fPYI8go8G9a8XrQY
	J+xq6bGHfuCxPlWPjPa/936EYwv3l8zzLs7Zc/O2uCAudtwRXdol0qPMlYMeQrRAtmkb
	kEEQ==
X-Gm-Message-State: ALyK8tI4sAsT12JpGWHRvLfSjcf/rZ0+hZ3nmOEUUMITKEUdjLYT/8WLIFPA0XGv9u+koEyJmijd6AwJaxXkrkkP
X-Received: by 10.107.135.137 with SMTP id r9mr9965770ioi.133.1467637623671;
	Mon, 04 Jul 2016 06:07:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 4 Jul 2016 06:06:44 -0700 (PDT)
In-Reply-To: <1467637324-16642-2-git-send-email-maxin.john@intel.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
	<1467637324-16642-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jul 2016 14:06:44 +0100
Message-ID: <CAJTo0LZUvOTA9X=SE=GrK4PkFvO-F4S556zEUjdSK2yBhZkShA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libsolv: upgrade to 0.6.22
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
X-List-Received-Date: Mon, 04 Jul 2016 13:07:04 -0000
Content-Type: multipart/alternative; boundary=001a113ec84237e2410536cf0315

--001a113ec84237e2410536cf0315
Content-Type: text/plain; charset=UTF-8

On 4 July 2016 at 14:02, Maxin B. John <maxin.john@intel.com> wrote:

> --- a/meta/recipes-extended/libsolv/libsolv_git.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_git.bb
>

As we're tracking versions, can you change the filename to libsolv_0.6.22.bb
so you don't need to specify PV explicitly

Ross

--001a113ec84237e2410536cf0315
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2016 at 14:02, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fp9" class=3D"a3s=
 aXjCH m155b603489f63151">--- a/meta/recipes-extended/libsolv/<a href=3D"ht=
tp://libsolv_git.bb" rel=3D"noreferrer" target=3D"_blank">libsolv_git.bb</a=
><br>
+++ b/meta/recipes-extended/libsolv/<a href=3D"http://libsolv_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libsolv_git.bb</a><br></div></blockquote>=
</div><br>As we&#39;re tracking versions, can you change the filename to <a=
 href=3D"http://libsolv_0.6.22.bb">libsolv_0.6.22.bb</a> so you don&#39;t n=
eed to specify PV explicitly</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a113ec84237e2410536cf0315--
