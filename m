Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 63B1E71C14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:21:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 23 May 2017 06:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,382,1491289200"; d="scan'208";a="90657132"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 23 May 2017 06:21:14 -0700
To: openembedded-core@lists.openembedded.org, Alan Levy <alan.levy@plextek.com>
References: <62b9d549e24c4b989a50dc565324e7e7@PLEXTEK-EXCH1.plextek.lan>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7e72ced1-5098-3f48-0bec-c8e4cf0f571f@linux.intel.com>
Date: Tue, 23 May 2017 16:19:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <62b9d549e24c4b989a50dc565324e7e7@PLEXTEK-EXCH1.plextek.lan>
Subject: Re: FW: patchtest: failure
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
X-List-Received-Date: Tue, 23 May 2017 13:21:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2017 03:04 PM, Alan Levy wrote:
> The patch applies correctly on my Linux development system but I'm
> having to copy it to a Windows PC and use Outlook to submit it
> because the Linux system has no access to email. I can only suppose
> that's why I get these errors. How do I fix this?

You only need access to any smtp server from the Linux machine; using 
'git send-email' does not require configuring access to an email account.

Alex

