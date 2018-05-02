Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8988D745D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 03:33:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2018 20:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,353,1520924400"; d="scan'208";a="225027147"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.22.30])
	([10.221.22.30])
	by fmsmga006.fm.intel.com with ESMTP; 01 May 2018 20:33:08 -0700
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1524640773.git.kai.kang@windriver.com>
	<819c96b9c218ece95d000835d8574837450a0e06.1524640773.git.kai.kang@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <8265d9ee-a91c-cb5f-33c1-434850f7aad7@intel.com>
Date: Wed, 2 May 2018 11:33:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <819c96b9c218ece95d000835d8574837450a0e06.1524640773.git.kai.kang@windriver.com>
Subject: Re: [PATCH v2 2/8] gstreamer1.0-plugins-base: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 02 May 2018 03:33:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 03:23 PM, kai.kang@windriver.com wrote:
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
> index b924e38824..438f4ebbf2 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
> @@ -20,7 +20,7 @@ new mode 100755
>  index b565e93..7741ccc
>  --- a/gst/subparse/gstsubparse.c
>  +++ b/gst/subparse/gstsubparse.c
> -@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject * parent, GstEvent * event)
> +@@ -270,24 +270,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject * parent, GstEvent * event)
>           goto beach;
>         }
>   
> @@ -45,13 +45,15 @@ index b565e93..7741ccc
>  -        GST_DEBUG_OBJECT (self, "segment after seek: %" GST_SEGMENT_FORMAT,
>  -            &self->segment);
>  -
> --        self->need_segment = TRUE;
> +-        /* will mark need_segment when receiving segment from upstream,
> +-         * after FLUSH and all that has happened,
> +-         * rather than racing with chain */
>  -      } else {
>  +      if (!ret) {

This probably should be checked if it's still required.

Please consider adding a PACKAGECONFIG to have jpeg enabled too ..


