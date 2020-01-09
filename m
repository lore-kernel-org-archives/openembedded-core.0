Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 39B507FEB7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:55:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so2930369wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=icGp14sr54nGrHIK9Q2mUBD+uxEEniHeUCgVpCsIAuE=;
	b=DFh0XiCFsETrrDRfv98th8uKUtIx7LVD6EFhAMmW45QA9BGkx4ewC3PH03HVefWm2N
	/YuAhoPRWtDZUDtvvDFrhXHZhs1f66O9LauU9dMBWC5DstdPI+naqevpohND91s5w86X
	7fFMfw0NUc7fHNJRXvgtCB10siPiaqRgqZ3Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=icGp14sr54nGrHIK9Q2mUBD+uxEEniHeUCgVpCsIAuE=;
	b=asLIPHK8smXhakqKa9IKQR/iHzBl7oKF4y5OqYeRj2sM4J+ajqw5NfeswxxGndmJME
	oF3ObbpO4SK3mCqmPAaxPsiN/b+lL0DQCZTrAUEnueJuRMlMcFmDntSXW+kKnMJ6pED+
	fM4OQfYgrzeQ4a0p/trEfpFIGy8ByfoeFCnJJSBarHl1EX+VXk4OTsno2WTjzaaNScfX
	yyWXvWqdJLLtTFexi9y0BYSStEyqjH0I02tHbXB081z+q6Ui2OO+lbeXpZvoBgPpbf9q
	o3zaMclDn0ujPzapHl3N48dOGSmMasq/Cmu0H9v+Zw9vhoGxxubZEvoFIprUEWMDO8eo
	wrZA==
X-Gm-Message-State: APjAAAW9uYgvDoP678Ffbis6ZWQjzY3vyHHYSCurFegdonRHGK4QmZtl
	Qc2IAbD+zy7GcIcZoM5PMK9XgA==
X-Google-Smtp-Source: APXvYqw1/Y8DknYTqBhKZuwHsPAGToSzjNd3atun7VuA+j7S8RUCZ5fhGC8ztjk8fsXqv1aOyysSug==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr5160449wmi.107.1578578154178; 
	Thu, 09 Jan 2020 05:55:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g25sm3948611wmh.3.2020.01.09.05.55.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 05:55:53 -0800 (PST)
Message-ID: <e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 09 Jan 2020 13:55:52 +0000
In-Reply-To: <CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 13:55:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-09 at 14:54 +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 14:47, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > I had a closer look at how and where ifupdown recipe is used, and
> > from what I see it isn't:
> > every configuration is relying on busybox to provide the same
> > utilities. That's why the failure is seen only in world builds :)
> > 
> > Should we drop the ifupdown recipe?
> > 
> 
> A followup: there is a busybox-free set put together in meta/recipes-
> extended/packagegroups/packagegroup-core-base-utils.bb
> which includes ifupdown only if systemd is not in use.
> 
> However that packagegroup is not used in any images, and the only
> test for it is in lib/oeqa/selftest/cases/imagefeatures.py
> which does enable systemd, so that doesn't pull in ifupdown either.
> 
> This means ifupdown isn't runtime-tested now, and probably hasn't
> been tested for a while.

That may be but I think this is an oversight, not an intention and we
should support busybox-free images...

Cheers,

Richard


