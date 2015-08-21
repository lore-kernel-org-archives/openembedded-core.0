Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 34B8473CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 02:18:50 +0000 (UTC)
Received: by igui7 with SMTP id i7so8310311igu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 19:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w2U28KOrXOPSFFN8dhP2/E+WIKMvvWqHHKuocIwm/C0=;
	b=sVz5if+c+EZpyN1/CKdWX0KrN1N1B5MjLhobh8Oiaf2ZxBiVz7lBT3ahaUSTHpwqwU
	uZIxilGI6DKYfvHETRthiFq+gJ1b1PyWY+AtppVCoMBA6+zBZ79+TD2CMW61LpYPVBEq
	djnfzCKcnGOePoQzSg5usy5y7okBO+9DC9jGe0D6bWugShfUPZOmehMjvgzCLM6BEr01
	SHImcHCuCib4Uve/CfWfaFGCCM7uUBNhOu6sMv0xFilE4XL//05X1Jl4Q1iFO/u6ajq9
	OpGW41aRUDCyizsbcX0sXJhzhAvVSBYW+42wLkbmlbyNE2t7WWgtnfsqyvoNqGJZjuVN
	AcWg==
X-Received: by 10.50.30.226 with SMTP id v2mr982301igh.11.1440123530746; Thu,
	20 Aug 2015 19:18:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 20 Aug 2015 19:18:21 -0700 (PDT)
In-Reply-To: <1440075290-1216-1-git-send-email-dv@pseudoterminal.org>
References: <1440075290-1216-1-git-send-email-dv@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 19:18:21 -0700
Message-ID: <CAMKF1srait1ZE9AcF_4WUifncREaXPcz_mEogCaZCGZ492UUBA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0-plugins: Ensure the native OE orcc is used
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
X-List-Received-Date: Fri, 21 Aug 2015 02:18:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 5:54 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> +ORCC = "${STAGING_DIR_NATIVE}${bindir}/orcc"
> +export ORCC

usual convention is
export VAR = "val"

