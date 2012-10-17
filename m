Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOUBp-0008Lf-1Z
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:01:41 +0200
Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 06:48:19 -0700
Received: by mail-ia0-f175.google.com with SMTP id b35so5408856iac.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 06:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=+KJHLgIoWWf8j/dJO/kQE4GKuK9d5+oZilcYcqdTsPM=;
	b=bntQTMpsE3PYwVGB7cDKcfh2cQf1nZdv+ahz3JQECA/NV3uNN/RYkaUfIfJHdlVKat
	YZjC931H1NM3CwMIFTN7b3cnp4OtcBj52r/EHhfM4SJmOkF6fQ008cLviYrHr/VorraK
	DKendUlzH61BUK3MW7rPdtToRIenMb2QkIt2iqUDn3Neknv0ZqTYzY3umUEmsnrqDoDQ
	sqb3HUNA1Btk+uSo3hQVAzn75ALP0jw987dYRmt0YaFs1k9l2F6sbAQFJo9FMUNewcR+
	sOsf0zr0C1g6CEJ01xTtYl279STbDcelmptCvXXUkkW+Al6O5GZbnh36EiO4dbBZeAaq
	dIrQ==
Received: by 10.50.220.229 with SMTP id pz5mr1518315igc.67.1350481698484; Wed,
	17 Oct 2012 06:48:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Wed, 17 Oct 2012 06:47:58 -0700 (PDT)
In-Reply-To: <1350481324.3259.185.camel@phil-desktop>
References: <1350481324.3259.185.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Oct 2012 14:47:58 +0100
Message-ID: <CAJTo0Lb2gv_VJ5jzbfCcebkhUpgDVR-MsGq_74c1_SPJph_OpA@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQnSQAVsyC3m7ghknZXWiEsCnMfSFbCUh7+pUZQjNWtX0hePiTFt2mJ8+Hs6ZaBnOy6R7Y9n
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] autotools: Don't install .la files if the distro doesn't want them
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
X-List-Received-Date: Wed, 17 Oct 2012 14:01:42 -0000
Content-Type: text/plain; charset=UTF-8

On 17 October 2012 14:42, Phil Blundell <philb@gnu.org> wrote:
> It's not obvious that libtool's .la files serve any very useful purpose
> on a modern system and they can be positively vexatious under some
> circumstances.  Make installation of this stuff conditional on the new
> "libtool-garbage" flag in DISTRO_FEATURES and backfill it for existing
> distros.

Hooray!

> Also, perform at least a perfunctory cleaning of unified build directories
> when reconfiguring since many packages don't have the right dependency
> rules to cause a recompile when this happens.  Making distclean is not
> practical since many packages either don't support it at all, or remove
> too much (e.g. polkit blows away its documentation which causes the
> subsequent license check to fail).

Would you consider splitting this into a separate commit?

Ross


