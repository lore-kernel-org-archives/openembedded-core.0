Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US350-0002C8-NU
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 12:25:39 +0200
Received: by mail-vc0-f180.google.com with SMTP id m16so226340vca.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 03:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=K7u6Y2c4Nb54iy+BCIjg94jFoEQgi5orwOuscNeoEFk=;
	b=WFGlk6uvDpIMqtNdq5OBWS9p5/cmME/I1xhoTwKVrbML2TNJgQ1QC9A8TpC+PZCNsY
	s1B7iewT9QD89scdJDkkZl2AMvCdl+CwxNUpxriEFR/LPt768Mokh6tWlLQkv67T8tyX
	7zuJiOr4sPQfDCuboqjuWs7NESva3QSqLWEfaxyLwc5V29N3be7PGesmiUjRmDwGtdyN
	snj125a3ddbszqQjQREVSoH177mu+BIEp8vnlKqtJP+m4qb/hXI2RWH9JA4GtUU61HCe
	0X/5Q6of89wPTRInTDPHSy07UF4dw0RM5a0oozX+xzSXWfzaoQK0Su44xVqJG9lKv2+C
	Vgrw==
X-Received: by 10.52.28.139 with SMTP id b11mr875769vdh.4.1366106888332; Tue,
	16 Apr 2013 03:08:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 16 Apr 2013 03:07:48 -0700 (PDT)
In-Reply-To: <1366069157-3166-1-git-send-email-obi@opendreambox.org>
References: <1366069157-3166-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Apr 2013 11:07:48 +0100
Message-ID: <CAJTo0LbJo8Te2msLtYQAQizQkYqX2sRizq2M03k=0Wh4-YTVQQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQkCCOR/o9DEntCTn26Zgz0GjrQAu0/4FqRpfWsOq668p7j9Tdv6G6fxoCk81omEt5kMrCik
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: don't fail if x11 isn't available
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 10:25:43 -0000
Content-Type: text/plain; charset=UTF-8

On 16 April 2013 00:39, Andreas Oberritter <obi@opendreambox.org> wrote:
> Patches backported from mesa Git and from mesa-dev mailing list.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-By: Ross Burton <ross.burton@intel.com>

Those patches were in the early wayland branches for Yocto, they must
have disappeared at some point.

Ross


