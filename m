Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC082771F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:46:25 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id q80so1274838ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=S5huN1qSe6VDUCc2O8Qo3j3N48E5tY5dHX0BsYnCP4Q=;
	b=StIsJD8J78AzsfDtAl/EZqF5hAU/CypkQj9tqc2D+ZUw6il4KoUyaJLjPfVDry1KrE
	c4q3ECE2KHOuqyFoWox8Qub7/tA9Ox0q3cWj9MxAGQZx2VC005AAdJpAKVHollVZmNbD
	gEgpZhJahuoNaCeCj1+vMGbzmxLHV2Kn9qyVRu12P0sFlhbbxnvigun9tStmA59ApmY1
	KwsyZHInepz8EEYJzi5guTELXNZaYaOwWOF6ZtH97nS33XUOKPIGtKH0ETOOWn41S5yi
	eSHy8Ui7+5FNKiyPDhaKxOoaNlsqeUMC2cRRbFbKvJR9mRFF6wVB3Sj5J0pEJPWITEm+
	q/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=S5huN1qSe6VDUCc2O8Qo3j3N48E5tY5dHX0BsYnCP4Q=;
	b=mf10wcy52yUb9mUoejbgFQ6rJLRe6q7u322NgR5XUOIrpR/1CcIECYSku/lFr4YHhg
	t3ax0x7QIqnnnqbhu/ALVrsTZjNecgp1XRKkhWr6pAAJzswjqGHhp1VhnBlTllwJvBZm
	geG+6MX5E4Lksee5A4oHr73Bp7gyr0NyRrZN8Nii+Qv/wazWWaPj5loF+ASxqqeOt1J6
	cRS7kBMWX3D/ept/NcTAPvcp1L+PpVvwmDMPmjAxNml48u846WFLeyvKAVy+Hr034xHf
	aPHeV2J4RQAiXB6T7NlIHjkeSughr5LtVivA/2g2j4RyXxnhY4Lm6CafGyLzlbnOT1Z4
	wM+A==
X-Gm-Message-State: AHPjjUjlg1wjQ8oidgRqIG4pV+uUXHYztzOQ1CtgnlPqI2dpHKqsoHCM
	mL+XBXtM1qoflRVXexZ8cbFt2l5h
X-Received: by 10.37.220.6 with SMTP id y6mr4020435ybe.214.1506620786210;
	Thu, 28 Sep 2017 10:46:26 -0700 (PDT)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47]) by smtp.gmail.com with ESMTPSA id
	f184sm836862ywc.19.2017.09.28.10.46.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 10:46:25 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id u130so3530675oib.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:46:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDX7QNk0fNiHBwKHGv/4GHH4WEDyxHTEJroeKQCcP+5/UxJnhk7eljwS9HPkZZ8DeZMFNxC8aGiA+CTYNNZamM=
X-Received: by 10.202.104.148 with SMTP id o20mr785581oik.409.1506620784411;
	Thu, 28 Sep 2017 10:46:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 28 Sep 2017 10:46:23 -0700 (PDT)
In-Reply-To: <20170928174429.GO3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
Date: Thu, 28 Sep 2017 14:46:23 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
Message-ID: <CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 17:46:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Tom,

On Thu, Sep 28, 2017 at 2:44 PM, Tom Rini <trini@konsulko.com> wrote:
> On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
>> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
>> > In the case of non-wic images there is logic today to generate a
>> > startup.nsh file that will be executed by EFI to run the loader that the
>> > image contains.  In the WIC case is currently depends on that file being
>> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
>> > present there.
>>
>> What's wrong with this approach?
>
> No one ever provides a startup.nsh and everyone that wants one creates
> the same one line trivial example.  The end result is that no WIC images
> are Just Bootable on UEFI systems unless you first go and spell that out
> as the desired booting device.  This isn't an awesome workflow which is
> why the non-WIC cases make the required startup.nsh :)

I think it could be done as we did for u-boot-extlinux support.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

