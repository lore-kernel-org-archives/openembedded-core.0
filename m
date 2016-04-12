Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0B56A62133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:57:04 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id o126so18315500iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=IqJAWyS1QrmQfEPFZV7GPN8mK04xrW2WQDrQlS7FVd4=;
	b=KMXfSPsSTissSPf1+bEwRu5pch6fSWNpTfRmztX/fdBkMw6HqpWxC5V+3hb6qmHWdB
	xELscU5Dd+EQ8u5l7SvEknQcSL89rYnIjCisdnTze+hPj83tkekZM6idinMDzaCsceve
	x8aAoh0Tjwoa0+PFyzuEUKQSOoM87bwrf3Hyai8SNMo1hdV72Rh9RLP6hHZ71Gzb3/yq
	J/Zdrven/O5O3/ojmvdSuJQlHCxTNM63UUbUnfsO9UuT6YXqQmYsqaAIy5fgQvWR0Wqg
	10WZHzI3svfO7iYsX8DVIG34n7Hzs1UoS96Q6cKmjx7vr4b8LRe1MT9+0i0KHtpG6V+V
	BV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=IqJAWyS1QrmQfEPFZV7GPN8mK04xrW2WQDrQlS7FVd4=;
	b=F4qKdBJxpfiQkpdA8nSDYgbamw12Y3DzKvSFN9vdtQDRkiZh5zwPNrTpKFXLZ40AUE
	GNmZSR0yPoctlEhtGakZ5sBliskgiQ6O28i9qkWEyxjSl6YhoQd06iGLO+CmTM6kk9s4
	UArIR4vLZ7x5pVNV5TO2gdET3GZ5dnU4G2ByZOf6b2cWX0l3K463D87tcO/Lyx/khF86
	duTLZczzt+r0WEY4QbDrz9621rgFncWsnhyV/VkuqyznGroGk8QA5KPWBVkk3rp3+ULW
	gnnidLC1dde6SOV8xVch9beClWvggXhHtN3FKjvj67iucH71bQ5fG81IdjkY55fKcE8Z
	2s3w==
X-Gm-Message-State: AOPr4FWdGZ/li2WfVQLJkbDm6FzaobZTtDBSih1a1Ax8VAsgAexoIYfEsmpC8FYyTJBgdkxl
X-Received: by 10.107.13.133 with SMTP id 127mr2647557ion.129.1460447824753;
	Tue, 12 Apr 2016 00:57:04 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D633.dip0.t-ipconnect.de. [93.232.214.51])
	by smtp.gmail.com with ESMTPSA id
	au6sm14885831igc.0.2016.04.12.00.57.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Apr 2016 00:57:03 -0700 (PDT)
Message-ID: <1460447821.25299.7.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Apr 2016 09:57:01 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Busybox syslogd/klogd and journald
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
X-List-Received-Date: Tue, 12 Apr 2016 07:57:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

Can anyone think of a reason why busybox syslogd and klogd are enabled
even when using systemd's journald? journald already captures both dmesg
and syslog output, the other two daemons are just plain redundant.

Is it perhaps because it is unclear during compilation of busybox
whether the daemons are needed?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




