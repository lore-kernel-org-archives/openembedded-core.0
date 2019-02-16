Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64A4871B1D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 10:22:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t200so12113729wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+roPOeE4b0pK3xpuZti5DfTi9Omiztudr8bAYQvL344=;
	b=RffoIjtVeYcR0NZVQ8V33rNUQ9thkeE/1daVZDJ8ylSbRYJFJoN/Q/SAPsH4spzIIN
	aJ69oQq2l1Qg5in+2JRjDFteGnrZ4iGRlrkXzV838kLb8ga78qVnuPpbxA12Cv51DIDc
	P0BRAzGhnnys32pjUYcXPIWt4KfEBEoytCQ+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+roPOeE4b0pK3xpuZti5DfTi9Omiztudr8bAYQvL344=;
	b=SEyExOzYBOFubMLSyGcmGQpW/HsJ8kU1EKCidrIv1dgUMnodMzbh1hivyDmUX3aMaY
	NsR07WVJUrBcgDj7NhITcaLcVYUKinPOPGpCp7+3lxJql8jmNHIuQHHOX7wYw3qZF0g3
	k4CirTVD6sIlsZWZYjw8pINT+1+R1AjhSShLeFeqjifETMpBoq0CUp15t5uEhGV9eths
	V7W5EHCzW6inwcAVpGaHPmqBc02XtDHX7lg+fr1MH0NtIQX5x97/ZMt44RDzBriEHLBE
	3+FVDUZ7ONBWGOJlLV9g1Xx52d5KnSavqIiGXHVoL+uq7bES+gAI28VIVnScq+ewT/xz
	mUvw==
X-Gm-Message-State: AHQUAuaCb5paJyRfMeYWER+wPcLbAxWjipsL4w+fr5Q7+f3F1MmpM1vL
	q8IaGPsV+5hZs1uGFnOvRG/03MhrIsY=
X-Google-Smtp-Source: AHgI3IZsQrfBcv54Z/los5LkoIEebvmvClOJC5xJ4w5KWcwkT+SGsGKzQXPv0e6laDhiHrcp3CBjlQ==
X-Received: by 2002:a1c:a6c9:: with SMTP id p192mr9543417wme.58.1550312554967; 
	Sat, 16 Feb 2019 02:22:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o7sm7176495wmc.44.2019.02.16.02.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Feb 2019 02:22:34 -0800 (PST)
Message-ID: <cc7016c6474ed98f24e875c1e80a93fb024d0b81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2019 10:22:30 +0000
In-Reply-To: <4dff35a9-3309-927e-1155-3cd2ac5a888e@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
	<5753a5096418e3f0800b7120ac4a6c5a75bac119.camel@linuxfoundation.org>
	<47d7a2fb-57a2-1f37-25be-1140a2e038ed@siemens.com>
	<65094bcd2eb9cbd4bcff181e8e6976c893562bf0.camel@linuxfoundation.org>
	<4dff35a9-3309-927e-1155-3cd2ac5a888e@siemens.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sat, 16 Feb 2019 10:22:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 09:31 +0100, Andrej Valek wrote:
> I used the default one, what is rpm. Maybe I can try it with ipk.

I had another look at the error. My guess is that you need an image
containing busybox and bc to reproduce. The bug is dependent on the
installation order of the packages.

One is likely being managed by update-alternatives, one isn't. A
further guess is that bc was somehow enabled in the new busybox. Do we
need bc in busybox and is the fix a defconfig tweak?

Note, this is total guesswork so it all may be wrong! :)

Cheers,

Richard


