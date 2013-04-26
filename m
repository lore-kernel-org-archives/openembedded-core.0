Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVjj9-00066e-Ej
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 16:34:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3QEGXSD026348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Apr 2013 07:16:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Apr 2013 07:16:33 -0700
Message-ID: <517A8C41.20202@windriver.com>
Date: Fri, 26 Apr 2013 09:16:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<517933DC.9080809@windriver.com>
	<1366984657.14512.108.camel@phil-desktop.brightsign>
In-Reply-To: <1366984657.14512.108.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Fri, 26 Apr 2013 14:34:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/13 8:57 AM, Phil Blundell wrote:
> On Thu, 2013-04-25 at 08:47 -0500, Mark Hatle wrote:
>> Is this a problem that they should have used the update-alternatives for
>> sulogin?  (Sounds like it might be a security issue though...)  This would avoid
>> the .debug conflict.
>
> I dunno.  It seems a bit sad to force use of update-alternatives just to
> deconflict the .debug data (since the binaries in question would never
> be installed at the same time anyway), and in general it seems like we
> want less update-alternatives rather than more of it.
>
> But I guess that would indeed solve the problem and it's probably the
> lowest-effort thing that does.  So maybe that's the way ahead.

The alternative of course is to crease special -dbg packages for the two 
conflicting items.  I.e. foo-dbg, foo-sulogin-dbg, bar-dbg and bar-sulogin-dbg...

--Mark

> p.
>
>



