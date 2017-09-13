Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id E049E78647;
	Wed, 13 Sep 2017 15:40:53 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id 93so559734iol.4;
	Wed, 13 Sep 2017 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=568fV5s2eiVKoQa6KDWEtIy8+es2kf79JWXxc2T312s=;
	b=ALPXhrX69lf6LALRtnwkAax6eRhzIxm1TXjzVyqDR7Yp/PBl/hSsr0U5264nVg+3PB
	4CPI3LYkvd+h0UTteYb5u6bhjnsA6V+TQltHjVLfgHkp89uMZsfvRK+nMVTa3sRjA8Lu
	EJMG30aQgxYNBdITmXlINA5xFEivFu1hJv/hTG10EMULgY9JIGaPuR9wTcTfBQubYsGG
	CFbVguGo40d7eqy5gOQ6QB/k6lUbKYnQt1zOPFj+CQEMJGKB+plkVLwi9HMsd3qLIn48
	NcDVuzoP5oFxB1HZ+X7C6efN+KljxUurRL0gPI+9AA9WhK/PkLkD4kCR4vHmmJ9qRXpk
	C6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=568fV5s2eiVKoQa6KDWEtIy8+es2kf79JWXxc2T312s=;
	b=EvFkkHz1RZ2/U3wmsm8oeIZJAJF17vNjSXEQD2ZdGfNdyzZYNRummOdxWHLJo30hsn
	YKh3+l4A0Tym0bmEtE/9s7ZNUpSiqP2bS2ut/S0Kg4yQjr+G2hfECfLF74j47Ed9nxc1
	F+zpBIvXBj1GL7d9wvJlAOaVjR4gLcNiNxNY/4MhZ3QUVLEoqF4GIqSri2tQ4ga6yE93
	uQ/XmLo6XIAsoOEA/BeyXOGTlc3loPNy9ic84CJaQZACCakKuoCNlgc6ebz7RRh9C1Je
	LTLV+vdwtFpXpvSsK/YFksVKyfRglIKtkYnBB+D8TgvrHUeCEU0LHBG/dqheo9E6xcP4
	M+JQ==
X-Gm-Message-State: AHPjjUj/fGJhmX/iawnh3OUI6f6L7nK0W69cgnt7HC7fBFyHscxIrRdd
	cqiDFD2P1mY+xZsAyhpKi/CGgUvg/wQmvKq/2Mw=
X-Google-Smtp-Source: ADKCNb4pAWw1N1UtNgRpRR8Fupc+LjtS2LNPm0a44Yynn1nf0Syl58o5cHBGxtJcp1Ac70e1Uy3C7NQS9Ygial7YaA4=
X-Received: by 10.107.6.78 with SMTP id 75mr25636500iog.204.1505317254697;
	Wed, 13 Sep 2017 08:40:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.27.133 with HTTP; Wed, 13 Sep 2017 08:40:53 -0700 (PDT)
In-Reply-To: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Wed, 13 Sep 2017 18:40:53 +0300
Message-ID: <CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Developer Meeting Oct 22, 2017 in Prague (before ELCE)
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
X-List-Received-Date: Wed, 13 Sep 2017 15:40:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 24, 2017 at 9:37 PM, Philip Balister <philip@balister.org> wrote:
> Once again we will have a developer meeting in Prague the Sunday before
> ELCE.
>
> Please go to https://www.openembedded.org/wiki/OEDEM_2017 and add
> yourself if you are attending and ideas for topics.
>
> Although it is called a developer meeting, we invite members of the
> larger community to attend. The core developers are always interested in
> hearing how OpenEmbedded is used, and what we can do to make it better
> for building the embedded devices of the future.

Is it free to attend, anything else required except of
self-registration on wiki?

Thanks,
Ruslan

