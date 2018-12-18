Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id DD6026C132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 14:50:16 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id z7so4542116iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 06:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CWHMTvg2A/0oD1x31HMY+8vSP6a7PdQooCRkv9ze/48=;
	b=zp6jJIOx4nHNqFbakiusz59ogKf4uKkfY0OpENvPKgusvBjuzySFYpy0SaKtiR25jK
	ijkPtjKN2mxNygMdiNAx1YPpHu5ARkvXS5hmjZGyXwth0qLcLn4geu3iC6go5KQdcVDS
	hM//3dTczPl0ZUKytd9rbkixerxhY1+swiYZL1pKuvDT7DLLrvnEhuYYzODf/brAgprS
	C4wRYXSdkHgmfOwN7ffbAThcdgAUZqHtH9/I5UIWOlFVw3J7QlQ+hicsdNkWMApa0FtK
	9sroe8/kQz+1K/G09tj8dCeL4ylVIqbkWQkV1ZCEPMsasuLC+dsClhxAfjeLguy8ppWO
	PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CWHMTvg2A/0oD1x31HMY+8vSP6a7PdQooCRkv9ze/48=;
	b=UuktRv+2FVatQyZGwEGkLitPGjePzCDmkWxzMiAM4SVSsGfclaHoH90ppmnkpvA092
	swGmBRPoKatfvatoQmuVtUwYhfqCE4GWUyNBZiNm5lLc3hrm0OMfDRyB3fwqAijHR+7Y
	Szpkc27Blb52wgnMcmq4whaBzjFkUJpxMBuo58Sg2a3ohdN+F55DdbD2wCpN/Iv0ADB8
	V6O4dnM2dKFRMe7DPHvab/loX1SyanpFgmuc13KJF4QsfpQeTBPUtFCJieOrG/gB9RQL
	NfvZqz44ZlyHLmgxFYAI+c8mRqVWEAm6KIhEpPvbj2WSv4Is08GW8Ipadu+t559QYraA
	VByg==
X-Gm-Message-State: AA+aEWYiZcRdC9XZwvgGh60WPI+TeIpTPv+Y653EVvqO6xGiI3VXTICE
	X8lPn1ItNobfeU1wvPWniKbyVdvNSWIXm+rhYUf2aw==
X-Google-Smtp-Source: AFSGD/XzlnqqughjVayvm8agYxqmaBrk70xdwse1dYsVeauJ4Hg+vxdVNj3FxLY3HlH/JNfno2bG6tOMkDNU02kRXlw=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr2960927ite.26.1545144617855; 
	Tue, 18 Dec 2018 06:50:17 -0800 (PST)
MIME-Version: 1.0
References: <1545115603-30751-1-git-send-email-yi.zhao@windriver.com>
	<1545115603-30751-2-git-send-email-yi.zhao@windriver.com>
In-Reply-To: <1545115603-30751-2-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2018 14:50:06 +0000
Message-ID: <CAJTo0LYfV4WEv7RD2e=SyFEyhrSaWiTe8gA-fpyrOfKcjYUsNg@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] json-glib: upgrade 1.4.2 -> 1.4.4
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
X-List-Received-Date: Tue, 18 Dec 2018 14:50:17 -0000
Content-Type: text/plain; charset="UTF-8"

packages/corei7-64-poky-linux/json-glib/json-glib-doc: FILELIST:
removed "/usr/share/man/man1/json-glib-validate.1
/usr/share/man/man1/json-glib-format.1"

That would be https://gitlab.gnome.org/GNOME/json-glib/commit/67c5e4fb8a3b8b74bd9c62650c9ee03cdbb7553c.
Please update the flags.

Ross

