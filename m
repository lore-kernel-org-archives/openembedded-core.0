Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 65CB16D334
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 14:07:24 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id pa12so51409veb.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 07:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bS9KB8Jferno4xeKoRSPNOI3nexJrhQeegs146Q/EAg=;
	b=hecm7q/U/Y5PwMjD1lVK8o1pd/6SYIEy+in4lDa5d1n03CVO+/6QiWVySWFEUE/EFJ
	4fp7jiinf4czAdiLy0WimIdlPnCDcgP9wa7w3KAfMgDZIGYPCJ7XvGfLmnfnY7SdE+nU
	EdnoAUa2g1tx91sWajGEsZhZzqtD2dsQuUubiDkfaJuUi4ozxTNjfQyShrVscydUEcr7
	a8HPOWyenMp/9miQIECXqv9q/9uKmbsGvbGBI1VgGjcxMmKr9YHcpkYC55+RksVDPWvB
	N8PgNHQRm5vLYCy3N//EcxlWnvxQoQbqOho9M0k9ocH+kT+zIGXlBB1jaLq7KOLrs47D
	zemg==
X-Gm-Message-State: ALoCoQmhrcQ9Uzy+133I8jmJZstb52V+6Aws6LwLS45X926n7aMf2+jGjvguodVGoxexI7/2MRca
X-Received: by 10.220.199.5 with SMTP id eq5mr1270855vcb.16.1382537245987;
	Wed, 23 Oct 2013 07:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 23 Oct 2013 07:07:05 -0700 (PDT)
In-Reply-To: <5267D269.2020701@mlbassoc.com>
References: <5267D269.2020701@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Oct 2013 15:07:05 +0100
Message-ID: <CAJTo0LYaqs00v5XUf+wRtaKytZy1-8VDuPcEyawYU8UXxzPUGw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Mesa mess
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
X-List-Received-Date: Wed, 23 Oct 2013 14:07:25 -0000
Content-Type: text/plain; charset=UTF-8

On 23 October 2013 14:43, Gary Thomas <gary@mlbassoc.com> wrote:
> With the current master (Poky ffb440c37c), I can't build anything
> with a virtual/mesa requirement.  This seems to bring in both mesa
> and mesa-gl, which fight to the death, killing the build :-(

Presumably you want just mesa-gl?

I guess your distro is setting a preferred provider for
virtual/something to mesa-gl, and something else is pulling in mesa,
probably through a default.  Can you check that all of the
mesa-related virtual/* lines are set in your distro, my hunch is that
you don't have virtual/mesa set to mesa-gl.

If the distro looks right then try using depexp to see what is pulling
in mesa when it shouldn't be?

Ross

