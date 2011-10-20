Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwPW-0007a9-Ve
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:28:07 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:22:13 -0700
Received: by wwn22 with SMTP id 22so8128326wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:22:12 -0700 (PDT)
Received: by 10.216.137.137 with SMTP id y9mr5028350wei.112.1319131331831;
	Thu, 20 Oct 2011 10:22:11 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id b5sm16791780wbh.4.2011.10.20.10.22.08
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:22:09 -0700 (PDT)
Message-ID: <4EA058BE.8010601@intel.com>
Date: Thu, 20 Oct 2011 10:22:06 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318852098.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1318852098.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] gstreamer plugins update/fix
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
X-List-Received-Date: Thu, 20 Oct 2011 17:28:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 06:27 AM, Paul Eggleton wrote:
> I noticed we don't have the latest stable version of gst-plugins-base,
> I'm assuming there wasn't a specific reason for this (FWIW the old version
> installs a header which causes some applications to fail to build, due to
> the use of G_CONST_RETURN which has been deprecated).
>
> In addition, gst-plugins-good builds a pulseaudio plugin if it is found,
> and this is useful so make this dependency explicit.
>
> The following changes since commit 629bea96ae07d9f3129a5da488682851a4e09d52:
>
>    xserver-xorg: remove glx-use-tls again (2011-10-17 12:26:52 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/gst
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gst
>
> Paul Eggleton (2):
>    gst-plugins-base: update to 0.10.35
>    gst-plugins-good: add pulseaudio to DEPENDS
>
>   .../gst-plugins-base-tremor.patch                  |    0
>   ...base_0.10.32.bb =>  gst-plugins-base_0.10.35.bb} |    6 +++---
>   .../gstreamer/gst-plugins-good_0.10.28.bb          |    4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.32 =>  gst-plugins-base-0.10.35}/gst-plugins-base-tremor.patch (100%)
>   rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.32.bb =>  gst-plugins-base_0.10.35.bb} (84%)
>

Merged into OE-Core

Thanks
	Sau!


