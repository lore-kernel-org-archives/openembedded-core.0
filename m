Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id DE1FA731E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 15:59:49 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id n190so136066106iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 07:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GSx7GlKF4mhGo0uapnt8GzQCtYDaX8VKI0wDSUUaNl0=;
	b=1QwrafnKP+ZYuXcdnoruZNE6ftSoYxDpoNUMT6WmrNvgGLMFkOgVtNY8p6vxqAgcTg
	QqwWjnMi6E4qCPPXc4OY7tlIjlArDUdwxqWT/jJ4BD5NeVHcYfw+T6ugohv86G3eCZi4
	92jtUyVAPp0m3JhNCRNK+rUgKEyM1O1RBcUdgcMgfZZYudAWI5UOCJK5kz8WFeB0OTS5
	oMtjpgq7nCwUVEpaMZ3+KJbFh/O6f2KZIhM72LwQOb1hGrjl94RdMW9G0Mn72nEt70P5
	kk8PeshFjF4qG0vWrJE3cr4Vv0ZfztqJwWnqxG4MDWfYBS3nPOQZPa3Y133okpjnihDL
	24iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GSx7GlKF4mhGo0uapnt8GzQCtYDaX8VKI0wDSUUaNl0=;
	b=lAVLtzkkcs8N5qRrrzyjVNSh4vzvm1DNYAcLxtFelyRrPPGDwSZSurtMzopDx9fM2w
	jrFxegRGez4sW02Hg7qoOKiuBLsppufaqloqUusPpjARXoowmikO0F4QClWz+aW4M2b5
	KK+mfRIFSsliN253bSf8Pec/AXxqNrcPeEdgP0PUSEUWNoEY+GaRZiVvCUh6tNem62Mp
	z85LInWza62CufLFTsemOxEkHpvPKLCtusVwlJ3uHBx1megPbjDr+ZOzFddjydTkHmR2
	lVtFQ5SGtRXfx3emsvvr66LAOKIOykUOu2DaHgRCF9Yg9aNWSop8IhaYkMQr20OJnXoP
	4usg==
X-Gm-Message-State: AD7BkJLdTdbnq4qLNJIS32pPd8e1pySpUqMITyQ/YBAU0to4JgxCt/DasGaPTVrLZXruolo9Q3uMUt2YNgmL9iBK
X-Received: by 10.107.16.19 with SMTP id y19mr8037286ioi.148.1457366390308;
	Mon, 07 Mar 2016 07:59:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 07:59:30 -0800 (PST)
In-Reply-To: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 15:59:30 +0000
Message-ID: <CAJTo0LZwOpAaUSOVYyuoKQxjU3OkUsi=pTvY5NihHw_kQGJ1Qg@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Mon, 07 Mar 2016 15:59:50 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea00a645052d778e03

--001a113fd1ea00a645052d778e03
Content-Type: text/plain; charset=UTF-8

On 28 November 2015 at 08:09, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> We get below host contamination warnings of license files for
> each recipe, when we try to create a separate ${PN}-lic package (which
> contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
> in local.conf.
>

If something is for master and jethro, please make it clear.

(Merged into mut)

Ross

--001a113fd1ea00a645052d778e03
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 November 2015 at 08:09, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishn=
anjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":ef" class=3D"a3s" style=3D"overflow:hidden">We get below host=
 contamination warnings of license files for<br>
each recipe, when we try to create a separate ${PN}-lic package (which<br>
contains license files), by setting LICENSE_CREATE_PACKAGE equal to &quot;1=
&quot;<br>
in local.conf.</div></blockquote></div><br>If something is for master and j=
ethro, please make it clear.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">(Merged into mut)</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a113fd1ea00a645052d778e03--
