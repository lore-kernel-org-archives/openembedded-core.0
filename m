Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 770B572D17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 12:46:27 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so5787480qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 04:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bL/txIdexOu0V/reFp0l+9m5Iodk3lbmJsu+l0uOMds=;
	b=FS5AvYc/jEYOAJGFsK8Q8eUGfzDdkGxVYtlaPlbutdkPhgUMcEsXY3sXscMXYQFyZq
	eYl/etmxq8+hDeStZ4seTkr2NQd5nw/RM5+UY3eKi9rt6IohMSlilR9HsBfhcYA3TXhS
	HG/anBc73LnPksiUILsyzAaW69y7ROYRQRVQJUrgEpu5MsGf1q2n4kxMnzzVYpZ4yq/9
	Hi8cQVgjc8seMQhCHFBdyuXRy8Dxwtm8ZVbUjET1vjgR4q6BpeQ3Jwb1/r9y3qVGpPkP
	a84XsAMEk1T+VY8AIbOzlK6zFCAIVPMxLw3UY0yUu631zRQkVR8xPMD5GbeiWV3JZw+L
	NU0A==
X-Gm-Message-State: ALoCoQk3KXM8AmU6ENVIoE0QUw8S9w66KQT4UM0oss15TIHdD3K3bzjD5/4+yBbcKTxqYENfB9xE
X-Received: by 10.140.94.195 with SMTP id g61mr12749994qge.80.1422017187847;
	Fri, 23 Jan 2015 04:46:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 23 Jan 2015 04:46:07 -0800 (PST)
In-Reply-To: <20150122163414.GE2456@jama>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-3-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZyFhMvO1YHeQTQsRRbVGmQ7xtmkzBH3rk4LvtGvvBMQw@mail.gmail.com>
	<20150122163414.GE2456@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jan 2015 12:46:07 +0000
Message-ID: <CAJTo0LY-OiMipO7_4rFV7Ppy=i7dmYr+-E8BDUsKsLKrQZXvMQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Fri, 23 Jan 2015 12:46:28 -0000
Content-Type: multipart/alternative; boundary=001a113a59ee58cb3e050d512df8

--001a113a59ee58cb3e050d512df8
Content-Type: text/plain; charset=UTF-8

On 22 January 2015 at 16:34, Martin Jansa <martin.jansa@gmail.com> wrote:

> and the .inc file is used in much more recipes (which don't need libx11 to
> build)
>

You can't be arguing that it's alright to build the X11 drivers when the
X11 distro feature is disabled?  I thought the end goal was to cover all
X11 recipes, not just the ones that happen to link to libx11?

Ross

--001a113a59ee58cb3e050d512df8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2015 at 16:34, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3rn" class=
=3D"a3s" style=3D"overflow:hidden">and the .inc file is used in much more r=
ecipes (which don&#39;t need libx11 to build)<br></div></blockquote><div><b=
r></div><div>You can&#39;t be arguing that it&#39;s alright to build the X1=
1 drivers when the X11 distro feature is disabled?=C2=A0 I thought the end =
goal was to cover all X11 recipes, not just the ones that happen to link to=
 libx11?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113a59ee58cb3e050d512df8--
