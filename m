Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Jan 2020 13:46:10 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5F57D60843
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 13:46:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2020 05:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,386,1574150400"; d="scan'208";a="402656745"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by orsmga005.jf.intel.com with ESMTP; 31 Jan 2020 05:39:02 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	IRSMSX151.ger.corp.intel.com (163.33.192.59) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Fri, 31 Jan 2020 13:39:02 +0000
Received: from zjeffery-mobl1.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Fri, 31 Jan 2020 13:39:01 +0000
To: <openembedded-core@lists.openembedded.org>, <matthew.zeng@windriver.com>
References: <87ftfw7lq0.fsf@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <71f40a14-d1c6-afbb-23f8-a5b8bc927c3b@intel.com>
Date: Fri, 31 Jan 2020 13:38:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87ftfw7lq0.fsf@windriver.com>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx602.ger.corp.intel.com (163.33.146.8) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Subject: Re: [PATCH] glib-2.0: add -dev dependencies to fix ptest failures
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
X-List-Received-Date: Fri, 31 Jan 2020 13:46:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 30/01/2020 20:06, Mingde (Matthew) Zeng wrote:
> There are a number of ptest failures due to glib-genmarshal, glib-mkenums
> and couple other executables not in the image. Since these
> executables are in FILES_${PN}-dev, we add ${PN}-dev to ptest RDEPENDS.

All of -dev is a bit overkill.  Maybe we should just move those binaries 
from PN-dev to PN-utils, and depend on that instead?

Ross


