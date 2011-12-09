Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYxpm-0003BY-AJ
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:37:42 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id B88DECBAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 11:30:51 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApIjACzj4U5T4zgTPGdsb2JhbAAMN4lNnmWCVAEBAQE3giQBAQEBAzhAEQsYCRYPCQMCAQIBMRQGAQwIAQG+VItyBJRwkig
X-IronPort-AV: E=Sophos;i="4.71,325,1320620400"; d="scan'208";a="232277147"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.19])
	by ipb2.telenor.se with ESMTP; 09 Dec 2011 11:30:35 +0100
Message-ID: <4EE1E350.4010304@emagii.com>
Date: Fri, 09 Dec 2011 11:30:40 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, elizabeth.flanagan@intel.com
References: <4EE1DE55.1040303@emagii.com> <1426848.m8dnn0MDvm@helios>
In-Reply-To: <1426848.m8dnn0MDvm@helios>
Subject: Re: Change in	"openembedded-core/meta/files/common-licenses/LGPL-2.0" breaks opie-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 10:37:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-09 11:24, Paul Eggleton wrote:
> On Friday 09 December 2011 11:09:25 Ulf Samuelsson wrote:
>> NOTE: package libopie2-1.2.5-r16.0: task do_configure: Started
>> ERROR: libopie2: md5 data is not matching for
>> file:///home/ulf/projects/OE_2011-12-08/sources/openembedded-core/meta/files
>> /common-licenses/LGPL-2.0;md5=03f2b9deed35802bc1aae2ae3dc6d9ed ERROR:
>> libopie2: The new md5 checksum is 9427b8ccf5cf3df47c29110424c9641a ERROR:
>> libopie2: Check if the license information has changed in
>> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
> Argh. I guess this is one reason why pointing to those files in your recipes is
> not a good idea. FYI I basically bypassed LIC_FILES_CHKSUM in meta-opie
> because the opie-* recipes build parts of a single source tree and not all of
> those split parts contains a license file. For 1.2.6 I plan to make the
> splitting script add a license file where it is not present and once the
> recipes are updated this will never be a problem again.
>
> For now I guess we will have to correct the checksums :/ I will try to do this
> soon.
>
> Cheers,
> Paul
>
I think someone needs to sit down and do this in a structured manner.
A number of license files were modified.
For each file, the old checksum needs to be searched for in the tree,
and the license modified.

A grep for "LICENSE =" should reveal offending recipes with "<recipe1> 
&& <recipe2>"
or "<recipe1>/<recipe2>" etc.

At the moment, OE-core seems totally broken.

-- 
Best Regards
Ulf Samuelsson
eMagii



