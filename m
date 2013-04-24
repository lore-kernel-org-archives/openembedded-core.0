Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UV2gU-0003up-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 18:36:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3OGIxDV007115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 09:18:59 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Apr 2013 09:18:59 -0700
Message-ID: <517805F0.5030501@windriver.com>
Date: Wed, 24 Apr 2013 11:18:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 16:36:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/13 10:58 AM, Lewis, Nick wrote:
> I am seeing problems when using PACKAGE_CLASSES = "package_tar"
>
> There are many warnings about python indents and there are errors regarding
> missing populate_sdk_tar.bbclass and rootfs_tar.bbclass

I don't believe that package class has been updated in a while.  It's not one of 
the normal testing ones.

ipk, rpm and the two most used.  deb is also available, but at least in the past 
has had issues in a few places.  (I think those are all resolved now.)

--Mark

> --
>
> Nick
>
> *Nick Lewis*
>
> nick.lewis@usa.g4s.com <mailto:nick.lewis@usa.g4s.com>
>
> +44 1684 277137 <tel:+441684277137>
>
> www.g4stechnology.com <http://www.g4stechnology.com/>
>
> New Challenge House, International Drive, Tewkesbury, Gloucestershire, GL20 8UQ, UK
>
> **
>
> *P**Please consider the environment before printing this email***
>
>
> --------------------------------------------------------------------------------
> The details of this company are as follows:
> G4S Technology Limited, Registered Office: Challenge House, International Drive,
> Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 2382338.
>
> This communication may contain information which is confidential, personal
> and/or privileged.
>
> It is for the exclusive use of the intended recipient(s).
> If you are not the intended recipient(s), please note that any distribution,
> forwarding, copying or use of this communication or the information in it is
> strictly prohibited.
>
> Any personal views expressed in this e-mail are those of the individual sender
> and the company does not endorse or accept responsibility for them.
>
> Prior to taking any action based upon this e-mail message, you should seek
> appropriate confirmation of its authenticity.
>
> This e-mail has been scanned for all viruses by MessageLabs.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



