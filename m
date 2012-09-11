Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TBUxc-00047p-C0
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 20:13:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8BI0lJ6007231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 11:00:47 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 11 Sep 2012 11:00:47 -0700
Message-ID: <504F7C4F.5030003@windriver.com>
Date: Tue, 11 Sep 2012 13:00:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120911130155.GC14077@jama.jama.net>
	<1347381972.29443.15.camel@x121e.pbcl.net>
	<20120911165323.GJ14077@jama.jama.net>
	<1347383662.29443.21.camel@x121e.pbcl.net>
	<20120911172107.GK14077@jama.jama.net>
	<20120911173529.GL14077@jama.jama.net>
	<1347385043.29443.28.camel@x121e.pbcl.net>
	<20120911174324.GM14077@jama.jama.net>
In-Reply-To: <20120911174324.GM14077@jama.jama.net>
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 18:13:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/12 12:43 PM, Martin Jansa wrote:
> On Tue, Sep 11, 2012 at 06:37:23PM +0100, Phil Blundell wrote:
>> On Tue, 2012-09-11 at 19:35 +0200, Martin Jansa wrote:
>>> If this works then DISTRO would have finer control of which DEFAULTTUNE
>>> to use
>>>
>>> 1) default: don't use mtune, optimize only for march (don't mix mtune in
>>> the same feed).
>>>
>>> 2) include optimized-tune.inc in distro.conf: use mtune only for some packages, but
>>> with separate package feed for them
>>>
>>> 3) DEFAULTTUNE = ${OPTDEFAULTTUNE} in distro.conf: always use best mtune
>>> available for MACHINE, but unlike current default, don't mix them in
>>> same package feed
>>>
>>> DEFAULTTUNE = ${OPTDEFAULTTUNE} should also be used for PACKAGE_ARCH ==
>>> MACHINE_ARCH
>>
>> Yeah, that all sounds fairly reasonable to me.  I'm not sure that
>> optimized-tune.inc belongs in oe-core, since its contents is inherently
>> distro-specific, but the general plan seems pretty good.
>
> OK, thanks
>
> I've put optimized-tune.inc to oe-core only to share knowledge of which
> packages are worth using OPTDEFAULTTUNE, but I expect DISTRO maintainers
> to add their own entries too (e.g. for stuff which is only in their own
> layer), so I'm fine with optimized-tune.inc in meta-distro too.

Along those lines.. I'm always asked for optimized crypto libraries (nss, 
openssl, beecrypt, etc...), database (mysql or similar), codecs, sometimes libc 
itself, and graphics drivers.. otherwise nobody seems to care if it's "good enough".

--Mark

> Cheers,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



