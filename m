Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D97271E22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 14:18:07 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id x190so117430840qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 06:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kCnlKz3PE054CKbfvlF/QLmcDNkUUZ8df90h8N3WQnM=;
	b=xvnmivc/DsJ7YpxTQpOaAKbNpfbf85esHM/NxPqav6OHUeCZS3t0RTz83qd61JBvGJ
	lpH8EqZYUG5kcTHKqAgREAgno9Qx4yfw53xYHNlrYK3h2bZ8cBXisRH/dkN7fPeE69D/
	Kdmf87RGOPJyijA2YtUjdYhf0WSkGPKMGOCWzcBeZDA7T1HiZwkkvutM0b/q4kNzgCBB
	U6GAezZDOx+WL8tr4mT0o8dQqxRxPyCpk+XJpu2LPbPaubwBZCedg3tiWWQJi5q1Uz3f
	UeaJfA8ufxyzzQH3DLX75qd4qLNVKKcmfJZyadqU4AS+dVNVDa3PAMGltNeRnq908ka7
	8U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kCnlKz3PE054CKbfvlF/QLmcDNkUUZ8df90h8N3WQnM=;
	b=jpdvTQUBYIIiAXWyY45qMgIPHPl2qaXNFEBlo3dU/ETe0lWTqKL7Ibw4FMzh83ZW28
	RxmqLOe9Jwybb+P3Trw2QEmPbdn+IIJQY6I2rQEuXWfXLWut0vfQS5myIfEKDNezob4C
	aYspM2lWpuI+3HcNOTgUJdus0LaZd8rEOhKK1rKbp0Z+MKILi2SXN6qY3RvgiR5r2Bnq
	IzI1zVrIY//FMhzTuQsKWfplE8UbUCfRGc1TWpJDxZC8yVC+om79cHhHDOcE4Sdlr3iq
	AJ5dYNsLlZRTR5JyuhHFJjxGBWMl+VFNR5+5Lh/86DluRWHUeQrhBPno7LtrvEPNnyeE
	HLAg==
X-Gm-Message-State: AKaTC03PbjkTvaf6Celzz8cTCrLpvAj0ZX74JseETxeMrxG60x2NBLgAI0LuodYwHB8IZXeWg+ja0gi8imrdEIuS
X-Received: by 10.55.106.134 with SMTP id f128mr93842416qkc.121.1481638688473; 
	Tue, 13 Dec 2016 06:18:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 06:17:48 -0800 (PST)
In-Reply-To: <1481627960-3608-1-git-send-email-awais_belal@mentor.com>
References: <1481627960-3608-1-git-send-email-awais_belal@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 14:17:48 +0000
Message-ID: <CAJTo0LZOSS8nYB9ooPsSJGkuBU5=pvzCTUAKVXSEUR=f7kgjDg@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub_git: extend recipe for proper target deployment
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
X-List-Received-Date: Tue, 13 Dec 2016 14:18:08 -0000
Content-Type: multipart/alternative; boundary=001a114fddf6b6553405438ae365

--001a114fddf6b6553405438ae365
Content-Type: text/plain; charset=UTF-8

On 13 December 2016 at 11:19, Awais Belal <awais_belal@mentor.com> wrote:

> +DEPENDS_class-target += "grub-native"
>

The native magic won't generate dependencies on itself, so this can just be
DEPENDS.


> +RDEPENDS_${PN}_class-target = "diffutils freetype"
>

Does this really need to be class-target-specific?

Ross

--001a114fddf6b6553405438ae365
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 11:19, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"=
mailto:awais_belal@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>=
&gt;</span> wrote:=C2=A0</div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div id=3D"gmail-:3nk" class=3D"gmail-a3s gmail-aXjCH gmail-m158f7e9ba465a9=
98">+DEPENDS_class-target +=3D &quot;grub-native&quot;<br></div></blockquot=
e><div><br></div><div>The native magic won&#39;t generate dependencies on i=
tself, so this can just be DEPENDS.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div id=3D"gmail-:3nk" class=3D"gmail-a3s gmail-aXjCH gmail-m158f7e9ba465a9=
98">
+RDEPENDS_${PN}_class-target =3D &quot;diffutils freetype&quot;</div></bloc=
kquote></div><br>Does this really need to be class-target-specific?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a114fddf6b6553405438ae365--
