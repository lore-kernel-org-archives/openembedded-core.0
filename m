Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D747D619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 17:01:10 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id gd11so9557679vcb.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 10:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=UD5cJkqZeMO7vSzwAHy4cmDwJsKhzDQa5dkBEj00Uwk=;
	b=jMn9b7+mhxLD5CbajHBn+yWh8Y6fWvddZUykTfAiocIH+ILCPtn+6itnthFJqfsb9B
	KGBLRrN7wXBQNq21DiqHBFxiZ6l0L/sGLM6b6gGbbhfzAQdEhzDq1cjNCdRAMORJvOBN
	IFA4UvMaxjctTIP7ikXoWwzAk32JQl/LSGb+AlxB/YO1LaIuYvqanUNE8ujckOZof+sq
	CLWTrcE3IByIZIYP2JeV8Pm9GrwnXDRFD5FUiF7IxcDofpZDq4ZKwMIczXPrDdFk0rMx
	GUfKvVlMt2tMcp8vQ0GHIxD8qSPCXQMA7llmQUKk6gcnGPD+yQe8nk43PIM13EDYasTp
	VQQw==
X-Received: by 10.220.42.147 with SMTP id s19mr28674943vce.46.1373907671101;
	Mon, 15 Jul 2013 10:01:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 15 Jul 2013 10:00:49 -0700 (PDT)
In-Reply-To: <1373905667.2651.39.camel@phil-desktop.brightsign>
References: <cover.1373896070.git.cristian.iorga@intel.com>
	<809bd57326a24570dfd583e33821f42c4e7b930a.1373896070.git.cristian.iorga@intel.com>
	<1373905667.2651.39.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 18:00:49 +0100
Message-ID: <CAJTo0LbPaTC0MxhcMM8eAzRxWNRZEw5pz58EnrP_BDixEO0AuQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkB3t1TsrZqKyBP9B2rD0z5cPpTq8qEdCkWyZId9iqwkS/qsrxPHJhJFolJSeeN1eUpuuU0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez4: conflicts with/replaces bluez5
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
X-List-Received-Date: Mon, 15 Jul 2013 17:01:11 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 17:27, Phil Blundell <pb@pbcl.net> wrote:
>> +RCONFLICTS_${PN} = "bluez5"
>> +RREPLACES_${PN} = "bluez5"
>
> I'm not sure that this necessarily does quite what you want.  What
> exactly were you trying to achieve with that RREPLACES?

I remember when this series was first published there was a long
debate over the exact lines required.  That said, I can't see why we
need replaces either.

Ross

