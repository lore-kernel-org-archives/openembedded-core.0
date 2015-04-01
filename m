Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 19F2A724B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 15:17:01 +0000 (UTC)
Received: by qcrf4 with SMTP id f4so31151323qcr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 08:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RklnWPCEll/sKwO2aMPt8FafY+iYi/ljhHPIfl7dyQ8=;
	b=W97kf3xuNsncv5vCT7AEk5roJSlxypvBekeM6z+nWt+lplfzc48aK+twqoxnG4CLcW
	UkwmSKfm2CKiWdnFXFSZO1lFCxbmGx1qurpnEd/dBVt0McOk5EUCFcnTgRgPYip/V7Y5
	2DAePLX1+l3qmV+bh/xxaL8JQFcEgMvSMOibqOoMTVu4D0u5R1AkIeZN7ey8Mp3ME6nx
	af0IuhL88S+XTAm9H+cFgyUc/s2xWEoSpRpEjhEys1nl61nenA12GzKPv43zLtjB9UDo
	+fojtAs3cJe8zWyYiMmxifem1RTY6s5PGsSrbcT++clS8pHd1Q+/ZTSeGuOzFNx2bcX3
	36nQ==
X-Gm-Message-State: ALoCoQkocZPx5VBxI7p4629mP45IClzSSW4mI9mnox/o9w9N8d9nkj+nADpDK1xUGOttJVAejHRH
X-Received: by 10.55.31.32 with SMTP id f32mr90956815qkf.41.1427901422977;
	Wed, 01 Apr 2015 08:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 1 Apr 2015 08:16:42 -0700 (PDT)
In-Reply-To: <1427891938-17616-1-git-send-email-gshastri@juniper.net>
References: <1427891938-17616-1-git-send-email-gshastri@juniper.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Apr 2015 16:16:42 +0100
Message-ID: <CAJTo0LbWx9PUmiowwPX3iOwjzg12k8q9nefGG1w1x9LELuUWsA@mail.gmail.com>
To: Gaurang Shastri <gshastri@juniper.net>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [Add xorriso recipe] Add xorriso tool support
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
X-List-Received-Date: Wed, 01 Apr 2015 15:17:04 -0000
Content-Type: multipart/alternative; boundary=001a1147b0dc17869a0512ab356d

--001a1147b0dc17869a0512ab356d
Content-Type: text/plain; charset=UTF-8

On 1 April 2015 at 13:38, Gaurang Shastri <gshastri@juniper.net> wrote:

> xorriso copies file objects from POSIX compliant filesystems into
> Rock Ridge enhanced ISO 9660 filesystems and allows session-wise
> manipulation of such filesystems.
>

Patches for openembedded-core should go to the openembedded-core list, but
also new recipes need to have a good rationale to be included in oe-core.

This doesn't seem like something that's universally useful across many
OE-based projects, so I recommend resubmitting it as a patch against
meta-oe.

Ross

--001a1147b0dc17869a0512ab356d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 April 2015 at 13:38, Gaurang Shastri <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gshastri@juniper.net" target=3D"_blank">gshastri@juniper.net</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5ij" class=3D"=
a3s" style=3D"overflow:hidden">xorriso copies file objects from POSIX compl=
iant filesystems into<br>
Rock Ridge enhanced ISO 9660 filesystems and allows session-wise<br>
manipulation of such filesystems.<br></div></blockquote></div><br>Patches f=
or openembedded-core should go to the openembedded-core list, but also new =
recipes need to have a good rationale to be included in oe-core.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This doesn&#39;t=
 seem like something that&#39;s universally useful across many OE-based pro=
jects, so I recommend resubmitting it as a patch against meta-oe.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a1147b0dc17869a0512ab356d--
