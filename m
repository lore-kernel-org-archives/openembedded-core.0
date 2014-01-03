Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id E73596BBD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 15:38:25 +0000 (UTC)
Received: (qmail 1014 invoked by uid 1003); 3 Jan 2014 15:38:26 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.44.145)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Jan 2014 15:38:26 -0000
Message-ID: <52C6D971.2000000@balister.org>
Date: Fri, 03 Jan 2014 10:38:25 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
References: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
	<2704C375-0C8D-46B2-A11D-3FF220661AFB@dominion.thruhere.net>
	<6741EAAB26B57F4995668065CB62D86B33983EAC@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <6741EAAB26B57F4995668065CB62D86B33983EAC@IRSMSX102.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Fri, 03 Jan 2014 15:38:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/03/2014 10:20 AM, Sywula, Krzysztof M wrote:
> Hi, why would it be '0.8.15'? Recipe points to 0.8.16-rc1 tarball and that's the only one that can be built. 

> that should be 0.8.15+0.8.16-rc1 to conform to the versioning policy

So that when you have the final 0.8.16 package, the version sorts higher
and updates happen. That is why the "base" version is 0.8.15, even
though the package is for a 0.8.16-rcX version.

Philip

> 
> Thanks,
> Krzysztof Sywula
> 
> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net] 
> Sent: Tuesday, December 31, 2013 12:19 PM
> To: Sywula, Krzysztof M
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] Adding irssi 0.8.16-rc1 recipe
> 
> 
> Op 27 dec. 2013, om 18:30 heeft krzysztof.m.sywula@intel.com het volgende geschreven:
> 
>> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>>
>> ---
>> meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 11 +++++++++++
> 
> that should be 0.8.15+0.8.16-rc1 to conform to the versioning policy
> -------------------------------------------------------------
> Intel Ireland Limited (Branch)
> Collinstown Industrial Park, Leixlip, County Kildare, Ireland
> Registered Number: E902934
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

