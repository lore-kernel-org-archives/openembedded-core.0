Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1TvI52-0001DF-OI
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 02:46:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jan 2013 17:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,476,1355126400"; d="scan'208";a="244391182"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2013 17:29:49 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id D5DFF2C8001; Tue, 15 Jan 2013 17:29:46 -0800 (PST)
Received: from 10.7.202.59 (SquirrelMail authenticated user kevin.strasser)
	by linux.intel.com with HTTP; Tue, 15 Jan 2013 17:29:46 -0800 (PST)
Message-ID: <40692.10.7.202.59.1358299786.squirrel@linux.intel.com>
Date: Tue, 15 Jan 2013 17:29:46 -0800 (PST)
From: kevin.strasser@linux.intel.com
To: openembedded-core@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: archiver.bbclass: what is the purpose of create_diff_gz?
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
X-List-Received-Date: Wed, 16 Jan 2013 01:46:26 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hi All,

In it's current state, the source archiver creates a diff.gz file
containing everything found in 'S'. I am wondering if this was really the
intended behavior, as 'S' usually contains things like object and binary
files. If anything, I would expect that this file should represent all
changes made to the original sources.

Thanks,
Kevin


