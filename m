Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 02C5178411
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 07:16:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 23:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,506,1511856000"; d="scan'208";a="18013136"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 23:16:46 -0800
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1518424026-25060-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1518424026-25060-2-git-send-email-rebecca.swee.fun.chang@intel.com>
	<fb6ff954-744b-b38a-59b1-4d5afa879ec9@linux.intel.com>
	<50B33AC5ED75F74F991980326F1C438D1F20A765@PGSMSX103.gar.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dbf50db9-5103-6b9f-afab-18dbc3370a6c@linux.intel.com>
Date: Tue, 13 Feb 2018 09:10:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D1F20A765@PGSMSX103.gar.corp.intel.com>
Subject: Re: [PATCH 2/2] build-appliance-image: update version to 19.0.0
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
X-List-Received-Date: Tue, 13 Feb 2018 07:16:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/13/2018 02:42 AM, Chang, Rebecca Swee Fun wrote:
>>> Updating recipe to reflect latest poky version and SRCREV points to
>>> latest master HEAD revision.
>>
>> The latest poky version is 18.0.1, and I think SRCREV should point to that as well,
>> not to the tip of master? 19.0.0 isn't yet released.
> 
> Build-appliance-image normally points to the tip of master, should I change this in stable branch instead while in master pointing to HEAD?

Actually, that's right. You should update the master to latest master 
revision, but don't set the version to something that does not yet 
exist. 15.0.0 (or 18.0.0) is fine, nobody would mind. This recipe is 
special, as it has a circular reference to the repository it's in, and 
so setting the version consistently is tricky.

As for what do do in the stable branch, I don't know. We don't have a 
clear policy for how updates to this recipe should be done.

Alex

