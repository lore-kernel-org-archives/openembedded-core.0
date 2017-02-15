Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 25F4A71E30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:59:29 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id k15so145813573qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lBZzcWc72IupNb+HNZYKBgmSNiEDZ+oGX+gguH71Qns=;
	b=XtGKJvJVx6KSra7OHjHTukELS5r0MGSgb6IT6D0JyV/vFjNDeiI+WUtRIUCH/YnqLT
	el3mr2kvkF361FFkNDQF08zp8VsUM9cLnq0l4Uv8rJywmKN7pvgpyZunYOeXDdB4jOgu
	I6lAizHdKg1pn1dgmh/+jlx3xoWshkPImIAyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lBZzcWc72IupNb+HNZYKBgmSNiEDZ+oGX+gguH71Qns=;
	b=fYQI6uIVyjrdMCnpHmtRIEG9tUEu0/8/nyYFzQiz5r63Ckk6egE41uY0aSv/9Bdz7O
	4ToME+oBfLZivQvSo+1bGxKd3BnF50ULp+CArZqjy77Pulkx/c7GWFy43/y9k2YEiEaE
	/1JJsTCPQyT0/bvXy06u8z1j6OSeZiYLzCdl3GfxExCwOurv6zo9nOK5UsZyHRwdJr9G
	3IoQmFMv4h7QcFOM+716VB0gqsQybOb/HuboA0KMJYAanLl/oAN5wrDTGw0U9t1Kb7kO
	5C9yNmL0TWw5yXkvQFFG8Mpu2iSbZdp7Ti46U1L8LidHQd3h9zhWYP3TopFctc2xpYJ5
	Y/Fg==
X-Gm-Message-State: AMke39klLnIzV0q9U5fQ+he7H09IIyjX+CJMNRmbqFF3Ai09ZYZeUelZ1YizoslVAkC0lA==
X-Received: by 10.237.53.236 with SMTP id d41mr38090932qte.135.1487185170011; 
	Wed, 15 Feb 2017 10:59:30 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	t67sm2837347qkd.41.2017.02.15.10.59.29
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 15 Feb 2017 10:59:29 -0800 (PST)
Date: Wed, 15 Feb 2017 13:59:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Nikunj Kela <nikunj.kela@gmail.com>
Message-ID: <20170215185936.GG26129@bill-the-cat>
References: <1487127821-3779-1-git-send-email-nikunj.kela@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1487127821-3779-1-git-send-email-nikunj.kela@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-fitimage.bbclass: Allow set/unset load address for FDT
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
X-List-Received-Date: Wed, 15 Feb 2017 18:59:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 15, 2017 at 03:03:41AM +0000, Nikunj Kela wrote:

> Allow the load address for the FDT segment in the fitImage. This
> allows U-Boot to load the FDT at a specific address.
> 
> UBOOT_FDT_LOADADDRESS - Specifies the load address used by u-boot
> 		for the FDT
> 
> Signed-off-by: Nikunj Kela <nikunj.kela@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

