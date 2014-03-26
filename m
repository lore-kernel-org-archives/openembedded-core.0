Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id D615C6B1FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 16:19:24 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id w5so2443093qac.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Fv2Ky73KjR32L0uK1CEwXAtYy538SUQGh7TX0Oj4IVQ=;
	b=Q/zYe0ZDOVOD3UuUUfiT2+WltfnoK1HLHVsZoQ5aJyMlzUcwVLVv0n08SwjcgyHGs0
	LM2NIOaw1v9OsUNquytINDmjnnZMpYJAb3xD5sbALqfCXCMqSLYZmdgp85wIMYTMJZfQ
	1gqsg3vGyYGwGL2SisCShAefm27ZK4hKT9qKaTEi3RfXEjcnZ5s6tcP486OehQpNsGb4
	wW+fSrKcj0WTB/2kLH6bKrnP26s53bau8O4+qHojr0tC+Rfr00QrpU0NZbo4o5dmBWlz
	AvSUJPiZq/zHouiLhUdhKaoQHgZE/izkpaq+rmfQnVYASiQy7zJKA5YVp3hS1tmXtjpj
	Jojg==
X-Gm-Message-State: ALoCoQnF5gFGu9anJfwDrcEn2rp9baIKJEK0HujLw4RhBlgJiO0b9JrDt8KGxoZ6KYepcxOF2Ura
X-Received: by 10.224.127.129 with SMTP id g1mr90367567qas.22.1395850765986;
	Wed, 26 Mar 2014 09:19:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 09:19:05 -0700 (PDT)
In-Reply-To: <1395844085-9929-10-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-10-git-send-email-lauren.post@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 16:19:05 +0000
Message-ID: <CAJTo0Lb8Gza45p0N4GzeGr1aT=wN8vKQVZg6=VSSxsUo-6feXw@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/11] bluez-hcidump: Change depends from bluez4 to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 16:19:26 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 14:28, Lauren Post <lauren.post@freescale.com> wrote:
> -DEPENDS = "bluez4"
> +DEPENDS = "virtual/bluez"

bluez-hcidump is integrated into bluez5, so this should remain as a
DEPENDS on bluez4 and bluez5 should provide bluez-hcidump.

Ross

