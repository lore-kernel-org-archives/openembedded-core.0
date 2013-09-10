Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 89F0460FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 14:08:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8AELgOu022776; Tue, 10 Sep 2013 15:21:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xs9p-V0wd40U; Tue, 10 Sep 2013 15:21:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8AELsYi022784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 10 Sep 2013 15:21:56 +0100
Message-ID: <1378822091.3484.163.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 10 Sep 2013 15:08:11 +0100
In-Reply-To: <522ECB4B.2070209@windriver.com>
References: <1378736079.3484.117.camel@ted> <522ECB4B.2070209@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Stop providing ${P} and ${PF} by default
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
X-List-Received-Date: Tue, 10 Sep 2013 14:08:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 15:33 +0800, Robert Yang wrote:
> Thanks, Can we provide a replacement for the "bitbake PN-PV" since it is
> useful, for example, can we support the PREFERRED_VERSION_${PN} in the env
> in the future ? There is a similar bug:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4965

If you set BB_PRESERVE_ENV=1 you can set PREFERRED_VERSION_xxx from the
environment so this should already be possible?

Cheers,

Richard


