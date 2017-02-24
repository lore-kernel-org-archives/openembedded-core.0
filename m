Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 638AB73110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 07:31:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 23:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,200,1484035200"; d="scan'208";a="229182049"
Received: from mburny-mobl.ger.corp.intel.com (HELO [10.252.22.38])
	([10.252.22.38])
	by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2017 23:31:53 -0800
User-Agent: Microsoft-MacOutlook/f.1f.0.170216
Date: Fri, 24 Feb 2017 09:31:54 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <7AB8ADC0-CEBA-4A5F-A2BF-4B62854EB9AA@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Fix rpm signing with GPG v2.1
References: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
	<9bbd49a0-b838-4342-43df-2bf3276c45ca@gmail.com>
In-Reply-To: <9bbd49a0-b838-4342-43df-2bf3276c45ca@gmail.com>
Mime-version: 1.0
Subject: Re: [PATCH 0/3] Fix rpm signing with GPG v2.1
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
X-List-Received-Date: Fri, 24 Feb 2017 07:31:53 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 23/02/2017, 17.58, "akuster808" <akuster808@gmail.com> wrote:

    Markus,
    
    
    On 02/23/2017 02:24 AM, Markus Lehtonen wrote:
    > This patchset makes signing work with all versions of GPG.  Previously, rpm
    > package signing in oe-core was not working with GPG v2.1 (which is becoming
    > more widespread). This was caused by a change in passphrase dialogue handling
    > of GPG.
    
    Off hand, do you know if Morty would benefit from this?

Yes it would. Same problem with GPG 2.1 there
  - Markus




