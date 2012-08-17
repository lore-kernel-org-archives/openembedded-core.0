Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Tna-0000Af-Fv
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:09:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 13:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135534561"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 13:57:42 -0700
Message-ID: <502EB046.3080704@linux.intel.com>
Date: Fri, 17 Aug 2012 13:57:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344884443.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884443.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/2] libowl updates
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
X-List-Received-Date: Fri, 17 Aug 2012 21:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 12:01 PM, Ross Burton wrote:
> Patches were merged upstream, so drop them and bump srcrev.
>
> The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:
>
>    foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/owl
>
> for you to fetch changes up to d3e664ba768f4485f8d7984a86c571cf43815497:
>
>    libowl-av: patches merged upstream, bump srcrev (2012-08-10 15:47:00 +0300)
>
> ----------------------------------------------------------------
> Ross Burton (2):
>        owl-video: patches pushed upstream, so bump srcrev
>        libowl-av: patches merged upstream, bump srcrev
>
>   .../libowl-av/gst_change_state.patch               |   42 --------------------
>   .../owl-video-widget/libowl-av/make-382.patch      |   13 ------
>   .../recipes-sato/owl-video-widget/libowl-av_git.bb |    8 ++--
>   .../owl-video/gtk_multithread_safe.patch           |   40 -------------------
>   .../owl-video-widget/owl-video/make-382.patch      |   17 --------
>   .../recipes-sato/owl-video-widget/owl-video_git.bb |    8 ++--
>   6 files changed, 6 insertions(+), 122 deletions(-)
>   delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
>   delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
>   delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
>   delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
>
Merged into OE-Core

Thanks
	Sau!


> Ross Burton (2):
>    owl-video: patches pushed upstream, so bump srcrev
>    libowl-av: patches merged upstream, bump srcrev
>
>   .../libowl-av/gst_change_state.patch               |   42 --------------------
>   .../owl-video-widget/libowl-av/make-382.patch      |   13 ------
>   .../recipes-sato/owl-video-widget/libowl-av_git.bb |    8 ++--
>   .../owl-video/gtk_multithread_safe.patch           |   40 -------------------
>   .../owl-video-widget/owl-video/make-382.patch      |   17 --------
>   .../recipes-sato/owl-video-widget/owl-video_git.bb |    8 ++--
>   6 files changed, 6 insertions(+), 122 deletions(-)
>   delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
>   delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
>   delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
>   delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
>


