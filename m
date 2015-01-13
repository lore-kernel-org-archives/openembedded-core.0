Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 769C865D3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 13:02:15 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id bm13so1914246qab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eyxN87/RdVs5HwdJDEfqOs1ih8+m9Yolv3/5X/NNWB4=;
	b=aONGzUlWHBVjHvkkPajvaxKNcXAJkPxgajNtxHU9BfhpngcvdJhlJuSK3wzCfC/gr6
	xElppVrpOrcCmHXFH/2yNCCZMfFGb4VVtMgmqKQbA42C/izvPOLSs6H5vDaJxu67A5cW
	HmFVPF/0Veu+cD5h3RyK/kWRNbxiogtUE6VNlRr3z6+mfMLVwMSqWXBGfRk7MftEAclx
	CACZOM40VlcBrCXP0cTtr0W1NQCDiGkHUfbY+v9G9Yb4XoS73SCW1ztpzfmH5zy2pA5E
	uWF8afzH4uLL9uv68ZyINnyCg7AHfRgVx6PeHbrEYewrIX0TkTeAeVPUyLBIbKNE8+0B
	63ww==
X-Gm-Message-State: ALoCoQlP9GgWcqVBAsVZGUX5mJDhh2lO1mQ2R5o6M9/A6tbUxkXuhG0KMpVRkIkYB9FbaTn2hvqr
X-Received: by 10.224.92.205 with SMTP id s13mr58911754qam.52.1421154136092;
	Tue, 13 Jan 2015 05:02:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 13 Jan 2015 05:01:55 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1501130453440.21773@localhost>
References: <alpine.LFD.2.11.1501130453440.21773@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:01:55 +0000
Message-ID: <CAJTo0LZSPW=igWoL+-1+dzrMB1_Cr54FOxtaq6H0XWJQmRQKAw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: in sysfsutils_2.1.0.bb, is 'S = "${WORKDIR}/sysfsutils-${PV}"' redundant?
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
X-List-Received-Date: Tue, 13 Jan 2015 13:02:27 -0000
Content-Type: multipart/alternative; boundary=089e015375e4742519050c883b21

--089e015375e4742519050c883b21
Content-Type: text/plain; charset=UTF-8

On 13 January 2015 at 12:57, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> setting S that way in the recipe obviously doesn't do any
> harm, but is it accurate to say that, at least in this case, it's
> unnecessary?
>

Correct.  A patch from the student is welcome. :)

Ross

--089e015375e4742519050c883b21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2015 at 12:57, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2qy" cla=
ss=3D"a3s" style=3D"overflow:hidden"> setting S that way in the recipe obvi=
ously doesn&#39;t do any<br>
harm, but is it accurate to say that, at least in this case, it&#39;s<br>
unnecessary?</div></blockquote></div><br>Correct.=C2=A0 A patch from the st=
udent is welcome. :)</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--089e015375e4742519050c883b21--
