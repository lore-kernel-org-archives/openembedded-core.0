Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7427E70657
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 09:29:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6V9TG5x006320
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 02:29:16 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 31 Jul 2014 02:29:16 -0700
Message-ID: <53DA0C70.50403@windriver.com>
Date: Thu, 31 Jul 2014 17:29:20 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <86wqaw5000.fsf@shell.gmplib.org>
In-Reply-To: <86wqaw5000.fsf@shell.gmplib.org>
X-Forwarded-Message-Id: <86wqaw5000.fsf@shell.gmplib.org>
Subject: Re: backport patches for gmp-4.x.x
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
X-List-Received-Date: Thu, 31 Jul 2014 09:29:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit




-------- Original Message --------
Subject: Re: backport patches for gmp-4.x.x
Date: Tue, 29 Jul 2014 05:15:11 +0200
From: Torbjörn Granlund <tg@gmplib.org>
To: Rongqing Li <rongqing.li@windriver.com>
CC: <gmp-discuss@gmplib.org>, <gmp-devel@gmplib.org>, "Patches and 
discussions about the oe-core layer" 
<openembedded-core@lists.openembedded.org>

Rongqing Li <rongqing.li@windriver.com> writes:

   Torbjorn Granlund:

   we am using the gmp-4.2.1, but compiling gmp failed on mips64
   and 64bit userspace, I see the patch 12418[(mips, powerpc):
   Provide assembly-free umul_ppmm for newer gcc] can fix it. but
   it is under GPLv3;

   Could you release this patch under GPLv2?

No.

Use GMP 6.0.0 or later of you dual-licensing is important.


Torbjörn
Please encrypt, key id 0xC8601622





