Return-Path: <matt@console-pimps.org>
Received: from mail-wi0-f195.google.com (mail-wi0-f195.google.com
	[209.85.212.195])
	by mail.openembedded.org (Postfix) with ESMTP id B3AA76B7BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:24:03 +0000 (UTC)
Received: by mail-wi0-f195.google.com with SMTP id ho1so197368wib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 01:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=eSI5j0LUq3DDRVYMdw52TaPMK5IBklEjI2idh+JbbA0=;
	b=SlZxk5GIp8WLSYCujrcPcTe0bhggUGdyMTz0gCnu7loPS8MV++CT5/WTNetQ6a8VXV
	96EY8IC/DDy5N+/UJID77TrQ8loc7ErSkUIvP2W2kB0QG8aepeCYSwlxBJEzUolYFs+i
	nQyGvs0GIqQrTW/kpiitTfF6bJ7XfWCJxnRByYL/STylQA8Cv87YXoJu8hRTREm1i06x
	NuKxhCH5gW4khtQR5+95zD0kwtbZa7NO8F6gInCqlAfQ3PCshvpZJSD/ojbUFpAW6Vd+
	NdRGW1Cm/ukxhf9IyMUGSQDedAkmG9PjUEbDOA6ItIf+pE1FSOAIg3eeLgH1L9duiCn3
	Ku0Q==
X-Gm-Message-State: ALoCoQmffCTpwOn8H070ADWM79stusizKBHziG921BXiWQlkMkh+zaoewImMSLn/SSv3LsoAA3Mo
MIME-Version: 1.0
X-Received: by 10.180.78.71 with SMTP id z7mr3195152wiw.14.1402043043160; Fri,
	06 Jun 2014 01:24:03 -0700 (PDT)
Received: by 10.194.62.98 with HTTP; Fri, 6 Jun 2014 01:24:03 -0700 (PDT)
X-Originating-IP: [90.207.204.193]
In-Reply-To: <5391086D.2030001@linux.intel.com>
References: <1401898238-18043-1-git-send-email-matt@console-pimps.org>
	<1401898238-18043-2-git-send-email-matt@console-pimps.org>
	<5391086D.2030001@linux.intel.com>
Date: Fri, 6 Jun 2014 09:24:03 +0100
Message-ID: <CADknwL4siVwW0wC2=ukTY+eyjSfnhhwiuCXd6=sM0pz+d=w6LA@mail.gmail.com>
From: Matt Fleming <matt@console-pimps.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] generate-manifest-2.7.py: Add importlib
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
X-List-Received-Date: Fri, 06 Jun 2014 08:24:06 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2014 01:16, Saul Wold <sgw@linux.intel.com> wrote:
>
> I think this needs to be rebased to master, I had some trouble applying this
> patch, the other one applied just fine.

Hi Saul,

Sure I can do that. Let me respin another version.

