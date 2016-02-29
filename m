Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0C7E771C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:18:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1TFIbe3014111
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 07:18:38 -0800
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 07:18:37 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
	<39dcc8978920aeaf0eeb206b7292f32af4b775f7.1456456877.git.mark.hatle@windriver.com>
	<55970.10.252.8.77.1456498907.squirrel@linux.intel.com>
	<56D060AA.6020100@windriver.com> <56D4449F.8010407@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56D4614C.1050909@windriver.com>
Date: Mon, 29 Feb 2016 09:18:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56D4449F.8010407@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3 v2] rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
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
X-List-Received-Date: Mon, 29 Feb 2016 15:18:38 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/29/16 7:16 AM, Alexander Kanavin wrote:
> On 02/26/2016 04:26 PM, Mark Hatle wrote:
>>> Why not update the oe-core recipe of db to 6.1 instead? Rpm is the only
>>> thing that is holding it back.
>>
>> Because today is feature freeze, and I'm not going to introduce a new BerkleyDB
>> version on the day of feature freeze.  The only thing I can test on is RPM --
>> and there may be other users.
>>
>> The patch was done as a single unit specifically so when DB-6.1 is introduced,
>> it's VERY simple to remove.
> 
> Can you then drop the NO_UPDATE_REASON from the db recipe as a part of 
> this patchset?

I'll add a commit that does this.

> Alex
> 


