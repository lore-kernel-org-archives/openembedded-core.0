Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3103E71DA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 14:44:08 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id a103so33335190ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=2pfBCOd9O8kbDLIBc+z8mCM49dSX+or+qeBiUIzh/iw=;
	b=FMXj6jtM5E7XPmaF18a/+9umJNYX/8TecHb2gcp56kAKiW602SFKrkE3OEBRNxESXV
	Uc6sXQfSvAIwillFDhPZLpW7fA2kJtGy9+8YeGdRH4XjNKxDUeKCwQdw2RIIeMrt6T5o
	4c9qWalmgxdibTIN+fJFfHQT008rp5YHtBujsnVxgp8GAWdMbcDa7YRb32gMfmFXMKnc
	j6+Ot/QCWyWmulJcKYdOMY4ghCaqobSfpPgHkyXankMiSDpUpymz3nKqQIKWZBrq7mSA
	NNHL9pLgYw0WFLpLwibT5RTawKd/LjTmcXbbZtSfG2Ed8tK6WHuLzW8m5oUMnhn7cqVn
	wtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=2pfBCOd9O8kbDLIBc+z8mCM49dSX+or+qeBiUIzh/iw=;
	b=hrNGJ6Ar9H9nBIvWXhVniDHnpF7I+jhKZM/Iu4EbnvFxbFtlCk6SBxIHw60byrymyt
	96S+EeEfXHd2QwuXjzPny3eHZlya8ZgbEvsc9shvLpQ9YEtT062j+THRrTSK/VlRKZhS
	pAHPWiCg2rA9pqjWagG+r3gsYK8fhN/PaK97DDIz8Qx/shFBx+qv2p00lGSN37D0FSyA
	34rWK5kGuVJbKk9Www4xDxEbOFQf5VYEw+AB1SWUKzEIQuVwFlXudF9rP5GHAh+sMJpa
	MVwETi368joTjH3DAJy2LBlcEEhcct7xgNVtnD/BvWumK9EZTpNnsAOi1xNDNi2hag3N
	7Sjw==
X-Gm-Message-State: AFeK/H1oI3yS15rGHHc4D88co/+UUa1e/GMv9pFNaFWRtI6uGxlfzgLKTkTfMo5zVoNM6hEt
X-Received: by 10.107.147.67 with SMTP id v64mr57522972iod.120.1491835449532; 
	Mon, 10 Apr 2017 07:44:09 -0700 (PDT)
Received: from pohly-mobl1 (p57A56DBC.dip0.t-ipconnect.de. [87.165.109.188])
	by smtp.gmail.com with ESMTPSA id
	x78sm3654043iod.31.2017.04.10.07.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 07:44:07 -0700 (PDT)
Message-ID: <1491835445.10884.142.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Apr 2017 16:44:05 +0200
In-Reply-To: <CADkTA4NkqkDvhBSArQ6_6uz7Syb0sL21Vg1brnEArD9y1rATag@mail.gmail.com>
References: <1491828558.10884.112.camel@intel.com>
	<CADkTA4PQHE0w9=kvr5EyeQvG-Vm8SPQFh9NqM2Jofp_Ec99fKA@mail.gmail.com>
	<1491829792.10884.115.camel@intel.com>
	<CADkTA4NkqkDvhBSArQ6_6uz7Syb0sL21Vg1brnEArD9y1rATag@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Mon, 10 Apr 2017 14:44:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-10 at 09:16 -0400, Bruce Ashfield wrote:

> Either way, I still have a problem when changes like this merge into
> oe-core and I never know exactly when .. until I get the email of
> people telling me that things are broken in meta-virt :D

I'm not sure how to solve this. Now that you mentioned it, I can keep an
eye on it and sent a separate warning once it enters master, but usually
a patch submitter doesn't even get a notification himself that something
was merged.


-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




