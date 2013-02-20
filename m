Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U8BTw-00065E-Es
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 16:21:16 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Feb 2013 07:05:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,702,1355126400"; d="scan'208";a="289599469"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2013 07:05:01 -0800
Message-ID: <5124E661.5030004@intel.com>
Date: Wed, 20 Feb 2013 17:06:09 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
	<CAF6bG8dW=kCYM3c-_4A_hzNjiAQZjz6YKByZDjLYZR4y3j2-Aw@mail.gmail.com>
In-Reply-To: <CAF6bG8dW=kCYM3c-_4A_hzNjiAQZjz6YKByZDjLYZR4y3j2-Aw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg: upgrade to 9
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
X-List-Received-Date: Wed, 20 Feb 2013 15:21:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2013 06:04 PM, Marko Lindqvist wrote:
> On 18 February 2013 17:47, Constantin Musca <constantinx.musca@intel.com> wrote:
>> License checksum change due to:
>> - version modification
>> - links modification
>> - additional license explanations
>>
>> fix_for_automake_1.12.1.patch: not needed anymore
>>
>> fix-jmorecfg-boolean-enum.patch: added
>> - we have to undef TRUE & FALSE in order to define
>> the boolean enum
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>   Have you tried to build webkit-gtk against this? At one point I had
> similar jpeg update in my tree causing webkit-gtk build failure.
>
>
>   - ML
You are right. The problem is that I can't upgrade webkit-gtk because 
the new version requires ruby.

Cheers,
Constantin


