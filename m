Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 637B160119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 10:18:50 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so16094379ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MJ41Fq+SKZybQyt9S3v7A8nexPtQrtgp6sRqvKde8CM=;
	b=jAZG57rs8+dzGB1H747P45LfWpV4ZG8CSLCpdKk8daYmY1vJpi3vQXNzqULlt6JF6b
	fv6wclKp6ec8qtvAN4B/SI1MWX2QFPnFgd6QHSIqBIg5GNu32NM0+fKYUxz8Y7r9eII6
	f5jtwStSjJNPMj07rttTJIpto7Lut2a4uLes2ue+3C4xYu2AhH4DcbOiUS7lawuiY9l/
	n+x/eRH06ck1M4S0rQNTkHKUmoGeG2zqPvX2kEeJEuUiHULynqHkxf4QFS+/IJY2Qy1z
	aVE+jCRlcnOcN8KuMLUXX5RSLUgpk80lHGzLxziSj3/Is+tXvSiB8V4r3Mbac2N4LLQD
	05ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MJ41Fq+SKZybQyt9S3v7A8nexPtQrtgp6sRqvKde8CM=;
	b=GCfHCYRv7JBhOJnRCRYbisTBMJoTOcOf2j+0xDj0OTOGSTLG9yagJ2TSJCFUtV2i9M
	HAbyCAmdXuV1+/pO2tNvvceMT82kQVQG+iDeYw6S2eedUInc0CYzA2sWVJtW6ulJrkZa
	wFTGQYkIaY5wz2A4nh9/ei/19Y4c7ZNlzmT7J/iXtkb2dODZw2P5lbX/bz0mcd7a1NMp
	pOvba2jJJdJ5TKNoURy+pOayCbs5Zk43EPTs1vi8ZvvBfmpwvCC8kd0VXbnkzHniu41S
	M+sUlcdSdtnc36BLtxdp5DpR3gPi/inhwKBmB3JCpb24Izjcq7qrwdaqxQnzQ24v7v0Z
	T+8g==
X-Gm-Message-State: ALyK8tLdHu398EFc6LIcLskAesVeHdT00tKAxpbLAoClcaktzfBriD+FExlpa7JIAODXw6TrwGHGTKOwdkBuVuUm
X-Received: by 10.36.20.212 with SMTP id 203mr7970876itg.83.1467627531474;
	Mon, 04 Jul 2016 03:18:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 4 Jul 2016 03:18:32 -0700 (PDT)
In-Reply-To: <1467611193-31658-2-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
	<1467611193-31658-2-git-send-email-carol.zhu@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jul 2016 11:18:32 +0100
Message-ID: <CAJTo0LZa0nqhg5ZTcP+4kz_yMAY2h-u3YoLgoeby814UXNmxEA@mail.gmail.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 1/6] gstreamer1.0-plugins-bad: Enable gldeinterlace on OpenGL ES
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
X-List-Received-Date: Mon, 04 Jul 2016 10:18:52 -0000
Content-Type: multipart/alternative; boundary=001a1143e198ad52f20536cca9ca

--001a1143e198ad52f20536cca9ca
Content-Type: text/plain; charset=UTF-8

On 4 July 2016 at 06:46, Yuqing Zhu <carol.zhu@nxp.com> wrote:

> +Upstream-Status: Pending
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=764873
>

U-S says Pending, bug says fixed.

Is this a backport of a change that actually landed upstream?  I don't
really agree with OE-Core carrying new API and features in a core component
like GStreamer that are not backported.

Ross

--001a1143e198ad52f20536cca9ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2016 at 06:46, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":fnd" class=3D"a3s aXjCH m1=
55b48282ccb8ecd">+Upstream-Status: Pending<br>
+<br>
+<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D764873" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D764=
873</a></div></blockquote></div><br>U-S says Pending, bug says fixed.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Is this a b=
ackport of a change that actually landed upstream?=C2=A0 I don&#39;t really=
 agree with OE-Core carrying new API and features in a core component like =
GStreamer that are not backported.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1143e198ad52f20536cca9ca--
