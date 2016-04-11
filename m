Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEA265CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 13:28:10 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id c20so124123721pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=j8ftb8C8ArRoAbVf4OHbS+8QZmxWv9iSWv3qtmJbKus=;
	b=kefIRlH4o9v02RdwLjh7LmaK9LcGyrF0/ufImWqC3x20P0yYuaJJBdehbLjRA46RlZ
	c98M+JHDICQ/baHbdXzmhbECMY6xM8W8v/SbhV9hRq1tYrl92+fRjQZ9+BlPewABJx9f
	4G21PxNTmPa2xigWk5fr7xYo1/q0cg8o9eT48Z3vA7pBfB1s372xnu02ErT98ZzAO4aU
	p1PejggdoeTFaat0zMtRu2n8ZKjrjm5EP4zEynOeKA/bdgEPQzRRFWVSk9w5ZBRovyL7
	KWeMuxD9JScVo+t/WaTDvFsYkDxvKv36Hv2ew4OP/DnXQMQj+qGY6ngLfqiM2SFioOUE
	Yy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=j8ftb8C8ArRoAbVf4OHbS+8QZmxWv9iSWv3qtmJbKus=;
	b=Dp3Ue0oz2c8xD43cuL/iHNz1PpXoe+iu48JAWpBpreet0ZvPlU5wAQpZ0WTJ/+Z5Aa
	n6Sg+X9F8aTqphx8Hdyuj72jDH3cfx/+OJF2rtuvK7epQk1cwyd101wWFsCW0W1QwuOf
	GCGv7GmyvgkmO+gRsUEPAFiFwmTgPb+7Wqqd+RGMIQvDNLOk6a2JJ9b55LlEpjDZoEMP
	3fpoEYCvkEjmSy+FE67c6hhZ7aP7gWvu5l7BNl72LWHlzyA+lIMkk1INTjFsusK+l0wD
	a2BWNC2HmfNh6E9XKZTTBdeuirgoKKdeyxERlbBM3C5a/tYQoO9HvdOkGzsvJBDUhzZF
	UIJA==
X-Gm-Message-State: AD7BkJLu1PbuyJr9Is53300/znNSOMGiv4g3ighpfzw8NGWE464mWPeafCyv7csi5iveUw==
X-Received: by 10.98.80.150 with SMTP id g22mr32759325pfj.132.1460381290898;
	Mon, 11 Apr 2016 06:28:10 -0700 (PDT)
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com.
	[209.85.192.172])
	by smtp.gmail.com with ESMTPSA id y3sm14946300par.2.2016.04.11.06.28.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Apr 2016 06:28:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f172.google.com with SMTP id 184so124334542pff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 06:28:09 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr32799375pfb.141.1460381288953;
	Mon, 11 Apr 2016 06:28:08 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 11 Apr 2016 06:28:08 -0700 (PDT)
In-Reply-To: <1460232711-23433-1-git-send-email-juro.bystricky@intel.com>
References: <1460232711-23433-1-git-send-email-juro.bystricky@intel.com>
Date: Mon, 11 Apr 2016 10:28:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo1b2o4LaMPmnrLg=Mz1NEgE2fCpXBrYyVooDMuBBAJmg@mail.gmail.com>
Message-ID: <CAP9ODKo1b2o4LaMPmnrLg=Mz1NEgE2fCpXBrYyVooDMuBBAJmg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] build-appliance-image: Support for VirtualBox guest additions
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
X-List-Received-Date: Mon, 11 Apr 2016 13:28:11 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 9, 2016 at 5:11 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> Add support for VirtualBox guest additions.
> The additions are built inside the Build Appliance VM.
> For this to be possible, the environment for out-of-tree kernel module builds
> must be present and set up properly.
> A README file with detailed steps on how to build the guest additions is placed
> in the home directory of the user "builder" as well.
> The main purpose of the guest additions is to allow sharing folders between
> the host and Build Appliance VM.
>
> [YOCTO #8073]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>

We have guestadditions (without X driver) supported on meta-oe, why
not included this here and avoid all this manual work from the end
user?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

