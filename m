Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id B3F77607BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 17:13:06 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so9264946qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 10:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=c9HvQEmYyCOq6ffsh5DBHyG6WT8Iqq3UgjbuvYp+wnU=;
	b=PIL/yN8P+ntyetazAnBE7z7dGio7ApsTTqT1IJ6KYsFfWnQT7LWINAvJCDoVrB9KjQ
	YWiQahgK+CKFJSyOZAquX1CERFkw+s7Twyo8/qpIJPwoE/DUdzvY3lmaRXv6MzsqrHoT
	+LBn0BKh4z+PsdQRqSZiF7uhdJwmHtrK4spU9S76lZVZVLPcUob6tjzulM8wNkabcufo
	c8+yMw6k4Zp9epUAeXgl71Fi64eYhgAe/yWGYyO6TXcFJ3IrG4LX6v1FNNz35b8nHx4q
	cSsGj0FKhXV+cnZSZIBS7fxIjAs+/RXCmMrP/MpFNel3I0lCqoqRVBb+3mwZdmlpGFT+
	o1gQ==
X-Gm-Message-State: ALoCoQkM0lPqHr2Vk9dJVT5WPRknF4SaXKDI2jxTW2Cy3tEed81gb8F0pzrA3twA/jjxvVNVvROH
X-Received: by 10.140.43.228 with SMTP id e91mr21060560qga.80.1433351588033;
	Wed, 03 Jun 2015 10:13:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 3 Jun 2015 10:12:47 -0700 (PDT)
In-Reply-To: <b945778bab5ef3c85d9e42efcf2cc904f0a137cf.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<b945778bab5ef3c85d9e42efcf2cc904f0a137cf.1433349512.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jun 2015 18:12:47 +0100
Message-ID: <CAJTo0Lb_sTZvpxKpaeOK2y4HQUvyKyMYQEUpO8xt3PtncBoUMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Wed, 03 Jun 2015 17:13:07 -0000
Content-Type: multipart/alternative; boundary=001a113a34bc3e4add0517a02c55

--001a113a34bc3e4add0517a02c55
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 17:42, Khem Raj <raj.khem@gmail.com> wrote:

> When booting weston-core-image with latest wayland/weston/libinput
> mouse/touchpad would not work on qemux86, this fixes the issue
>

Presumably you verified that X still works as before with this change?

Ross

--001a113a34bc3e4add0517a02c55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 17:42, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":x3" class=3D"a3s" style=3D=
"overflow:hidden">When booting weston-core-image with latest wayland/weston=
/libinput<br>
mouse/touchpad would not work on qemux86, this fixes the issue<br></div></b=
lockquote></div><br>Presumably you verified that X still works as before wi=
th this change?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113a34bc3e4add0517a02c55--
