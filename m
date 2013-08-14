Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 195436007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:57:24 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so5206537vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7MlyYeQsvMA2l/FDJ91TXagIQ4MIW/Si26HEW/HtJq4=;
	b=QmRDUh76C4Prx/HfqrnxEmB8hGHzIDrh7NY/F0+IgOBemjWv30MB0/LZnQi0tONZcC
	3gyYhqyKJmlWIxaqt7TKVjoTHqKesaf0HwNDt5peVunZ6QlPIh1T8kq9iS8NCWG5Lvo1
	UbDuXdpO/17YC9EipzdbOgscSlcLj/za8E3c0TATspLMSHLIRIfbKCZ1pM83vtUYhE5D
	+SlIIq+E8/kQNQZZvwGSxfwDwQcX0w02bdpeN1mH8iBccMItxvZMGoYpOFiaLHNAk0RC
	mzpP2KONRTfccKNR4+m/IyIPJzhlbrQ07oIl4YM614WZ4r3j8xVkmpYTCAtzo7QKeFrW
	NhJw==
X-Gm-Message-State: ALoCoQlaDVH1f0wYokhLpfa+qxin65E6Ezym+FS49YK3hZafgYwFc0TAWDZ/AsG8DyBljbkuE2tk
X-Received: by 10.58.136.4 with SMTP id pw4mr8802548veb.10.1376488644454; Wed,
	14 Aug 2013 06:57:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 14 Aug 2013 06:57:04 -0700 (PDT)
In-Reply-To: <1376485672.17787.1.camel@phil-desktop.brightsign>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<16c7ff9c4e9ff11888d8d6b594f5ede88a78feeb.1376038140.git.paul.eggleton@linux.intel.com>
	<20130814122216.GX17945@jama>
	<1376485672.17787.1.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Aug 2013 14:57:04 +0100
Message-ID: <CAJTo0Lb0Pb=8UCBgEvZqHwrC7ALirbjSsjUaEA-+PNNU3_bf=A@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] libav: add from meta-oe, update and tweak
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
X-List-Received-Date: Wed, 14 Aug 2013 13:57:25 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2013 14:07, Phil Blundell <pb@pbcl.net> wrote:
> I'm not quite sure why aargh64 is in there but arm isn't.

Is that an official architecture alias, or a typo? ;)

Ross

