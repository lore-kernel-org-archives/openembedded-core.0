Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RVTa5-0001y9-OY
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:43:05 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 838B5D81F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 20:36:26 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhweALwz1U5T4zgTPGdsb2JhbAAMN4lKoUkBAQEBN4IkAQEBAQMBAjVAEQsYCRYPCQMCAQIBFhsUEwYCAQG/Q4gJgxUEkjOCIZIS
X-IronPort-AV: E=Sophos;i="4.69,592,1315173600"; d="scan'208";a="225834747"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 29 Nov 2011 20:36:26 +0100
Message-ID: <4ED53438.9040903@emagii.com>
Date: Tue, 29 Nov 2011 20:36:24 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
In-Reply-To: <1322579029.7964.0.camel@ted>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Tue, 29 Nov 2011 19:43:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-11-29 16:03, Richard Purdie wrote:
>
>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer
>> available.
>>           tzdata , same problem.
>>           The recipe is located in two places.
>>           meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
>> problem
>>           This is what the build uses.
> This is something to raise with the meta-oe maintainers. I think there
> isn't a problem in OECore.

Since we now have a large number of layers, maybe it is a good
idea to define in each layer,  how the "git send email" should behave in
by providing a better ".git/config" file in the trunk?


I.E:

[sendemail]
     to = openembedded-core@lists.openembedded.org

or
meta-angstrom/.git/config
[sendemail]
     to = angstrom-distro-devel@linuxtogo.org
[format]
     subjectprefix = "[meta-angstrom]"


No need to look in the README file with this.


-- 
Best Regards
Ulf Samuelsson
eMagii



