Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 591437F0CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:50:05 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id k8so18501034iot.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vK4R8/kBuEiIAZ75dF/GYf9OOGUpnB2T0wi8ZK9dAuM=;
	b=0TJqyFcXOxmZ8lXSz0j+aYifUwRJ3WBHVaW/P2kvsesGeuoCmxOU7TZinisjk09KqZ
	egeSrrxvqqJXV1Gu9Z+AbYPKBvMtiWbL+LdOPJPvd1zD6RF4SzAEne3JkZoVrDeNRa1J
	/QDBiocILeuXspmP9ptMs7Rc/fPe6/ctiM8GARPZGBp68CAnNpkM/lSPCyVRTsec2dYx
	CZ6rtnzBN/VxhiwZMJBLpJp2F2no/fuDkwvQ3qpUxAKPXcacJFe4DG3p9zvFL1jrufqZ
	RsggAiIgHn+v0/i0kTG6BBz++AcceguWmr2YIdBWZd6GIpjmJZtk3mGLNd8O/M67X338
	NGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vK4R8/kBuEiIAZ75dF/GYf9OOGUpnB2T0wi8ZK9dAuM=;
	b=iS1ODE+XjreEYGWD9opkN6OWrRsemrxo9eiGJIdrtfxbwNwEMfCFufd8WRI7ggaZTU
	htgiv85Pdjf/7eVMaVn53xjFbCY7F1SGf9cC6HGaIBWZZgoeSwxEN+M+pJiOwR0AtJSh
	nvEyuCjuGahuYCfm8PelRS01uF3Z1n3garq1EERx4qKz1aLUYcZP69e/ml37JJPl7AhL
	RCBqzvWY0Vsel5KbkKTTQv0LpgnOVJUm2U1uQPTfy5+gCjyJEMxKdF/eYYyZWGJvsWVK
	MBVvrU6ND+V2ZrBm80Tzq6gH+pR3uVk77nrVs2A22OAsxNVSTSOAvbYup6a+WFItfZE6
	32/w==
X-Gm-Message-State: APjAAAW/0Kb6+R+9BtLhxWux1eg7zTZpaOZksRzJYHzvruONN8aSNebg
	Er/9Wy8DZZTagnGAuKASWlIEwE6/L/+090RfuP+ZpRGiTPw=
X-Google-Smtp-Source: APXvYqxB9VILR76mnugEf+B/sh6rc93fz5rxo9fIVRiNzd6gFY1bXpnukP8ZkYgaM6XMm38vA98KVmdt5PuolM1Cfr0=
X-Received: by 2002:a02:a90a:: with SMTP id n10mr9579962jam.61.1562917806242; 
	Fri, 12 Jul 2019 00:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190711235423.23013-1-ross.burton@intel.com>
	<CAMKF1srPCffyPSbQ+_QAd-3rDh4=X8TgDyp0abTPT0fS+9WBhg@mail.gmail.com>
In-Reply-To: <CAMKF1srPCffyPSbQ+_QAd-3rDh4=X8TgDyp0abTPT0fS+9WBhg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2019 08:49:55 +0100
Message-ID: <CAJTo0LZMEU=45FdVhO0dejvd-KoSbQUM70sz-MasxB22TBiD_g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: use Python 3
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
X-List-Received-Date: Fri, 12 Jul 2019 07:50:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 01:54, Khem Raj <raj.khem@gmail.com> wrote:
> Maybe we should encode it in interpreter section inside configure.py
> itself and upstream it.

I've filed a bug (https://github.com/ninja-build/ninja/issues/1601) to
see if they have any strong reasons to stick with python instead of
python3.

Ross

