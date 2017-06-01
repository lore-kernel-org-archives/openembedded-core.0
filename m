Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1883977DB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 17:39:27 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 10:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="108072912"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 01 Jun 2017 10:39:27 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496335920.26945.80.camel@linux.intel.com>
	<b191e2fc-65c7-350f-1a7e-da684ca6b2b5@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f71622c0-5f67-999f-da93-b441d1e3445a@linux.intel.com>
Date: Thu, 1 Jun 2017 20:37:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b191e2fc-65c7-350f-1a7e-da684ca6b2b5@windriver.com>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Thu, 01 Jun 2017 17:39:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2017 08:13 PM, Mark Hatle wrote:
>>> perl
>>> before: 1m19s 63M
>>> after: 55s 42M
>>>
>>> python3
>>> before: 40s 38M
>>> after: 28s 24M
>>
>> it is interesting to see that perl and python does not benefit 'much'.
>> buildstats should give us a better picture per recipe.
>
> This may be due to how we process rpmdeps within OpenEmbedded.. but I'm not
> sure.  I'd have expected a bigger time difference with large packages (lots of
> sub packages) like perl and python3.

The numbers include the overhead of starting bitbake (some 10 seconds). 
Subtract that (from both 'before' and 'after') and then it's more 
impressive :) I tested via

time bitbake -f -c do_package_write_rpm perl

Alex


