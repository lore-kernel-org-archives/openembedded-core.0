Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 100B47F2ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:00:27 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id h192so760104vka.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+mL51l59ikePlb6HUwDnrIiAcCFx5paiy7GJozxrDEU=;
	b=XgkWIdDCWaeuE1QI7QpnVOog4o1AEPyNhN6FZ33Ykh+jwvtJG2B5D5718w/QChIrpn
	MerKmFikAm5DoiOUj88dBS4Po/gYYaJ2EQBiC8s1zr0barEwcqptjWCECidVCDegV0CZ
	yW98eqPGqLdL/b+1hjkeBhXJmzwWYrbHZxeGyRHlwtSvReWu4XRzZPUBleNYBSu/ozfv
	e3POnSL5w2xJBuqztJcMpjKAeLHAqCEcvlaiSk2HtmnhgUNNbvYtOapXoNJrk6M1ycDg
	f5PFBmgbkVzEMgZvmkiqFbEPRA4mugso+2TKop0Dd14gI1e3paFCcAD2skAV7AH2jMTi
	isvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+mL51l59ikePlb6HUwDnrIiAcCFx5paiy7GJozxrDEU=;
	b=WR+L2AsQd2e7W/C7mb02TLyQxQWKf69Ha4DZaHFFyW7dqYTThO07df/F1a2gkAK3cy
	SWqOjpOJ9vfX5KMbvUdbYuj039JmlA6N4snnmpkdKipgspebRPUhPsxiHTPbv3wr+ekr
	J+WhZauxzx0e8X3d/qso3zcMcEDbpPvhSFl4L4Wozh4Ac5Gr9qBRGJeILRGj10fpz8oh
	rx1eIXrOZrQo89wCbkSbWokIFMdzzr0yq974oDS+X1p+XRPcVGtXG4koPcK8wCPJqf+y
	6VtY1zsha1CcvclPwT3e/K3buhPNiwRNTj+JNT/O6z70Itg2UuhrUYvBgh6Z5fvYSi7x
	XyfA==
X-Gm-Message-State: APjAAAVTXTyEimOGETm+VJ9vzP+TvQ05U5qA+QtigQsKfCyZyiyw4hSp
	frMZ7H5KEDFdbqbT0B/yf9AilsJauKjN3UySKHI=
X-Google-Smtp-Source: APXvYqzVxKvsfHPlUMeRVGdmZj/nKaIgTIOGWxKqXqMvMEYjWJFNZtAMwvjdGYSk2K/xD7ccaJq5bT1Zg3JxmiK8fAs=
X-Received: by 2002:ac5:cc4d:: with SMTP id l13mr4856634vkm.72.1567083628982; 
	Thu, 29 Aug 2019 06:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
	<20190828215810.GF3044@localhost>
	<CADkTA4NbtkgR2LrZC+Srtn-BC+6q=7HQH9S7tbJ3H4u7=HQm7w@mail.gmail.com>
	<20190829063158.GG3044@localhost>
	<CADkTA4NXYy0jnZg6=S_W=3znH9M1hidYw8MDwqOqQCGESq8p=g@mail.gmail.com>
	<20190829125351.GB32705@localhost>
In-Reply-To: <20190829125351.GB32705@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Aug 2019 15:00:17 +0200
Message-ID: <CANNYZj9fyZ_Us1gFy7KvS4Gw41ztNDCmt5bn=ARAX16h7pEETQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Thu, 29 Aug 2019 13:00:28 -0000
Content-Type: multipart/alternative; boundary="00000000000009f4ca05914117bd"

--00000000000009f4ca05914117bd
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2019 at 14:54, Adrian Bunk <bunk@stusta.de> wrote:

>
> It is an unexpected meaning of "zero risk" when this excludes
> breakages with kernels other than the ones in master.
>
> One of the non-python changes to perf blew up the build for me even when
> trying with a kernel that is only a few months behind on the 4.19 branch,
> so there's some patches for me to send next month.
>

This is part and parcel of using the master branch with various 'other'
layers. Things can and do break in those other layers, and have to be fixed
after the fact of the breaking changes landing in master. If this is not
acceptable, then stable branches are far more conservative.

Alex

--00000000000009f4ca05914117bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 29 Aug 2019 at 14:54, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
It is an unexpected meaning of &quot;zero risk&quot; when this excludes <br=
>
breakages with kernels other than the ones in master.<br>
<br>
One of the non-python changes to perf blew up the build for me even when <b=
r>
trying with a kernel that is only a few months behind on the 4.19 branch,<b=
r>
so there&#39;s some patches for me to send next month.<br></blockquote><div=
><br></div><div>This is part and parcel of using the master branch with var=
ious &#39;other&#39; layers. Things can and do break in those other layers,=
 and have to be fixed after the fact of the breaking changes landing in mas=
ter. If this is not acceptable, then stable branches are far more conservat=
ive.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000009f4ca05914117bd--
