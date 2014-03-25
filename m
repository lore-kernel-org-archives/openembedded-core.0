Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 258FB6B25F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:59:45 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id w8so384374qac.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 05:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gd4Nrv2Ji9DmvzVsjn2HL8IFjW/PuEFdCeRp8oeSM3Q=;
	b=VvL45Ab40iPWppxDHrZzbXR+7HIqpshTCiIW+xT/Qpogi6ZUm06fj+SSmbFEfqHDao
	TGi8FUZrGAV5QJvuoC/yWx66Gl8VSeGYd8ebC8SUb4uC6OtjtLkVO+8qUxJA/RL1Ep5p
	J4ZNNhECDK2e2wCDiausFhDPG92pvoTxh7ZzC63z+ovWt23EWZba8hriMU0lp9nUBlhC
	hQ3pvyyZfBrB8RMyFKr7xhtsRCDVFfM1xcPUgcdGhEhtUiu17f9j41JN81mwos7qs8nj
	+b5/IJGNsaodXDGp9UjjR2jmT0PDYV6DmJ5eILWOPx5TWzHTum7pmKvFCQW+FJ48v3Hc
	tBbw==
X-Gm-Message-State: ALoCoQmN+qXi2aNEiXoUmb//OSjuSBQXAJzzv2r/DKNMnQJNwstZQmxTqHut8aOHphCaZsFHq2/U
X-Received: by 10.224.147.77 with SMTP id k13mr81377529qav.64.1395752386264;
	Tue, 25 Mar 2014 05:59:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Tue, 25 Mar 2014 05:59:26 -0700 (PDT)
In-Reply-To: <CAP9ODKoarQQR572240q6E_57CVRaYPHOiShXSWHMxob91Y5MyA@mail.gmail.com>
References: <1395426119-3011-1-git-send-email-ross.burton@intel.com>
	<1395426119-3011-2-git-send-email-ross.burton@intel.com>
	<CAP9ODKoarQQR572240q6E_57CVRaYPHOiShXSWHMxob91Y5MyA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Mar 2014 12:59:26 +0000
Message-ID: <CAJTo0LYOrH4Sor7cjnfKP4rJcpJ=wym7KBhrk6NGpqE5GXDE7g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gtk-engines: move engine schemas to a dedicated package
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
X-List-Received-Date: Tue, 25 Mar 2014 12:59:46 -0000
Content-Type: text/plain; charset=UTF-8

On 25 March 2014 12:27, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Fri, Mar 21, 2014 at 3:21 PM, Ross Burton <ross.burton@intel.com> wrote:
>> The GTK+ engine schemas are not insignicant in size but also mostly useless.
>> Put them in a sub-package instead of PN so they only get installed when
>> explicitly required.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Isn't it breaking runtime update? People with a running system which
> updates it using package feeds are going to get it removed. Am I
> missing something?

There is the possibility of a migration path but honestly, nothing is
using those files and I'd be surprised if they were installed by
anyone.

I guess there should be a replaces/conflicts to ensure that PN-schemas
doesn't clash with PN in upgrades.

Ross

