Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RFpal-0000JO-8z
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 17:59:07 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2011 08:53:13 -0700
Received: by wwe6 with SMTP id 6so1574096wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:53:12 -0700 (PDT)
Received: by 10.216.220.196 with SMTP id o46mr2037343wep.46.1318866792407;
	Mon, 17 Oct 2011 08:53:12 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id g20sm31814713wbp.13.2011.10.17.08.53.10
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 08:53:11 -0700 (PDT)
Message-ID: <4E9C4F64.1000105@intel.com>
Date: Mon, 17 Oct 2011 08:53:08 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318601142.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1318601142.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] A couple of bluetooth improvements
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
X-List-Received-Date: Mon, 17 Oct 2011 15:59:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/2011 07:07 AM, Paul Eggleton wrote:
> The following changes since commit 362512b83775ad7020e5870a594f0e7ca9ef83ba:
>
>    bitbake.conf Exclude MACHINE from MACHINEOVERRIDE variable dependencies (2011-10-14 13:51:14 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/bluetooth
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bluetooth
>
> Paul Eggleton (2):
>    pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
>    bluez4: disable hidd, pand&  dund
>
>   meta/recipes-connectivity/bluez/bluez4.inc         |    6 +++---
>   meta/recipes-connectivity/bluez/bluez4_4.96.bb     |    2 +-
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +++--
>   .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
>   .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
>   5 files changed, 9 insertions(+), 8 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



