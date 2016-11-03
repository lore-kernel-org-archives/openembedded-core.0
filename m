Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 01B8A71AC9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:39:28 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id n6so35305452qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EYx8nYelJzVdGpIjJcE268c8Eu72kqZavaMZ8iWBVUY=;
	b=u/guuu3eM5/3wQGo38A6oTZAnAN7Zbnl+nporJGZocNIfGhRrOYVYemIJn/zvmvvHz
	BxelHF2NSO0ayjRZNfbKom1oPQZujKbfe9qrDrvg5b+ryFLC6aQQjIOc7xjlEV3WR8US
	Jtv+l5Q42G9js9omY5xRjg+Ojg+I2vwcC3hNJ7kUw8qMxVo8A++J5DBEBXZVunkXZ2e2
	PiN4p1ev2ppogwEEB51DbUY6iu4sabX4eKDX/i6o3uBUeyjQXmlX8RD4W2hxKtbyHJNF
	dUoKPmUbEjgZ6/zY4gfdjUpSamxHQa3PMa2+yQCz15mp9nap2tjxtv/YeOrxMfvAT68d
	gyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EYx8nYelJzVdGpIjJcE268c8Eu72kqZavaMZ8iWBVUY=;
	b=Ik5rlWEbzrpeU34WJfAwNFa0XUW0ZxUDRYBakwkaNf8h36cnYxqb2WINXpC3REhtcd
	wHw6PHdwE5HI6opdWXyHDBmRtwJZXtTNxCjEBTrNXV4Xjt1VZriQT7/bcrOtrnl2mqh5
	UtHc5EvP6NM8/SWzY8bDsMI3/TyBauVIarEKI84pAvx6NsFqfNidIJtLyi8TBKI1r9A+
	RkqYWbSd17dOmbu4xap+95K6/dcLSX7X6Ej4r482xI8TSu7qDj6mULlmarYASKQEWyxE
	I0TG8iCpNhtAFEHKUfg6lK/OBB4aPtSgk2orRcaEuruTxkOGBWEfXxb6TP1nPKsgqzM7
	rzSA==
X-Gm-Message-State: ABUngveDsyZ54+4wnXWBuFeWUQ9X/iUbgHpcRtwKk40XA3cqFAe2cHFeTjxsNB9bo2IK6GeTqhrmAlO9PoeT6Caw
X-Received: by 10.200.53.69 with SMTP id z5mr9889798qtb.64.1478201967629; Thu,
	03 Nov 2016 12:39:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 3 Nov 2016 12:39:07 -0700 (PDT)
In-Reply-To: <1478196294-7594-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1478196294-7594-1-git-send-email-jkrishnanjanappa@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Nov 2016 19:39:07 +0000
Message-ID: <CAJTo0LbvVLrkAJuF3uEMm-_DPmJQLsX2=rT0a4hvKUi9k79MYQ@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][morty][PATCH 1/2] ltp: Fix QA warning
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
X-List-Received-Date: Thu, 03 Nov 2016 19:39:29 -0000
Content-Type: multipart/alternative; boundary=001a114058582fec4005406ab7ab

--001a114058582fec4005406ab7ab
Content-Type: text/plain; charset=UTF-8

On 3 November 2016 at 18:04, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> WARNING: ltp-20160126-r0 do_package_qa: QA Issue:
> /opt/ltp/share/licenses/ltp/run_freezer.sh contained in package ltp-lic
> requires /bin/bash, but no providers found in RDEPENDS_ltp-lic? [file-rdeps]
>

So the common problem "if PN-lic contains a license statement embedded in a
file with a hashbang, file-rdeps is triggered", so I'd say file-rdeps
should be added to INSANE_SKIP_${PN}-lic in bitbake.conf instead of dealing
with this per recipe.

Ross

--001a114058582fec4005406ab7ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2016 at 18:04, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishna=
njanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1a8" class=3D"a3s aXjCH m1582b6c357bbac23">WARNING: ltp-201601=
26-r0 do_package_qa: QA Issue: /opt/ltp/share/licenses/ltp/<wbr>run_freezer=
.sh contained in package ltp-lic requires /bin/bash, but no providers found=
 in RDEPENDS_ltp-lic? [file-rdeps]<br></div></blockquote></div><br>So the c=
ommon problem &quot;if PN-lic contains a license statement embedded in a fi=
le with a hashbang, file-rdeps is triggered&quot;, so I&#39;d say file-rdep=
s should be added to INSANE_SKIP_${PN}-lic in bitbake.conf instead of deali=
ng with this per recipe.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a114058582fec4005406ab7ab--
