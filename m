Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A58D26AC85
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 21:50:17 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id r5so1561519qcx.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vxatLk2BI456AzioTIzVM0qWe6/JzgDx1eJZOLlhjoU=;
	b=fSI+9ASG23JKBmGEMnx0Oef8EmMymxqpIlrcqIzxJW+qBxwKV6Z234n6X412SSFMID
	k0XIiEnnTW2RPN8jRGidPLZWrlE7Y0J/PDTkQ4+QnFs1CQqo27KlHhrkmykrLsqHH78n
	M+BRz4TotipXjOG2uN5PyMfxFpR8Jnh5xKwBueLoQelLGvw8vegfmxiyGjcGBNXZyQp8
	I3HGK0xHr3z8yaELIlo+OlN8WDKT5Y7h1BfbxDN1sNU8q5J0p4p4VmBHEgZgygfxOggu
	RaOUgOh4qFtvJxHlXtOd6XA7/Y/YzEdpWppt4TYRfxGDco9nDvkexDxCpbbfMhF1kW1a
	4W1g==
X-Gm-Message-State: ALoCoQnmRjxW4cPotIbqtwrbNRMIU37G9hFlM0BVRZycecaYZitJjtuu1KCT756bLHXJzToYHFzY
X-Received: by 10.229.236.8 with SMTP id ki8mr11438228qcb.12.1409262618868;
	Thu, 28 Aug 2014 14:50:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 28 Aug 2014 14:49:58 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C7CEBAB24@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAB24@ORSMSX103.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Aug 2014 22:49:58 +0100
Message-ID: <CAJTo0LYe3MdLf08HmpY=2FO1XMNi5KmpXdJ-t09Yg2SiMYCWog@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>, "Hart,
	Darren" <darren.hart@intel.com>, "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 21:50:27 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2014 22:05, Kamble, Nitin A <nitin.a.kamble@intel.com> wrote:
> Ohh, That is a good idea. Do you have any example recipe for me to look at which is doing something similar?

It will just be a matter of imageconfigurator RRECOMMENDing
imageconfigurator-data, and then imageconfigurator-data being
machinearch and doing the per-machine magic however it wants.

Ross

