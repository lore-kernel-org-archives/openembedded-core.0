Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD0EA605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 18:12:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB2ICq95019630
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Dec 2014 10:12:53 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 10:12:52 -0800
Message-ID: <547E012B.5010406@windriver.com>
Date: Tue, 2 Dec 2014 12:12:59 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
	<547DF0C1.4020608@windriver.com>
	<CAJTo0LYvMw+ptJJw-OCj_W1d19qwf+=t3dPC7SC3r=fy07dgmw@mail.gmail.com>
In-Reply-To: <CAJTo0LYvMw+ptJJw-OCj_W1d19qwf+=t3dPC7SC3r=fy07dgmw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4][RFC] Change libexecdir to ${prefix}/libexec
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
X-List-Received-Date: Tue, 02 Dec 2014 18:13:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/14, 11:10 AM, Burton, Ross wrote:
>
> On 2 December 2014 at 17:02, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     Personally I think using "${exec_prefix}/libexec" is incorrect.  This does
>     not support a multilib configuration where you may have both a 64-bit and
>     32-bit version of the libexec program on the system.  (perhaps this isn't a
>     real problem, but we ran into some conflicts in the past.)
>
>
> Are any of these conflicts actually a problem?  Can you give an example?  I know
> there's been several attempts to "fix" GConf multilib installation which were
> generally breaking GConf instead of fixing a test case...

I simply don't remember anymore.  It was an issue were a 32-bit and 64-bit 
version of whatever it was, wasn't working properly.  It was returning values 
that were specific to the libdir.

The problem was discovered in comprehensive system testing... but for the life 
of me I can't remember what the problem was.  (and for all I know it's not a 
problem anymore?)

>     So moving to the libdir, ensures that we are unique per multilib.. and the
>     BPN ensures that we're unique per recipe.
>
>
> A libexecdir that isn't global is a problem because some packages want to run
> *other recipes* binaries, and they can't just do $libexecdir/some-binary.

The other binary problem was addressed by either changing the libexec path for 
the provider, or setting to libdir/${BPN} for the user.


> Ross


