Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 45DAF73DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:56:02 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so107007271qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 06:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o3dnU37YBEGR0KdqLG1rn9wplqM2HaWoUexYrWVGIug=;
	b=EeXal2ZbZvSsObBdui21GwOEGBI2tLYQWkAL55rZkxsBoGWpHu97+iSS6/8eTsHD95
	MpclGlLv9mVSlyXBLaiQx8oTAizzLXAbE4jTNftDb7+Yr0XE5vgE5YiBVBC//UdOZ/4/
	m9wmPt43lDdn/XJYQU+zuuPI070jpfkN0twLhTjtAwAWPNUucR5z4z4UqNbPO0Lu1HRC
	BPPIMSNV6ifMA4XOYkoDZI5xEoXmeMrL+smZ/Dn/zwX+w4akX6BPL6cHiA7k+7tf/vGf
	d+EBA159eqN3kyq4GMNec7ZPvp44ltYhl8z/8HoSpe2DRkCokEUd9YD19oGXSG03kKTQ
	62Xg==
X-Gm-Message-State: ALoCoQkGNamGwhQRD1tIICKf6//CZmCyJ6LdMomdkzqm7DnRKe6pcp/7hG+b5zf9MLfqsLI6fian
X-Received: by 10.140.133.67 with SMTP id 64mr69700623qhf.52.1440510962686;
	Tue, 25 Aug 2015 06:56:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Tue, 25 Aug 2015 06:55:43 -0700 (PDT)
In-Reply-To: <6CC83472A885EA4DB329C78841C52459131202C4@VF2WDEXMB3.verifone.com>
References: <6CC83472A885EA4DB329C78841C52459131202C4@VF2WDEXMB3.verifone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 14:55:43 +0100
Message-ID: <CAJTo0LabH-O=oVA=sN1mmSVrQMTtnTaDw9zzfP=QCQq95+v+2Q@mail.gmail.com>
To: Nageswari Srinivasan <NageswariS1@verifone.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: two versions of xlibrary in the same target image
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
X-List-Received-Date: Tue, 25 Aug 2015 13:56:03 -0000
Content-Type: multipart/alternative; boundary=001a1136fdce39fb69051e2318fc

--001a1136fdce39fb69051e2318fc
Content-Type: text/plain; charset=UTF-8

On 25 August 2015 at 12:50, Nageswari Srinivasan <NageswariS1@verifone.com>
wrote:

> Can we have two versions of xlibary installed in the same target image?
> For example, can we have both xlib and nanox in one target file system?
> Will there be an issues due to same header file names?
>

If file names are the same then you'll have file conflicts.  You can solve
this by installing them in different prefxes or library directories if you
really want to have two copies of Xlib in the same image.

Ross

--001a1136fdce39fb69051e2318fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 August 2015 at 12:50, Nageswari Srinivasan <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:NageswariS1@verifone.com" target=3D"_blank">NageswariS1@verif=
one.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=
=3D"direction:ltr;font-family:Tahoma;color:#000000;font-size:10pt">Can we h=
ave two versions of xlibary installed in the same target image? For example=
, can we have both xlib and nanox in one target file system? Will there be =
an issues due to same header file names?<br></div></blockquote><div><br></d=
iv><div>If file names are the same then you&#39;ll have file conflicts.=C2=
=A0 You can solve this by installing them in different prefxes or library d=
irectories if you really want to have two copies of Xlib in the same image.=
</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1136fdce39fb69051e2318fc--
