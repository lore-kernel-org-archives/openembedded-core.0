Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 387C37847B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 23:42:43 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id b198so3895002iof.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=frDgV8Z3+54D0sbeniRs92WWU+qiwb9CVpqQss/MAfY=;
	b=ihrBw/yXrQUKz9dCKCLTAIrAOB33HD/TGcPGa8OnOXar9OXz7EUsscombRow9NsKc2
	5CMs9jfsInarAGuYHQ8nIFzS+hPRQTvUQylAc/gjEao4zAatxQh4FxTqcswLbwy+/2HS
	/l3h/OFtSNIEJv01chZLP88Ju9B5TUqQClYYbLNjMf1FZK4+33QiXq0Z8NAyHMf/xzXH
	tcIRujHd1f1Ejb5szjtkRckXrDTg0/F247E6f+N2BWoICG4VoBP9MCw3Efwkt1ZSoDB0
	grR0/Crq1e497HmTlSBahAn7Plu5GCrTEsG6wWEL6XsUD0lUySL3jD/WvDnW6CaczuYK
	CrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=frDgV8Z3+54D0sbeniRs92WWU+qiwb9CVpqQss/MAfY=;
	b=g+30eKBqLWO+ivRrjQzQIckoEjPEmU+OD+Fzat2/sJXYc/icnRpfU7asYtze1VPEBX
	cgeNmloVLAr1MfMh5/5QKronlQHtOg6PkFCCNGy5tGBonQlnBUddeimrNIi2qWuJqnGm
	KSn/NX833/qGjBW3RMhGd2bYnk3skpHI+Lqvg3u1c2lldZFfe2EoX+yNqyFQRa79/GF6
	lL7Dko5sQrnRVNq7ptbmFrR1jIFF6RuuA+UJVFD+YUOZ0/BS5VPFvqb3Sv3So+jtXxLu
	ZiFuLNL89hyitH7bhpPESTN+yDCXCRFXkkl3B9AlH+vAia3O+UKJ4/Cpfyf32aEBTBHt
	0tQw==
X-Gm-Message-State: APf1xPDv7kCOcYaAPtA/tuZrRFPnPq612/3Kccu7bqPM+I9N+z8bI9Bm
	zUGfUzSJvcRHXUdUyQX7x/VWv7B7VnNkxpTn5Sfnmw==
X-Google-Smtp-Source: AH8x227lF4WMyoYHSup7utlu8SyO1OLzv9rBgHCYAas2sOLwcUVRigqimUDm4/zcK9E/+lLESgGiQI03Mj3LI9dIiyE=
X-Received: by 10.107.32.19 with SMTP id g19mr9736395iog.217.1518046965281;
	Wed, 07 Feb 2018 15:42:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 7 Feb 2018 15:42:24 -0800 (PST)
In-Reply-To: <16827076-8e50-dd0a-cb2f-6fee4ac54c70@ridgerun.com>
References: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
	<CAJTo0LZpMogpg6sBUtbL+-BJ+Cf6C-HG6P3um-HjUaCct52YXA@mail.gmail.com>
	<16827076-8e50-dd0a-cb2f-6fee4ac54c70@ridgerun.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Feb 2018 23:42:24 +0000
Message-ID: <CAJTo0Lb6NDXxbB_Pg8Wk49QEUoJs3xS1QLGqnDq_ZX2dNk-g6w@mail.gmail.com>
To: Carlos <carlos.rodriguez@ridgerun.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 07 Feb 2018 23:42:44 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a41e50280564a7da8c"

--001a1141a2a41e50280564a7da8c
Content-Type: text/plain; charset="UTF-8"

On 7 February 2018 at 23:40, Carlos <carlos.rodriguez@ridgerun.com> wrote:

> Ok thanks for the feedback. Will create the patches for meta-multimedia.
>
> If you have any other suggestion please let me know.
>

I can't stand single recipes that put the bulk of the content into a .inc
without anything else using it, but I know some people disagree with me.

Ross

--001a1141a2a41e50280564a7da8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 February 2018 at 23:40, Carlos <span dir=3D"ltr">&lt;=
<a href=3D"mailto:carlos.rodriguez@ridgerun.com" target=3D"_blank">carlos.r=
odriguez@ridgerun.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Ok thanks for the feedback. Will create the patches for
    meta-multimedia.<br>
    <br>
    If you have any other suggestion please let me know.</div></blockquote>=
<div><br></div><div>I can&#39;t stand single recipes that put the bulk of t=
he content into a .inc without anything else using it, but I know some peop=
le disagree with me.</div><div><br></div><div>Ross</div></div></div></div>

--001a1141a2a41e50280564a7da8c--
