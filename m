Return-Path: <mikko.ylinen@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3669D71A60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 12:24:20 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n204so377444875qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 04:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/OsX0ZTDVlVUKmSHPWA6QlA8A4QSPAU5TdDM7NgumAI=;
	b=KgFzMCXgPtCo+r9iWzl2RuqavJh3ZG1vF1fkp3lFpOGF9dovZwyjUUXpHjdfvvSNaX
	z61Cw8b5iP7sddymOPD67jXWrFdz+U/BRvVGfRe80WmLmzz3p7jezJOCToL7OVfYSFiD
	F0bZj0ZWax5Tt36qvuC3H2wrEUEGwUkYIsynDsQzOxi5bHTMrR0KnMwGjC7yQup3B+Ly
	zzqSSdI5s46jZSVrRp3qmNn9azbS5sAJTjzYXeE+mIZLDMc/GNM67Q9fIZ8PZ1yoBLsU
	arhBuy8G60D2j4yffCMehPThcLCE46ZxO+Qu1JOM0Oi/ELQ0pNVl5f4upO9d+s3PjXzy
	3Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/OsX0ZTDVlVUKmSHPWA6QlA8A4QSPAU5TdDM7NgumAI=;
	b=L6LyBxT1YuMols9Om35D+WMSIEYJZ6PQM9d0S93p3aVig+GyTbjUncGU9jwpISOdgC
	9/uaP6srcWFTOogZm2Jaqvf//dA6/g6hbH1RuDFvq/bI+7viy9f2w7skE/fgt55KRBKq
	RMwlSMEHIMdd0rBvTflF1sNH7kmyZROiTGBEyZA+xWcHXF1S4xd/QtS0p/KMA6dRcfJ1
	qlnTkMmaVkPansZwtRUfMC9inHLhD/zKimRdJUyWuK8s+nZSJ+wlBQWDraElWo4JCqkl
	/9wwG4I7rQ9wd58VeSWmRAL+xI0+rhZy19KOAkppTc+gq6ZnGoTqYTIr3LST7Pbd2okL
	demA==
X-Gm-Message-State: AKaTC00gHuw91NgwjcGtKNRBnwv7N1PhlOmGqGB8BMxwf+5Qkq8zoSFVcJPzT2hvwnI4T9SiRxoULSkmf0UPEYhs
X-Received: by 10.233.221.135 with SMTP id r129mr53914547qkf.56.1481027062161; 
	Tue, 06 Dec 2016 04:24:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.173.200 with HTTP; Tue, 6 Dec 2016 04:24:21 -0800 (PST)
In-Reply-To: <CAJTo0LbB5_PkVd-XBH7ESUtiGvTi7ziqLjRr9FXjLp7zAVpvqw@mail.gmail.com>
References: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
	<CAJTo0LbB5_PkVd-XBH7ESUtiGvTi7ziqLjRr9FXjLp7zAVpvqw@mail.gmail.com>
From: "Ylinen, Mikko" <mikko.ylinen@intel.com>
Date: Tue, 6 Dec 2016 14:24:21 +0200
Message-ID: <CAHZ0fbGUf4naEmiEvTPuEMT2LgRYKf+m70-rqon7ZReVrp9a3g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-intel] [PATCH 2/2] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Tue, 06 Dec 2016 12:24:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c0438a8f1862c0542fc7bd9

--94eb2c0438a8f1862c0542fc7bd9
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue, Dec 6, 2016 at 12:48 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 6 December 2016 at 09:57, Ylinen, Mikko <mikko.ylinen@intel.com> wrote:
>
>> This suggests the versions should be kept in sync with the gstreamer
>> versions:
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/commit/
>> ?id=3f51f61efe93c104ba7996f54f381c6c1a5e6546
>>
>
> Khem sent a GStreamer upgrade a few days ago, so they'll all be merging at
> once.  gst-vaapi 1.8 doesn't build with gst 1.10 anyway.
>
>
OK, I had missed that. I only checked master was still using 1.8.x.

-- Mikko

--94eb2c0438a8f1862c0542fc7bd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Tue, Dec 6, 2016 at 12:48 PM, Burton, Ross <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quo=
te">On 6 December 2016 at 09:57, Ylinen, Mikko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mikko.ylinen@intel.com" target=3D"_blank">mikko.ylinen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>This suggest=
s the versions should be kept in sync with the gstreamer versions:</div><di=
v><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/commit/?i=
d=3D3f51f61efe93c104ba7996f54f381c6c1a5e6546" target=3D"_blank">http://git.=
yoctoproject.org/cg<wbr>it/cgit.cgi/meta-intel/commit/<wbr>?id=3D3f51f61efe=
93c104ba7996f54f<wbr>381c6c1a5e6546</a>=C2=A0</div><span class=3D"m_-136144=
7690138155312HOEnZb"><font color=3D"#888888"><div></div></font></span></blo=
ckquote></div><br></span>Khem sent a GStreamer upgrade a few days ago, so t=
hey&#39;ll all be merging at once. =C2=A0gst-vaapi 1.8 doesn&#39;t build wi=
th gst 1.10 anyway.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra"></div></div></blockquote></div><br></div><div class=3D"gmail_=
extra">OK, I had missed that. I only checked master was still using 1.8.x.=
=C2=A0</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>-- Mikko</div></div>

--94eb2c0438a8f1862c0542fc7bd9--
