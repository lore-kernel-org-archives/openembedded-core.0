Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id E37FF7744E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 16:09:02 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id y8so40827560igp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QWNUi6BneTZHVVWUv3Um1Gy0VWPs2RB48DhMNgXJerU=;
	b=JnRSiPPgPEwlL1jx942/9qll7DWcDtiPxXSBEGgRteHofH6hIXSHR1uLwzlcRh+f5a
	wY4M1iSgKJScPDjn4h0APYF6yaVA12XnmOId5NUHoWfewXTBaO/vk7uXWeTMyBIC6uiC
	lIfmYewF4SDD+selWxMri/zK8UVgX+zEKgwlcl0sskPhGBFaTMxQpOzUwrpmHEkymukp
	TNiBcgsYdhxPaEa8jftwagK7mjHIWFgesrSxr2ClsURAI2leKRpJSfxuqMccKa+2Qd7m
	TFtEqi5cFqqM7saX5XN9ZDC5+27uPtVK59ysLECOi5U3V+ua8pF5jF+hKkLdVRQrh6jN
	5IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QWNUi6BneTZHVVWUv3Um1Gy0VWPs2RB48DhMNgXJerU=;
	b=XNhV6xrSUYRyhH/wN1VqOseBFXVXMkfEnP23e8fPC1k0XKYHDOuotTYG8nYu2uWRB3
	NzXVmCZjnQaL0IV0RdNIc1K5GS3KqniMbri4pyJcDyFOgAsMLnP6HCoz9SacLOyevW1p
	O/4Hpnkn1ZhF7rmJNAnYWNExROsMYztEgJdDFt2Ujx/88g49shvdpBNsaxZPCAYPOKdf
	uz+CHVJVSRXuTFI4sC6UDcQOxXCl8t+pmVTZvHo3u2tTzKDrPhWkFnxrbBB2HZAdH23p
	HsYqBNj6f+upHW3twUAXOn24sZ/Ji2Cy7qxvFa3BZiLwabBM7kpW5fsdE1Ac0zFriDcB
	XZ6Q==
X-Gm-Message-State: AD7BkJIGdNEoqxb8ielahlaEL8RIzjHCVV9u7Iaju9n+vm86Fo45FQ2Prez0LVb56hyWsC5lMcLgHl2zK72xt1HD
X-Received: by 10.50.66.238 with SMTP id i14mr3387587igt.52.1456502943151;
	Fri, 26 Feb 2016 08:09:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 08:08:43 -0800 (PST)
In-Reply-To: <1455554962-6301-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1455554962-6301-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 16:08:43 +0000
Message-ID: <CAJTo0LYHT_ac564ZQySik5kMcnzc4U_YD7eCP7ORfkWjpzEG3Q@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/buildoptions: Test build does not fail without git rev
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
X-List-Received-Date: Fri, 26 Feb 2016 16:09:03 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109c8a9e1f052cae84bb

--047d7bdc109c8a9e1f052cae84bb
Content-Type: text/plain; charset=UTF-8

On 15 February 2016 at 16:49, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> +        shutil.move(git_dir, git_dir_tmp)
>

This is a bit scary.  I think the test should use yocto-layers to create an
empty layer.

Ross

--047d7bdc109c8a9e1f052cae84bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2016 at 16:49, Daniel Istrate <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.al=
exandrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":1ly" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 shutil.move(git_dir, git_dir_tmp)<br></div></blockquot=
e></div><br></div><div class=3D"gmail_extra">This is a bit scary.=C2=A0 I t=
hink the test should use yocto-layers to create an empty layer.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc109c8a9e1f052cae84bb--
