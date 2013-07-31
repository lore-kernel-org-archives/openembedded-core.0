Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 426CB6A59F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:51:27 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id d10so443457vea.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 01:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=d0pQ0hOBfGefdAUtUaP/ITrfKiwnTGMbcO4XAlgBw98=;
	b=N2+pfxN0xrdt31rFuYry+q8hgwbEjgX1sR1k3ljiSjgiXlWGUQC7yb1sztxms5kH4L
	GJw58/0RBXRP5smwVOv0GsoKr+s6SJMlvR3+SXHLcA6Q+T2LQTBmL6fnpcA4mdCcqgI0
	3xW7W+bGOiORyiUGCtmEqizydTIqLgx6G9G5nkR/ajiXbQ/6Pz0aeoOzGDan+pKrJ4pm
	IuawKZo5lGPRiAJYdM9J/8uY2HheEzdgNBQ2jV8Dl1zBju7bGSqhgLeC4GPtJlBVsC+e
	lkupUy9eOBPV4JEejDeWUKCh3ajb14FztEsJLRFwtpRDY6GBb0k073HpmsBYxH42MLzF
	M03A==
X-Received: by 10.220.1.9 with SMTP id 9mr11406336vcd.37.1375260687609; Wed,
	31 Jul 2013 01:51:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 31 Jul 2013 01:51:07 -0700 (PDT)
In-Reply-To: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
References: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jul 2013 09:51:07 +0100
Message-ID: <CAJTo0LbO4f_PU+ecCVNT-AWiOcmVeR5ErXWNdmw4HrJaxe7bUw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQl5aJBbIkuiRLcLtIvTRmkMUaFKXGpcjSNC94yroBORirAmZK4DAYrbILFh9x2sAxAjkK5+
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 08:51:27 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2013 02:11, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This allow the addition and removal of distro features easily. To add
> a feature, use:
>
>  EXTRA_DISTRO_FEATURES += "wayland"
>
> and to remove, use '~' prefix, as:
>
>  EXTRA_DISTRO_FEATURES += "~x11"

I'm not sure I like the use of "extra" and "remove", as they're
contradictory.  It's too early to come up with a better suggestion
though. :(

Ross

