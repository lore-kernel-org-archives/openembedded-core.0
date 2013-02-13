Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5fpq-000533-6Y for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 18:09:35 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1DGxPkn001330; Wed, 13 Feb 2013 16:59:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 12vYsWyQ+o6b; Wed, 13 Feb 2013 16:59:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1DGxHYi001290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 13 Feb 2013 16:59:21 GMT
Message-ID: <1360774391.11225.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Feb 2013 16:53:11 +0000
In-Reply-To: <CADkTA4PWV5zc7LtXZiMORT=XcMB-ydkxc2qZbsfrE0S_7oVXzA@mail.gmail.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
	<5110A9D1.20208@windriver.com>
	<CADkTA4MN+jzTZCLBK17mJvhvLbAB7yf-8Fr8bRBaM7c=b=_avw@mail.gmail.com>
	<1360675313.30425.14.camel@ted>
	<CADkTA4PqMtT5Jt3yuaKO=f=TX4hYk4qFrCP_2amMi3Y=KbW3uw@mail.gmail.com>
	<1360683160.30425.29.camel@ted>
	<CADkTA4PWV5zc7LtXZiMORT=XcMB-ydkxc2qZbsfrE0S_7oVXzA@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2013 17:10:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 11:50 -0500, Bruce Ashfield wrote:
> Attached is the fixed up patch with DEPENDS, the existing one had a typo
> in:
> 
>   do_config[depends] = "kern-tools-native:do_populate_sysroot"
> 
> I've gone ahead and replaced it with a DEPENDS and tested the failure case
> here.
> 
> This is a complete patch replacement, let me know if you'd prefer something
> incremental.

DEPENDS should be towards the start of the file and/or use =+ in case
something in one of the classes also sets DEPENDS. I tweaked and merged
it since I don't really want to review it again ;-).

Cheers,

Richard



