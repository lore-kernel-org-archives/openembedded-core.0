Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id 535746BCB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 08:34:13 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id i3so5968791vbh.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 01:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZcfQlBrLzD1G0uzHKnoh1IJJ5uTqqD9vttaew8pyDGk=;
	b=QmuE/1VjzIIx16R12Z/e9gxyqkW+ExFNtgVl7qbVyrmAUk4VURpowLntnPoAAT8B8Z
	GYA1TG8PgEH3OfhWt3r97qZdkaVUqIGibXojtY2aoIhi767x0Amls2Zub0rAgQjnZ2Ef
	GtysqhoWyENV/PdmAXoR84YRNE/NGBZbta2RHAh87iCwxbcpIQSGjI5Mfnv802pYDHkZ
	hSRezgwKErEodbF6D4JOdxH81zjsARfpFph0cM7lzADwW+5DxcgfefhRaE8fWomsn94Q
	KsAXWFtMHuEmjuSyp0GgrcENleZte6ZfrM4g+Jnw9XSxVYRyEiVAyf1suyQbYLirZs7B
	fB0g==
X-Gm-Message-State: ALoCoQlPxb8zJbRnVAFzF+Jaj4ZOzn+kAPZed/fYMrHMGMUXnLtDKNDZ1HkSq2B/UEO+eEt7pX+j
X-Received: by 10.220.10.194 with SMTP id q2mr177844vcq.2.1378888454704; Wed,
	11 Sep 2013 01:34:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 01:33:54 -0700 (PDT)
In-Reply-To: <1378869075-29422-1-git-send-email-b28495@freescale.com>
References: <1378869075-29422-1-git-send-email-b28495@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 09:33:54 +0100
Message-ID: <CAJTo0LaTMt61KRCWLKW_9ap09WHckX+J8kXboi4D10u_btBBQQ@mail.gmail.com>
To: b28495@freescale.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libcroco: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Wed, 11 Sep 2013 08:34:14 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2013 04:11,  <b28495@freescale.com> wrote:
> +EXTRA_OECONF += "--enable-Bsymbolic=auto"

Acked-by: Ross Burton <ross.burton@intel.com>

Ross

