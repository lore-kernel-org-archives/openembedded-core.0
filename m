Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCBE6080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:26:56 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 63so7412959pff.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 08:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=gSMsfUnUIjMx1LPTkU1KTOxJ7D2U6lwDXX7p8uvynbU=;
	b=stVmx4Mktox5xm+FuRPmRmGCbqHCWwuHL+g8jzG85yuxhJXwBFe1ALsYNVBd/whfar
	1iMvjr6YORLp9FBehrHp2B72J6Z7yp1wgE+YNnIVt9/jPjPRNojXMvMr16jqoLaX7WAD
	ymjKNv8WKD+L8G/SbvLRn8VEQi1T+4WEZAfSgtUe1x0XGuDJTuJcO1gSTBLbzUC+uUwb
	shBXdB6Igqg1wIkuWoWyMIojr7WCH4eolyrH78ESZHF8739e2S/zcxXGeoTtBPjyb5WR
	/eMSRayE/NGu9wVeVSdC/gWPShe+7VtLmiN7rwnDLRpfS/00TyLviJ5MGsaCyAZ+x26G
	leOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=gSMsfUnUIjMx1LPTkU1KTOxJ7D2U6lwDXX7p8uvynbU=;
	b=h49BiQVuYDQAw3DrJ0l9i6JF71Lp5BDo3bYOjqic2YvSv4VdopXQCYLHgzPwHHfneI
	vygeMWTEEaMtGHOXc2bsjDgYOi6Nra1JvisoCA827l1GnKGLE29NS3F9dVRnOnevTbpr
	IhG1eFTSoDNnUBnBjhBVQs1u9CnAS6NGMiiJsMPF79mOJigZMO8qkwbnNsC2hNAGoogf
	rsCwxwu0KsOAvgDTMcOwalL2KD8fPX2TAHSK9dY3ebKc5Xeu0gb+8fYR3AZQDGQ8duQs
	m/9AngCQ7N4RGT1zgF2LNUTwwNMUiU1krS7fUEypKpLFaMbwZlNf+ujxZyzBEBSebNQH
	hyDg==
X-Gm-Message-State: ALoCoQkdBjUIuIFU5cKm3h1qaKiMDTBB2oAQuzUCqpVs0lKorZ9BHq73KxEq587VCnYGV0LHqlW2sAK0nminr5QhQLWGFU5/Ug==
X-Received: by 10.98.15.67 with SMTP id x64mr46414423pfi.67.1450196816927;
	Tue, 15 Dec 2015 08:26:56 -0800 (PST)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	q70sm3331817pfa.12.2015.12.15.08.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 08:26:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id ur14so7255833pab.0;
	Tue, 15 Dec 2015 08:26:54 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.221.228 with SMTP id qh4mr14402934pac.68.1450196814612;
	Tue, 15 Dec 2015 08:26:54 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 15 Dec 2015 08:26:54 -0800 (PST)
In-Reply-To: <567039E1.5000205@linux.intel.com>
References: <567039E1.5000205@linux.intel.com>
Date: Tue, 15 Dec 2015 14:26:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrRaak7oo5F+u1-g5LwZE0TBAb3GiZ9WuGiKXqXu90Y9g@mail.gmail.com>
Message-ID: <CAP9ODKrRaak7oo5F+u1-g5LwZE0TBAb3GiZ9WuGiKXqXu90Y9g@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Tue, 15 Dec 2015 16:26:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 2:03 PM, Mariano Lopez
<mariano.lopez@linux.intel.com> wrote:
> There is an initiative to track vulnerable software being built (see bugs
> 8119 and 7515). The idea is to have a testing tool that would check the
> recipe versions against CVEs. In order to accomplish such task there is need
> to reliable mark the patches from upstream that solve CVEs.

I support this initiative and I also second the preference for the tag
in the patch header. It is easy to add, grep for, and simple.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

