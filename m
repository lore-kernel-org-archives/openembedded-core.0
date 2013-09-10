Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 20C7A6BE31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 09:52:05 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cz12so4445446veb.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FLI5LjVXYXS4BdPHS/C8RBI+/uqptrcbYG8qGywvKyI=;
	b=bllPZFPruAvFXsdHnG63Vj19I8+BsD+DaZx8pPTXDoUBWHSj+vg2DBAaLtgUwOy77G
	hD72LS74O5PAd24AmSjsXvBaaHZeT7nUxlovLwzDjaGEhKVmVtLKIves8RTnPnDJCKW+
	5QvhFU3M1b818MWUNw9ZNN2lJLQTC0TxmUYCzl2dezKffedNiIeHmBbUrKHA5XXmap+u
	YuC1Gw4zWuH8skXsMDBfDyqRK0yyvGJrGSuhtwznjNi7wlyybP0OtjXbCpopOyKY+9Ix
	Z5nF9ALbRwPT8DKeAR2xQZ1md4UodrPi23C1YKxHcv6Qy6+3DuqWvQHUZvi4rO7dFPdg
	thdg==
X-Gm-Message-State: ALoCoQlAFHW+DUmF54Gd1U03g8/vKqN8pcCS4QpOByU0Ep9WnMPhlC7PirJ5sPkh1CBdkXetF99W
X-Received: by 10.220.43.19 with SMTP id u19mr22032275vce.3.1378806726748;
	Tue, 10 Sep 2013 02:52:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Sep 2013 02:51:46 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 10:51:46 +0100
Message-ID: <CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Tue, 10 Sep 2013 09:52:06 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2013 17:57, Kamble, Nitin A <nitin.a.kamble@intel.com> wrote:
>   This is a clever way to deal with unnecessary rebuilding of mesa we were seeing earlier. With this mesa-gl,
> the mesa also need modification to remove gl from the default recipe.

No, mesa and mesa-gl intentionally conflict.  mesa-gl provides GL,
emgd-driver-bin provides EGL and GLES, your machines shouldn't need
both mesa and mesa-gl.

> Also looks like there is a need from community for mesa-gl-lib and mesa-gl-headers, as some
> platforms need just the mesa-gl-headers and not the libs.

To be honest GL platforms that don't ship their own headers are
*totally broken* and using mesa's headers is basically the same as
crossing your fingers and praying to $DEITY. Platforms that do this
need to be fixed, not worked around, and taking Mesa's headers without
editing them is just wrong.

Ross

