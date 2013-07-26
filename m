Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC8C6AE6E;
	Fri, 26 Jul 2013 16:08:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6QG8Ji6004219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jul 2013 09:08:19 -0700 (PDT)
Received: from [128.224.20.81] (128.224.20.81) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 26 Jul 2013 09:08:19 -0700
Message-ID: <51F29EEF.1020806@windriver.com>
Date: Fri, 26 Jul 2013 12:08:15 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51F18346.2@windriver.com> <20130725202743.GB3280@jama>
	<2462161.40E7azp51u@helios>
In-Reply-To: <2462161.40E7azp51u@helios>
X-Originating-IP: [128.224.20.81]
Cc: koen@dominion.thruhere.net, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: Add lua to oe-core.
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
X-List-Received-Date: Fri, 26 Jul 2013 16:08:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-07-26 10:11 AM, Paul Eggleton wrote:
> On Thursday 25 July 2013 22:27:43 Martin Jansa wrote:
>> On Thu, Jul 25, 2013 at 03:57:58PM -0400, Randy MacLeod wrote:
>>> I've found that many projects use the lua scripting language.
>>> I'd like to move it from meta-oe to oe-core:
>>>
>>> http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recip
>>> es-devtools/lua/lua5.1_5.1.5.bb?h=master
>>>
>>> http://www.lua.org/about.html
>>>
>>> lua-5.2.2 is current, see: http://www.lua.org/download.html
>>> so we'd likely uprev and send that version.
>>>
>>> rpm and lighttpd could (would?) optionally depend on lua.
>>>
>>> oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
>>>
>>> meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
>>>                --without-lua \
>>>
>>> Any comments pro or con before we do the uprev, testing and send
>>> a commit?
>>
>> 2 recipes which would optionally depend on it doesn't make it good
>> "core" component IMHO.
>>
>> But uprev, few PACKAGECONFIGs and more testing would be nice.
>
> I concur with Martin, if we're only talking about optional dependencies this
> should just be a case of adding the PACKAGECONFIG options to the recipes in
> OE-Core (or whereever they happen to be), with lua remaining in meta-oe.

I understand your reluctance to add bloat to oe-core but from a
users point of view a base distro should have a reasonable
collection of tools. I'll add lua to our internal layer since
we don't support all of meta-oe. We'll uprev and send meta-oe the
new recipe.

> However I am aware that lua may be a hard dependency for upcoming versions of
> stuff we do have in OE-Core (I can't recall which). We'll have to cross that
> bridge when we come to it.

Ok. Thanks for the feedback.

// Randy
>
> Cheers,
> Paul
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

