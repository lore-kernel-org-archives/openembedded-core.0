Return-Path: <robert_joslyn@selinc.com>
Received: from volare.selinc.com (volare.selinc.com [74.117.214.143])
	by mail.openembedded.org (Postfix) with ESMTP id 240A0781F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 17:22:55 +0000 (UTC)
Received: from pps.filterd (volare.selinc.com [127.0.0.1])
	by volare.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w1LHMuM5027595; 
	Wed, 21 Feb 2018 09:22:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=in-reply-to :
	references : to : cc : mime-version : subject : message-id : from :
	date : content-type; s=SELinc2017;
	bh=tlafTj1Ci8XsIP9valIU42L2kPDpvEm2l+9+dr3t8uk=;
	b=HC/dA8xIscBBEcVa0mcyy7YgsGA0ZsKiJFHwqWyuuv/FKfxmuVNRsQf68sWJGY9wa5rU
	QEEzNA1baSc7rtemUd3bHFmiSFmFihM32IRUW2jNWBd9NsY8GREwKvN5chcIN9BBgksz
	ViNcbLtOkHiVx3hbO07xC02V/l7ROh25wrAnkQ2+OvZ1hBQOVi2fphy9AnSFf8B54hQK
	NSBSWxSOohdMqaNzVShKy7DBHZ89ayoX8/cHuqfPKlxl1tECEJCSB8k4vTpH3p4qUcem
	QKZB2HilfNFakKoZu3g5BsWSK5lMxWqWjNWIrwDkdIm+B/N8vSSVOQUBySBUA3ua6G4H
	TQ== 
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by volare.selinc.com with ESMTP id 2g8571tays-1;
	Wed, 21 Feb 2018 09:22:56 -0800
In-Reply-To: <ec004c5f-51b9-9ead-b429-cc2d8011ce5d@gmail.com>
References: <20180214032812.349-1-robert_joslyn@selinc.com>
	<ec004c5f-51b9-9ead-b429-cc2d8011ce5d@gmail.com>
To: akuster808 <akuster808@gmail.com>
MIME-Version: 1.0
X-KeepSent: 1905711D:D62EE87E-8825823B:005F5700;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OF1905711D.D62EE87E-ON8825823B.005F5700-8825823B.005F7695@selinc.com>
From: robert_joslyn@selinc.com
Date: Wed, 21 Feb 2018 09:22:42 -0800
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/21/2018 09:22:42 AM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/21/2018 09:22:42 AM,
	Serialize complete at 02/21/2018 09:22:42 AM,
	S/MIME Sign failed at 02/21/2018 09:22:42 AM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/21/2018 09:22:56 AM,
	Serialize complete at 02/21/2018 09:22:56 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8811
	signatures=668676
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [pyro][PATCH v2] openssl: Upgrade from 1.0.2k to 1.0.2n
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
X-List-Received-Date: Wed, 21 Feb 2018 17:22:56 -0000
Content-Type: text/plain; charset="US-ASCII"

akuster808 <akuster808@gmail.com> wrote on 02/21/2018 07:03:50 AM:

> From: akuster808 <akuster808@gmail.com>
> To: Robert Joslyn <robert_joslyn@selinc.com>, openembedded-
> core@lists.openembedded.org, 
> Date: 02/21/2018 07:03 AM
> Subject: Re: [OE-core] [pyro][PATCH v2] openssl: Upgrade from 1.0.2kto 
1.0.2n
> 
> On 02/13/2018 07:28 PM, Robert Joslyn wrote:
> Drop patches already applied upstream. Refresh parallel.patch using
> latest version from master.
> 
> LICENSE checksum changed because of updated copyright years and a minor
> wording change.
> 
> Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
> 
> This is failing in the AB.
> ERROR: openssl-1.0.2n-r0 do_package: objcopy failed with exit code 1
> (cmd was 'mips64-poky-linux-objcopy' --only-keep-debug '/home/
> pokybuild/yocto-autobuilder/yocto-worker/nightly-mips64/build/build/
> tmp/work/mips64-poky-linux/openssl/1.0.2n-r0/package/usr/lib/
> openssl/ptest/test/x509aux' '/home/pokybuild/yocto-autobuilder/
> yocto-worker/nightly-mips64/build/build/tmp/work/mips64-poky-linux/
> openssl/1.0.2n-r0/package/usr/lib/openssl/ptest/test/.debug/x509aux'):
> mips64-poky-linux-objcopy: Unable to recognise the format of the 
> input file `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> mips64/build/build/tmp/work/mips64-poky-linux/openssl/1.0.2n-r0/
> package/usr/lib/openssl/ptest/test/x509aux'
> ERROR: openssl-1.0.2n-r0 do_package: Function failed: 
split_and_strip_files
> 
> on mips arch64
> 
> DISTRO = "poky"
> MACHINE = "qemuarm64"
> bitbake -k core-image-sato core-image-sato-dev core-image-sato-sdk 
> core-image-minimal core-image-minimal-dev

> dropping patch for now.
> 
> - armin

Sorry about that, looks like there were a few changes to ptest that I 
missed. I'll send out an updated patch later today.

Thanks,
Robert

