Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 80AD1713AF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 13:32:27 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j107so447663qga.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 06:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eJCpOPb9UZNL7SUjilQy8Kssr/Fuz6tOHf3xEdU6vJw=;
	b=SIC47w7w+mq25XDh9czLDdskFFjQMpOqxRtgM9g01GrT5UBrsTLVB3XgrCJvyVW5Ke
	prs375w5g2mjkvSRJVT/TiFBMtbmga3vX2GZxm23WSsH2+8TkYEpjzWHC6Lp99eJGxc9
	jd5nPkEuviPUPOcUUod5PWskRFm4ZhrXHvrnWPRSpXQ8t/TYmMMabKFGzDJV3TiEIoVb
	L/0adGMPOTauvVDUxitM4ZO6ryIp5s/5GNqVouzUEfIyB4cMmchrt1gOIoYZ/5B2n7Z0
	8gyL2QrhRrnc/XOE2pIb8H24foo3G9qRpkhIK5xyoUiM8wsat9wM9MQF19Aiu0HP/VJC
	z0DA==
X-Gm-Message-State: ALoCoQmTFc8FjKEilTDh5eZnUaZvxsG50Rv7fHemGOagwbctcMT+T6GbB8Ctp4mdcvmTfOM3fqm3
X-Received: by 10.224.103.65 with SMTP id j1mr27779895qao.17.1410010349187;
	Sat, 06 Sep 2014 06:32:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sat, 6 Sep 2014 06:32:09 -0700 (PDT)
In-Reply-To: <CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
	<CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
	<CAMKF1spYXbaKdjQhAYM3SEL8RjqfTeOwmXpsOXNOS0YaXZJzLg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 6 Sep 2014 14:32:09 +0100
Message-ID: <CAJTo0Lb708rnUEEUf9w0B2er_Ttb890niQUjRdBTTD952BcogQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
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
X-List-Received-Date: Sat, 06 Sep 2014 13:32:28 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2014 11:03, Khem Raj <raj.khem@gmail.com> wrote:
> This issue should be fixed now. Please download pwclient from
> http://patchwork.openembedded.org/pwclient/
> once again and, it should update your .pwclientrc but there may be
> gotchas so make sure it is of this form

Thanks Khem, much appreciated.

Presumably the hooks to auto-mark merged patches haven't been
activated because the git server and the patchwork server are on
different machines. Has there been previous discussion to get this
resolved?

Ross

