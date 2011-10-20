Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwJF-0006Fk-B1
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:21:37 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:15:44 -0700
Received: by yxm34 with SMTP id 34so6753963yxm.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:15:43 -0700 (PDT)
Received: by 10.68.31.196 with SMTP id c4mr13875863pbi.66.1319130943411;
	Thu, 20 Oct 2011 10:15:43 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y4sm20821013pbe.4.2011.10.20.10.15.41
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:15:42 -0700 (PDT)
Message-ID: <4EA0573C.1040509@intel.com>
Date: Thu, 20 Oct 2011 10:15:40 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319064436.git.josh@linux.intel.com>
In-Reply-To: <cover.1319064436.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/4] Update tzdata and gst-plugins-good v2
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
X-List-Received-Date: Thu, 20 Oct 2011 17:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 03:49 PM, Joshua Lock wrote:
> Upgraded tzdata, tzcode-native and gst-plugins-good per mailing list
> requests.
>
> Updated gst-plugins-good recipe to install and correctly handle its
> gconf schema.
>
> Cheers,
> Joshua
>
> The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:
>
>    fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/work
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work
>
> Joshua Lock (4):
>    gst-plugins-good: update to 0.10.30
>    tzdata: updated SRC_URI and update to 2011k
>    tzcode-native: update SRC_URI to new IANA location
>    gst-plugins-good: correctly handle gconf schema
>
>   .../recipes-extended/tzcode/tzcode-native_2011i.bb |    4 ++--
>   .../tzdata/{tzdata_2011k.bb =>  tzdata_2011l.bb}    |    6 +++---
>   ...good_0.10.28.bb =>  gst-plugins-good_0.10.30.bb} |   10 ++++++----
>   3 files changed, 11 insertions(+), 9 deletions(-)
>   rename meta/recipes-extended/tzdata/{tzdata_2011k.bb =>  tzdata_2011l.bb} (96%)
>   rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb =>  gst-plugins-good_0.10.30.bb} (75%)
>

Merged the tz* patches and the first gst-plugin.

Second gst-plugin patch got some feedback, I missed.

Thanks
	Sau!


