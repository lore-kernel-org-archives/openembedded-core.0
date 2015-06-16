Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id ADD8665C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 19:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 95FBD3155F7D;
	Tue, 16 Jun 2015 21:09:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CLdu-ngxUpU2; Tue, 16 Jun 2015 21:09:36 +0200 (CEST)
Received: from [172.22.22.61] (55d44892.access.ecotel.net [85.212.72.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 282A33155F42;
	Tue, 16 Jun 2015 21:09:36 +0200 (CEST)
Message-ID: <5580746F.8000305@opendreambox.org>
Date: Tue, 16 Jun 2015 21:09:35 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Leandro Dorileo <leandro.maciel.dorileo@intel.com>, 
	Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>
	<1431553871-23972-4-git-send-email-bruno.bottazzini@intel.com>
	<5553D30E.9010201@opendreambox.org> <5580690B.9070908@intel.com>
In-Reply-To: <5580690B.9070908@intel.com>
Subject: Re: [PATCH V5 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 16 Jun 2015 19:09:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Leandro,

On 16.06.2015 20:20, Leandro Dorileo wrote:
> On 05/13/2015 07:41 PM, Andreas Oberritter wrote:
>> Hello Bruno,
>>
>> On 13.05.2015 23:51, Bruno Bottazzini wrote:
>>> +########################################################################
>>>
>>> +# Aggregation of Split Packages
>>> +########################################################################
>>>
>>> +PACKAGES =+ "${PN}-services-base"
>>> +SUMMARY_${PN}-services-base = "Base services aggregation"
>>> +ALLOW_EMPTY_${PN}-services-base = "1"
>>> +RDEPENDS_${PN}-services-base = " \
>>
>> I think it would be better to use RRECOMMENDS, in order to support
>> BAD_RECOMMENDATIONS per image. This would also remove the need to use
>> bb.utils.contains, because unavailable recommended packages get ignored
>> by the package managers.
> 
> 
> In the end, isn't it just a different approach? a different way of
> doing the same thing?

No. Although recommended packages get installed by default, just like
depended-upon packages, the difference is that you can choose to
uninstall these packages selectively or to disable automatic
installation using "BAD_RECOMMENDATIONS".

If you choose this route, then it doesn't make a difference whether you
use bb.utils.contains(...) for each package or not when declaring the
relationship between packages (unless you keep old packages on your
update feeds). I just mentioned that, because the patch is already hard
to read and any simplification in syntax may be a plus. I don't think
it's important though.

> By the way, from my point of view, semantically
> we're saying "we want a given package feature" besides the "we want a
> given distro feature", don't you think?

I can't follow you, sorry. At this point, PACKAGECONFIG already
determined which files got built, installed and packaged. I fail to
connect this to distro features in this context, besides its use for
sane defaults of the PACKAGECONFIG variable.

Regards,
Andreas

