Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C47D72108
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 22:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAGMqQgT021328
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 14:52:27 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sun, 16 Nov 2014 14:52:26 -0800
Message-ID: <54692AA9.9030607@windriver.com>
Date: Sun, 16 Nov 2014 16:52:25 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <54677D77.2090104@pabigot.com> <5467EA52.6020008@pabigot.com>
	<1416142745.28563.2.camel@linuxfoundation.org>
In-Reply-To: <1416142745.28563.2.camel@linuxfoundation.org>
Subject: Re: opkg/rpm inconsistencies in multilib image installations
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
X-List-Received-Date: Sun, 16 Nov 2014 22:52:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/14, 6:59 AM, Richard Purdie wrote:
> On Sat, 2014-11-15 at 18:05 -0600, Peter A. Bigot wrote:
>> On 11/15/2014 10:21 AM, Peter A. Bigot wrote:
>>> tl;dr: multilib apparently defines its own root directory underneath
>>> ${IMAGE_ROOT} which includes copies of /etc files like passwd that are
>>> not known to pseudo.  opkg and rpm differ in whether useradd scripts
>>> are run when a multilib package is installed, resulting in failures to
>>> add users/groups during multilib install when using opkg because a
>>> sanity check thinks they already exist because pseudo is looking
>>> somewhere else.
>>
>> Actually, I'm going to retract this whole thing, since I'm now unable to
>> reproduce any of the problems described here.  Possibly because of
>> changes to the pseudo patches that fixed problems I thought were
>> unrelated to this behavior.
>>
>> Sorry for the noise.
>
> FWIW you are right in that the way multilib works with rpm is different
> to ipk/deb, you can end up with two different rootfs directories which
> are then reconciled. I do have some concerns about what would happen to
> the passwd/group files in this scenario since they could easily become
> out of sync. I suspect we'd have to create a pathological configuration
> to manage that but its probably possible. I *think* the system would at
> least error out if that pathological case occured.
>
> That said, I suspect this problem exists before your patchset so isn't a
> new issue.

Personally I recommend using RPM if you need multilib support.  For single lib 
support, I don't have a single recommendation.

--Mark

> Cheers,
>
> Richard
>


