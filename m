Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id C06AF72FF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:41:38 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l7so20020081ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=sQdArRyBjeCllvT67yf8WyBbMum8p98YKqY8u225rEU=;
	b=UUaB71AgNQg2tBAL4EALfs0wXG/zSj2nWFCYTM8Iwh8abjlEIiuEJckmql6GPWjyGD
	DFi+cqopJfIN2wc28XKl5830iL9nGEFp4JyhU5uoqZ1pbMnjm2qSrpZGsCGIM5nwWPeZ
	D+geQLbU6F6hOzSQxernyI6LZRNscqOE6pskxh8BB9+cpg6eztRjV1Ir1ZtfSE8ewW9W
	E5u4fplgjUVqQuFhE4BRVybWWZeibnBYT0O9Ld5dmf1rBzwdXod+JQ94mUBD2SsGLvJe
	hXOIxq0RcnXDEdpcBtg8Sms66NHg+eij3TRELBXdH0/bYLgRBH9dlg+nMIH5zA2qF6xN
	zH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=sQdArRyBjeCllvT67yf8WyBbMum8p98YKqY8u225rEU=;
	b=Qpq2MysY53NVPd3TBE/1rdhepOilFvKilhLkD5stCX/VAdJ8LUGgfbXIF4xcOPQmd9
	+rSlt105jAwIFAa+pf8woBafakYhMH7bKjAqoVWvWkn1dHEF6PlycTD3I5bBnIVrDbPS
	ZkXapuQiXo7Wg2hGOxqrgl2d0xD94qzmVJCfMwvM+zzTYplHaNpdbotK4Ac7iFf8Aaxw
	F9eQ9A4oZFIlhgVtscf8rkmLSKFunuoNn0IGbKwFPDvm4kElNYX2jBo62A9FY/1V82Jl
	Ftdz9K73wVsBsvS7XeZck0YZwuVZzfkZoG61sdXpkxhwoTfyW6C/J9IBysS/MOTEBpYi
	dXlw==
X-Gm-Message-State: AFeK/H3ny/jEAmo2FWsYf4FCRZmmZ4QFRjSqJEVniv96djNnr/w1p6RHVvsAd7FBpqDdxK6g
X-Received: by 10.107.133.86 with SMTP id h83mr5100604iod.230.1489585300274;
	Wed, 15 Mar 2017 06:41:40 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id
	y203sm1510777iod.11.2017.03.15.06.41.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 06:41:39 -0700 (PDT)
Message-ID: <1489585294.6396.104.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Wed, 15 Mar 2017 14:41:34 +0100
In-Reply-To: <1489585158.6396.102.camel@intel.com>
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
	<1489585158.6396.102.camel@intel.com>
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
X-List-Received-Date: Wed, 15 Mar 2017 13:41:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 14:39 +0100, Patrick Ohly wrote:
> On Wed, 2017-03-15 at 14:58 +0200, Ed Bartosh wrote:
> > Regarding do_rm_work. It should not touch rootfs directories, I believe.
> 
> It does, and it should by default because a rootfs can be quite large.
> If it's not going to be reused in another recipe, then it is worthwhile
> to remove it.

I should add that RM_WORK_EXCLUDE_ITEMS += "rootfs" can be used in image
recipes which know that their rootfs is going to be needed elsewhere -
it's just not the default.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




