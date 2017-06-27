Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id AA6DD6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:21:42 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id h64so14269375iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=GeXCvK8ccXsRtBCJKehVZEBBepZnLC8mdyHYo5t6alM=;
	b=FY5RBftFmwveXo4ALZWqq9jXPjDFEt+0y3/sOENrOuQi3v8/emw6N1mkP3UP0MO+OD
	+s5Lgi8WCE66w1ml6jCprrOJ2+wH17vh0iezQqpCpvlmW35wbRG6wMPD5AdBmatT31UE
	gJJO3jwb36nScun4+pUETXn5KDQPhyJ7ryQkNHBEqChxHj7s8rAQSAfftAqEuwvBrfdW
	MwGo3fL3ELZiLNv6hMq9n+Z2v8cGaZ1x3d+QDM/2Tu6kfpRzlSrk4mGoE3vBZS/DoKiP
	P62Zsdr+4I3zQyTZ33T63d1Wi6PTMdv3+mdXHO70ks4xNhPCWRRCHLo/2UaVA5goDRcu
	0VYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=GeXCvK8ccXsRtBCJKehVZEBBepZnLC8mdyHYo5t6alM=;
	b=Fes5lmc4F0pAPjKfkiXA/t3qyl7ZFK5IEiDzHu+Rqgp8UfjGsv/OYONkCwJtXjhHV+
	yy+CoRAXjd29yylVM+tZS17UnZFwOVT8ZRKYENlUwQaDyejscDmNtqCOO5NUZ/WAUEZh
	4zwbb8z7Fe4uA994JyO8funAuOM2UXrCMopSgo0CJD3fQsbQh2lro58m4P44JYxgG/HO
	QGeVUXvLGg3ZIxvnlokoHujxfa2DVENH6YJf5oOMIb1GD3hkPLAASImSp1qWr1cNQ0pt
	2iybZwt4+PlDuHzAjTJaXoI8gHRKscG1yEdaQyGk3prVIDMmisf5nqxq4BVkCqjnYJXi
	//8g==
X-Gm-Message-State: AKS2vOwYxjOA/yKk9uT04o9Z4aJ5MWLBl5hUuyATaAAFj0Fu/gDYCx+h
	VcCqfTQJeWF0S2ip
X-Received: by 10.107.131.229 with SMTP id n98mr5949309ioi.97.1498555304290;
	Tue, 27 Jun 2017 02:21:44 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id e4sm1285685ioe.50.2017.06.27.02.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 02:21:42 -0700 (PDT)
Message-ID: <1498555300.7464.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Jun 2017 11:21:40 +0200
In-Reply-To: <1498551943.3124.4.camel@linuxfoundation.org>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
	<1498550932.7464.29.camel@intel.com>
	<CA+chaQf=qedEY+V7b8WUG=YNKwANzTSabaY4DNZMa81V7-MiPQ@mail.gmail.com>
	<1498551943.3124.4.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 09:21:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-27 at 09:25 +0100, Richard Purdie wrote:
> So if its not default, we should make it default and I'd encourage
> people to use it.

It's not the default at the moment because it's only in
local.conf.sample, which people might not use.

So should a default for BB_DISKMON_DIRS be set in bitbake.conf?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




