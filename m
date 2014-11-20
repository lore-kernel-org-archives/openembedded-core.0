Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB3865C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:41:18 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j7so2538092qaq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FDfIyJo7ZGkGf0DykidgMKIFlfCc14Xlns+/yRAnzog=;
	b=WEl7PY+PXwZp0vpMDNHHi+FznCrlq68qcGYl2XgaH4jtmlrtFNK5peo1P6zJALhyNd
	3d4DcdFrhLcNiI0TJY0E0EfYQ9/bu7LDFHknCQzZyr6IeZO9Gb076POy1obMFvb0aG57
	1YpPSmN9p5u8Rzti5YPldKWrr+qJT4SROQAHgCrf6K4vUETBXbAmqMRfuITRyIRC7Sn0
	dXGk39F40mbtjX3OZloiBoYbtvsob2OlA8xVuw9eXHqMlv+jSNI6ShfwxYY/+mIaWlbb
	n/2B4W1wfMxicYwrqTb2abSczXoujJOmYBaS/DN2orAFUOVBLLoSg8HXyrvb3+hDvD3r
	fXzQ==
X-Gm-Message-State: ALoCoQmgyP9Q/oFsyHCk+A9ja+jXoKEc9Rf+GFiWAAB6cBOavJTLGMGKvDyMlRBmvg/npTmpl8VW
X-Received: by 10.140.109.130 with SMTP id l2mr511964qgf.80.1416516079131;
	Thu, 20 Nov 2014 12:41:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 12:40:58 -0800 (PST)
In-Reply-To: <1415958217-16545-2-git-send-email-jian.liu@windriver.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
	<1415958217-16545-2-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 20:40:58 +0000
Message-ID: <CAJTo0LZtW8Yv0TXLvUxLm6QYA0vPoH7BZu75e6rmi5354Hsytw@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] base-files: files will be over written when updating using rpm
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
X-List-Received-Date: Thu, 20 Nov 2014 20:41:22 -0000
Content-Type: multipart/alternative; boundary=001a113ba01ab7334d05085059e7

--001a113ba01ab7334d05085059e7
Content-Type: text/plain; charset=UTF-8

On 14 November 2014 09:43, Jian Liu <jian.liu@windriver.com> wrote:

> If there is no %config micro before the file in the spec file,
> this file will be over-written after updating this package
> using rpm.
> This will make our settings lost.
>

Whilst this commit message is accurate for your situation, it's actually
not just rpm - the same behaviour will happen with opkg and dpkg.

Please resend the patches with a commit message along the lines of "Use
CONFFILES to mark configuration files as such".  This isn't rpm-specific
behaviour and it's misleading to state that in the commit log.

Ross

--001a113ba01ab7334d05085059e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2014 09:43, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3rj" class=3D"a3=
s" style=3D"overflow:hidden">If there is no %config micro before the file i=
n the spec file,<br>
this file will be over-written after updating this package<br>
using rpm.<br>
This will make our settings lost.</div></blockquote></div><br>Whilst this c=
ommit message is accurate for your situation, it&#39;s actually not just rp=
m - the same behaviour will happen with opkg and dpkg.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Please resend the patches =
with a commit message along the lines of &quot;Use CONFFILES to mark config=
uration files as such&quot;.=C2=A0 This isn&#39;t rpm-specific behaviour an=
d it&#39;s misleading to state that in the commit log.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ba01ab7334d05085059e7--
