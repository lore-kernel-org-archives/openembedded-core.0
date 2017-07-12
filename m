Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 25CF5781F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 16:22:56 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id m68so14392410ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yR7YDEtJOTi0qeU2MWPM5wtMHx3nXZ7lApX1aDQTbiM=;
	b=w+u31oU2VfsyL83bimKozx7pJOg9x2IebvtdEUe4wUlCkbvhwPfuLP8VoMYK6JL7Qk
	8hl0nB0PtmygyQ3qnTji9nvDN1s85VdsibyO3/5pXhIEjZpAMWWaE5SAMqSowWFIm4cP
	7zmniDgXMzbp+NhX+uVFIQ2QClok24sMDrJz+CIbhbhfJxnWRCbrD0UZW6GvuKDctMFh
	laThtkxEYSsofz73qH75Kzdcl1f0wkEHN/OqK9ZDxKOICUHIHRsYsTC0WrjPhbTYsAer
	WpPO3lL91Zrez2bUpCE1JcfzNqZVTMn75KlDUIOVYS+kJYPq5Z48brwNkJoFccB/JXLB
	AZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yR7YDEtJOTi0qeU2MWPM5wtMHx3nXZ7lApX1aDQTbiM=;
	b=EerBXxmLhl6j89rjIAPmMLpoBbVgejHo2rKJrzF6hg/PgSv9r58rG70188nj0+3OUn
	iNg6Wy1oO0W3oEniFl7ZQCqoiP+o+0xCeCkfKCbkg4zxr3XA7+FuTcUaqjQOcHm9skqV
	SidjFNMQjW6HLSBVCGAjLnn7mqLUNMsNq1tjoZisAYo5hKNR01zfsy0dPNbzt8wIRN0T
	ZUhKynSAgisZ48A+XYglBpc4Swj/mzjcSoRb9fRLuMthaDrIo3gOCnikcUkaP9lPA6yD
	Jda/YPa0CMdNRvVn88iqvl/PIgr/obKKr2y5be0G/IBJ1iZ8vlDWS4yoz64ZujptNLpA
	ntLQ==
X-Gm-Message-State: AIVw113TzdgUh84sZCsxmySokNkG6+ZJifD6ol8aT3FCaj7iK+8kLqFu
	r50xYGO7oi1fwkqvOpNZBEMiqMfoRZ5V
X-Received: by 10.36.58.6 with SMTP id m6mr22555066itm.43.1499876578174; Wed,
	12 Jul 2017 09:22:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Wed, 12 Jul 2017 09:22:37 -0700 (PDT)
In-Reply-To: <a41b7c3c-fd67-9cd2-a427-90fec4037af8@deshawresearch.com>
References: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
	<CAJTo0LYs38P1M3_YBNWfHq71s3RUMeJW4hGKUtQxBWMbT-HGBA@mail.gmail.com>
	<a41b7c3c-fd67-9cd2-a427-90fec4037af8@deshawresearch.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 17:22:37 +0100
Message-ID: <CAJTo0LbyhidXO6AFEYE_K0q_vg8Z-k4iYg_ocm+QgY0D_cXEkw@mail.gmail.com>
To: Lev Iserovich <Lev.Iserovich@deshawresearch.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: Enable generation of libasprintf in gettext 0.19
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
X-List-Received-Date: Wed, 12 Jul 2017 16:22:57 -0000
Content-Type: multipart/alternative; boundary="001a114419caa654360554213a41"

--001a114419caa654360554213a41
Content-Type: text/plain; charset="UTF-8"

On 12 July 2017 at 15:31, Lev Iserovich <Lev.Iserovich@deshawresearch.com>
wrote:

> As this pulls C++ libraries into the core package, can it be split out
> like the other libraries?
>
> Sure, I can do that - can you point to some prior art for how this is
> generally done?
>

Add the package name to PACKAGES and fiddle FILES to put the bits in the
right place. gettext already does this for some other libraries.

Ross

--001a114419caa654360554213a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2017 at 15:31, Lev Iserovich <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:Lev.Iserovich@deshawresearch.com" target=3D"_blank">Lev.Iserovich@desh=
awresearch.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D""><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail=
_extra">As this pulls C++ libraries into the core package, can it be
          split out like the other libraries?</div>
      </div>
    </blockquote></span>
    Sure, I can do that - can you point to some prior art for how this
    is generally done?<br></blockquote><div><br></div><div>Add the package =
name to PACKAGES and fiddle FILES to put the bits in the right place. gette=
xt already does this for some other libraries.</div><div><br></div><div>Ros=
s=C2=A0</div></div><br></div></div>

--001a114419caa654360554213a41--
