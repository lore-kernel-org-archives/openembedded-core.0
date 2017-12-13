Return-Path: <tobias.hagelborn@axis.com>
X-Greylist: delayed 408 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Dec 2017 10:39:03 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3CB7824D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 10:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 01926183AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id bK07s--NDWkz
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:15 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 54439180EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:15 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 401F51E06E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:15 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3517C1E06C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:15 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:15 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 294CDCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 11:32:15 +0100 (CET)
Received: from [10.94.62.1] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 13 Dec 2017 11:32:14 +0100
To: <openembedded-core@lists.openembedded.org>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
	<2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
	<CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
	<0fa15a09e9554731a800e4e771e25ab9@XBOX02.axis.com>
	<CAJ86T=XX0-pkH-4jRMq1o3pJbz-iwGcksGuR7oZHkaYgn86new@mail.gmail.com>
	<e986d856398445c89fa14558da885793@XBOX02.axis.com>
	<90ef5ca5-9697-773a-3281-68a5683cbc95@windriver.com>
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
Message-ID: <5e59842c-6ff8-5599-2957-3195d869c496@axis.com>
Date: Wed, 13 Dec 2017 11:32:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <90ef5ca5-9697-773a-3281-68a5683cbc95@windriver.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Wed, 13 Dec 2017 10:39:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/05/2017 02:10 PM, Randy MacLeod wrote:
> On 2017-09-01 08:00 AM, Peter Kjellerstedt wrote:
>> Well, the most common request we've gotten from the developers is that
>> they want to be able to search through all the sources, e.g., to find
>> out where a particular function is used. The tmp directory does not
>> lend itself very well to this, given that it also contains all build
>> trees, applied patches and other meta information that bitbake needs.
>> Thus the idea for the parallel tree with only the source references.
>>
>> //Peter
> 
> A shadow tree of links to the source is "mostly harmless" to experts
> and useful for newbies and code browsers as you explained.
> 
> The src dir should be under tmp/src though since anything
> that can be regenerated shouldn't be in the top level
> project directory.

I'll fix that: tmp/srctree

> 
> We don't pay that much (enough?) attention to the SECTION tag
> and something like half of the oe-core recicpes doen't
> have one. I suppose this feature would encourage us to
> fix that.
> 
> Have you run your script with meta-openembedded and other layers?

I've run it with core-image-minimal and core-image-sato.
(I do not think they pull anything in from meta-openembedded)


A new patchset  will soon be available.


//Tobias

