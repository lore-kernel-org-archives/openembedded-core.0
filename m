Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 16C476071F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 12:25:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2016 04:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,383,1477983600"; d="scan'208";a="1102458614"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 04:25:44 -0800
To: openembedded-core@lists.openembedded.org
References: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f00958f8-1c4a-e0ae-8a13-d6f672c8a850@linux.intel.com>
Date: Wed, 21 Dec 2016 14:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
Subject: Re: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
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
X-List-Received-Date: Wed, 21 Dec 2016 12:25:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/21/2016 01:14 PM, Burton, Ross wrote:
>     https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027
>     <https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027>
>
>
> Can you explain *why* we should cherry pick a patch from upstream?

Because someone didn't check RRS, which would suggest an update to gpgme 
1.8.0 should be done instead.

http://recipes.yoctoproject.org/rrs/recipedetail/834/

Alex



