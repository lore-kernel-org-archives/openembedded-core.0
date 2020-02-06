Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D551860B3F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 09:03:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so5368849wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 01:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=7MWXxWw6oUICvO/an/7MONpHXFsSWGcU6t45XumH+X4=;
	b=Npma+SXgG3L7f4aFJLts2DtdcI5Lq6g33txxikP1V2AKB7faHaO8lTBhSYyH62yVED
	tjDMZBP6hTAnBqfOuTV/6DoBKMc2Qo+v4rnb7vxAGgJYLCvbD9NoP0Jk5gjCmK0iSpPj
	CmB1e3Df9z+VC33Dv5dEbVLagNXH2iQjuEqpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7MWXxWw6oUICvO/an/7MONpHXFsSWGcU6t45XumH+X4=;
	b=e8GWChWKn4YxDHIVO97lqtUHehz8b8itu0Z16EMo83usNQErprGUjoLF97qJy1iknh
	7XQEbxaLDfdf2s1vGZ7PE3MdZYbXRxORRt+CIjaeoDP65O1w9hqUCY3WTXU61OO6EZ6V
	5VLd5udsWmxoHpGmBWMItwwGoMckE5wyKzXGktkosJ+tSKKCoE4ktwHTxuLWs2dv6KEv
	BW6sjKfEqkppVTZoSeixGhzxDp553YdYiqE7Ey2GE93p6iGYsJGAQ+Q3+QV1OCgA8LlD
	DrSu/4tFpadQWUI4aIW4jWJBMXh20vzfZ2XcmHGA97QnyhXC5uEg0kd8Rkw4p/EEiSCt
	6TCg==
X-Gm-Message-State: APjAAAU6PTSr+NcDe2NigZf9xkszUOG/DOtZZkT7HsNDuzI2+C5NYtlx
	Lho7Ljla0Wd+DDhR8C9PdWBiLA==
X-Google-Smtp-Source: APXvYqwlPSMb+LgtqIsv+aQUgi4+mVRXXirMQvSN0CHM+XGf4ZdWGf+vby5/n5l5f8x1hkBA5wxziw==
X-Received: by 2002:a7b:c774:: with SMTP id x20mr3248516wmk.67.1580979837364; 
	Thu, 06 Feb 2020 01:03:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b67sm2937229wmc.38.2020.02.06.01.03.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 01:03:56 -0800 (PST)
Message-ID: <81d55204978a296d27ecaff359d270dfc0f473eb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Date: Thu, 06 Feb 2020 09:03:54 +0000
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 06 Feb 2020 09:03:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

On Wed, 2020-02-05 at 18:12 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Hi all,
> 
> I've kept the v5.4 content changes, as well as the kernel version
> default
> changes out of this series and instead focused it on the collection
> of
> kernel-yocto and kern-tools tweaks that I've gethered over the past
> few
> weeks.
> 
> I have Martin's gold linker fixes included, as well as the re-org'ing 
> of
> the linux-yocto tasks that Paul Barker did to make it usable as a
> single
> inherit of the bbclass.
> 
> I also have a defconfig detection fix included that was sent to the
> list.
> 
> I was able to confirm that my configuration was the same with this
> series
> enabled, and I was able to boot.
> 
> That being said, I'll keep my eye out for any AB fallout and will
> continue
> some more build locally .. but I wanted to get this out today as
> promised.

qemuarm64 seems unhappy:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/1524

(the builds on the arm native machine also failed but it looks related)

I think everything else passed testing for this series.

Cheers,

Richard


