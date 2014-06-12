Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7904765D6D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 13:36:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5CDag9g005409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 06:36:42 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Jun 2014 06:36:42 -0700
Message-ID: <5399ACE8.9090809@windriver.com>
Date: Thu, 12 Jun 2014 21:36:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1402564829.git.liezhi.yang@windriver.com>
	<d34c8b5769080274b7202919e450d42c69a5450d.1402564829.git.liezhi.yang@windriver.com>
In-Reply-To: <d34c8b5769080274b7202919e450d42c69a5450d.1402564829.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] gstreamer1.0-rtsp-server: depends on libcgroup
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
X-List-Received-Date: Thu, 12 Jun 2014 13:36:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Updated it a little, it also needs depend on gstreamer1.0-plugins-base:

   git://git.pokylinux.org/poky-contrib rbt/gst

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc 
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 6917d41..28a9420 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -2,7 +2,7 @@ SUMMARY = "A library on top of GStreamer for building an RTSP 
server"
  SECTION = "multimedia"
  LICENSE = "LGPLv2"
  HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
-DEPENDS = "gstreamer1.0"
+DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"

  PNREAL = "gst-rtsp-server"


On 06/12/2014 05:21 PM, Robert Yang wrote:
> Otherwise may do_compile error:
> test-cgroups.c:43:23:: fatal error: libcgroup.h: No such file or directory
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   .../gstreamer/gstreamer1.0-rtsp-server.inc         |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> index 6917d41..e4bf7b0 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> @@ -2,7 +2,7 @@ SUMMARY = "A library on top of GStreamer for building an RTSP server"
>   SECTION = "multimedia"
>   LICENSE = "LGPLv2"
>   HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
> -DEPENDS = "gstreamer1.0"
> +DEPENDS = "gstreamer1.0 libcgroup"
>
>   PNREAL = "gst-rtsp-server"
>
>

