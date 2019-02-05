Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A644B7C0FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 18:26:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r2so4721226wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 10:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=F8zqBMSLFxxKrJHeSQLVwqurqQvj5pwr3Lf7UHI+UDw=;
	b=cj2NVvyO876ICl9i+lv5q3O92atwmbjWhWd+EpXFJoj5b8nXl1iqA3lw5z722w6OYP
	mQs3SuUSZpSzibrdrtQ0Z9IN5uYVsoqAhAS7xTlgqINzUCXkB0KEhi3/whVc+N/3rxub
	MGHdcuZNU5CahmyYOSFuzqpzoSDhlBeU8tvq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=F8zqBMSLFxxKrJHeSQLVwqurqQvj5pwr3Lf7UHI+UDw=;
	b=p7WIrcWREd+zdBDGRtq+L6+Xn0j3tUynmhSGL1Chm8UGyN7nV9e7wkUVDvBi3qSs82
	2pGymU5xm04KFIAjnK1gRnbDT0yhNYq5QidTzuuuiLeHuTHS+y1XqTKc63QHK48Whe1t
	thMeonmberR1qND6S3gMehQeaX1wSEaZQR4NYdjC/QLTRXPdUZG9aCb5CBJ1hsM7nhQY
	2nii5lTX5YTaM3uZs8LqVadw2LNt+Jb23UmTvArq0rIevSAGXU0cRp1U/Vi3bw7WKmE2
	jqt7rLjAZ+qOY8viC7VJ78JVRtwwc5fDN2ya7oRzNuvGelZo57eKEsbXhJHCtyN0EiI7
	vb/Q==
X-Gm-Message-State: AHQUAuas/X4ovY7c1AIL2S2com8K1er/YVd6QwX4gNxIli90wEZ2hbst
	x9hMuZJNdIVbw/D2A5eqRYg3HPpyalg=
X-Google-Smtp-Source: AHgI3IaGi8c12arqwwcBK7OVsn/kdbEFNiMCbpsZ5QNhXDg4WlEBfSWagxpr/Ewmlz5UXWesUriJnw==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr4589660wrv.247.1549391169359; 
	Tue, 05 Feb 2019 10:26:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z5sm281056wmi.15.2019.02.05.10.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 10:26:08 -0800 (PST)
Message-ID: <e21a184451ce71b68f8cbfe7abf26c583189a7e6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Feb 2019 18:26:07 +0000
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v6 00/13] util-linux: one package per binary
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
X-List-Received-Date: Tue, 05 Feb 2019 18:26:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-02-05 at 02:32 +0000, André Draszik wrote:
> v6:
> 
> This version now also builds nativesdk-util-linux fine for me.
> 
> * introduce patch 04: util-linux: fix packaging nativesdk-util-linux-
> lib*
>   - this is to fix nativesdk build failures triggered by later
> patches
> * update patch 10: util-linux: simplify meta-package RDEPENDS /
> RRECOMMENDS
>   - make sure to walk each bindir only once, to better
>     support nativesdk and usrmerge builds
> * update patch 13: util-linux: final cleanup
>   - commit message updated

Thanks. We appear to be now onto runtime errors:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/260
https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/260
https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/257

Seems some util installed into -lsb images (and full-cmdline) causes
some getty error?

Cheers,

Richard


