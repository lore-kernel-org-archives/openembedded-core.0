Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TyUZ0-0002LF-Az
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:42:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0OLQpSQ012332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2013 13:26:51 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 24 Jan 2013 13:26:50 -0800
Message-ID: <5101A719.8030801@windriver.com>
Date: Thu, 24 Jan 2013 16:26:49 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Development list for the linux-yocto repositories
	<linux-yocto@yoctoproject.org>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: FYI: new linux-yocto contrib option
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
X-List-Received-Date: Thu, 24 Jan 2013 21:42:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

We now have a more up to date kernel repository for contributions to
the linux-yocto kernel or linux-yocto meta data (configs, patches).

(Michael indulged me and help set this up really quickly, so he gets
all the credit for the work on this).

Enough rambling, and onto the link:

   git://git.yoctoproject.org/linux-yocto-contrib
   http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-contrib/

This is just like the old contrib repository (linux-yocto-2.6.37-contrib),
except that it is up to date with the mainline kernel, and doesn't
have a version number stuck in the middle. There's a cron job that
will ensure that it stays up to date, saving bandwith on pushes
and pulls from the repo.

Anyone sending kernel pull requests should switch to using this repository.

We'll hide the old linux-yocto-2.6.37-contrib repository from the main
cgit page to reduce clutter, but the repo will still be present and
accessible.

Cheers,

Bruce


