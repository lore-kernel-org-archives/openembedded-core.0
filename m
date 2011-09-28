Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8xrr-0002Bq-46
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 19:24:23 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 10:18:54 -0700
Received: by wwf22 with SMTP id 22so6210923wwf.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 10:18:52 -0700 (PDT)
Received: by 10.216.82.211 with SMTP id o61mr9511980wee.81.1317230331770;
	Wed, 28 Sep 2011 10:18:51 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id fr18sm41398643wbb.9.2011.09.28.10.18.49
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 10:18:51 -0700 (PDT)
Message-ID: <4E8356F8.9030804@intel.com>
Date: Wed, 28 Sep 2011 10:18:48 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
In-Reply-To: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
Subject: Re: [PATCH 0/3] adding cortexa9 tune file and feature for arm socs whithout neon
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
X-List-Received-Date: Wed, 28 Sep 2011 17:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2011 12:37 PM, Henning Heinold wrote:
> Hi,
>
> the series adding the tune file for cortexa9 which is in pandaboard or
> tegra2. It also adds a feature for socs like the tegra2 which has no
> neon unit and enables it for cortexa8 and cortexa9
>
> Bye Henning
>
> Henning Heinold (3):
>    tune-cortexa9.inc: add tunefile for cortexa9 socs
I am planning to pick up this one today

>    feature-arm-d16.inc: add feature for arm cores which do not have a
>      neon unit or no support for it in the kernel
>    tune: enable d16 feature for cortexa8 and cortexa9
I am holding on these two changes as there seems to be some discussion 
pending on the d16 changes.

Sau!

>
>   meta/conf/machine/include/arm/arch-armv7.inc      |   25 +++++++++++++++---
>   meta/conf/machine/include/arm/arch-armv7a.inc     |   24 +++++++++++++++---
>   meta/conf/machine/include/arm/feature-arm-d16.inc |    3 ++
>   meta/conf/machine/include/tune-cortexa8.inc       |    8 ++++-
>   meta/conf/machine/include/tune-cortexa9.inc       |   28 +++++++++++++++++++++
>   5 files changed, 78 insertions(+), 10 deletions(-)
>   create mode 100644 meta/conf/machine/include/arm/feature-arm-d16.inc
>   create mode 100644 meta/conf/machine/include/tune-cortexa9.inc
>



