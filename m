Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 65FC7602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:21:15 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q192so10593203iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bbYs7fbnJbyHVOivv/tKSk8guXe2n9fhHMZWvK61ur0=;
	b=RZ0dJ+rsNXz4QCWDKaFLlPFXl9PQ3kfauMoDEUClphQbcOFvyyPSPNl3cOUF76ArmD
	EO3lakYPvzcUj422/otyCYcfSEY53pfDMjd5DRoOMSS26D2+8fqiZFmwdSgLgJcn3vE3
	6VmC0/XPZwW8SZX3voj3dP/+kVWpb4Fdo4z3nrWsdUPjD+EEciEtuwbZTZfS5Qt+/ccJ
	VB+6oA1oYQj9p7V2OwKxXh/CVU0KWJxjZhU8sr0q3s3wWBfu3kdo9//yOXsLw0p5hgqk
	yf3EX7GWz8pVw/fmoNWxYIvRtknGirxoCYrvb6qvcnGtGLojJUnxwm17OA2drnqoVg/0
	auBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bbYs7fbnJbyHVOivv/tKSk8guXe2n9fhHMZWvK61ur0=;
	b=TIOckLhQ/QjPQmUbtSXEBrjCtqeOLzdYmQfvyf1Ky5IXOtyom372R5LkgXnqrQShuk
	dU/SoF4mA744NyeJsSSTfD2g2JXzP0ZOBXCUPgQGNOuU+Fnpy0Wym0zoMEPkNJjfILZ8
	7wdjlUbRqZ/2O1PjWZS7smXUi2W1EIwX3PnJ/8XBbaUM52rST4W7Q1vJRO6r25Crg9v0
	KHjjeqSvnWYCp48C+rGOEI5f3yiIWRXDeDeOW9h+Qz0qPHN8Hx/6aHKcbXM+57furFAw
	iYlYpL/4fuPMIMS2EEUP0ZwISKdPhWIax1qYf69XdoZ2BmmjYecL9lnGI4+slibYNH/o
	6fPg==
X-Gm-Message-State: AA6/9RkqLsnDS5BLvzhAY0xNYZ4KzuiaCjp81Z+1UooUksE2g4/t3di1rlPCbyUXiU3sCgBAjbdcNwtcaJ0r9jXI
X-Received: by 10.107.5.72 with SMTP id 69mr1201952iof.132.1475749277187; Thu,
	06 Oct 2016 03:21:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 6 Oct 2016 03:20:56 -0700 (PDT)
In-Reply-To: <1475746035.30475.515.camel@linuxfoundation.org>
References: <20161006085422.GA2921@jama>
	<1475746035.30475.515.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Oct 2016 11:20:56 +0100
Message-ID: <CAJTo0LZeeCneaGNBOx17Hk6WL=LaaQrFwO43boxv6Zs+9r9PhA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and linux-libc-headers are again going backwards
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
X-List-Received-Date: Thu, 06 Oct 2016 10:21:16 -0000
Content-Type: multipart/alternative; boundary=001a113efe2c72036f053e2fa71f

--001a113efe2c72036f053e2fa71f
Content-Type: text/plain; charset=UTF-8

On 6 October 2016 at 10:27, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I wish we knew for certain whether ~ works properly everywhere. A good
> case for some unittests I guess...
>

I own the bug for that and there's actually a start at this in
poky-contrib.  The problem is that it's practically impossible to ask RPM
to do a version check from a shell, and opkg at the time had three
different comparison algorithms depending on what you were doing.

I'll have another look for 2.3.

Ross

--001a113efe2c72036f053e2fa71f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 October 2016 at 10:27, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdi=
e@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":1zk" class=3D"a3s aXjCH m1579951c28425989">I wish we knew fo=
r certain whether ~ works properly everywhere. A good<br>
case for some unittests I guess...<br></div></blockquote></div><br>I own th=
e bug for that and there&#39;s actually a start at this in poky-contrib.=C2=
=A0 The problem is that it&#39;s practically impossible to ask RPM to do a =
version check from a shell, and opkg at the time had three different compar=
ison algorithms depending on what you were doing.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">I&#39;ll have another look for =
2.3.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113efe2c72036f053e2fa71f--
