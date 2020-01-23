Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 99E897FDBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:56:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2020 05:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="250981036"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2020 05:56:07 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 23 Jan 2020 13:56:06 +0000
Received: from rochenix-mobl.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 23 Jan 2020 13:56:06 +0000
To: <openembedded-core@lists.openembedded.org>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <8c30e0dd-0517-6ccb-40b9-82a9ff93f639@intel.com>
Date: Thu, 23 Jan 2020 13:56:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx604.ger.corp.intel.com (163.33.146.137) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 13:56:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 23/01/2020 13:14, Jean-Marie LEMETAYER wrote:
> So "example.com" is clearly not a good domain to do connectivity checks.
> 
> The "openembedded.org" domain is good but have a slow response time.
> 
> And finally "google.com" which have all sort of speedy networking stuff is very
> efficient.

Oh my domestic ADSL in the UK I ran your script, example.com finished in 
1 minute with 100/100.  What internet connectivity to you have?  The 
performance hit with the OE servers isn't ideal, and Google isn't 
suitable as has been said.

Note that if you're having problems with the check, a quick fix would be 
to just set CONNECTIVITY_CHECK_URIS="" in your distro to turn the check 
off entirely.

Ross

