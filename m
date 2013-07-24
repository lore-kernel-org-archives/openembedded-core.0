Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id C1C59605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 07:50:00 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id f12so6134427vbg.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 00:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=MEFg3cZkImQDLt9tvpZwgpR7is0BvbDD5WI+NL2bXs4=;
	b=BQrFjRWB8xY712WJIRC+tGuzkBUNYz659fqqlceeBXTXl7O6Y5DwK5zlMUOCxeQjsF
	/stZ1ubjt0TZ/Rn20dBiO53CfSaXlkBEiUxguKtIzKGT/0bqq2NobJdSFC7QxkuRULnE
	HjitGXg/LYuxyi4oSoH0DbjcS+E1JVTM0zQ8i2aGyXgAp73BGcrU0C/omCYlWsn3rGDG
	GkmUDvrQXPV7YY5BT5LxMTUhTjVjUJc2gUNhlriAyim0Y7nIC5fQP4SsZZM0j3Iv9aBl
	mbEjX4pOwtrzlMc4kmkqhTQSKy+p24PwlTt+l0Xg8HPEbtOgUnXuEpXA8w8EhjqgHaQh
	fhnw==
X-Received: by 10.58.67.9 with SMTP id j9mr13602246vet.22.1374652200777; Wed,
	24 Jul 2013 00:50:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Wed, 24 Jul 2013 00:49:40 -0700 (PDT)
In-Reply-To: <51EF39C7.2060703@windriver.com>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
	<51EF39C7.2060703@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jul 2013 08:49:40 +0100
Message-ID: <CAJTo0LYcYUVxJ0pyMDKTSA_=ezGnn++nSh-MuFsFC40LBwydWw@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Gm-Message-State: ALoCoQki4MZd2Lkv3HQ5EJrYn4KjqEDxQmUrOF7s3wBtn5rqusVuDBOnnUzx4AR3YGV7Y0BhDVov
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Wed, 24 Jul 2013 07:50:01 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2013 03:19, Kang Kai <Kai.Kang@windriver.com> wrote:
>> Instead of penalising everybody, would it be possible to make this
>> change dependent on the build machine (ram + swap)? Or to only add
>> -Wl,--no-keep-memory if the build failed without it?
>
> Yes, it doesn't fail on every build machine. But it seems that build fails
> randomly on different build machines.

I'm in agreement with the others - this is how individual build
machine admins make a webkit-gtk build work on their machine if it
doesn't have enough memory available.  We should probably document how
to do this in local.conf in the recipe for reference, but not make it
a default.

Ross

