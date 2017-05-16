Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D95CB72F2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:47:51 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o12so93809389iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=EsBN9dQnGyTSW/cMnr2DKQm4UFDFpwylI5B8tfiDN6c=;
	b=vUDlescNWdHsR+Vz/ffERSpwDhaPJTpDgqsujA+4oQIJoAbHWapOV5BblN/nLSJYlu
	lNOUEU/eNYuyrcwXAxU1APvn22dK/uOvc8y++FdyTPMcS35pcaISyWMBzmiVm5PDxsKd
	3vkZFhBsu4x0ojCLD0NSl4FZe5vQjFzTdCIsnRBrtdPVRnGS+aAGv1Fz5NTMi1OQJWQM
	uEnKWibchfgCgbiP/i7mVfh/m9V1vqM/I/UGTXwmfCxRvwOq6oKrlnt3e4+LYU18YFO0
	6pj4IV42gYlKySlTFjUk9G+MdlyaVdnve3MzH87c8Tn66zUEGsgitQG/LhKJEZLFegkG
	LgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=EsBN9dQnGyTSW/cMnr2DKQm4UFDFpwylI5B8tfiDN6c=;
	b=lUw+RUWGUiS+/VcfBvEKJ1rg18cS18cKg2MW7I46fSWDm0Tlkya58BKBAE+95yzVq9
	AGoLpwKYykmzFZKDLig8FkjB6nXvDukg5+5EHyIlWatYlh5JANy4sfkwylgEHyffsoem
	HZrNytNwh39Q2PEBi9ZNC7iz0vZpYkbyeGgRo8CMz6yw0OzQIgLE9vclomssU+QwtdEv
	gh5xOR+BLFcMZE82e+7Wowo6kJtJvIUcJzu0ZkOfsS7f+/DrX6HMhcAdjVv3m5ZmiBQn
	pXq3wGbb1UOqYIlQmXoaojhquEaGJ8d7r1sM7D817bddfa8IgBx9qnV6VYbW4W/FhOVc
	YAaQ==
X-Gm-Message-State: AODbwcBJGbkHZmPIO0aCnBK9/C3O5EfQuBdxy4l4XmRDXTJJWXEO+4tq
	fN4KEuVbRJ+LdEzq
X-Received: by 10.107.12.143 with SMTP id 15mr10082600iom.94.1494942472909;
	Tue, 16 May 2017 06:47:52 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EB79.dip0.t-ipconnect.de. [93.232.235.121])
	by smtp.gmail.com with ESMTPSA id 141sm5972733itz.4.2017.05.16.06.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 06:47:51 -0700 (PDT)
Message-ID: <1494942469.28624.10.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 16 May 2017 15:47:49 +0200
In-Reply-To: <aaeaad51-6bd1-10c4-ce22-4381c07bd9a8@linux.intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
	<1494922912.1179.306.camel@intel.com>
	<aaeaad51-6bd1-10c4-ce22-4381c07bd9a8@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 13:47:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-16 at 14:49 +0300, Alexander Kanavin wrote:
> On 05/16/2017 11:21 AM, Patrick Ohly wrote:
> 
> >> While the "development/production" switch may be great for some projects,
> >> it'll make things only more complicated for others while gaining nothing above
> >> what we have now.
> >
> > What about the approach I outlined in my reponse to Richard, where we
> > just introduce the IMAGE_MODE mechanism in OE-core without defining
> > specific modes? Would you find that useful?
> 
> Please no. Global variables are a headache, and the less we have of them 
> the better.
>
> Here in particularly, what is wrong with defining:
> 
> patricks-awesome-image-developers.bb
> (containing IMAGE_FEATURE = "no-password-for-anything")
> 
> patricks-awesome-image-production.bb
> (containing IMAGE_FEATURE = "serious-security")
> 
> and the common bits can go to patricks-awesome-image.inc.

Then why is not already done like that in practice? Is it just because
OE-core and Poky set such a bad precedence with teaching developers to
add EXTRA_IMAGE_FEATURES ?= "debug-tweaks" to make the images usable,
and then that approach gets copied?

I think everyone agrees that removing "debug-tweaks" would be a good
idea. But completely removing the global (sic!) EXTRA_IMAGE_FEATURES in
local.conf.sample would go even further, and I am not sure how the
reactions to that would be. I suspect there are people who find it
useful to have just one image recipe that gets build in different
configurations (dangerous and not so dangerous).

Feel free to prepare and propose a patch that implements the idea above
for OE-core; I personally won't, I've had enough negative feedback for
this week already ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




