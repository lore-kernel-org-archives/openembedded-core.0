Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1A635770EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:21:10 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D642CF811E0; Fri, 16 Oct 2015 09:21:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6A1ECF811E0;
	Fri, 16 Oct 2015 09:21:10 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1445005527-2384-1-git-send-email-adrian.ratiu@ni.com>
	<56210C4A.2090400@mlbassoc.com> <20151016144408.GB2544@jama>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5621160F.2020004@mlbassoc.com>
Date: Fri, 16 Oct 2015 09:21:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151016144408.GB2544@jama>
Subject: Re: [PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Fri, 16 Oct 2015 15:21:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-10-16 08:44, Martin Jansa wrote:
> On Fri, Oct 16, 2015 at 08:40:10AM -0600, Gary Thomas wrote:
>> On 2015-10-16 08:25, Ioan-Adrian Ratiu wrote:
>>> x11vnc can be configured with --use-system-libvncserver to use an
>>> external libvncserver which will be added to meta-oe. Since oe-core
>>> should not depend on meta-oe, we move x11vnc there.
>>>
>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>>
>> Just curious why not the other way - move libvncserver to OE-core?
>> x11vnc seems like one of the very few [and useful] X based tools that
>> are present in OE-core that it seems like a huge step backwards to
>> move it out.
>
> It was discussed in "[OE-core] [oe] [meta-oe][PATCH v2] meta-oe:
> recipes-graphics: add libvncserver recipe" thread and I agree with
> Otavio that x11vnc doesn't look so fundamental component used by most
> embedded builds to deserver being in the core.

Well, I tend to disagree and I don't think there has really been a
discussion - only one "no" (Otavio) and one "I don't know" (Paul).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

