Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TyAzx-0000cS-7A
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 01:48:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0O0XPCX023880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 16:33:25 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.117.44) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 23 Jan 2013 16:33:23 -0800
Message-ID: <51008153.6090800@windriver.com>
Date: Wed, 23 Jan 2013 18:33:23 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20130123172748.GB14381@jama.palm1.palmone.com>
	<CABcZANkfiefEBNVAswnCrmjPFSiJeijvaJ+o++EH7qtrQfnKMA@mail.gmail.com>
In-Reply-To: <CABcZANkfiefEBNVAswnCrmjPFSiJeijvaJ+o++EH7qtrQfnKMA@mail.gmail.com>
Subject: Re: File conflicts between PN-doc packages
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
X-List-Received-Date: Thu, 24 Jan 2013 00:48:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/13 6:13 PM, Chris Larson wrote:
>
> On Wed, Jan 23, 2013 at 10:27 AM, Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     |  * check_data_file_clashes: Package gcc-doc wants to install file
>     rootfs/usr/share/info/dir

I missed this earlier.  Yes, the 'dir' file in an info (-doc) package should not 
be included.  It's existence is an error.  This might be a sanity check we 
should be adding.

--Mark

>
> In this particular case, I think we can look at how other distros handle this
> file and follow suit.
> --
> Christopher Larson
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



