Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0DE600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 14:09:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2017 07:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,330,1491289200"; d="scan'208";a="1168271374"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2017 07:09:01 -0700
To: openembedded-core@lists.openembedded.org
References: <20170512135918.25150-1-awais_belal@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
Date: Fri, 12 May 2017 17:06:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170512135918.25150-1-awais_belal@mentor.com>
Subject: Re: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Fri, 12 May 2017 14:09:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2017 04:59 PM, Awais Belal wrote:
> +-        *perl ) echo '#!/usr/bin/env perl'
> ++        *perl )  PERL=`which perl`
> ++                 PERL=`readlink -f ${PERL}`
> ++                 echo '#!' ${PERL}

Isn't this backwards? And why is PERL set twice in a row?


Alex


