Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 75F1474197
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 11:56:46 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so15433633wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 04:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=V2+U4s5jQdYZCPB0EQXViP75lH3+etphEUfbfHAfN54=;
	b=GvCBMMz3YFjohb4w0DcqcH8jel5Vs4nrgctBoPJyKqfRKlmeIcbMmNJlsraW+PpqOt
	hgLAC8xVCUX3bXnAFc7Wz7h+9B+wxQaQ+pMtZq1qr+sxQoohsngiQh10crTouRW+n64Q
	A+xOpuqNIZjoJ/PCsDkjgtTPgpbekXBZX8RTzrav67kJsnM9yEEJPtioTVIUE8kI+xsc
	4SCSyaTVFDBTkLscVtcmIClwOl8RD3w0kUqf9o5YZBVGd85RfQt7WUWid0mojjIJ5Zno
	QYs4QNr7jvuBwKuz5drvYO4IuJjb4bsDib/zu3jasVogD0glMhV4s0OOzYo7fOxa+o96
	BRAw==
X-Gm-Message-State: ALoCoQmOCUCMEHnwGVRYFNeoujZDfxlHXR2ZZUu2ZPE4GUEcyL99eN5hdwRd5DLar9aHl+I2SLPQ
X-Received: by 10.181.12.40 with SMTP id en8mr6851591wid.75.1441367806319;
	Fri, 04 Sep 2015 04:56:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Fri, 4 Sep 2015 04:56:16 -0700 (PDT)
In-Reply-To: <CAJTo0LYdE-XZkCASy9n3uuL_HrrFTZKC5a3aA0Mj4FU4kOPnew@mail.gmail.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYdE-XZkCASy9n3uuL_HrrFTZKC5a3aA0Mj4FU4kOPnew@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 4 Sep 2015 14:56:16 +0300
Message-ID: <CAHiDW_EOBOQEzZbQRa7kyapoNWTod-pNDtZQ90u6e0fVv+=OSg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 11:56:48 -0000
Content-Type: multipart/alternative; boundary=f46d04388df516342d051eea9887

--f46d04388df516342d051eea9887
Content-Type: text/plain; charset=UTF-8

On 3 September 2015 at 19:08, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 3 September 2015 at 16:34, Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
>
>> It is not used by anything in oe-core and will be moved to meta-gnome
>>
>
> I've a feeling that there are some apps in core-image-sato that actually
> like to have gnome-icon-theme installed (specifically I'm thinking
> pcmanfm).  We should probably check that they work correctly without this
> installed (or more likely, show more icons when it is installed) before
> removing it.
>

Sounds like that's worth checking but I don't think that's related to
Alexanders change: Even before Adwaita applications were supposed
RRECOMMEND gnome-icon-theme if they needed it (not saying it's necessarily
a good idea but that's how it used to work and still works). So if pcmanfm
doesn't do that, it may be missing icons already and did so before adwaita
as well (assuming nothing else in the image pulled in the icon theme).

I don't think it's likely but there is a chance that gnome-icon-theme
contained icons that Adwaita does not provide (comparing them all turned
out to be tricky). So double-checking how pcmanfm looks with Adwaita might
make sense in any case.

Jussi

--f46d04388df516342d051eea9887
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
 September 2015 at 19:08, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote"><span class=3D"">On 3 September 2015 at 1=
6:34, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.k=
anavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div style=3D"overflow:hidden">I=
t is not used by anything in oe-core and will be moved to meta-gnome<br></d=
iv></blockquote><div><br></div></span><div>I&#39;ve a feeling that there ar=
e some apps in core-image-sato that actually like to have gnome-icon-theme =
installed (specifically I&#39;m thinking pcmanfm).=C2=A0 We should probably=
 check that they work correctly without this installed (or more likely, sho=
w more icons when it is installed) before removing it.</div></div></div></d=
iv></blockquote><div><br></div><div>Sounds like that&#39;s worth checking b=
ut I don&#39;t think that&#39;s related to Alexanders change: Even before A=
dwaita applications were supposed RRECOMMEND gnome-icon-theme if they neede=
d it (not saying it&#39;s necessarily a good idea but that&#39;s how it use=
d to work and still works). So if pcmanfm doesn&#39;t do that, it may be mi=
ssing icons already and did so before adwaita as well (assuming nothing els=
e in the image pulled in the icon theme).</div><div><br></div><div>I don&#3=
9;t think it&#39;s likely but there is a chance that gnome-icon-theme conta=
ined icons that Adwaita does not provide (comparing them all turned out to =
be tricky). So double-checking how pcmanfm looks with Adwaita might make se=
nse in any case.</div><div><br></div><div>Jussi</div><div><br></div><div>=
=C2=A0</div></div></div></div>

--f46d04388df516342d051eea9887--
