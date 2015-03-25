Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4B95773C06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 12:11:24 +0000 (UTC)
Received: by qgh3 with SMTP id 3so26754859qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 05:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DlYQn2s68GcZkEwtvn+AthdEJOwtjnHN3SIeebapXoc=;
	b=Jw/LDZiBxdkrMJfQtlNaf81A6QgDul+1w8a2WKdAZraQIp+mRYrVwiVqkNigFYFP+W
	cRBolOZovOuLtJvJPqdVTjxPAkJxNFJkZzs+tUZ4AREAigQ7+zsqh2MwDajcJFH3uuOI
	F85R1SYYB4/xp6wFjbhq2kD+xy0meKzmClmDIUflG7yIX0j6a4VcydLth6wP25S/4/rB
	YoQiLC1H58QQRGiP2HdbE8rKCMR3B1MvEj5Gy5USEjWM3zAQ2KEEDTFsMtyWNZnADyZ+
	2MgMbp1Q/sKbBxQiGnnwoFkv+/mJuU6MQrtjoD+lp2wMb2D74TgvHWM/Tf4Bcda7AGwW
	5Hug==
X-Gm-Message-State: ALoCoQnP/wYTxu+OOtCtHStLbHBvHE8YhwoBqSJ4odEOeGCw/ddXQ/anOwKVdyp9gP1AU7D1yuDr
X-Received: by 10.55.21.152 with SMTP id 24mr18703769qkv.40.1427285485830;
	Wed, 25 Mar 2015 05:11:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 25 Mar 2015 05:11:05 -0700 (PDT)
In-Reply-To: <20150323222113.GD3904@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Mar 2015 12:11:05 +0000
Message-ID: <CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Wed, 25 Mar 2015 12:11:26 -0000
Content-Type: multipart/alternative; boundary=001a1147a9b860b56905121bcc33

--001a1147a9b860b56905121bcc33
Content-Type: text/plain; charset=UTF-8

On 23 March 2015 at 22:21, Martin Jansa <martin.jansa@gmail.com> wrote:

> In my case it's reproducible by adding udev-ptest to image, more
> specifically
> having these 2 directories in rootfs:
> usr/lib/udev/ptest/test/sys/devices
> usr/lib/udev/ptest/test/sys/bus
>

oe-core 3f799b should mean that those directories are in a tarball instead
of unpacked on the rootfs.  Do you have that commit?

Ross

--001a1147a9b860b56905121bcc33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2015 at 22:21, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D":36w" class=3D"" style=3D"o=
verflow:hidden">In my case it&#39;s reproducible by adding udev-ptest to im=
age, more specifically<br>
having these 2 directories in rootfs:<br>
usr/lib/udev/ptest/test/sys/devices<br>
usr/lib/udev/ptest/test/sys/bus</div></blockquote><div><br></div><div>oe-co=
re 3f799b should mean that those directories are in a tarball instead of un=
packed on the rootfs.=C2=A0 Do you have that commit?</div><div><br></div><d=
iv>Ross</div></div></div></div>

--001a1147a9b860b56905121bcc33--
