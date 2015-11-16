Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 423 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Nov 2015 10:14:14 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3A073D46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 10:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 04A8C315CB44;
	Mon, 16 Nov 2015 11:07:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id MhSPz5q20a-W; Mon, 16 Nov 2015 11:07:08 +0100 (CET)
Received: from [172.22.22.61] (55d460ed.access.ecotel.net [85.212.96.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DD64E315CB43;
	Mon, 16 Nov 2015 11:07:07 +0100 (CET)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
	<20151113114617.GB2567@jama> <5649A542.8000307@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <5649AACB.6070204@opendreambox.org>
Date: Mon, 16 Nov 2015 11:07:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5649A542.8000307@linux.intel.com>
Subject: Re: [oe] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Mon, 16 Nov 2015 10:14:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 16.11.2015 10:43, Alexander Kanavin wrote:
> On 11/13/2015 01:46 PM, Martin Jansa wrote:
> 
>>>>> 1) or even better in a separate repo
>>>>
>>>> To be honest, I had anticipated this being a separate meta-qt4 repo
>>>> myself. It
>>>> would be consistent with what has been done with Qt 5 and much
>>>> earlier with
>>>> Qt 3.
>>>
>>> Agreed.
>>
>> I'm also fine with separate layer.
>>
>> Even better for me, I'll be less tempted to include it in my world
>> builds and to fix qt-mobility-* issues.
> 
> Making a separate repository with this layer is even more disruptive,
> and complicates administration and maintenance. I'm not going to handle
> those. So I'll make a meta-qt4 layer under meta-oe, and it's fine if
> there is no official maintainer or ongoing build testing for it at least
> until someone volunteers to pick it up.

Basically everyone agreed on moving qt4 to its own repo. And your
conclusion is to ignore that and move qt4 to meta-openembedded, already
expecting bitrot?

Regards,
Andreas


