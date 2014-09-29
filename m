Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 764286017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 14:57:03 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id r5so8836669qcx.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 07:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lk2RG1On+7xNil34kG2lH85xOzUiAv6ZkLzYFeUWngc=;
	b=dQmB8NHo8iHReV9LuvKz+bITE8pDS3fX2z6hkE6ZVcb3cnaLsyRsVoRNUfDptEFnJQ
	q5olypU2h5PtFqWQnJMe7+6x4diuqytDK98TrXX04tKmF314exjwbb2cqW4axWWrK/vw
	r6gOO99GOB/Yg/8oYA/MZevn4c2IXq/yjgpmhOMUYdOWf03V4MwPDcmeFvsRHlbxuWWE
	UMHuPWh7VdqhuA7t6VW4aTcoS5F/vimg0klXRpnXsAJneue0NHdh7Aw3cK1+wXcsg0NV
	MSZsgepjbGRXHxTbf+8jTsi114ZoPSI8sT6Oas31l3NMfJA8wmxV0+6pb+qISB1tH8wt
	trcw==
X-Gm-Message-State: ALoCoQn5+vRaQZGi6F/QPh8SJVXolona7STGqd3J44E3SRdbt/Ym6MimVPtzkWV0UhIZN9VVJdv9
X-Received: by 10.229.74.136 with SMTP id u8mr49940683qcj.5.1412002624561;
	Mon, 29 Sep 2014 07:57:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 29 Sep 2014 07:56:44 -0700 (PDT)
In-Reply-To: <201722111.zmNURQEFnj@comp-006-thk>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
	<201722111.zmNURQEFnj@comp-006-thk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Sep 2014 15:56:44 +0100
Message-ID: <CAJTo0LZ4RCk5eqdXb2MxchvQkZgiT3+4+yUnNuNwQZcX+0Vm4w@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Mon, 29 Sep 2014 14:57:09 -0000
Content-Type: text/plain; charset=UTF-8

On 29 September 2014 15:52, Maciej Borzecki <maciej.borzecki@open-rnd.pl> wrote:
> So a trick like this will not be needed anymore to automatically rebuild
> whenever sources in SCM change?
>
> SRCREV = "${AUTOREV}"
> PVBASE := "${PV}"
> PV = "${PVBASE}.${SRCPV}"

That's right, you don't need to embed SRCREV in PV to get a rebuild.
For many recipes it's still a sensible thing to do, but it won't be
mandatory.

Ross

