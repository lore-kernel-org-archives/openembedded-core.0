Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1TwGsg-0008Hs-4v
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 19:41:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jan 2013 10:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,494,1355126400"; d="scan'208";a="275587182"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2013 10:25:02 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 3583C2C8001; Fri, 18 Jan 2013 10:24:59 -0800 (PST)
Received: from 10.252.133.156 (SquirrelMail authenticated user kevin.strasser)
	by linux.intel.com with HTTP; Fri, 18 Jan 2013 10:24:59 -0800 (PST)
Message-ID: <59506.10.252.133.156.1358533499.squirrel@linux.intel.com>
In-Reply-To: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
References: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
Date: Fri, 18 Jan 2013 10:24:59 -0800 (PST)
From: kevin.strasser@linux.intel.com
To: "Holger Hans Peter Freyther" <holger@moiji-mobile.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: Archive the native builds as well
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
X-List-Received-Date: Fri, 18 Jan 2013 18:41:38 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On my build no copy of gcc/opkg-utils was archived. For gcc it is
> bad as libgcc will end up in the image and the sources should be
> provided. Update the method and comment to not exclude the native
> version of the build.

Native packages shouldn't be included in the target image, and therefor do
not need to have their sources archived for any compliance purposes.

-Kevin


