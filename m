Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 05054606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 14:04:47 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id p64so16619715ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+3fbSh28BlmMF82YRtP7i0wSjMZNjPvZCCmieNDro/g=;
	b=0o5aXsA0uEol+/acklYPYQAOwLkcdB2Hqq+kuOsCy0U9qGzxstcS30qPFVv3yuhuVP
	T4krIWFegmBugEc4PYfihfdjcylXoQp1N3/RbzyIfyWiFmd6Wj4/y29UjXceuKNvZGt5
	5LxSAvhbi0DcCkRdlgq4IrjgIsOKQ3CILT+9rqtA7lwPaqoxPUt85EgfiE0RisRetanX
	m2cJ4u7uaMMDHwktOEs1ikFkXXhJ27yE4vwPVZZ3MJpQZHKRu9uYtQFFokNKJBUMxy41
	CZl3kMrCcHuqcv9iZAOoqRFJOZQOa1JH9YjgQDa5+CPRNVaO46podsqjj8z63ChxDGyU
	Dubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+3fbSh28BlmMF82YRtP7i0wSjMZNjPvZCCmieNDro/g=;
	b=MdB9nYX6IDyhMeED4b8/KHVtDd6qsyRdslN15DuV8iRGTqJ/KHoM2tbjSUinBDd+Fo
	HFWHPBQI8igtSeRyZOXvPxf9LQUDNrYiGnDDuPnAT2N7oPaw0s5azB++ak8l4MPyYWKl
	2g6mmJHkvhWiEjeafrx9+75ZKwQackNgIfB5FcoJiRpSR189GKNE9i5yW0aPC4pSJCC8
	5ZODJ3HGdpx0tw0V9sNyRTX2klwTtLTDGhS5sFxR+Dj3bIiGHt3Z1oWnx9TZXqEo5QWT
	HgRHOCpucBd1cc6IPWARDmSE2qapLtqmWmnjCLOO62/izFPHFDkPl90ce831fQQGOn53
	37bg==
X-Gm-Message-State: AOPr4FX7Whiv0O1j8ZtmzgjPIQAS4Y4cD+aRQhMnF65lXL63IFsvhQk8vms+9i0KAYniP8zYyyAc8rBEugn9nKTg
X-Received: by 10.107.51.213 with SMTP id z204mr9319177ioz.148.1463666688685; 
	Thu, 19 May 2016 07:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 19 May 2016 07:04:29 -0700 (PDT)
In-Reply-To: <1463665389-18822-4-git-send-email-maxin.john@intel.com>
References: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
	<1463665389-18822-4-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 May 2016 15:04:29 +0100
Message-ID: <CAJTo0LY6DgrzrHmZXfX7Am9Q-dyS+F2MKERGwZr1ur4NLvBj1w@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] ghostscript: fix upstream check
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
X-List-Received-Date: Thu, 19 May 2016 14:04:49 -0000
Content-Type: multipart/alternative; boundary=001a11440cd00cbb3b05333275bb

--001a11440cd00cbb3b05333275bb
Content-Type: text/plain; charset=UTF-8

On 19 May 2016 at 14:43, Maxin B. John <maxin.john@intel.com> wrote:

> +UPSTREAM_CHECK_URI = "
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
>

#9573 reports that the current SRC_URI doesn't work either, so you change
the SRC_URI to their new download URIs and see if we still need this with
the updated URI?

Ross

--001a11440cd00cbb3b05333275bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2016 at 14:43, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":cor" class=3D"a3s=
 aXjCH">+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/Artifex=
Software/ghostpdl-downloads/releases" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases</a>&quot;<br=
></div></blockquote></div><br>#9573 reports that the current SRC_URI doesn&=
#39;t work either, so you change the SRC_URI to their new download URIs and=
 see if we still need this with the updated URI?</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11440cd00cbb3b05333275bb--
