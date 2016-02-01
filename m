Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 356647715E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:22:29 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id f81so172148975iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RhfPNLj2C3pJGk4oiWItnvPS2u6kH0uO0hrwvtv4nMY=;
	b=Zr8cYJg4jnLb8tLs8ApGe5PWd6O89C7gkvnxCYhMtMvDP0U3NqTieMtm1+qzvw3+0z
	kQ7roO1XifR4GAFA8QvfCcLePCsRKoN3xrqI6W/M+R60UmepZFA7hFpLDhZa3ucgKnRo
	+NUUD9hp4fgopoGb+kSQZRrfSWOD6ZVyO12T0RbXyfRK6IRiQshenztkQQ1C6OJ/y5Pc
	5YCiZzGNhtbJ2dzER+YQ82U1S2IAzgTu1jTmj3+iBDN3Nh17alqLKszN+I38tylEHJvM
	NziVDKZdLzMAc606pateAFlXImOH8vPl5lM/ae65/w0OQIm76yi+U2206VBvsFUsM8Zu
	Ho2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RhfPNLj2C3pJGk4oiWItnvPS2u6kH0uO0hrwvtv4nMY=;
	b=ehg0XsMAL+ywcAFxnsmeBdO0Yv49L7g+Uoom1eJF0hlBhxMjMXWHFzORjNpa+XjI2H
	7rIP/Fl/JdFUGVq1ASwJQ69H+USMrDkaAKZyX/OAgzICmTE89oL0VLKRc4EeM++y06Ck
	89ZiDrm3sfGaQ5GOp13QCKpRAafdrg19YblpHQO/HmMATyl38k0AdYGSrDuywLqlVdEZ
	2kONLMN0yJ2S5N6NW+J3clQ/4bH+ippemWsbGTF0owchSblbisrExT0qNIlJdSlB++OR
	v7dGBP+kctonXHiFiKWXiP9g2wBocjBTRjYaJ3aaGSAdv4WMv/9j4yFrJnJrpcxwYJ5b
	w/Bw==
X-Gm-Message-State: AG10YOQHk37Sb5YZ05rIRV+aNaxeyPCSWf3reedWxEaLu1D9u0DtqVhaUipYHEMyi24yYQLCp1L1LnvQQhpv61tA
X-Received: by 10.107.10.157 with SMTP id 29mr11131736iok.133.1454361750491;
	Mon, 01 Feb 2016 13:22:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 13:22:11 -0800 (PST)
In-Reply-To: <CAJ86T=XrU3Rz0OMk7EukArS07PBCifE89U2vhmqKcBDAytZ3xQ@mail.gmail.com>
References: <20160201143944.GA2639@jama>
	<CAJ86T=XrU3Rz0OMk7EukArS07PBCifE89U2vhmqKcBDAytZ3xQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 21:22:11 +0000
Message-ID: <CAJTo0LYG2=+s=+a4ptGFcM4d-XuS5pRCkHLodGK-CY23CbROfw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2016-01-30
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
X-List-Received-Date: Mon, 01 Feb 2016 21:22:32 -0000
Content-Type: multipart/alternative; boundary=001a113f8df88361a5052abbfb34

--001a113f8df88361a5052abbfb34
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 20:47, Andre McCurdy <armccurdy@gmail.com> wrote:

> There seems to be something odd going on with these file-rdeps warning
> messages. e.g.
>
>   chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package
> chkconfig ...
>
> Should be:
>
>   chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig ...
>

Yes, insane.bbclass needs to sanitise the string for display.  If the
filename contains an underscore you get that appearing as @underscore@ too!
:)

(patches welcome)

Ross

--001a113f8df88361a5052abbfb34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 20:47, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ry" class=3D"a=
3s" style=3D"overflow:hidden">There seems to be something odd going on with=
 these file-rdeps warning<br>
messages. e.g.<br>
<span class=3D""><br>
=C2=A0 chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package<br=
>
</span>chkconfig ...<br>
<br>
Should be:<br>
<br>
=C2=A0 chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig ..=
.<br></div></blockquote></div><br>Yes, insane.bbclass needs to sanitise the=
 string for display.=C2=A0 If the filename contains an underscore you get t=
hat appearing as @underscore@ too! :)</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">(patches welcome)</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f8df88361a5052abbfb34--
