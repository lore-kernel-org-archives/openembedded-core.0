Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E96D773243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 14:25:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Sep 2015 07:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="774540641"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2015 07:25:16 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id C8CD36A4087; Tue, 22 Sep 2015 07:24:21 -0700 (PDT)
Received: from 10.252.48.86 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 22 Sep 2015 17:24:21 +0300 (EEST)
Message-ID: <60704.10.252.48.86.1442931861.squirrel@linux.intel.com>
In-Reply-To: <20150922131738.GA2388@jama>
References: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
	<560029CB.6050006@linux.intel.com>
	<CAJTo0LaJFQozfE1gaXvdEBR=ioCB7GR425_TDJaiVE1E9UnuXA@mail.gmail.com>
	<58887.10.252.48.86.1442920356.squirrel@linux.intel.com>
	<20150922131738.GA2388@jama>
Date: Tue, 22 Sep 2015 17:24:21 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Martin Jansa" <martin.jansa@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Sep 2015 14:25:16 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Why can't the tools figure out which recipes should be excluded from
>> builds without explicit annotations?
>
> See discussion around this change on ML and please don't remove stuff
> just because you don't know/remember why it was added without at least
> using "git blame" to read commit which introduced it.

Fair enough. What about adding new recipes? How is one supposed to figure
out whether there are required distro features to list?


Alex

