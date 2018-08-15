Return-Path: <nickaein.i@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id B4C1878869
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:35:21 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id q12-v6so412336qtp.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xw2pInbHHF2hCRGL09ENRLD9A1VrShOYPNWo58VLUKc=;
	b=cqNGapn8KVfNYccym2XJ5+c7Cv2q5+jdOG5AgHpPdZI5rKFqH77eP8TApSpiwvB/4B
	xyrKIyMDbIZQTbzRQTlv5VbrNKwG2HV6jpAUL1KtfsvoHmeguJXohoXS4q8MkhUJuSB+
	xtWbPtmIOBv8g4UfY97Ca0bQCUwZ/lZAtW4fWupvBdu5M9SS1OKK99aZqJBnn4DufUOk
	OTOJ63R9OVzNw4en+oXO4Qd5KSChRehv5uhHTkkuo6YzBpQ9M4yO+TPf8vpo/IatpvT5
	+AxAJavhU6o+WVfampFA3Wg3C6twBPPa9g8f4siMvC2+aBJuAXc8JVvRdRd1HN0go9zN
	3FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xw2pInbHHF2hCRGL09ENRLD9A1VrShOYPNWo58VLUKc=;
	b=PwSWCAsS8QfWipD+/I6EHO81QMj5b8Ug3mg8CmI9sGTNOxu3AxB7Sj6yOFy5sVE6Te
	Shii93egU4o6m9ZLhxdF8kWXaYHsg5dFR070VuEhHQt6PHye45FrBrVW/Ew2NZUz47j2
	+v0WAqRFKUl+Kn6zi57LAwH0lpgeFZF0CIVb9pxGVXWALbpVzhLLMPLlj4ZJ2xHL9tlQ
	m7ZY1HFqRxBrmXlwcJQC+/cQhIzUkBfYmRbnqXQN98RkW7fOb532EagD7hNeI+7/huS3
	L0FYQcmbirutCCIAeVIL5DpwYLPaNJyRoFZzOT9vq4Jw118N5AxEUbxNJZ/D2CvZ/CJd
	HzDg==
X-Gm-Message-State: AOUpUlFANPoZXiosUclDMCHVP/BPEpmfBXvZhQbfhOpACfAjeSFZnM7r
	6b+lwHPml0hcVNPyVv6U2rmHAh3dKCq6iC+FW2A=
X-Google-Smtp-Source: AA+uWPy6OOdIgN/nQDGxUxPVBoMqMenQBm3n8P00qDa9MgNRg1ycFwwiOfal5PMMRH8iB0GwOfy1yLSckhaZ1jgTMik=
X-Received: by 2002:ac8:95a:: with SMTP id
	z26-v6mr25026722qth.211.1534322122542; 
	Wed, 15 Aug 2018 01:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
	<CAJTo0LaSOFApbGM6OpBWhkQUEdPk9qvXy-q+HWyiSVMku7G4=g@mail.gmail.com>
In-Reply-To: <CAJTo0LaSOFApbGM6OpBWhkQUEdPk9qvXy-q+HWyiSVMku7G4=g@mail.gmail.com>
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Wed, 15 Aug 2018 13:03:33 +0430
Message-ID: <CA+NJmkdCRHgRLUZz0bm3sALnCt+o91g=rDG4Rht+Q8H5MVBj6Q@mail.gmail.com>
To: ross.burton@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: iotop: failure, python module subprocess is missing
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
X-List-Received-Date: Wed, 15 Aug 2018 08:35:22 -0000
Content-Type: text/plain; charset="UTF-8"

> Yes.  Should be a simple fix. :)

As a workaround, I added  iotop_%.bbappend to my layer with following content:

RDEPENDS_${PN} += " python-subprocess "

This fixed the issue but I'm not sure if this is the *correct* fix.
There could be some other bug or some other higher-level missing
dependency that could be overseen.

