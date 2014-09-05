Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3A71D71340
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:53:37 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id i50so11723504qgf.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 08:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CI5MGCsNkjiL4+Vf2cxOx6zZB2rFKcJguhkTTt4XTh0=;
	b=JjzXLySpsfC0Z9UYxeoV35RSEYJMQtdPxmsg6aK8AbICibLLk8EKSKuR+2foQU0p4S
	vP4uSUiSXpf5jcaRIyTd+6f2XytYF0sZhEn+cv5j75O3cS4eeIbc42KAh4H4E0vWNYLa
	OG0QGEthM66YHqEhXerK3NqAUoTWP2Rof8MVshDcc/laWqY27d/bVQW/TUpCXpuSdeRh
	e9EOyUqouJhU5+EY2iBVLFng1Lp+pnUXzmq/RMzp6mLyR3bKd8mNVLIXTTLRycgkf0iJ
	rCmHWxu9eTsXv/8BNrneuW+K3YVWP6ARlfnQZ/nRu7OXLEczU8bLd3192ycPQRI+u0Eq
	iG1g==
X-Gm-Message-State: ALoCoQmNuyyBZqi7lS+7Scvrux8omBNHJ/m50qsLHJr3sXmjR+UFlnjfpePz3NB7I3FYyoxYdxCZ
X-Received: by 10.140.94.234 with SMTP id g97mr18998390qge.77.1409932419126;
	Fri, 05 Sep 2014 08:53:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 08:53:19 -0700 (PDT)
In-Reply-To: <5409D739.1030307@windriver.com>
References: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
	<CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>
	<CACS+7ZQiCVksBN1FK9wJ56k_hpJhpYFq23sWw3srHQ5ZsE1P9A@mail.gmail.com>
	<CAJTo0LZNo4MxuZoSOvZU-kaL1v=+Wyy2To=s8Dp68ShszTRSbQ@mail.gmail.com>
	<5409D739.1030307@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 16:53:19 +0100
Message-ID: <CAJTo0LbQtJFH8Tm3y58WPVx3GGbzCPATrqt5OnNWT3Q1=q1ALA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Fri, 05 Sep 2014 15:53:45 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2014 16:31, Mark Hatle <mark.hatle@windriver.com> wrote:
> I'd prefer a patch that used a define myself.  I don't like seds of source
> or patches...

A #define for /root might even get upstream.

Ross

