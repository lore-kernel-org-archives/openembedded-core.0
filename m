Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 200E7736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:29:54 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so52184953igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=sK7IsZdthPKN2yUDx2DSi5i/XGjktJzQU/1A4D9itIM=;
	b=gVwR0rEhI9aHicxHF3Lj0tNA0NfpAPkljZiSUTseJnPaE9pFBpHkpLtW9IwmrvsJAk
	AY/46bmCAqq46IsPv2aEDis9VJRDNFVU1SypCWsYYaobueIXWngqwStMJZjeHnRnfuO5
	aDEUKtIiFZDZy0fGw2BG7++ADORtwbat0Tn9Lsh8Vs70LIjpjxuOD/zdaGsWLu7ijXyZ
	HQJFzJvXLipbH+9eGvOVJyIrK6VDmiw691nCMKavbod0eImQJDZTAs010AA3wdVCtuU0
	IYPC0i/Tx0LbQkrdQVTQnGl143IL1IpLfyNuZAtCDO6yoxMN1ZC50/UhpFObjcPxefYy
	Ktrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=sK7IsZdthPKN2yUDx2DSi5i/XGjktJzQU/1A4D9itIM=;
	b=HDd5k/S6/WjhrzFGucjtXVKJ3oZrIxjofx0D2Y5kSLyTmqqP93CqMUFpIRt7pgipSG
	SA+5AQ5sHf1gWcEf92fqMZLQG+I7HBOmsICnak5txG+aSVt1b3AnMheNZBeYYZSh2aPW
	K7imAinds0UKyHZUVcni80cHNLxsZ52b9ewGvCHKZ3uoMG1btqIKPWcoBUEZdW/Sarrf
	tR4IgsADiWaj0MJah1t6P93a81nly/wBRMRx828xYAb2sr3xTqIbAF8NmuMmcBQkJr1a
	ppnmiCCQE27RPFLC/FWY86ldMX1YAZM50JI/Jzz2wPwDV8ND0xuAiu589ONYAVTSj54x
	4b7g==
X-Gm-Message-State: ALoCoQnrjNBkjvolPmwuogcwAEQOHjp6aKkWoSIqO6LxLefBoQEx/K+Ubyu+GXLYkjAd5WveAkdx
X-Received: by 10.50.72.112 with SMTP id c16mr12137980igv.1.1447169394336;
	Tue, 10 Nov 2015 07:29:54 -0800 (PST)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176])
	by smtp.gmail.com with ESMTPSA id 81sm814548iot.17.2015.11.10.07.29.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 07:29:52 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igl9 with SMTP id 9so55737731igl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:29:52 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr4707693igt.5.1447169392351; Tue,
	10 Nov 2015 07:29:52 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Tue, 10 Nov 2015 07:29:52 -0800 (PST)
In-Reply-To: <56420AE4.1090500@linux.intel.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
	<CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
	<56420AE4.1090500@linux.intel.com>
Date: Tue, 10 Nov 2015 13:29:52 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoMdtxRCAhsOHoJoV9wkmr=sUaHgTb5X3zY9h2YpfnDUw@mail.gmail.com>
Message-ID: <CAP9ODKoMdtxRCAhsOHoJoV9wkmr=sUaHgTb5X3zY9h2YpfnDUw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 15:29:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 1:19 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/10/2015 05:10 PM, Burton, Ross wrote:
>
>>     I should clarify: there might be Vala software out there that
>>     someone would want to run in an embedded context. And that software
>>     might require Vala bindings for libraries that are in oe-core. If we
>>     don't provide those bindings, then either the layer that adds vala
>>     recipe also has to patch all of our oe-core recipes, or (worse!) the
>>     person who needs something vala-based also has to ad-hoc-patch the
>>     dependency recipes of that.
>>
>>
>> One solution for no vala in oe-core would be for all vala-supporting
>> recipes in oe-core to have a PACKAGECONFIG[vala], so if someone does
>> want Vala then they just need to add meta-vala (for example) to their
>> layers and enable the PACKAGECONFIGs where they want it enabled.
>> There's plenty of prior art for this behaviour in oe-core already.
>
>
>
> PACKAGECONFIG alone is not sufficient; to build the bindings properly, the
> package also needs to inherit vala.bbclass:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/classes/vala.bbclass?h=akanavin/gobject-introspection-experimental

and this belong to meta-vala (or other). This reduces the core and
this is something we really should to push for.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

