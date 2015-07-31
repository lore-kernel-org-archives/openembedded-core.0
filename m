Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id C7468765A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 12:40:17 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.1/8.15.1) with ESMTPS id t6VCeAgn021894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 31 Jul 2015 14:40:11 +0200
Received: from [139.22.116.63] (md1g632c.ww300.siemens.net [139.22.116.63])
	by mail1.sbs.de (8.15.1/8.15.1) with SMTP id t6VCe7N3030682;
	Fri, 31 Jul 2015 14:40:09 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143658.GK2457@jama> <55BA4399.2030302@linux.intel.com>
	<CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>
	<55BA524A.1070904@linux.intel.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <55BB6CA7.2060908@siemens.com>
Date: Fri, 31 Jul 2015 14:40:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55BA524A.1070904@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Fri, 31 Jul 2015 12:40:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi

Am 30.07.2015 um 18:35 schrieb Alexander Kanavin:
> On 07/30/2015 07:25 PM, Burton, Ross wrote:
>
>> For the release tag I'd agree with you, but as 219 < 219-stable we can't
>> just change this now (without adding an epoch, and adding epochs are evil).
>>
>> Does the RRS have a way of mapping a PV to something that can be used in
>> the upstream comparison?
>
> I just noticed that specifically systemd-stable repository does not have release tags for new versions at all, and just adds branches for newer versions:
>
> http://cgit.freedesktop.org/systemd/systemd-stable/
>
New tags for systemd are created but not on the repository above but on their git repository:
https://github.com/systemd/systemd

I think this is the now main repository.

Pascal

> RRS does not support branch names as indication of "new releases" (and it shouldn't IMO), so maybe this patch can be simply dropped, and systemd will not have automatic upstream-check.
>
>
> Alex
>


