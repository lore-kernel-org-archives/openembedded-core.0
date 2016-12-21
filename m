Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB4D772AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:38:36 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m133so23776621iom.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Oi0Mz1c0njEF2kYgg5BKTniU+99o7mxbzC14thaojls=;
	b=OnZAtGph3x9n9CT/yxJZrrVzH+ClSoj+ToIfYm5iHMKJuDxswz8OC6ZrIjymI5AAW9
	6ByWSsjjwRt6IfUfjUBrQViNjp1q8y3i0imZXY0BT8Twswct9lBt7+RGff3+QtnSLG44
	UVl5O7GuZkqDKSUv3aGPfE+xQtRjM7wl7o0WqQDZjfbMAuY/Ny8mYGBQ70/gC4LxRWti
	QWIe5rmx43VAqKJXeYpGJXJCEeguUQEfR3KS0OQFdw+2Nkru6ujd2mUPp6S9eaSCVfam
	m5EZ/zyFJI4z9CJHcKq88a6QY4JbDVUya1hibeih9pB+VQ+ynBANXfrPfyuIoGWRVvRa
	+CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Oi0Mz1c0njEF2kYgg5BKTniU+99o7mxbzC14thaojls=;
	b=SCzdSyfO/VQiJvIGKmL2Q5mHtemOQpI2z66oBWdP47OBnWFJ4zdziBddvtmGf3Y1BE
	gNA9Zfe1ftEpz3xFZGW75byhAMh9mhlXOkTcauja2myWaWLM6NTNQWlr/6WRFZ8NI2B0
	M8RIDLOvz4ew85Nlc8ZaGWp/3kIenkYt5+TwpDMykqC7/bJGvBdK6nhaHiI/fi1lrp9I
	VoF1CQgyt8NWuPH9m3oUrIH/KLsBtbVxeeFYukoKTEjg1XpFNx1H0Cyhre+G+1HQVa8l
	fQTmiEO1pejr9Bp6T35P/SjuPUswsJrmx2Bl2jWRzBOUcoaIEojreqNtDG8TirdekKpM
	yKEg==
X-Gm-Message-State: AIkVDXKlYR7ODwEBz6//6kyj7+TvxenM+UsiczY/sW1emkzP5XZylGpow87NUy12S8Ye34WW
X-Received: by 10.107.36.74 with SMTP id k71mr5773514iok.157.1482334718063;
	Wed, 21 Dec 2016 07:38:38 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F3CB.dip0.t-ipconnect.de. [93.232.243.203])
	by smtp.gmail.com with ESMTPSA id
	130sm10910607ity.5.2016.12.21.07.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Dec 2016 07:38:36 -0800 (PST)
Message-ID: <1482334714.6937.34.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 21 Dec 2016 16:38:34 +0100
In-Reply-To: <CAGNsrLBx=+yvgDAsaqz8mYm30WG0TVEV3eR2PNMj+VHK4ceSOw@mail.gmail.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
	<CAGNsrLBx=+yvgDAsaqz8mYm30WG0TVEV3eR2PNMj+VHK4ceSOw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: meta-luv <luv@lists.01.org>, "Neri, Ricardo" <ricardo.neri@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] iasl: move from meta-luv to OE-core
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
X-List-Received-Date: Wed, 21 Dec 2016 15:38:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-21 at 16:11 +0200, Fathi Boudra wrote:
> On 21 December 2016 at 15:11, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > iasl is also provided by the meta-oe layer's acpica recipe. iasl is a
> > bit simpler and thus seems more suitable for OE-core.
> 
> Simpler in what sense?

Less code to compile, which might matter for people who just want a
working UEFI for qemu and nothing else. I haven't measured the
difference, though.

>  acpica recipe is trivial and provide fully acpica tools.
> Would you mind to import meta-oe acpica recipe instead of providing a
> reduced set of acpica for not much benefit?

I don't have a strong opinion about this and would be fine with moving
acpica to OE-core instead, too.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




