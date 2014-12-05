Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 17DEE723B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 18:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB5I2dlj009016; Fri, 5 Dec 2014 18:03:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zgkr8FK6wWBa; Fri,  5 Dec 2014 18:03:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB5I3Jub009040
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 5 Dec 2014 18:03:31 GMT
Message-ID: <1417802636.5102.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 05 Dec 2014 18:03:56 +0000
In-Reply-To: <20141204214800.GF2453@jama>
References: <1417087023-29423-1-git-send-email-gshastri@juniper.net>
	<969F26A8BAB325438E7EB80D3C3134FB2F3C5556@IRSMSX105.ger.corp.intel.com>
	<1417722559.15614.58.camel@linuxfoundation.org>
	<20141204214800.GF2453@jama>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"gmshastri@gmail.com" <gmshastri@gmail.com>
Subject: Re: [PATCH] When building with systemd based image, udev-hwdb postinstall script will fail because of not passing	correct CPU option. So fix it by passing correct QEMU_OPTIONS.
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
X-List-Received-Date: Fri, 05 Dec 2014 18:04:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-12-04 at 22:48 +0100, Martin Jansa wrote:
> Thanks for fixing that. Would it make sense to add comment saying that
> nobody is expected to use "QEMU_EXTRAOPTIONS" directly and that they
> aren't overrides (so that nobody makes the same mistake as I did).

Yes, I've done that, and fixed up another reference in the
qemuwrapper-cross so things are more consistent...

Cheers,

Richard



