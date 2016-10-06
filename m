Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B98D71A6F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 02:33:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u962XqZ4020759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 5 Oct 2016 19:33:52 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Oct 2016 19:33:51 -0700
To: "Tan, Raymond" <raymond.tan@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
Date: Wed, 5 Oct 2016 21:33:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
Cc: "Gupta, Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Thu, 06 Oct 2016 02:33:56 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/5/16 9:11 PM, Tan, Raymond wrote:
> Greetings, I would like to know if there is any plan / schedule to upgrade to openssl 1.1.0 into OE-core? 

Currently 1.0.2 is the LTS version of OpenSSL.  1.1.0 is not scheduled to be LTS.

For the upcoming release (soon), I would NOT expect 1.1.0 to be in it.  There
are still too many incompatibilities with other components.

For the next version of OE, I think it is appropriate to include 1.1.0, but I
would also like to maintain 1.0.2 for the time being.  (Beside LTS, it also is
still the only way to have FIPS-140-2 module, as there is currently no module in
the 1.1.0 -- and there may not be for a while.)

--Mark

> Thanks!
> 
> Raymond Tan
> 


