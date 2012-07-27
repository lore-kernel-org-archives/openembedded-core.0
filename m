Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Suroq-0007hP-C0
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 23:11:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6RKxx1f019618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:59:59 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.34) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 27 Jul 2012 13:59:58 -0700
Message-ID: <5013014D.4040404@windriver.com>
Date: Fri, 27 Jul 2012 15:59:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343418723-28606-1-git-send-email-fcooper@ti.com>
	<1343419294.4470.82.camel@x121e.pbcl.net>
	<8F29D6B095ED194EA1980491A5E029710C27A73D@DFLE30.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C27A73D@DFLE30.ent.ti.com>
Subject: Re: [PATCH] busybox: Add inetd related files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 27 Jul 2012 21:11:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/12 3:26 PM, Cooper Jr., Franklin wrote:
> The section you mentioned is within the file inetd which I am adding to the SRC_URI list in the busybox_1.19.4.bb file. The variable ${sbindir} won't be expanded.
>
> -----Original Message-----
> From: Phil Blundell [mailto:philb@gnu.org]
> Sent: Friday, July 27, 2012 3:02 PM
> To: Patches and discussions about the oe-core layer
> Cc: Cooper Jr., Franklin
> Subject: Re: [OE-core] [PATCH] busybox: Add inetd related files
>
> On Fri, 2012-07-27 at 14:52 -0500, Franklin S Cooper Jr wrote:
>> +if ! [ -x /usr/sbin/inetd ]; then
>> +       exit 0
>> +fi
>
> That should be ${sbindir}.

Inline sed of the initscript may be the easiest way to do this.

You need to expand it, you can not rely on /usr/sbin/inetd, as OE-Core expressly 
permits people to change the bindir and sbindir locations.  (Generally if 
someone does, they change from /usr/sbin to /sbin, and /usr/bin to /bin...)

--Mark

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



