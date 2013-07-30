Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 766156B20C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:25:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2013 07:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="378914707"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2013 07:24:57 -0700
Message-ID: <51F7CCB8.4020006@linux.intel.com>
Date: Tue, 30 Jul 2013 07:24:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1375164419.git.sgw@linux.intel.com>
	<CAJTo0LZk9HR12mR7nozaE0yZ-DjMPkagf1GvagEeKmkF2i6M9A@mail.gmail.com>
In-Reply-To: <CAJTo0LZk9HR12mR7nozaE0yZ-DjMPkagf1GvagEeKmkF2i6M9A@mail.gmail.com>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (M3 rc1) 00/26] Needs early review and ACK
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
X-List-Received-Date: Tue, 30 Jul 2013 14:25:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2013 02:46 AM, Burton, Ross wrote:
> On 30 July 2013 07:14, Saul Wold <sgw@linux.intel.com> wrote:
>> Saul Wold (2):
>>    bluez5: Add obex as a PACKAGECONFIG and package seperately
>
> I'm still unsure why this patch was needed.  I've nothing against
> splitting out the OBEX functionality and controlling it with a
> packageconfig, but this does disable it by default when before it was
> enabled.
>
> The libical build dependency is only required by obex, so that
> dependency needs to move.
>
Ok, then we can drop this,

>>    texinfo: Update to 5.1
>
> Yesterday or so this was marked for testing, I presume it's been
> tested and works fine now?
>
Yes

Resending C-PUll Now

Sau!

> Ross
>

