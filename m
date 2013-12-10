Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id E3E9961566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 17:21:59 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id 11so759253vbe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LaPmw2baxCj3yLMVGx7gAfhnSBbevg4tlD2x7YTv6pE=;
	b=KQ3PZMgjk8ZgOfbNQJV2+qqdTsIFnSQuJzMz5UjOzQk887yey09vRGBHuZWoilRq7a
	m6cs9DjRiYst9w64vpUR7ORjloC3JDBUmqCefjC9amkcwPR671Li0qbnEM+q46qfwunW
	v71ZnfDhknbDTiCbc0r5jaoSTKoNOM3Y0TUTeuaDhMgXoCm5r3OiojoWtUJhJgJQlBL5
	J/bRWOutpcSsLED+Tcyir3qpvy3qMEvcFVIK8BABC+xPvl7TMH4soiiIUlIDr4V0zJvG
	Cd9arxhmhz6gtRInFl5hAf/3W6jB0cc0e0DpiY4rigyL1fxDlMeeDlAFoCgS6QDzl2o6
	xo7w==
X-Gm-Message-State: ALoCoQlpxuUwV3jTnPakAEpyghdCq5LW0Fu3cYL5h9c7IlWIq3ojl/X/LErY8At5abwWNN2ntyBD
X-Received: by 10.58.37.67 with SMTP id w3mr1391618vej.22.1386696119318; Tue,
	10 Dec 2013 09:21:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Dec 2013 09:21:39 -0800 (PST)
In-Reply-To: <1386695884-27586-1-git-send-email-kirgene@gmail.com>
References: <1386695884-27586-1-git-send-email-kirgene@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Dec 2013 17:21:39 +0000
Message-ID: <CAJTo0LYZ++Jn2A0y1LPtVqJuPZxHQ7waBUPiNA9xbmEqzsTW8Q@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] psplash: add support for systems without mmap support.
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
X-List-Received-Date: Tue, 10 Dec 2013 17:22:00 -0000
Content-Type: text/plain; charset=UTF-8

Surely if your system has a broken mmap() you've got far bigger
problems than the splash screen not working?

Also, we're upstream for this so instead of patching the recipe, file
a bug with a patch for psplash itself.

Ross

