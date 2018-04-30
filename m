Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id EC3756086F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 19:57:32 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id t27-v6so8460241oij.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=jDwWvvO5RbFlSKvuBvuBD2gxwkI5WVkk4YHEwV6F4Dw=;
	b=Q2gIgmlsSe3VjlMDJocM7Z8NpZnim+r2uMKf3zz0yDg3b1/R7yi9pOhsq6H1j63muv
	VZK1xvexaalYQ1JE8R2KcNtEBg6A/y2myyoNLwj0+4AZPexBsU61Pp76C1FbzljPQbHs
	BRtB4cplsfCEkFei1SDY2Ug+PiHMIE80cvOdcB5ykO8NWoKMD3nYaQc+4WPEedap+ruR
	fHjiteDLfON5ZGIUUub6X1LwaxdynwkNe8Dc1YkUzHWN1TjlWkGkUyufPWnDrh9Pzz74
	yQLBRO8wH2VFzDakhbpVtWR7c9WgQCweUQux2CN6U7bQs/knbCLKlR4WAF/AhJW9t8Y4
	58yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=jDwWvvO5RbFlSKvuBvuBD2gxwkI5WVkk4YHEwV6F4Dw=;
	b=JQgGQErQH9KRWax/Yr61AOjdM6sGyWwC4thOXhJbD2d3OX/tnSGvNj/Ek+U0BZAXch
	S2536t4rigcHy4K4VnPwYo6rNqNs9orj1TpOqJlH6QNHydsqRQDMKdCG5GzeHeFtuBEF
	Wze+y/IPJcYL/+2FiK+JC3D/ZpnGnk+LjfuC2Y0iuJ/Hc2LZ7EVxa+ZrcrhcPryTiW2P
	PFQ1s9nnDdKvhsiD5og/C65xO/9DzCNSOZaopTNSWkxmcrzvBn1pkirqLVhVc9nXE2KC
	Pj7Rjw7Jc6oHRCeZ8JVxmLKZ5hVheBbhAXuRgfCSWna3V48AVqk4L4wEB8lgknMo9Pu3
	WBHA==
X-Gm-Message-State: ALQs6tBHimv6act7SFS+NkLzKUw6aGL1pSASp94Epm9pJWiBjSYjDkQ0
	XdbCZFxmfMNd1Z8j8QY+L3Ly8dqf
X-Google-Smtp-Source: AB8JxZoU9R6KVfkl6rV5BQWeR8OjgTJIfTYwhfduv3lyFBQC0sFGP7S1SRFmW7ep2C4vdEmj9xFKVA==
X-Received: by 2002:aca:6501:: with SMTP id m1-v6mr1991347oim.0.1525118253341; 
	Mon, 30 Apr 2018 12:57:33 -0700 (PDT)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170]) by smtp.gmail.com with ESMTPSA id
	c11-v6sm4672822oif.40.2018.04.30.12.57.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 12:57:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id n1-v6so10840736otf.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 12:57:31 -0700 (PDT)
X-Received: by 2002:a9d:53cd:: with SMTP id
	i13-v6mr8725106oth.181.1525118251061; 
	Mon, 30 Apr 2018 12:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
	<f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
In-Reply-To: <f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
Date: Mon, 30 Apr 2018 19:57:18 +0000
X-Gmail-Original-Message-ID: <CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
Message-ID: <CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 30 Apr 2018 19:57:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 4:53 PM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 04/30/2018 08:25 PM, Marek Vasut wrote:
> >>>> Isn't it possible to solve your issue in the OE side?
> >>>>
> >>>
> >>> Can we NOT compile DTC alongside U-Boot somehow ? :)
> >>> That'd be the most desired solution IMO.
> >>
> >> Yes please. Can you adjust the recipes and classes in oe-core, and
> >> remove the dtc recipe altogether?
> >
> > Remove dtc recipe ? Not sure I understand what you're implying.

> If u-boot bundles dtc in its source tree, can we use that, and remove
> the external dtc recipe?

We shouldn't. The point in use the recipes inside OE-Core is because our
bugfixes, patches and etc are used everywhere. If we use the bundled copy
how we'd fix a host issue for example? Duplicate patches?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

