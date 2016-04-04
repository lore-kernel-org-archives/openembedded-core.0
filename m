Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id A6679763F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 08:46:26 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id k1so171110176vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9oD96POhZcOdQkxoOIUGz4CEitoE8KYmaykMSHqMHuQ=;
	b=TYMfnJXWGrSrj5Owq3Fra4oqMzAysCibKCNdmpjOzFRx79yi1lHEKYdOzIBahVZrxA
	mWyp3HokUtI4xOUorPJyuLnlphxnP2zkjg1FBN84ZE0cSVDN6ZNSxbHSHRSb04/wJ7IY
	/ojPSIUZPgiTONi1DJ0ci/TTKtpzwasGpqjuukqYZO6ReysxA8GtAdiRpivAXL+8sWQZ
	TaoRwIYktHADDno/E+BxRMnt+cD1Q5rVup9Dp970bGysg6ZnyI/jRnSHkxNX17WrdqF8
	+ywD4UNsN+QycNEKhu+aKN6HBafT6WHw9SWQN4hiurp1vjpu03vBcBxlHjIom4ZCbayH
	pCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9oD96POhZcOdQkxoOIUGz4CEitoE8KYmaykMSHqMHuQ=;
	b=SP062mxziF8WDeE01vlXXMEyMq8boKHgZxD8k7DxxwAbHc1f4U0tdPVzDjBXn0f2xA
	utJozQIh68cFAwW5UeU59nbh//i5mZfic5RZ/V/Gx3Gtn2mBJRb5WjenMt6BHOFAmoVy
	u/r84g07l+xX1+bwBU0GMiZAetGBR4hdg39cyWqIQeTylvO3Jpc7KVGvo1as4F1UhhxP
	QBPt3HV0l/wa/xTFW7QSq2oNGVD0Ch7qsIZv7XcTU5DUHgBtosiAHe80/btDJkcyZKg2
	QM3OxlEPkiI6SlQXWus0hoAKdYtyZsjV84wbr2qjgkX1Gb2+Iv5aDnvysB102aKte65d
	wEzQ==
X-Gm-Message-State: AD7BkJIs7n35tUvkoRU5rxEpXAnEiayagH8Q61o4pJP3CXNZe26dIAV0tSqS6u5tFOfgYjSLqONRCUeS8ihv4A==
MIME-Version: 1.0
X-Received: by 10.31.52.134 with SMTP id b128mr3619766vka.124.1459759587482;
	Mon, 04 Apr 2016 01:46:27 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Mon, 4 Apr 2016 01:46:27 -0700 (PDT)
In-Reply-To: <CAEHkU3XvFjr8dCV48E7zvtWPDwJ1Vht=Q02MdM9C+KM0-N=s9g@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
	<CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
	<CAEHkU3XvFjr8dCV48E7zvtWPDwJ1Vht=Q02MdM9C+KM0-N=s9g@mail.gmail.com>
Date: Mon, 4 Apr 2016 10:46:27 +0200
Message-ID: <CALbNGRTvQBVetdm7ty8RQLviYijSP0GadUNUUycAepYWX8iCjw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 08:46:27 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 10:00 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Hi Andreas
>
> I guess Richard refers to this one:
> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/package.bbclass?h=master-next&id=ecb56a6ae0c870af680da03db9d39703b525fc98
> Max
>
Hi Max,

I was addressing Khem as I understood his comment in a way that there
is a related fix in angstrom master (which I cannot find).

Andreas

