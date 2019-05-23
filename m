Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id A0BC07D735
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:41:22 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id h20so9718596itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=n41bhc5SdSMzDYwSgfLpgzVYsH2Ok2idyJexo8YalRE=;
	b=dPQPNdq3nkjPeYWoPzTrmKNc0rewPI4MyHrZjreGNUdkO6HLUHq4gSrEKAx8z9lcEU
	nN96C55zdyhOCEWFeV1z3Qb8HYEgcLYKVwS4u+s/G04a3bvlY8H/FcHFwPtkHC0DalPo
	tLBmNrwGy3n5aZFD240lu3hndDsmancPqLIZTu+ZBuO2JEekpKMATlHhp4DW/OUPiZUO
	LEt0d9wTbAtmP4xPfZVRO8ofIIaQFGUEoyibCTO5ZzZmizkRmEbWH4VOR+sPnkGbniBJ
	xpVMerBeP6seSPDZAlcV3U74vvyudPCk2JzpcKbYkER6AFtP/F3g/pnUy2fCKhllKgJ7
	QiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=n41bhc5SdSMzDYwSgfLpgzVYsH2Ok2idyJexo8YalRE=;
	b=FgG6DLD3dGQovSHGevZ9SLQRvktj3VYrBZj4FcRQB1bPJrBeIgDVwdYoKdjzetErsE
	GkrOirZHYbCpcjpPzF6lGvPbczuYydPPfnz1rbX9AcUnJXaFhfj1hMm8xYWJHAWzwihG
	bHU6nBsQ+1H0rtIK99u9qPGhxefgpB2CgJoMfyhZBLzPsl0op0SsXI4S27f2VtKaRhrM
	GCI69FfuCUxarUrklk+45dAZh6LX6kgQfCzakwmX3884AFMtv85IKIICvZo3nwN15KR/
	LsU2Sl8Bt7zFbAeReOaV1xLJBYc9dIrf86cmiTVrwYvp7zegEK6zTOD6OvGg8xAzcoMP
	dZQQ==
X-Gm-Message-State: APjAAAVFfiDVdKWTqGJk/h7yhO+MChXbdv9U7DoveqdTZeL71i05nUct
	0VZc2c1HYyL6fkHYee3aUQ5B+WymUrd37HPOK2fE/g==
X-Google-Smtp-Source: APXvYqwKhjpapeXayRaC/0pzfiTGY3QAJXic6fRMfQRUKjgNMVTSNRc5fh1sB6CFEhNjscBCTud8X4Jcdfyue6IaZeQ=
X-Received: by 2002:a24:c204:: with SMTP id i4mr13172674itg.83.1558618883709; 
	Thu, 23 May 2019 06:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190523122941.21058-1-schnitzeltony@gmail.com>
	<CAJTo0La2B39+ZuN6t40xz_g2MoDo44kow6g4RA6L_8YGfin0VQ@mail.gmail.com>
	<CALbNGRTv8f6nPOS1fDskR3t=29+jw9Gj74_jsZCY7jpUFPk24A@mail.gmail.com>
In-Reply-To: <CALbNGRTv8f6nPOS1fDskR3t=29+jw9Gj74_jsZCY7jpUFPk24A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 14:41:12 +0100
Message-ID: <CAJTo0LZbGbXH7ex=mRDj-oa6dW0MUcjZP+c_r=61g7uHrzpUEw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: add help packages based on languages selected in IMAGE_LINGUAS
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
X-List-Received-Date: Thu, 23 May 2019 13:41:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 May 2019 at 13:44, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> > Why -help- and not -doc?
> >
> Because there are help files installed in 'help' directory and
> displayed by a help browser.

Sounds a lot like documentation to me...

