Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8933A71A62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:14:07 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v84so105011182oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=HTA0t714/hPiNcxsWXoSQ2BA79zLK0P8l8myhjnY1Jo=;
	b=sXpDxkyGM1iwb4b3NV9o2stDGjjC+MeM6muaLhhn0Db6FaS3AG6xlUshIPtQb3T3uM
	4reC/6vU3LQxOddjsR/YusI5HdgB2b+Qto5hWhBdXACA2+oAEC++4BS6rcy3DNpsq488
	SQTmbeVHeQzX41rakkqXCnDcU27gmuCEI4RcmWH1YdWxwsDKW2z2Sgwu4Wk80ztTwhhz
	MV+kHvMXqRqL8TY38izHA8Yw0EWxM2ZgzuR+45A7pWMgRccexR7Ke63FNkoLF6jxGt7P
	WJE+gxgzUFuxrA8hs8MFMriQL3JDPeZbwVnHIsmwYWnGNWSqB8XPo+6ZPMcPzDdrx+em
	p46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=HTA0t714/hPiNcxsWXoSQ2BA79zLK0P8l8myhjnY1Jo=;
	b=NPGzARUppTVNnP7FNBJQz1HQUYZTmlcOnPDJUycmIxHdw6w57hjimVQxbiIJPUAKkK
	DwgSrTlOxvksg6HDqhRkX84rB6fD9T62ojst1utk1ajZpbDOvmrZLp23fxRdbr8k1gUS
	cVrGNbOhJLfkkJp+USaeaNBBOJ+OBNEDjVDIh/G+cqtp/SFX+GY4QXCMzt36WJcz/1Qm
	W2z4se1gnXi8tFFnuiucefk/kCZMYuHH7rMYiarCpwCYsoUYdXsKuKspJgt/TVdBXSH7
	Fs1VzVouAoidcNzwgNMKJiy4LVz6t6jf2UyiyZrEbDmOUA9eGOoWU8jzAtE5imb2qQ7z
	ndOw==
X-Gm-Message-State: ABUngvdN5vyvUxmaezNznsdU7Ls5PEJKQaaBsynhzK3FoMK77Hj00zIv6xoejPuRgC4GcUm6
X-Received: by 10.107.1.138 with SMTP id 132mr9817324iob.72.1478200448378;
	Thu, 03 Nov 2016 12:14:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E52F.dip0.t-ipconnect.de. [93.232.229.47])
	by smtp.gmail.com with ESMTPSA id 7sm2865387ioh.2.2016.11.03.12.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 12:14:07 -0700 (PDT)
Message-ID: <1478200444.13356.108.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Thu, 03 Nov 2016 20:14:04 +0100
In-Reply-To: <CABcZAN=6WvHcfyUj5hYmFG6nYoYTkYLrqO6s70v31bYNn85iXg@mail.gmail.com>
References: <6511599a-ddb1-77b0-f42e-69afeaa60cae@linux.intel.com>
	<CABcZANnYeGT9VVFBH3cNGUKnE_jPw8CDGv2YC_10-w5pe=WmKQ@mail.gmail.com>
	<86a0da96-542d-685b-cdd3-588df6fe7024@linux.intel.com>
	<CABcZAN=6WvHcfyUj5hYmFG6nYoYTkYLrqO6s70v31bYNn85iXg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: using devtool for rebasing patches
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
X-List-Received-Date: Thu, 03 Nov 2016 19:14:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-11-03 at 10:14 -0700, Christopher Larson wrote:
> 
> On Thu, Nov 3, 2016 at 9:35 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> 
>         What you need to do here is to use git am --reject, which
>         would partially apply the patch, then find all the *.rej files
>         and let the user manually edit them in, then complete the
>         patch application with git am --continue.
> 
> 
> With -3, it’ll merge it into the file with conflict markers, which is
> a lot more pleasant to deal with than .rej files, even without the
> merge-base being available.

That's also what I would prefer.

To deal with recipes that have something other than git as source one
could create a local git repo with a branch that contains two commits
(old version and new version), apply the patches on a second branch on
top of the old version, then do the normal rebase with conflictstyle =
diff3. At least I find that configstyle useful and have it in my
~/.gitconfig.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




