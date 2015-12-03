Return-Path: <vz@mleia.com>
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by mail.openembedded.org (Postfix) with ESMTP id E22FD6FF76
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 05:57:45 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 02CF3400527;
	Thu,  3 Dec 2015 05:59:36 +0000 (GMT)
Message-ID: <565FD9D2.3050707@mleia.com>
Date: Thu, 03 Dec 2015 07:57:38 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1449031718-3786-1-git-send-email-vz@mleia.com>
	<CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
In-Reply-To: <CAJTo0Lbzvbwc34aXEMgfUJGnANMzaB+4ecM1=sa=8KONeTJukw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20151203_055936_032637_BCD96FE8 
X-CRM114-Status: GOOD (  14.70  )
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk: allow to specify OPKG_ARGS in local.conf
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
X-List-Received-Date: Thu, 03 Dec 2015 05:57:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ross,

On 02.12.2015 11:48, Burton, Ross wrote:
> 
> On 2 December 2015 at 04:48, Vladimir Zapolskiy <vz@mleia.com
> <mailto:vz@mleia.com>> wrote:
> 
>       sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad
>     interpreter: Permission denied
> 
> 
> Whilst the patch is fine, this is worrying as noexec /tmp shouldn't
> break opkg.  Maybe opkg should be changed to use something in /var for
> the scripts?
> 

here IMHO two cases should be reviewed, build host side execution and
opkg on a target.

On a target /var/lib/opkg/$some_dir should be fine as a default
temporary directory, and it might be nice to have a config option in
/etc/opkg/opkg.conf

On a build host side /var/* may have permission restrictions also, so
* there should be a possibility to accept a user defined tmp dir,
* if /tmp is not good enough as a default opkg directory, probably some
subfolder of ${TOPDIR} should fit, either a fixed one or dynamic
somewhere in a working folder of bb recipe, which calls opkg.

Just my two cents.

With best wishes,
Vladimir

