Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 32F4860557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:45:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Aug 2015 09:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,722,1432623600"; d="scan'208";a="773220886"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2015 09:45:14 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 54D0F6A4087; Fri, 21 Aug 2015 09:44:26 -0700 (PDT)
Received: from 10.252.47.114
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 21 Aug 2015 19:44:26 +0300 (EEST)
Message-ID: <59469.10.252.47.114.1440175466.squirrel@linux.intel.com>
In-Reply-To: <1439730631.1218.25.camel@linuxfoundation.org>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
	<993511190b981cc8f6dfbffca61b5d8c56a891a4.1439548737.git.alexander.kanavin@linux.intel.com>
	<1439730631.1218.25.camel@linuxfoundation.org>
Date: Fri, 21 Aug 2015 19:44:26 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rpm: update to 5.4.15
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
X-List-Received-Date: Fri, 21 Aug 2015 16:45:16 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> The autobuilder exploded with failures like:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/430/steps/BuildImages_1/logs/stdio
>
> which are due to the installed manifest file listing installed packages
> being empty.

After spending some time with this issue I have to give up (for now). Rpm
seems to install the packages without any errors, but the database of what
is installed isn't updated correctly (rootfs/var/lib/rpm/Packages is
empty, but there are also __db.00N files in the same directory which
weren't there when the previous rpm version was in use). Then when rpm is
later asked to provide a list of installed packages, it returns nothing
and image build breaks down.

If there are any rpm specialists around, feel free to pick it up:
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates-rpm-db-incomplete

Regards,
Alex

