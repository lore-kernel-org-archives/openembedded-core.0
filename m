Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TGt95-0003sa-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 17:03:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8QEoaD8012859
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:50:36 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 26 Sep 2012 07:50:36 -0700
Message-ID: <5063163E.5040608@windriver.com>
Date: Wed, 26 Sep 2012 09:50:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1348577690.31293.70.camel@phil-desktop>
	<1348610357.2853.5.camel@lenny>
	<1348610431.1335.11.camel@x121e.pbcl.net>
	<1348611089.2853.7.camel@lenny>
In-Reply-To: <1348611089.2853.7.camel@lenny>
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
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
X-List-Received-Date: Wed, 26 Sep 2012 15:03:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/12 5:11 PM, Colin Walters wrote:
> On Tue, 2012-09-25 at 23:00 +0100, Phil Blundell wrote:
>
>> That'd be inconsistent with other packages, since we do generally build
>> and ship the static libraries.  Having a big switch to turn off static
>> libraries globally seems like a fine plan, but I can't see any obvious
>> reason why the util-linux ones are any more useless than the rest.
>
> Makes sense.  I wonder if there are actually any users of the static
> libraries.

Users are primarily small systems, where static linking may result in a slightly 
smaller system.  (When I say small systems, I'm talking about single application 
embedded systems..)

> For what it's worth in gnome-ostree I do just globally pass
> --disable-static by default.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



