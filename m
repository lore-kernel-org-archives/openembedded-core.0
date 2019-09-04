Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA3597F27B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:54:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c9so283232qth.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EbvkZvBT5yWEQIODAsDCmydqwQ5WR67IOCcyz8RKksE=;
	b=ecHP5PMIoJvyF2Bo4XN1ekoYAyxMAO9wJqHUMFaR7b1a/xoJwb7xz05H5Ea/b9c+53
	wcNnvsznJFRQM5Kz2CRg/yRMVpKM6SbpdhW+rlL/3B9bswtGYq2eVzW/2aNVe55T9ujm
	gn6kkQBduLyNWPidTeRE57Kcy7bggRM6qPSYcnOYIfdb4WFk5GSSk2NKRMo8WqxV0aaU
	p9U9/zphqq3DyYwfgBoDSEeE1nUv0LSnGkZviLfUgDEzTnwN14JOii8cMMt2RvHSpWHX
	Qf7Eszi56FeFxHLyv+lX6DjKq4b9iHPsysUids6Vx9gkJAT4xf3XFxokuOiG9uM3UXLx
	SEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EbvkZvBT5yWEQIODAsDCmydqwQ5WR67IOCcyz8RKksE=;
	b=l9Hf99jxkvEvqJe7kg00uEMRN+YsBuynYdjDwuSD1069M5hgBYEh8mYuAgvEXS92Q2
	vuOMEKTQBBdugM1BL9taGJvTKBQ4zwWeG8eZ4nTsJ+8ARC29zLEbCam8viNMZDHrqQer
	rrnhSMSaIGR4s0mTmA1p3zulb8n1wl3L2P9z6zx9JJJ4mS+PbVBENvjZNv/mAHdhS1Uh
	9Ggqp3U76x+JBEPgJk43ZoCCSxRndfMdk/gBqADThwY85tvgoCXLcTAfu6yy+ln7Fvby
	lk1yw0T7BrO2slApyDCXSTg56OeMEwUIuSupYd6jidD9kNU01BHheBkNt11vJuifK6iT
	1iBg==
X-Gm-Message-State: APjAAAWmcr2HIrb5YNsHZRJkjY4BQQOSrE0ErYtpysoDXd4rvbdT/+FE
	sWmGLSqy5DwIKlanFBF7KwaNqfk68n9FnrT1tBg=
X-Google-Smtp-Source: APXvYqwqDAGyxVLUL/Jp4plFs8WoRFE/ocr7cbdUAHsbFluDjqTpfx9HhI4Z13puCT/GtVoeVddPg1l8JctN+b01kC4=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr32596818qtn.378.1567623261323;
	Wed, 04 Sep 2019 11:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190904181009.8374-1-raj.khem@gmail.com>
	<20190904181009.8374-2-raj.khem@gmail.com>
	<CANNYZj9k5pyYnXj5gnrazMV6WBjJvKOQsGr_cD7rY3-Z-k2wMg@mail.gmail.com>
In-Reply-To: <CANNYZj9k5pyYnXj5gnrazMV6WBjJvKOQsGr_cD7rY3-Z-k2wMg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 11:53:55 -0700
Message-ID: <CAMKF1sqTS2xn=dEtM5a9vd+KUP15HPjqi38BWz4g9DCejuWP+A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python3native: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Wed, 04 Sep 2019 18:54:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 11:17 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 4 Sep 2019 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_BINABI}"
>> +export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_BINABI}
>
>
> You need to explain why this is needed. Where are these variables used?
>
> Also, python3-dir.bbclass already has all the needed settings, so please use it.
>

sent v2

> Alex

