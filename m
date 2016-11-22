Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 613A26074F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 11:20:46 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n21so18357422qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jqtRav1RBpEML2svWXIASx/p7ckBmG1eAA0xkQU6g9A=;
	b=HNWeCPejVjXAOJZKpiGn3aFq2IVvxZijVMgq8cA9v1Yo1KOewnaQz+yuz4/hGZtnPz
	LQQqWQXBeiRRz3bDQq2FjowtetCpdIpx8H8A/FTGljTT7z0mamaFZQZj2BsdzSaCVjRf
	dm2zHqvHvryD8/ZFJaHvvgGgEq74hHBgs8WB/JSqp2CpHQl45zCh1/2R4dLtp8TeagEY
	NBAJ+nydZhHYERPZxSFjt9mmZx0v4XdrMompVNJZE8eLPc0qSD0DdV7fhZEf+UQmwZhD
	693XLxg7bJfpf9IYxQTu/Pjadfy5+bzSQvxtPgVgsrhiVRLmyR1dfKfv6KUdVXWUQDC6
	uyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jqtRav1RBpEML2svWXIASx/p7ckBmG1eAA0xkQU6g9A=;
	b=RfYoSH6RvaOv9h/TN1lIZR6OwTpOk5/U02Rxx0EMT7FuLmVMvqYPX6gSAMyGf5UWvc
	UxOQsc/p9yT/igxGLJHUcMu47AC4l5C7DzjM7OhuSKeEq2D+sfdVqgUOWuh9fpsq55k0
	py8ZIiC9ZQq5IoD8NSjaNeY6wUAZ1X/6y4HMjP9gV3PMeeXAz9NFamiX7E5hyNHLFrmy
	9tqxZjyIKg7TruCWDNWGHV5lWEIk/VHY2/3ah0xFSS/Mikx9gTyXGKdb/cALnC3DJ0D3
	wwczkg3s7+/G2B32XcV+mBVVNZkeGszqTczxZ4jACVG9aMGEQwtvo27RsF8rekmfmwmv
	Jrnw==
X-Gm-Message-State: AKaTC031wt28pHkrWuLmp1L3/DXnjUss9nNeHAjV/8j23tQvqen1VmT5cdv3w9v8OVvhU2NwgiRmPgK66FbY/vaQ
X-Received: by 10.55.207.78 with SMTP id e75mr25144942qkj.36.1479813648309;
	Tue, 22 Nov 2016 03:20:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 03:20:27 -0800 (PST)
In-Reply-To: <CAJTo0Lb7jorMUq-8D-tkBTK0bP45AOtP_tBS2PTGGxPrUWbc8g@mail.gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<20161116174748.26994-2-raj.khem@gmail.com>
	<CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
	<eb6aeb51-c0c5-fe39-f3e1-ac1dfede129b@gmail.com>
	<CAJTo0Lb7jorMUq-8D-tkBTK0bP45AOtP_tBS2PTGGxPrUWbc8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 11:20:27 +0000
Message-ID: <CAJTo0LZbASS4RinqtPaPk3bojynYD1jNFnE0y67ULzqO_pxJNg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] taglib: Update to 1.11.1
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
X-List-Received-Date: Tue, 22 Nov 2016 11:20:48 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8d771ec0541e1f6a8

--001a1145b7b8d771ec0541e1f6a8
Content-Type: text/plain; charset=UTF-8

On 22 November 2016 at 10:44, Burton, Ross <ross.burton@intel.com> wrote:

> No but I've an example where boost doesnt build at all and this breaks
> core-image-sato (IA x32)...
>
> Building all of boost just for a macro seems rather unfortunate.
>

Found the magic -D options to convince taglib that boost definitely isn't
present and verified that it does the same thing with and without boost in
the sysroot so I just sent a v2.

Ross

--001a1145b7b8d771ec0541e1f6a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 10:44, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ext=
ra">No but I&#39;ve an example where boost doesnt build at all and this bre=
aks core-image-sato (IA x32)...</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Building all of boost just for a macro seems rath=
er unfortunate.</div></blockquote><div><br></div><div>Found the magic -D op=
tions to convince taglib that boost definitely isn&#39;t present and verifi=
ed that it does the same thing with and without boost in the sysroot so I j=
ust sent a v2.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></d=
iv>

--001a1145b7b8d771ec0541e1f6a8--
