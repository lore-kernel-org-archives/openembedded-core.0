Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id B2DCF65E94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 12:58:10 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id v10so2141741qac.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 05:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RL+oBTFEojy4zg8VZEehLdf3f/w/w3QbGmXNLZeRluU=;
	b=ZRkblTqqhGSReV11N/Nzwy1I2KqackXgd5lQ5E4OyGmK2OhaVThgt1GWwh8K22MNBP
	gzG6aMFIVGmXvbJvYnKwzqxP7ydMHkcWbpjJO3DwCMxTKhf3js44FmSn3bd1LmxBeVdB
	HxmHgsmaPxRFdpRJp40n6UbacVzMnsXxMY0almw3FfnTe4O2Mv+vWNiWDEORrMxIgegC
	2jMQ0sPP/uMb9wAQacGHCTL4l/581CMZUug1bAscTZ9E5pdhI3Oxqrq9ZQjGkqitwFXp
	7pfrAps+FHrQQqOH/o2rnGDIyt94nWQkxPBRyfIV98NtR5EFF7+W4sDxLquS8KBuKpCa
	huWw==
X-Gm-Message-State: ALoCoQkPZ/ay1l189HBSb101fpNoaKNnL/N8Vplg0EikutsoUevOvP0+mgpQciYxwuGbh8/DGg9C
X-Received: by 10.140.109.244 with SMTP id l107mr24088951qgf.80.1414673891393; 
	Thu, 30 Oct 2014 05:58:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 30 Oct 2014 05:57:50 -0700 (PDT)
In-Reply-To: <1414508747-4688-1-git-send-email-gary@mlbassoc.com>
References: <1414508747-4688-1-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Oct 2014 12:57:50 +0000
Message-ID: <CAJTo0LaLRhRASrwdHQboWYjbsGzBmCZgq4J1Qv_i5KDo17ZhVQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-pygtk: Restore pkg-config file
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
X-List-Received-Date: Thu, 30 Oct 2014 12:58:15 -0000
Content-Type: multipart/alternative; boundary=001a113b7e50c544590506a36eba

--001a113b7e50c544590506a36eba
Content-Type: text/plain; charset=UTF-8

On 28 October 2014 15:05, Gary Thomas <gary@mlbassoc.com> wrote:

> Some previous version of this recipe was errantly removing the pygtk-2.0.pc
> (pkg-config) file.  This is needed for other packages to be able to build
> against this library.
>

It's deleting the code generator too.  This entire recipe gives me the
heebie-jeebies...

Ross

--001a113b7e50c544590506a36eba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 October 2014 15:05, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex"><div id=3D":so" class=3D"" style=3D"overflow:hidde=
n">Some previous version of this recipe was errantly removing the pygtk-2.0=
.pc<br>
(pkg-config) file.=C2=A0 This is needed for other packages to be able to bu=
ild<br>
against this library.</div></blockquote><div><br></div><div>It&#39;s deleti=
ng the code generator too.=C2=A0 This entire recipe gives me the heebie-jee=
bies...</div><div><br></div><div>Ross</div></div></div></div>

--001a113b7e50c544590506a36eba--
