Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B411E601E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 22:49:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2015 15:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,668,1427785200"; d="scan'208";a="593540053"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.55])
	([10.219.4.55])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2015 15:49:55 -0700
Message-ID: <5589E306.6020807@linux.intel.com>
Date: Tue, 23 Jun 2015 17:51:50 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Christopher Larson <clarson@kergoth.com>
References: <1435089761-27337-1-git-send-email-anibal.limon@linux.intel.com>
	<1435089761-27337-2-git-send-email-anibal.limon@linux.intel.com>
	<CABcZAN=VA7n8WucUUgWiPXK+bqoNB6Qz2dznOyVNQtKbaukmHQ@mail.gmail.com>
In-Reply-To: <CABcZAN=VA7n8WucUUgWiPXK+bqoNB6Qz2dznOyVNQtKbaukmHQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/sstate.bbclass: Improve checkstatus using connection cache.
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
X-List-Received-Date: Tue, 23 Jun 2015 22:49:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/06/15 16:42, Christopher Larson wrote:
> On Tue, Jun 23, 2015 at 1:02 PM, Aníbal Limón <anibal.limon@linux.intel.com>
> wrote:
>
>> Use FetcherConnectionCache to improve times when do checkstatus over
>> sstate resources.
>>
>> Add debug message about how many SState objecs are available also
>> how many time takes to get it.
>
> If this is an RFC, it should be marked as such in the subject. If not, and
> you actually want it applied, I don’t think including debug messages with
> performance metrics is appropriate.
I agree, sending v2 removing debug messages.
     alimon


