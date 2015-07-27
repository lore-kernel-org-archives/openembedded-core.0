Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 31FE7605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 18:46:00 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so42689761qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qXXt0LK4JBFE6Zz3RbRkNwaDt6kCHnMVu3iiib5SF1E=;
	b=H1ueqjYcqEhu1v8DvvKLyVwm5ckKzkX79wRu8oRyKIrAPD/Bwm+2i4V5FbieZBg32w
	NvA+fqH0ugjFuZlC+33Bc/ZPxKGrzcZ/mjQ0qx9dW3HNi/h1ifA32ZOkmxiTXsbTXqF2
	7bRQ/2UFTImoL7Ch99XhIp7gExIXf1UMx6mjLGcPh9C2XuakbJFt2ILUIomZOoYCSv2S
	PXW5VPqYcVLa5a/NB8aZ6ARc/zbPV0RPCA4O8Gn2qbcwiWNbU11F4yKDJNkXIKltvBou
	FDQmO6FFjVwQibQ0BeA53Xrp0g1TKEjLm01YrOg8iCWpsISwIrGbOPA2SP+i7xeyXcBv
	nCxg==
X-Gm-Message-State: ALoCoQnQfrnn5I7POtJmxchBIDbQ2xPNBAAkbb/j7KGSBTwd8BthqDH/YssihYBRdR2NxlzcvyJ8
X-Received: by 10.55.17.170 with SMTP id 42mr38992874qkr.29.1438022760662;
	Mon, 27 Jul 2015 11:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Mon, 27 Jul 2015 11:45:41 -0700 (PDT)
In-Reply-To: <CAP9ODKpOjR2Lgx=7iQLW5yctfa2shZrM09J4piDxw9UxDVOm3Q@mail.gmail.com>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
	<CAP9ODKp5X5bK_3-OuBi9RY=L6VSO7sXjdyes3UUG-pOv48FZOg@mail.gmail.com>
	<20150727181551.GD2195@saldanha.aker.com.br>
	<CAP9ODKpOjR2Lgx=7iQLW5yctfa2shZrM09J4piDxw9UxDVOm3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jul 2015 19:45:41 +0100
Message-ID: <CAJTo0LaTi0YsVJCmAC+UzFCTHKc8zHmC8VbSYBtSbVAfpgCU1g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: "wei.tee.ng@intel.com" <wei.tee.ng@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] [master][dizzy] Enable Marvel 8897 Wifi feature
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
X-List-Received-Date: Mon, 27 Jul 2015 18:46:01 -0000
Content-Type: multipart/alternative; boundary=001a1135bd02d41dad051bdfc31c

--001a1135bd02d41dad051bdfc31c
Content-Type: text/plain; charset=UTF-8

On 27 July 2015 at 19:28, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> Sure but this is not a bugfix. I am opposed to backport features
> without a very clear reason and this does not seem to qualify as a
> massive need.
>

Indeed, and existence in meta-oe is an even better reason *not* to backport
to oe-core dizzy.  If there's a product being built on the dizzy release,
then these can be added to your distro layer (or meta-oe used directly).

Ross

--001a1135bd02d41dad051bdfc31c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2015 at 19:28, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"=
mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@=
ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":2ov" class=3D"a3s" style=3D"overflow:hidden">Sure but this is not=
 a bugfix. I am opposed to backport features<br>
without a very clear reason and this does not seem to qualify as a<br>
massive need.</div></blockquote></div><br>Indeed, and existence in meta-oe =
is an even better reason *not* to backport to oe-core dizzy.=C2=A0 If there=
&#39;s a product being built on the dizzy release, then these can be added =
to your distro layer (or meta-oe used directly).</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135bd02d41dad051bdfc31c--
