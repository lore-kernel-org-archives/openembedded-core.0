Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1946B3A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:24:18 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so673974pab.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=buBL9BpD+iBY8wt/Zh/qmajDGk5xwrClKr/zcWhttak=;
	b=BLyIYma36y7b/OiOnSZp/0bNENR8MsGwfRTE8/oYaHLZI98b9qteNgC+M9T8VRlXLC
	lOYyGY+eLq2c9srkQ3KV2LNgS/qsX+aa6HAumDzuMsnP/rHI+Ocew4h29upJZ8RfHxeZ
	AI0MQDX4dKTl00eTHFwm404X+avPKth7p9a975cRvNwq79BFah1ZdPEbnmXfnUrLxX96
	FOkh53OpnDsDQnDlV5sKkRwr3ShoLmc03xlpXnXBK3lTh45iNNaZnLo53F8Hipz0JcZc
	x6NWnV7PO8ErnKHR0CT4kf0kiFqMH0+66lWs5viWGFgCpbgoupej2SZuA7/uz5D5qn1t
	KNqg==
X-Gm-Message-State: ALoCoQm2CZDxmPchtDjCa72GAeJjWze0+SdxLCkkVnGsKCaUUOXNMOMSbJiKOvPXE9vMwxLuMMFM
MIME-Version: 1.0
X-Received: by 10.68.59.98 with SMTP id y2mr6859264pbq.135.1377080658964; Wed,
	21 Aug 2013 03:24:18 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 21 Aug 2013 03:24:18 -0700 (PDT)
In-Reply-To: <CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
Date: Wed, 21 Aug 2013 11:24:18 +0100
X-Google-Sender-Auth: myAHsIASMG_kQMFq3O6Vg65SNjc
Message-ID: <CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 10:24:18 -0000
Content-Type: multipart/alternative; boundary=bcaec5304f818145f404e472933f

--bcaec5304f818145f404e472933f
Content-Type: text/plain; charset=ISO-8859-1

I am not saying to fix gtk-doc-stub only. I am saying fix the nastiness of
using git repositories for released and supposedly stable versions. I do
not see why tarball would not be enough for those to work off-hand? That
should be the ideal architecture IMHO.


On Wed, Aug 21, 2013 at 11:21 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 21 August 2013 11:16, Laszlo Papp <lpapp@kde.org> wrote:
>
>> Having had an inconvenient debugging session this morning with the help
>> of you, ndec, and so forth on IRC, I would propose to get rid of this gtk
>> doc stub, at least how it is now. It is completely breaking projects
>> causing regressions compared to denzil. We are pretty much blocked by it
>> altogether now. Here is the other thread for details:
>> https://lists.yoctoproject.org/pipermail/poky/2013-August/009184.html
>>
>> IMHO, there should be a way for end users to get rid of the blocker issue
>> and regression. So, how about making this optional?
>>
>
> We used to patch each recipe individually and it wasn't pleasant.
>  gtk-doc-stub is just the first place you're hitting problems with putting
> DL_DIR inside a git repository, removing it will cause something else to
> break.
>
> Ross
>

--bcaec5304f818145f404e472933f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am not saying to fix gtk-doc-stub only. I am saying fix =
the nastiness of using git repositories for released and supposedly stable =
versions. I do not see why tarball would not be enough for those to work of=
f-hand? That should be the ideal architecture IMHO.</div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Aug 2=
1, 2013 at 11:21 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"im">On 21 Aug=
ust 2013 11:16, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@k=
de.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br>
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D"i=
m"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">

<div dir=3D"ltr">Having had an inconvenient debugging session this morning =
with the help of you, ndec, and so forth on IRC, I would propose to get rid=
 of this gtk doc stub, at least how it is now. It is completely breaking pr=
ojects causing regressions compared to denzil. We are pretty much blocked b=
y it altogether now. Here is the other thread for details:=A0<a href=3D"htt=
ps://lists.yoctoproject.org/pipermail/poky/2013-August/009184.html" target=
=3D"_blank">https://lists.yoctoproject.org/pipermail/poky/2013-August/00918=
4.html</a><div>



<br></div><div>IMHO, there should be a way for end users to get rid of the =
blocker issue and regression. So, how about making this optional?</div></di=
v></blockquote><div>=A0</div></div><div>We used to patch each recipe indivi=
dually and it wasn&#39;t pleasant. =A0gtk-doc-stub is just the first place =
you&#39;re hitting problems with putting DL_DIR inside a git repository, re=
moving it will cause something else to break.</div>
<span class=3D"HOEnZb"><font color=3D"#888888">

<div><br></div><div>Ross</div></font></span></div></div></div>
</blockquote></div><br></div>

--bcaec5304f818145f404e472933f--
