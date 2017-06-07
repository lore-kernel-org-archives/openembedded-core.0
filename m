Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7905F780BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:31:46 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id b184so7698691ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=t0qIbVURmLyM/rzQ6fOcenqcB2D//wh+MeGuAe8/1J0=;
	b=VKTuFqLFRpZYLKmTyww6gFcbg8maG8VengGSWXWvF8a1HpYIbSfclOinGj69bswCxm
	rUuSsr6CQO+XrXuBHZk6Gvmkf6oNbsZO2FSVaeUxvcpLOyvyFZDp+hc9CiEjoCnMrKfB
	/cCvEi71+cK+HbKgBwInylrcnJBBKAUzRXhY5QjVEiqvThMHb16V50CH2suEPEqut1os
	Cp6V/uajLER2myYJidYMGYXt/qGaKAw85zMsEuEcQi/Q/UU3ivq2kmuLa2wgaJhyAB7M
	/ejk8LL8IEQLpmuaEvnYvt+jsNYfw+TgKoi6Wk4MfgTaV2hGzVpVH+YshoRBQhbPFl7K
	ZnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=t0qIbVURmLyM/rzQ6fOcenqcB2D//wh+MeGuAe8/1J0=;
	b=UQNb9gGa2qbbWDe6gm8Q4qaHQ4Rx9rbpBKX6BteTTiHl/AkGOv42wTDs2djUeIV82f
	q+GgSUgzVzO5l0eY+IDhjumEmtPMZuIddMAZ0UEHTlnUcaYzqZ5RYrVx2NkjdsCb10Do
	mUndEiTrACbgLHpjVf8EqWMD6WYShVRknRbC2elIyl4/Q3cU0w+T/g7UOJjMllZhO3HF
	0Dy4ORt1GDcHrIBSMY3GrLdQnABpFdzlNosNmQxb4WA1qHUJFa9rt4qEsCEqkVd9YwMf
	w18/1lF8E3b5aJEb1Fz+HL3MB/J+uA47L/ni2yN+ZeCACTZ21NM1yo5eYzVmXtp9JKcz
	erwQ==
X-Gm-Message-State: AODbwcBBHR0oEYtB+7JUe+Uuxeh3/x+lrdQXWAP76j5CxmqdXiND+/La
	psx2632L8xliY5Xn
X-Received: by 10.107.132.201 with SMTP id o70mr23788187ioi.4.1496845908098;
	Wed, 07 Jun 2017 07:31:48 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FFF1.dip0.t-ipconnect.de. [93.232.255.241])
	by smtp.gmail.com with ESMTPSA id
	v13sm1033613ita.28.2017.06.07.07.31.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jun 2017 07:31:47 -0700 (PDT)
Message-ID: <1496845904.30163.102.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 07 Jun 2017 16:31:44 +0200
In-Reply-To: <1496836331.6630.213.camel@linuxfoundation.org>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1496836331.6630.213.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 07 Jun 2017 14:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-07 at 12:52 +0100, Richard Purdie wrote:
> On Wed, 2017-02-22 at 10:26 +0200, Amarnath Valluri wrote:
> > From: Joshua Lock <joshua.g.lock@intel.com>
> > 
> > Modify bindir, libdir and sbindir to be exec_prefix/$d, rather than
> > base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> >  meta/conf/bitbake.conf | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> I was asked to clarify the status of this series. We've taken many of
> the changes but the core changes to bitbake.conf haven't been merged.
> 
> Ross/I discussed it and we both feel that the bitbake.conf make the
> file pretty unreadable. We'd therefore like to see this implemented as
> a .inc file which gets included when the relevant DISTRO_FEATURE is set
> (or could just be included by the appropriate distro configs). This
> .inc file would then simply override the paths. I believe this would be
> a lot more readable than the current approach which is a key concern in
> the core config.
> 
> The merge of the rest of this feature is therefore pending on the
> development of such a patch, or a discussion convincing Ross/I why we
> shouldn't take that approach for some reason.

Such a .inc file would have to be included after the "Include the rest
of the config files." section, because DISTRO_FEATURES only has its
final value (?) at that point. One also needs the patch that I
coincidentally just sent today to the bitbake list which allows
including such a file only when "usrmerge" is in DISTRO_FEATURES.

Would that be okay?

One downside is that code using the variables earlier will just see the
non-usrmerge version, with no indication in "bitbake -e" that the value
might have been different in the middle of parsing. The if check in the
proposed patch has the same effect on the actual values, but at least it
shows up in "bitbake -e". This is not a particularly strong argument
either way, I just wanted to mention it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




