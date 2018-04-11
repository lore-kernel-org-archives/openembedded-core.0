Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id D4C277468E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 14:47:38 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id o9-v6so2274520otj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XB7aEmL1lR5TuFbq2GmNubDtI+5Z59RF2cYourrQ2rI=;
	b=Q3/kejWBXdhvlsozJagUqEDEYY4Dwy+eHHSTF6Gxxyam3X5FdIqUlMecV5KN1lq8iT
	yBvMB8rUYrIp34eXbMSf2sWOD3nqnC2LlYHF0VWYI74uZnW6j2erFIb2h/XNmzDS1/nA
	oD3raXy12s6cIQ1hR6t5GE95HZh85ex2IWPws5hKktrarJ9NTUJRRXKqIH7ezG1RviQ/
	PPUAkv0R57n0mUTOv85fCLWxgCT++Sk/yBXt1RNjbz61Ef3p6+NdfHONPMTzxYXgB1mC
	ULca5xRcsSlu7BR2ODRH9mNFhMoY6xkvlfdP69WSYG7us60Mrr2G2o24vwnUl0br5vd2
	Y6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XB7aEmL1lR5TuFbq2GmNubDtI+5Z59RF2cYourrQ2rI=;
	b=XB2hOSSxsf6LA8PsE/iDBOeGRzndkXmMWqs2mUphVF57gUW44irqMPC2rKjv4785vf
	sYcJlTq6XyQjKuXnFSVT5OjFZ1sKJXd0LxyxCJYGS9Q7hf3oBYfG4IiIc3Ibt3SDFVNn
	HelmVE1/lhdDT2myApktjnDJoBdut0+OeNmKB/1OWV4tX9OrH/GOHnSKZMMgXjteXHdW
	7KZ1x8ecHAhfgDbPsExYID1oK041mZ8B7NfdXXcPippbtpIj4G7gVvUZD5pz2Yx0twlN
	wa0cc0X8VXuGzQ+PxtDhr0nWL/453I/7IwI6YtG90jrfUhRL3TkPVYMJGpzCtfvA7pcn
	9iUw==
X-Gm-Message-State: ALQs6tDwD7xlqnZzUfSmF2YNuPGTZvTkpIr0JXVyqnvrcZKBmJR30jFr
	pVIA+J3iI6zIiY27Yh6MidDkKTW7bGx40agdy0DMSA==
X-Google-Smtp-Source: AIpwx4/APF6VHyG/ttW1vLIy0n1N1Qtn/7/MGEOQKlQCuTO0m6KbEoRxaPS35ZraXULeQ9t5IGJUla7GULyfErtjzrs=
X-Received: by 2002:a9d:70c1:: with SMTP id
	w1-v6mr3548218otj.300.1523458059485; 
	Wed, 11 Apr 2018 07:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 11 Apr 2018 07:47:18 -0700 (PDT)
In-Reply-To: <20180408230223.17260-1-marex@denx.de>
References: <20180408230223.17260-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Apr 2018 15:47:18 +0100
Message-ID: <CAJTo0Lbdrm7y5ZHHSHH980jmZSJE0RbhLQCVY3NtQ1DPz-A3fw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Wed, 11 Apr 2018 14:47:39 -0000
Content-Type: text/plain; charset="UTF-8"

On 9 April 2018 at 00:02, Marek Vasut <marex@denx.de> wrote:
> This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
> patches accepted upstream, getting the patch count to zero.

Are you proposing this for 2.5/Sumo (breaking the freeze) or is it
fine to sit in master-next until 2.5 is released?

Ross

