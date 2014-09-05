Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 14D41713DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 16:56:58 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id w8so11052710qac.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 09:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9lM6U6E8rNRDndoxCzi55IH2mYztLzhAHSpiLUNiSQ4=;
	b=brut/CIxG5UAHjIVnPdVgACsTzkmPe7DfFcdy+0bK7cd3xUZnmKcPWrjNjwmP6y8az
	NG7bvJu7A5DnKGnshmvMPfQp/howsVU/AG/U34w0EHwN4eADKNzKs+ujqkiKZ3DtqgZ6
	cAWbuCA13Y/bmwZRVwDJygFjEhdCWjxJDoBMQeielTkPNwlzzqbbXb7XqXH2ZclLK/hJ
	m2qkefTaWC+5r0Fp1kcL1U2RQ2F6jnz/o4Ga7ycRccklP7USKsJZEEfL47/WEBwCcP1I
	UNCoSWd+gG2YG4liRHjudphcbp/WyBx4jSrY25PVElCiG54V8E9DopQOFIIIrMeLMG3H
	/iGQ==
X-Gm-Message-State: ALoCoQmSPoN+ts6WajqmsfcWZMtHCYw/d10E5L3G5q9V9TL+mhDVOdOx2uDThU5tHglm/kAs7ycj
X-Received: by 10.140.97.131 with SMTP id m3mr19456129qge.80.1409936218781;
	Fri, 05 Sep 2014 09:56:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 09:56:38 -0700 (PDT)
In-Reply-To: <1409236987-31568-1-git-send-email-muzaffar_mahmood@mentor.com>
References: <1409236987-31568-1-git-send-email-muzaffar_mahmood@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 17:56:38 +0100
Message-ID: <CAJTo0Lbcmk+eRyVJwBch9Qu5XYA+Ps_5u7r70jcagVK4vboMDQ@mail.gmail.com>
To: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
Cc: Anant Agrawal <Anant_Agrawal@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: interrupt streaming via signal
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
X-List-Received-Date: Fri, 05 Sep 2014 16:56:59 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2014 15:43, Muzaffar Mahmood <muzaffar_mahmood@mentor.com> wrote:
> aplay/arecord (alsa-utils v1.0.27.2) cannot interrupt streaming
> via CTRL-C. Fixed the issue by reverting buggy patches and
> properly handling 'in_aborting' flag in appropriate functions.

Applying patch alsa-utils-aplay-interrupt-signal-handling.patch
patching file aplay/aplay.c
Hunk #2 FAILED at 1929.
Hunk #3 FAILED at 1972.
Hunk #4 FAILED at 2021.
Hunk #5 FAILED at 2060.
4 out of 6 hunks FAILED -- rejects in file aplay/aplay.c
Patch alsa-utils-aplay-interrupt-signal-handling.patch does not apply
(enforce with -f)

This doesn't apply against 1.0.28 which there's also a patch for - can
you refresh please?

Ross

