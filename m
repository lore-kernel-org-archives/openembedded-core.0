Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T105I-0001rk-0H
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:13:53 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 12:01:56 -0700
Received: by wgbdr13 with SMTP id dr13so2497211wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 12:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ku9oAxYVeaXhxtgxq7JYoEBthmzWC91409EpzCAXZM4=;
	b=VLbU9drRhcncom3Kjj7zxCj/GCWBTukXrnBq44tKIfabVHhXxTmMyuP0JpvnYm01lF
	adGQAIUhSLJ5e8M7mbwaiRtpdJIrV4wKqU5d+MDKZkmYlVUR5qdOyDqDANMGNB/rk/wg
	v+ghVQdLEhN7Aw5+Y1UBlYbiHzJo1X0j9sNnyP37K8qT9Jk3kyBzPUpYwQ2flXJjktyi
	+flxIxWVun9X8MIovUCMzvYb6Wh3sA2P0Nz08yK6fLGzdI/gnPDqg63zfCHh1/GbmwzD
	cf6H3P1MAuzLlIr0N4fZA1TTmXqzYTMwbny21mkD5yTMU8MvQsTxX6EWjiYdU0OgQvtb
	x96g==
Received: by 10.216.139.196 with SMTP id c46mr6787643wej.220.1344884515388;
	Mon, 13 Aug 2012 12:01:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm26044104wix.5.2012.08.13.12.01.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 12:01:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 20:01:21 +0100
Message-Id: <cover.1344884443.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlQz51QODgm3wT1r4Y0PmFyaQYGPQ9RZ85q3UoBbZrK13c8JTTT51JcPb6GNy9buvDOT5pL
Subject: [PATCH 0/2] libowl updates
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
X-List-Received-Date: Mon, 13 Aug 2012 19:13:53 -0000

Patches were merged upstream, so drop them and bump srcrev.

The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:

  foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/owl

for you to fetch changes up to d3e664ba768f4485f8d7984a86c571cf43815497:

  libowl-av: patches merged upstream, bump srcrev (2012-08-10 15:47:00 +0300)

----------------------------------------------------------------
Ross Burton (2):
      owl-video: patches pushed upstream, so bump srcrev
      libowl-av: patches merged upstream, bump srcrev

 .../libowl-av/gst_change_state.patch               |   42 --------------------
 .../owl-video-widget/libowl-av/make-382.patch      |   13 ------
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    8 ++--
 .../owl-video/gtk_multithread_safe.patch           |   40 -------------------
 .../owl-video-widget/owl-video/make-382.patch      |   17 --------
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    8 ++--
 6 files changed, 6 insertions(+), 122 deletions(-)
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/make-382.patch

Ross Burton (2):
  owl-video: patches pushed upstream, so bump srcrev
  libowl-av: patches merged upstream, bump srcrev

 .../libowl-av/gst_change_state.patch               |   42 --------------------
 .../owl-video-widget/libowl-av/make-382.patch      |   13 ------
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    8 ++--
 .../owl-video/gtk_multithread_safe.patch           |   40 -------------------
 .../owl-video-widget/owl-video/make-382.patch      |   17 --------
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    8 ++--
 6 files changed, 6 insertions(+), 122 deletions(-)
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/make-382.patch

-- 
1.7.10



