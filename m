Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id D43E36074F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:14:45 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id w3-v6so12035259itc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U6SdEo8MpvbDmpGdWOct6rHyOowWQi5b62ADbuQTGGQ=;
	b=yTZ0QEJ5NphNS5iHjWOPc+l5eJob1vmTxNHef2n2KdJA/G1q8r1Kpp2aCjtRUR+hEU
	Vlxk86uHs2mYNAWzf26aHJT8JlzoA80OAwwBoMgLlYR308FK6a4li3jUDMf2fk0e3f6v
	TqZrXDFclbxBK/HTPnccfsWo0AF8uf9br3HW3zCO97+wntImQcdeC89lQ0vG78AhoDsV
	/Wnwkff3ql6SZrA/hzKLeRWI8XDl6aUOrs9U/yj2IDszFx4f/LBJNmrhLKEJt8M0gtKW
	MWbObDiPfwC36Gx6q6rEKRbeQPL5Q3xSBGaFbVXCEzXF/oUeTkHPMQUTbJdhrhxgSHr8
	m2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U6SdEo8MpvbDmpGdWOct6rHyOowWQi5b62ADbuQTGGQ=;
	b=VmSL/0mOAOTRb16kh3CdSiFL4x5bMrI5w1d7ruoftPaMF944LssRGcfY2Z00qcgL+T
	bWRTCWshWVwmTIjw3eA4E3GOEgebIC9/ol2t0mCaqL8KOGOy6a1eAIAZDnJ/RawPuyOA
	B5AapaCckvgENxOM09l27Tont9vVE01UGCs3Ktp3OTXqth4+C06L1v3URjuUvsMO9OnY
	YyEb71rWRr9gylk6KYx3nfwzDNTqV+UxzeuEGWPv8B8uUuW2xcw3tcue9NfzgHlS5lM0
	E9MTBJZ5qgTGUXiFOoR8sf/ZMETF3LJNdpvVK6DFKWAyvsIZ7leNKEZ/1KrwSDlULG3B
	dsCA==
X-Gm-Message-State: AElRT7EfFquLAv+N/gAZa4BFHCBcC6o5F+LkMrprG6WAimKt4Q2OCkOj
	ryyymBXkOnzOU3b4AFbQSDHElDMgDmHhEN2RmJfgkQ==
X-Google-Smtp-Source: AIpwx49HU+yQML5lMmX8Z0ow6X1g80LVaTNjsYr3mK+LvWm6W7W6hSG3cqSXK5WzV2KmZulHLuavzDRdRQg2v6fVc5w=
X-Received: by 2002:a24:4c0e:: with SMTP id
	a14-v6mr9476494itb.34.1521735286800; 
	Thu, 22 Mar 2018 09:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 22 Mar 2018 09:14:26 -0700 (PDT)
In-Reply-To: <c0ceed82-d9c2-ccea-8140-9f212a10d49e@windriver.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
	<6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
	<16a50e80-4e34-e7aa-016e-12e2b1d32958@windriver.com>
	<bf908c93-3935-e053-e601-445400ff7ed4@linux.intel.com>
	<c0ceed82-d9c2-ccea-8140-9f212a10d49e@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Mar 2018 16:14:26 +0000
Message-ID: <CAJTo0LaTf794zGj82O3nhk_66PcoUDZn=LEZTNBOEyonksj8Vg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Thu, 22 Mar 2018 16:14:46 -0000
Content-Type: text/plain; charset="UTF-8"

On 22 March 2018 at 16:12, Randy MacLeod <randy.macleod@windriver.com> wrote:
> Best if we could pitch this to the meson devs on their list:
>
>     The Meson Build System <mesonbuild@googlegroups.com>
>
> The earlier that we describe the problem and our proposed solution with them
> the better.

There's already a bug filed against Meson for installable test cases,
but nobody is working on it right now.

Ross

