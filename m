Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCA86AC82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:45:41 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so6838584pac.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 15:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=6Iq0fNf8Sn3QETsACv3e/C/ne0pOVqQEg2FX/dbsvW0=;
	b=NZZ0vsyuBmXBiUEvRl9pkwE1lcv4MOZhA/mc1FXxZtQbERSPANs1g2bnOX15qkF98f
	eKx3oGm6DnYUphvL2DqyjK/4lkBb9nSJwSxVETzye7sQtYc4v17nCFxAy+egXRWokzNG
	Lbq5cIcbzpYVymyaFu4E9O2MoF3ZVj0WDUQqBJzPPQ4bF16wS6xEeH7ecpC7seAAoPX8
	FoRfe/3BmCNxhUN3KIT18aVdcFfo6Ikk9FEUGgy1VSIR5sKAwZJ9hLjyFWsnAhPdWz+H
	rv7qYVn7Sl0FqssYbZSVwxhqTrruzhFNA0qiAsQDhjS/Dm3qDUKxp2ST8/O8zWaNwbE5
	h7eg==
X-Gm-Message-State: ALoCoQk5RkMfZGWhaNGqm57k2CQofnLLIqPm0YJ/Yy7nEDQFuMDjL1VOAcInNQ0DEm7WZ/y2A8wB
X-Received: by 10.66.100.200 with SMTP id fa8mr21752723pab.23.1406328342154;
	Fri, 25 Jul 2014 15:45:42 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id x15sm9933016pbt.52.2014.07.25.15.45.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 15:45:41 -0700 (PDT)
Message-ID: <53D2DE13.9010007@mvista.com>
Date: Fri, 25 Jul 2014 15:45:39 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>,
	jackie.huang@windriver.com, Mark Hatle <mark.hatle@windriver.com>
Subject: libpcap-ng
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
X-List-Received-Date: Fri, 25 Jul 2014 22:45:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello all,

Meta-security and Meta-selinux both have libcap-ng. Instead of 
maintaining the same package in both places, can we get it into OE where 
libcap resides?


regards,
Armin


