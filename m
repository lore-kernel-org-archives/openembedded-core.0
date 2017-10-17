Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 67ACD782A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 13:57:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 17 Oct 2017 06:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="324206892"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga004.fm.intel.com with SMTP; 17 Oct 2017 06:57:14 -0700
Date: Tue, 17 Oct 2017 09:07:03 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-Id: <20171017090703.85ac6135846b0a469bca4631@linux.intel.com>
In-Reply-To: <20171017124339.3966-1-alexander.kanavin@linux.intel.com>
References: <20171017124339.3966-1-alexander.kanavin@linux.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/send-recipe-update-reminders: send recipe version update reminders by email
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
X-List-Received-Date: Tue, 17 Oct 2017 13:57:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Oct 2017 15:43:39 +0300
Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:

I like the idea of a simpler script to do this job.

Just one minor comment on the code: I would use non-zero exit values in case of errors and as a possible future enhancement, use a template (jinja2 for example) to format the email and just populate this with the data  from checkpkg.


Leo


