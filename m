Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B402177444
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:14:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 26 Feb 2016 06:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="924511785"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2016 06:13:59 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id E45862C8001; Fri, 26 Feb 2016 07:01:47 -0800 (PST)
Received: from 10.252.8.77 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 26 Feb 2016 17:01:47 +0200 (EET)
Message-ID: <55970.10.252.8.77.1456498907.squirrel@linux.intel.com>
Date: Fri, 26 Feb 2016 17:01:47 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Mark Hatle" <mark.hatle@windriver.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
References: <cover.1456456877.git.mark.hatle@windriver.com>   
	<39dcc8978920aeaf0eeb206b7292f32af4b775f7.1456456877.git.mark.hatle@windriver.com>
In-Reply-To: <39dcc8978920aeaf0eeb206b7292f32af4b775f7.1456456877.git.mark.hatle@wi
	ndriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3 v2] rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
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
X-List-Received-Date: Fri, 26 Feb 2016 14:14:14 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> +Set the DB 6 version to match oe-core db 6.0.30
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +-    [db-6.1], [db_create], [db.h],
> ++    [db-6.0], [db_create], [db.h],

Why not update the oe-core recipe of db to 6.1 instead? Rpm is the only
thing that is holding it back.

Note that last time I tried, it broke completely when trying to create an
image, but maybe the problem has been fixed in the rpm upstream meanwhile:
http://lists.openembedded.org/pipermail/openembedded-core/2015-August/109187.html

Alex




