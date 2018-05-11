Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 65D137869B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 22:07:24 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n64-v6so3734734itb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 15:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5gn/24jp6IAit5IASctAbfpC2ww7poXuyl6u+jupBkM=;
	b=uf8MSfF4yNWNd+I3QEa5OD/6li6K7t6Yzuh2g5eEy9RTWrXPRyMuXLtuvfKikslsWM
	FNocGyzn5/bJ8mouH+SABw3SFBnUaaQ+c6jnigbbcRF7sI31+53A/1T6bSiH6pDhd+Yb
	ccA0QrF8VuiMilJYmtZgQdCnj5tMPIv1drYx9WfjAGnkL2myaH4XbldrW1Pwo/TpYQi5
	WXS6MCodPNiydmsK2dVNro11Jlx3snw2asH8CW0FPPjvHEMqi5+FIAyAvlI04uXIV2Xj
	aXxNSUNvBtpQL6rSBisDDOkr0qgKc/e844LejrDfSh1TgQAf+CMZRtVcHvlmhxKOw+6+
	PviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5gn/24jp6IAit5IASctAbfpC2ww7poXuyl6u+jupBkM=;
	b=Gc72Dnnd8s2ATThEKOe6A9bZ181HPaVC0EoYywhaceXl7THKOopOEKQqwx8lWgbpxE
	Q1O9AFkME8jkJAP2wFdwxvhq9C6VhgBSAvQLU0jFGWd1moIkSxeiJyUt/dNYJCP9wMXe
	CciS2UG2wrU8naJjrzfh7X9E3uMbsT9Gk2cu/FOrOoTUDO1EiO4UdY9Z5bIyUpiarknF
	8r9jUZ4HO/kefOdGbO3hPLu2Mw0d6ksFVUGK8ke3xPsZluY0M0B+O+CIKsyMXFUiq0FU
	eFmaTvqnxaq4b9QvhGSI3kBBNOquA1aMH8Hughe01FIuSllCz9cd5t9JwbtEmPhim45y
	L7TQ==
X-Gm-Message-State: ALKqPwcft0qkm6PmFxzyjK/udrMUwFfulNCqXGPX1HA5SWPGMNI2ojhA
	au/XQYdWZh6L/GQyBB4DxHaeJKSIE8ro0/LY3SO6jp6N
X-Google-Smtp-Source: AB8JxZq5CC9dGJwcz0IvEQe75jBW+AJ+pzGcXyZUJrB9paZpNcgFjYCzIIZCNi3bKC4WWmvyvmosES98ks3RjOHJiFM=
X-Received: by 2002:a24:d2c4:: with SMTP id
	z187-v6mr5280649itf.60.1526076446016; 
	Fri, 11 May 2018 15:07:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Fri, 11 May 2018 15:07:05 -0700 (PDT)
In-Reply-To: <CAP9ODKpkqeqn=DpBGsAHMdHP94f=92P1tQL1VKTu+uk88UyhXw@mail.gmail.com>
References: <20180504174346.1149-1-otavio@ossystems.com.br>
	<20180504174346.1149-2-otavio@ossystems.com.br>
	<CAJTo0LZRrvYgu9Pthi+ZzsxQX76qW2j7VzXvxfjMuOFNr5JJiQ@mail.gmail.com>
	<CAP9ODKpkqeqn=DpBGsAHMdHP94f=92P1tQL1VKTu+uk88UyhXw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 May 2018 23:07:05 +0100
Message-ID: <CAJTo0LYcAyon8a2+UmYaZYvtETjrs1_PuCRNj6s7_E=Z=9kXkQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] wic: add ontrack DM6 aux3 support
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
X-List-Received-Date: Fri, 11 May 2018 22:07:25 -0000
Content-Type: text/plain; charset="UTF-8"

This one?  http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=2e9012e6b44b83b3952598b08cd9d5dadd633b69

Ross

On 11 May 2018 at 20:33, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Fri, May 11, 2018 at 12:41 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Somehow, these patches are causing selftest to fail:
>>
>> ERROR: Not supported fstype:
>>
>> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1051/steps/Running%20oe-selftest/logs/stdio
>
> You forgot the parted patch.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

