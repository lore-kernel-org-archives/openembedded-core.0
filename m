Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3BE60685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:59:17 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id xy5so13551528wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jo+BP65bIBIK70O4DYnAavfs47SFKtYppdsaeDWgbX8=;
	b=rOz55pbUckxEWSoVFrUFLFNkyxqouXUOra1oDNMJ83OAZAHdtUjvIDIW9PP0Ry1Jme
	errNhSGM78T2v3LGrQ7Izlch+l0APyydMThr77h/6A1ulYcs/Q2CJi43dQrqwnch3MHN
	YB8+bOu0YRH+ljCTeT0AKUMR/paHjEUAvUZSbZk437zi4E/N9j+wLR6jidn0jjLV0GJ3
	RjDKYjDfA6VIDy2TiXF4f04mW1qEHj0jns4s9CujWCvhLdJaL69bSY4w6r2k47b4drEL
	wE7PKzLRioeQXwFTZ6ziRln0ame76YoFE+JqK4nlk4uoCE2+L7d2uRqKuqi5E6yOfFdl
	aPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Jo+BP65bIBIK70O4DYnAavfs47SFKtYppdsaeDWgbX8=;
	b=J6Giy5ZO6hWyErMR0zq/XMqS2XfkOqFzF4Fb2OGgIEDEBuAqa+T4iJZ9aFiP1fK+bP
	LlofYszJTgFkoByysjHaRey0EgKYnU97UNzXjJIAPSRJmETo9EEgC3SkPob45VKeKWqq
	2/nWu/MM38DpphiIrPvrM+N0MXXCv6edNiwajR5HhPeHmWb69Z5X/F6zkJm8zyxoNrlN
	/xgCF74NYRrDWbOrje3BmAP0HhONqcHMPN2YCuOy4nnTjMM2WVzB7hVFKvHhN2Qzizml
	CVa7QcNqJS9t+T9rFTV6xO6j7I4ZA411wnkEXCP3JBM6xFkZQiWJeTea/e5pZ38s80QN
	AvSg==
X-Gm-Message-State: AKaTC03yHnL2w7FI8X1kVqd5FIplbLhbQJzjA76rkjgQD5Qf1kP3XqBaEfDGcaO8tUQ2Ag==
X-Received: by 10.194.103.100 with SMTP id fv4mr18360354wjb.102.1480330758063; 
	Mon, 28 Nov 2016 02:59:18 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	f67sm28262178wmd.13.2016.11.28.02.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 02:59:17 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 11:59:11 +0100
Message-ID: <1828681.KGajjQBiyB@crde-port-20.cahors.local>
User-Agent: KMail/5.3.3 (Linux/4.8.9-1-default; KDE/5.28.0; x86_64; ; )
In-Reply-To: <ea567625-caf4-487d-449f-31c2d1b36427@windriver.com>
References: <CAKRNOGzXLf_kfousHniKin-qqs2TURwOQQptDJTMHA9Gqe5now@mail.gmail.com>
	<CAJTo0LaJZesXW8ytS+nkVh2Sa1JGKzMsSN=MPvoqMQz5sezyAQ@mail.gmail.com>
	<ea567625-caf4-487d-449f-31c2d1b36427@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] rootfs: Modify RPM installation
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
X-List-Received-Date: Mon, 28 Nov 2016 10:59:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On vendredi 25 novembre 2016 13:09:30 CET Mark Hatle wrote:
> On 11/25/16 12:17 PM, Burton, Ross wrote:
> > On 24 November 2016 at 10:49, David Vincent <freesilicon@gmail.com
> > 
> > <mailto:freesilicon@gmail.com>> wrote:
> >     -        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm',
> >     '/var/lib/smart']) +        self._setup_dbg_rootfs(['/etc/rpm',
> >     rpm_libdir, '/var/lib/smart'])> 
> > Can we extend the un-hardcoding so this uses ${localstatedir}/lib/smart,
> > and rpmlibdir also uses ${localstatedir}?
> 
> The value for the rpm directory is hard coded into the configuration file.
> Anything we do outside of that MUST match.  Inspect the rpm macros file for
> the matching value.  (This is why /var/lib/rpm was hard coded in the past.)

And that was the root cause of the problem when rpmlibdir is modified from its 
default value. Maybe the rpmlibdir variable should be documented in the ref-
manual for those who wants to tinker with it.

> 
> As for smart, I don't remember the rules offhand, so someone will need to
> figure out if it's variable (compile time) or hard coded.
> 
> --Mark
> 
> > Also current master lets you not bother passing True to d.getVar() as that
> > is the default now.

So should I send a v4 ?

> > 
> > Ross



