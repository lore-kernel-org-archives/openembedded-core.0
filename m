Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B36B4719DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:39:23 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id z13so20086353iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=RTzgiCvP01BEMw6yYuAY0jSN9loBc3SrT1BOHhmA0DI=;
	b=Lyq1OMLjyYmyFSo/Ld5Lc46dwgNVTZdDt+MQVp25T7cU9RYrIqQo/XwEnYTZDk4k2z
	/auawMdlwIZNVJFRQXH+wDAtWlo+0UoZCCYcjJvo5s81GlxkbC71zeaDM+EtBRKFp3Ac
	Iwc2oUC95phwIaFqB8jPxaEumnqjiOrZBQEd5CSrE7lGdKQ0v2gZAYUmZGlA9UcCr8W7
	M1RODx3JDuu1gcd6/8LFXO/MmjHSmdcR2EFoIu91HkHuQOfb0k/LD43CicTBTrXL19fw
	USd7YoEaUBd7ybNSbzbi0thpAZTBcAV5vNuDq+M9bpGlrKWGHN7SB0KtkmFyxyHoCiNE
	+PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RTzgiCvP01BEMw6yYuAY0jSN9loBc3SrT1BOHhmA0DI=;
	b=i5zJWduxgRpR0uzBTAO56kQEUtfHp3B1mVmU+9oe6D1y7xCr7pis/zhmBr7wCpWhfc
	Wj8xBKHej3vZIevrfLMqHUFeP/LFhOyqWpQUNePxSm8aFX/fURv3yn8WHMmvmRw0qH22
	gT14HMd9i1TMgpxs3cZ8m7E2h94N7X+byP5kjI0Sf53MH/0egmoW/GGqiB7FVbR1TF7X
	LIJSO/eG0QVnmv2EkreUbjqcHwvx7TidGO4Z966jMKUwbg+PGt1eFVVpkwP88JKv4XTV
	dQI/0HJcZM0o9YnHnZrjHB6ovwODZgNnhjgUYaI4FVHDMJGjuB+LhKFahgKlbVBg6jCP
	vccw==
X-Gm-Message-State: AFeK/H3aqLqf3WzuLeAMFzZeLIpvHWsBKh4k9/cOxyY81OYQyTQLe6d6j1m5pwG5xMfe7nP4
X-Received: by 10.107.12.215 with SMTP id 84mr4876654iom.89.1489585164398;
	Wed, 15 Mar 2017 06:39:24 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id
	d12sm1492926iog.53.2017.03.15.06.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 06:39:23 -0700 (PDT)
Message-ID: <1489585158.6396.102.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Wed, 15 Mar 2017 14:39:18 +0100
In-Reply-To: <20170315125810.GA28986@linux.intel.com>
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
	<1489562674.6396.89.camel@intel.com>
	<20170315125810.GA28986@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 15 Mar 2017 13:39:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 14:58 +0200, Ed Bartosh wrote:
> Regarding do_rm_work. It should not touch rootfs directories, I believe.

It does, and it should by default because a rootfs can be quite large.
If it's not going to be reused in another recipe, then it is worthwhile
to remove it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




