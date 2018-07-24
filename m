Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id D1C2678911
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 17:51:22 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id t4-v6so2473910vke.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MZ6KUKEi4vz0CoGVz0od9xDsBFqIX38P1geXm2SnnH0=;
	b=UvqiUGL1VaTttYwK4GPxdJ30xWbcYsf8mVO3d2vZPPSnEh48xpkOJf5WtTMXy6kDgl
	5L+dWukmTxyW6dfXgNuBLXROJvYZO3AHQkiyRurQ6cRZoDNmi6KNV1qJnHx/AtqKzjUj
	DStEThRPIbV6dxVKnurELKmGl9AtfcB0WnhvPMP3COdiBIzoI3I4A1zpelRHeU76LoZN
	UHi6weuqUtEdcKeCXMSXy5I413QPaCfqqoLLQUgnBN2wK9VoZRwf0I296DNm1wZ8mVp7
	g/SEOj7AexCf2H0N9HHMgoC3ysKUJKykXPf8JwxbIbSeTcDtpPK0PwFrViukn1T27mTx
	WBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MZ6KUKEi4vz0CoGVz0od9xDsBFqIX38P1geXm2SnnH0=;
	b=hVxk6LaQv3Yc9pR/dGuxlFGG4o8Wguf1ipWQEB501gbitJStAAj0A0avLTuqk4f7Tu
	7ghqksxm2k4MsPgrwxcKI8bDttY82YIdAGySqydDn9zPpWyOBjzzVCdrPmSKuIvM++VL
	PEpLG1H3IbRJ7UWNLVSVMAV4MV4oyvzvrxcSAB02aHCz3OcKpFV1y8zS2RjHRmqPqkyi
	A0FWRDMNRY80qdgo7xD/sJ/c4kwRZokrh0BoYv2X1eJnmX1m3hjzaWuyv/yD89DImtBi
	Nlt+WcJBfcRhv7Qb2VXyIAcmmJYYkahP4CTZNAvLNraEMRnnb+ol/NvVZxski0lXRBuw
	EzAA==
X-Gm-Message-State: AOUpUlEEph3xyHTD917Pz7ZCRs9uqMvlpzH8bnezaGA6ohO4RFMg7Q8y
	eDoyIVoZRPIaa9HGPFelVh45GmfsuPNP8UnU+GY=
X-Google-Smtp-Source: AAOMgpeF9ne+iGU6GYaX6y+A40EAdgEvCGf6KKSIvq9Nt4ESzVkcNCyFT5KDMnylaE/W3xI8SZdPSKIzC9jffSDK0Kc=
X-Received: by 2002:a1f:e847:: with SMTP id
	f68-v6mr11022238vkh.31.1532454683782; 
	Tue, 24 Jul 2018 10:51:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 24 Jul 2018 10:51:23 -0700 (PDT)
In-Reply-To: <CAFeBWL4WvT2CJkd25BVwje6_KvKZ5wquM6+YyPeHzywdMTT_iA@mail.gmail.com>
References: <CAFeBWL4WvT2CJkd25BVwje6_KvKZ5wquM6+YyPeHzywdMTT_iA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 24 Jul 2018 10:51:23 -0700
Message-ID: <CAJ86T=W-DOtSSpBb_tK_XuiPJAxteirR8xeCvWz5q9Hv3Q3-xg@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Setting include path in a recipe
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
X-List-Received-Date: Tue, 24 Jul 2018 17:51:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 6:52 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
> How do I defined a custom include path for an autotools recipe?
>
> This may as well be explained somewhere in the reference manual, but I can't
> seem to find it.

Assuming you want to add a custom directory which is within sysroot:

CPPFLAGS += "-I=/usr/include/specialheaders"

