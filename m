Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C037760043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:44:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 27 Aug 2015 04:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="791988734"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2015 04:44:09 -0700
Message-ID: <55DEF867.3020500@linux.intel.com>
Date: Thu, 27 Aug 2015 14:45:43 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>	<1440666743-12035-2-git-send-email-andrew.shadura@collabora.co.uk>	<CAHiDW_E+9HLPzehoxvm2S6RUuRfy5mcgYqXEL69rrr-d2=U+mQ@mail.gmail.com>
	<55DEF697.5010106@collabora.co.uk>
In-Reply-To: <55DEF697.5010106@collabora.co.uk>
Subject: Re: [PATCH 2/3] dbus: update the recipes to 1.10.0
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
X-List-Received-Date: Thu, 27 Aug 2015 11:44:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/27/2015 02:37 PM, Andrew Shadura wrote:
> On 27/08/15 13:22, Jussi Kukkonen wrote:
>> Could you please configure your git so that it tries harder to find
>> renames: it's hard to see the changes otherwise. Something like this
>> would work in git config (the other option is renames=copies):
>
> Right, thanks for the suggestion. Resubmitting that patch.

Whenever you change something else than the version number and tarball 
checksums (e.g. build options, or dependencies, or adding/removing 
patches), it's good to explain in the commit log message what was 
updated and why. So you provide answers to the 'why' questions before 
people ask them :)

Regards,
Alex


