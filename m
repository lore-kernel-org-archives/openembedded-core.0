Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C951E721CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 07:17:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL7H6pS005855
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Nov 2014 23:17:06 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 20 Nov 2014 23:17:05 -0800
Message-ID: <546EE6F0.2060104@windriver.com>
Date: Fri, 21 Nov 2014 15:17:04 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Himanshu Pandey <pandey_himanshu80@rediffmail.com>
References: <1416229670.S.5155.1660.F.H.TlJvYmVydCBZYW5nAFtiaXRiYWtlLWRldmVsXSBbUEFUQ0ggMC8xXSBiaXRiYWtlLXdvcmtlcjogZXhpdCA_.RU.rfs308,
	rfs308, 384, 79.f4-234-218.1416548909.31064@webmail.rediffmail.com>
In-Reply-To: <1416229670.S.5155.1660.F.H.TlJvYmVydCBZYW5nAFtiaXRiYWtlLWRldmVsXSBbUEFUQ0ggMC8xXSBiaXRiYWtlLXdvcmtlcjogZXhpdCA_.RU.rfs308,
	rfs308, 384,
	79.f4-234-218.1416548909.31064@webmail.rediffmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto error
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
X-List-Received-Date: Fri, 21 Nov 2014 07:17:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Himanshu,

This email should go into the oe-core mailing list (see the CC),
I don't know why you get this error, have you tried:

$ bitbake linux-yocto -ccleansstate && bitbake linux-yocto

Do you have any bbappends for linux-yocto_3.10.bb ?

And I don't think that the error relates to master's patch:
bitbake-worker: exit normally when SIGHUP

// Robert

On 11/21/2014 01:48 PM, Himanshu Pandey wrote:
> Hi Robert,
>
> I am getting following error everytime on compilation:
>
> NOTE: Executing RunQueue Tasks
> ERROR: Recipe linux-yocto is trying to change PR from 'r0' to 'r14'. This will
> cause do_package_write_* failures since the incorrect data will be used and they
> will be unable to find the right workdir.
> ERROR: Function failed: read_subpackage_metadata
> ERROR: Logfile of failure stored in:
> /home/yocto/poky-dora-10.0.0/build/tmp/work/genericx86_64-poky-linux/linux-yocto/3.10.11+gitAUTOINC+363bd856c8_702040ac7c-r0/temp/log.do_package_write_rpm.2168
> ERROR: Task 362
> (/home/yocto/poky-dora-10.0.0/meta/recipes-kernel/linux/linux-yocto_3.10.bb,
> do_package_write_rpm) failed with exit code '1'
>
> How to get rid of this?
>
> Please help.
>
> Regards,
> Himanshu
>
>
>
>
> From: Robert Yang <liezhi.yang@windriver.com>
> Sent: Mon, 17 Nov 2014 18:37:50
> To: <bitbake-devel@lists.openembedded.org>
> Subject: [bitbake-devel] [PATCH 0/1] bitbake-worker: exit normally when SIGHUP
> The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:
>
>   bitbake: cooker.py <http://cooker.py>: fix loginfo op being set to an invalid
> value (2014-11-12 17:04:50 +0000)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib <http://git.pokylinux.org/poky-contrib>
> rbt/sighup
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/sighup
>
> Robert Yang (1):
>   bitbake-worker: exit normally when SIGHUP
>
> bitbake/bin/bitbake-worker |    9 ++++++++-
> bitbake/lib/bb/cooker.py <http://cooker.py>   |    7 ++++++-
> 2 files changed, 14 insertions(+), 2 deletions(-)
>
> --
> 1.7.9.5 <http://1.7.9.5>
>
> --
> _______________________________________________
> bitbake-devel mailing list
> bitbake-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/bitbake-devel
>
> <http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?>
> Get your own *FREE* website, *FREE* domain & *FREE* mobile app with Company email.
> 	*Know More >*
> <http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&cmp=host&lnk=sign-1-10-13&nsrv1=host>
>

