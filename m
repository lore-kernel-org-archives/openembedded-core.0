Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8B260703
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 12:13:19 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id cm18so14036091qab.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 05:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=G4rNGJ7rAkgRU8GEpakqSjFe8sPly7UYflT/WLky1eg=;
	b=B3Iux0aZPS+z2DYIFLp60cM75ydquEDlc9gKdjv55jGcNMSL+504UhPNLfmTImf5fj
	+Mvp/HM58RNlLcgZSAqLgnijbH++lLfwpl3qmMFUEVyQzu7Xdlh/ywrIDSTlV/0zybGZ
	Zodj5D2ECgPR5TKzrvJ9J+EXFos4MSv4YrvF/y2hzjZPY3wCxkYf3P6cNCAJBWTauLK0
	1/cwCp7JlSUVqZj7FQ08uQ6lChlP0IrQDmdhCyGD7ahIOSRCC48LD8/mAA2PVGJWO08r
	YfGp9n72+1V4wcc3qylz3ANHaw8fX1XseIfB3QPRpyJfAh2kQKxMGsYZJQcqd9jsiMfc
	YTEg==
X-Gm-Message-State: ALoCoQmmeBDwGNHrJgqb1jYJBUrFVJe+TM22OxyyBnpEc0RYR4e+sqDlepHt4ZDSs4GYm4B34ewS
X-Received: by 10.140.105.138 with SMTP id c10mr39241601qgf.15.1410178400318; 
	Mon, 08 Sep 2014 05:13:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 8 Sep 2014 05:13:00 -0700 (PDT)
In-Reply-To: <1409137928-25490-1-git-send-email-marius.avram@intel.com>
References: <1409137928-25490-1-git-send-email-marius.avram@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Sep 2014 13:13:00 +0100
Message-ID: <CAJTo0LbYeJPJxQEQ7nOq39w_sy6fZ9o2SpahkK+NV8GOHe4MNg@mail.gmail.com>
To: Marius Avram <marius.avram@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libfm: Upgrade to 1.2.1
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
X-List-Received-Date: Mon, 08 Sep 2014 12:13:32 -0000
Content-Type: text/plain; charset=UTF-8

On 27 August 2014 12:12, Marius Avram <marius.avram@intel.com> wrote:
> -                    file://src/base/fm-config.h;endline=23;md5=ad0fc418c3cf041eea35ddb3daf37f17"
> +                    file://src/base/fm-config.h;endline=23;md5=71596f90de8d83df26974967cd6b6730"

Please explain in the commit log why the license checksum was changed.

Ross

