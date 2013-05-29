Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4206A571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 09:41:19 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id f13so6069717vbg.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 02:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=5WjUZy8RNXVvrOOv6AGVbQoW5RUeIRi9ddhABD1n/vk=;
	b=Vgfokoq6Zw6ZpS3sRtXM1CMw0Y8A0d5fBkQgi74LV43MUyKBXLo68knqQ7pi/RucCE
	sozsrJwrNU8HKjDw+H1JW7jpMq2HT0801Ac/y/L4Ns793JpFrdXmiKjaj/o3744OlxWy
	Bc4E2rzZUz1YW2N/5ucfBhQtluWeTS8ql8IrPnENuNAowgHOY9dpK3IOzT5umHuW7BQy
	kcjiesarV+TmrZW+iOvzyabgastqaHBH8py3EjHMSuvXq64bYlxa2u5qja1s+yK3+N8p
	10kywZICSBIr7Q0OmsiaqWs5Mn8b9iuoBctYW/b3hdEOidhkiUaMfVpiTUgHv/QiOvxI
	4epQ==
X-Received: by 10.52.165.99 with SMTP id yx3mr865574vdb.34.1369820479875; Wed,
	29 May 2013 02:41:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 29 May 2013 02:40:59 -0700 (PDT)
In-Reply-To: <CAMZjud39jnVQwMShEzn33EAs_VyxM-BESBLhyyp_vZj+T8M+4A@mail.gmail.com>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
	<CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
	<1369227075.6695.89.camel@phil-desktop.brightsign>
	<CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
	<CAMZjud39jnVQwMShEzn33EAs_VyxM-BESBLhyyp_vZj+T8M+4A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 May 2013 10:40:59 +0100
Message-ID: <CAJTo0LZMVZ55-g=4rh_wEOYKOYMQb9rQfwxsekYsqVORDJnweg@mail.gmail.com>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
X-Gm-Message-State: ALoCoQn+nBQedVYW4zXvaFCaeSw4/04/Am7WoeE0KpHkt/nD2nlenRG+Dx98uc4ZZV60/XUs5Q/H
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 29 May 2013 09:41:19 -0000
Content-Type: text/plain; charset=UTF-8

On 28 May 2013 15:14, Marinescu, Bogdan A <bogdan.a.marinescu@intel.com> wrote:
> So, if I understand correctly, this bug depends on the fix for #4530
> (because the patch that I've sent isn't generic enough) ?

A short-term fix until 4530 is resolved would be to make the depends
recommends, as then they won't fail in a non-eglibc environment.  When
virtual providers exist, we can make it a hard dependency.

Ross

