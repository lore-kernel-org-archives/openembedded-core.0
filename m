Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6241460664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 20:00:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2013 13:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,808,1367996400"; d="scan'208";a="381411857"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2013 13:00:34 -0700
Message-ID: <51FD6162.6020900@linux.intel.com>
Date: Sat, 03 Aug 2013 13:00:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1375521469-1654-1-git-send-email-lpapp@kde.org>
	<CAP9ODKrGeOrWx6v_E9cYBY_VvBn3BLNDWMaDBekhfFR3sr4+eg@mail.gmail.com>
	<CAOMwXhOopQVMRmCXVMnGPt_ZrcL8aS0mxwmUyGgGAvLH7533Cw@mail.gmail.com>
In-Reply-To: <CAOMwXhOopQVMRmCXVMnGPt_ZrcL8aS0mxwmUyGgGAvLH7533Cw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Sat, 03 Aug 2013 20:00:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2013 11:12 AM, Laszlo Papp wrote:
> It is updating the latest version while also preserving the option of
> using an earlier one.
>
As has been mentioned both on the IRC and here to various other patches 
that update without out removing the older version, we ask why is the 
older version still needed.

In certain cases, such as changing licenses (GPLv2 -> GPLv3), we keep 
the older version, in the case of the toolchain and eglibc, we keep n-1 
around while we stability n.

It appears that u-boot is one of those special cases, but I do not have 
enough information in the logs to determine why we are not removing the 
older recipes.

Otavio, any reason we need to keep 3 older versions?

Sau!


>
> On Sat, Aug 3, 2013 at 6:53 PM, Otavio Salvador <otavio@ossystems.com.br
> <mailto:otavio@ossystems.com.br>> wrote:
>
>     On Sat, Aug 3, 2013 at 6:17 AM, Laszlo Papp <lpapp@kde.org
>     <mailto:lpapp@kde.org>> wrote:
>      > Signed-off-by: Laszlo Papp <lpapp@kde.org <mailto:lpapp@kde.org>>
>
>     Please reword the commit. You're not updating it but adding 2013.07
>     version.
>
>     Personally I'd prefer to update for 2013.07 and drop previous
>     releases. To support the update, I've been using this in meta-fsl-arm
>     since rc1 ;-)
>
>     --
>     Otavio Salvador                             O.S. Systems
>     http://www.ossystems.com.br http://projetos.ossystems.com.br
>     Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

