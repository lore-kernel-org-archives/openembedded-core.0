Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id DDCCD6ADB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:32:33 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 14so7072561vea.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=OcPZPxaXzCQFBSq15Cp+vJS1gwyviBrmvKWrtTHDPlk=;
	b=T4QTbCwNsRaoBrgh/zwFhlzZOYvR1yfSTD+0NiqRSWnGSkBA8iIgcVeSEuU2U24nga
	ranREUv0SCUeN9Tvhu6mnzG8Ml1wQM1lWVwI2Wdi8OjO3xW3voPEgkIqHKAoljmBban9
	RMUHlFySLArUewR4+PK84c8LXohpn4Ag4qVK7owmzgt1nHeP+CrdHswUc28s5clPbMio
	k0zysuoJpN7LmVBC8sEXVKknVvn5kWnBoNDTQTWnjGMnITN16rp3+OLx0sXzOL77yE2X
	rt95weG6XDiUQkfz5rzN1VYAd3OdeNTZK+i7UAe6GBSPhI9s61QTUA5URzAWwfXVIcOm
	YIxg==
X-Received: by 10.58.118.70 with SMTP id kk6mr21291637veb.1.1373538754285;
	Thu, 11 Jul 2013 03:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:32:14 -0700 (PDT)
In-Reply-To: <51DDACEA.1080503@linux.intel.com>
References: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
	<51DDACEA.1080503@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:32:14 +0100
Message-ID: <CAJTo0LZ7POY-i61qz8hUE=JXbc0=0uoNo_i1aTmgi-ma_cc8hw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlFagwvVwRhfURN+tsVf8M5POFVLBqDhliVG/3olsEjFuYjvP2ILPpVgrzyAjsdYor5x5/W
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: Added consolekit dependency for pulseaudio-module-console-kit package
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
X-List-Received-Date: Thu, 11 Jul 2013 10:32:34 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2013 19:50, Saul Wold <sgw@linux.intel.com> wrote:
> Is this really a build-time dependency or a runtime dependency specific to
> the pulseaudio-module?

It's a runtime dependency, but from memory bitbake doesn't manage to
piece the chain together enough to actually build consolekit (probably
because the packages are dynamically created).

Ross

