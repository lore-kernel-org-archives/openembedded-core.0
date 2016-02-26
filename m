Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8C977443
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:26:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1QEQpva018347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Feb 2016 06:26:51 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 26 Feb 2016 06:26:51 -0800
To: <alexander.kanavin@linux.intel.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
	<39dcc8978920aeaf0eeb206b7292f32af4b775f7.1456456877.git.mark.hatle@windriver.com>
	<55970.10.252.8.77.1456498907.squirrel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56D060AA.6020100@windriver.com>
Date: Fri, 26 Feb 2016 08:26:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <55970.10.252.8.77.1456498907.squirrel@linux.intel.com>
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
X-List-Received-Date: Fri, 26 Feb 2016 14:26:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/26/16 9:01 AM, alexander.kanavin@linux.intel.com wrote:
>> +Set the DB 6 version to match oe-core db 6.0.30
>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> +-    [db-6.1], [db_create], [db.h],
>> ++    [db-6.0], [db_create], [db.h],
> 
> Why not update the oe-core recipe of db to 6.1 instead? Rpm is the only
> thing that is holding it back.

Because today is feature freeze, and I'm not going to introduce a new BerkleyDB
version on the day of feature freeze.  The only thing I can test on is RPM --
and there may be other users.

The patch was done as a single unit specifically so when DB-6.1 is introduced,
it's VERY simple to remove.

> Note that last time I tried, it broke completely when trying to create an
> image, but maybe the problem has been fixed in the rpm upstream meanwhile:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-August/109187.html

There were two issues affecting image generation.  One was an upgrade of the rpm
python module broke the PACKAGEORIGIN support we rely on.  The other was a
processing issue in the package_manager.py.  It was splitting on '|', and if any
of the lines came back as warnings (say from BerkleyDB) it would fall over.

Both of the issues were addressed in this set.

--Mark

> Alex
> 
> 
> 


