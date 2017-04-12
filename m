Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 69C3C77D25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 15:25:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3CFPFEf020683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 12 Apr 2017 16:25:16 +0100
Message-ID: <1492010715.26846.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wei.tee.ng@intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 16:25:15 +0100
In-Reply-To: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
References: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3 0/3] Set linux-firmware to correct license
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
X-List-Received-Date: Wed, 12 Apr 2017 15:25:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2017-04-09 at 18:58 -0700, wei.tee.ng@intel.com wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
> 
> This is the revised version to fix the ipk packaging error as below:
> ERROR: linux-firmware-1_0.0+gitAUTOINC+b14134583c-r0
> do_package_write_ipk: Function failed: do_package_ipk
> 
> These patches is to update the SRCREV of linux-firmware to the latest
> HEAD
> and set the license file explicitly for linux-firmware-carl9170 to
> GPL-2.
> This also targeted to solve the Bugzilla ID 11090.
> 
> The SRCREV for linux-firmware was updated to the latest in order to
> include the GPL-2 license file. The netronome firmware was removed
> until rpm packaging issue is resolved.
>  
> This configuration are build and tested for ipk, rpm and deb
> packaging.
>  
> Please review and provide feedback if you have any.

We can't upgrade this recipe at this point in the release unless there
is a pressing reason to. You don't list any reason at all for the
upgrade here so I can only assume there isn't one. This patch and the
ones that depend on it will therefore have to wait for 2.4.

Cheers,

Richard

