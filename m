Return-Path: <wouter@wouterlucas.com>
Received: from h0stless.netw0rk.nl (h0stless.netw0rk.nl [149.210.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6D0774812
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 18:14:03 +0000 (UTC)
Received: from c-73-162-69-48.hsd1.ca.comcast.net ([73.162.69.48]
	helo=[IPv6:::ffff:192.168.11.200])
	by h0stless.netw0rk.nl with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
	(envelope-from <wouter@wouterlucas.com>)
	id 1fJNPe-0005O0-GE; Thu, 17 May 2018 20:14:03 +0200
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Wouter van Boesschoten <wouter@wouterlucas.com>
Date: Thu, 17 May 2018 11:14:02 -0700
Importance: normal
X-Priority: 3
In-Reply-To: <23be1398-3a48-8071-70aa-b17f6f394178@gmail.com>
References: <20180428033806.21451-1-wouter@wouterlucas.com>
	<23be1398-3a48-8071-70aa-b17f6f394178@gmail.com>
X-Antivirus: Avast (VPS 180517-0, 05/16/2018), Outbound message
X-Antivirus-Status: Clean
PrimaryMX: Accepted email from trusted host. Hint: This skips spam scanning so
	make sure other host is not vulnerable
X-Relay-Host: 73.162.69.48
X-Authenticated-Id: wouter
Subject: Re: [pyro][PATCH] gstreamer1.0-plugins-bad: Refresh patchesfor live streaming and add mpdparser for Dash playready support
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
X-List-Received-Date: Thu, 17 May 2018 18:14:04 -0000
Message-ID: <MADEUP.15FE234AC0501BE6.3419@groups.io>
Content-Type: multipart/alternative;
	boundary="_98E94354-870E-4C5F-9F6D-324675C93620_"

--_98E94354-870E-4C5F-9F6D-324675C93620_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Yep my bad, still in the app layer that I was porting down from. Will updat=
e and include the patchwork feedback.

From: akuster808
Sent: Saturday, April 28, 2018 9:37 AM
To: wouterlucas; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pyro][PATCH] gstreamer1.0-plugins-bad: Refresh patc=
hesfor live streaming and add mpdparser for Dash playready support



On 04/27/2018 08:38 PM, wouterlucas wrote:
Signed-off-by: wouterlucas <wouter@wouterlucas.com>
---
 ...demux-improved-live-playback-support.patch | 358 ++++++++----------
 ...implement-adaptivedemux-s-get_live_s.patch |  63 +--
 ...vedemux-minimal-HTTP-context-support.patch | 142 +++++++
 ...-PlayReady-ContentProtection-parsing.patch | 109 ++++++
 .../gstreamer1.0-plugins-bad_1.10.4.bb        |   9 +-
 5 files changed, 452 insertions(+), 229 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch

This fails with:
RROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure: Unable =
to find file file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-=
bu.patch anywhere. The paths that were searched were:
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/poky
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/poky
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/files/poky
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemux86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/qemux86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/files/qemux86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemuall
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/qemuall
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/files/qemuall
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/x86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/x86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/files/x86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/i586
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/i586
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/files/i586
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/buil=
d/meta/recipes-multimedia/gstreamer/files/
    /srv/autobuilder/autobuilder.yoctoproject.org/current_sources
ERROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure for URL=
: 'file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch'.=
 Unable to fetch URL from any source.
ERROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Function failed: base_d=
o_fetch
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/gstreamer=
1.0-plugins-bad/1.10.4-r0/temp/log.do_fetch.1786
NOTE: recipe gstreamer1.0-plugins-bad-1.10.4-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non=
-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.=
4.bb:do_fetch)=20

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
1-mssdemux-improved-live-playback-support.patch b/meta/recipes-multimedia/g=
streamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-supp=
ort.patch
index 4832c18e78..041a3d6313 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssde=
mux-improved-live-playback-support.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssde=
mux-improved-live-playback-support.patch
@@ -1,7 +1,7 @@
-From 73721ad4e9e2d32e1c8b6a3b4aaa98401530e58a Mon Sep 17 00:00:00 2001
+From 12b9645c4c5b94ff4fd5062bdb02b63db7648db9 Mon Sep 17 00:00:00 2001
 From: Philippe Normand <philn@igalia.com>
-Date: Tue, 29 Nov 2016 14:43:41 +0100
-Subject: [PATCH] mssdemux: improved live playback support
+Date: Thu, 10 Sep 2015 16:13:30 +0200
+Subject: [PATCH 1/6] mssdemux: improved live playback support
=20
 When a MSS server hosts a live stream the fragments listed in the
 manifest usually don't have accurate timestamps and duration, except
@@ -12,23 +12,20 @@ be incrementally built by parsing the first/current fra=
gment.
=20
 https://bugzilla.gnome.org/show_bug.cgi?id=3D755036
 ---
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
  ext/smoothstreaming/Makefile.am               |   2 +
- ext/smoothstreaming/gstmssdemux.c             |  60 ++++++
- ext/smoothstreaming/gstmssfragmentparser.c    | 266 +++++++++++++++++++++=
+++++
- ext/smoothstreaming/gstmssfragmentparser.h    |  84 ++++++++
- ext/smoothstreaming/gstmssmanifest.c          | 158 ++++++++++++++-
- ext/smoothstreaming/gstmssmanifest.h          |   7 +
- gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  27 ++-
+ ext/smoothstreaming/gstmssdemux.c             |  61 ++++++
+ ext/smoothstreaming/gstmssfragmentparser.c    | 255 +++++++++++++++++++++=
+++++
+ ext/smoothstreaming/gstmssfragmentparser.h    |  84 +++++++++
+ ext/smoothstreaming/gstmssmanifest.c          | 155 ++++++++++++++--
+ ext/smoothstreaming/gstmssmanifest.h          |   3 +
+ gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  28 ++-
  gst-libs/gst/adaptivedemux/gstadaptivedemux.h |  14 ++
- 8 files changed, 606 insertions(+), 12 deletions(-)
+ 8 files changed, 586 insertions(+), 16 deletions(-)
  create mode 100644 ext/smoothstreaming/gstmssfragmentparser.c
  create mode 100644 ext/smoothstreaming/gstmssfragmentparser.h
=20
 diff --git a/ext/smoothstreaming/Makefile.am b/ext/smoothstreaming/Makefil=
e.am
-index 4faf9df9f..a5e1ad6ae 100644
+index 4faf9df..a5e1ad6 100644
 --- a/ext/smoothstreaming/Makefile.am
 +++ b/ext/smoothstreaming/Makefile.am
 @@ -13,8 +13,10 @@ libgstsmoothstreaming_la_LIBADD =3D \
@@ -43,10 +40,10 @@ index 4faf9df9f..a5e1ad6ae 100644
 +	gstmssfragmentparser.h \
  	gstmssmanifest.h
 diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstms=
sdemux.c
-index 12fb40497..120d9c22b 100644
+index 9d0aece..70b541e 100644
 --- a/ext/smoothstreaming/gstmssdemux.c
 +++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -135,11 +135,18 @@ gst_mss_demux_stream_update_fragment_info (GstAdapti=
veDemuxStream * stream);
+@@ -135,9 +135,16 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiv=
eDemuxStream * stream);
  static gboolean gst_mss_demux_seek (GstAdaptiveDemux * demux, GstEvent * =
seek);
  static gint64
  gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
@@ -56,16 +53,14 @@ index 12fb40497..120d9c22b 100644
  static GstFlowReturn
  gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
      GstBuffer * buffer);
- static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * dem=
ux,
-     gint64 * start, gint64 * stop);
 +static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demu=
x,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
++    GstAdaptiveDemuxStream * stream);
 +static gboolean
 +gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * dem=
ux);
 =20
  static void
  gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,10 +199,15 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+@@ -190,8 +197,13 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
        gst_mss_demux_stream_select_bitrate;
    gstadaptivedemux_class->stream_update_fragment_info =3D
        gst_mss_demux_stream_update_fragment_info;
@@ -73,36 +68,39 @@ index 12fb40497..120d9c22b 100644
 +      gst_mss_demux_stream_get_fragment_waiting_time;
    gstadaptivedemux_class->update_manifest_data =3D
        gst_mss_demux_update_manifest_data;
-   gstadaptivedemux_class->get_live_seek_range =3D
-       gst_mss_demux_get_live_seek_range;
 +  gstadaptivedemux_class->data_received =3D gst_mss_demux_data_received;
 +  gstadaptivedemux_class->requires_periodical_playlist_update =3D
 +      gst_mss_demux_requires_periodical_playlist_update;
 =20
    GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugi=
n");
  }
-@@ -650,6 +662,13 @@ gst_mss_demux_get_manifest_update_interval (GstAdapti=
veDemux * demux)
+@@ -648,6 +660,17 @@ gst_mss_demux_get_manifest_update_interval (GstAdapti=
veDemux * demux)
    return interval;
  }
 =20
 +static gint64
 +gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStream * =
stream)
 +{
-+  /* Wait a second for live streams so we don't try premature fragments d=
ownloading */
-+  return GST_SECOND;
++  GstMssDemuxStream *mssstream =3D (GstMssDemuxStream *) stream;
++  GstMssStreamType streamtype =3D
++      gst_mss_stream_get_type (mssstream->manifest_stream);
++
++  /* Wait a second for live audio streams so we don't try premature fragm=
ents downloading */
++  return streamtype =3D=3D MSS_STREAM_TYPE_AUDIO ? GST_SECOND : 0;
 +}
 +
  static GstFlowReturn
  gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
      GstBuffer * buffer)
-@@ -670,3 +689,44 @@ gst_mss_demux_get_live_seek_range (GstAdaptiveDemux *=
 demux, gint64 * start,
-=20
-   return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start,=
 stop);
+@@ -659,3 +682,41 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux =
* demux,
+   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
+   return GST_FLOW_OK;
  }
 +
++
 +static GstFlowReturn
 +gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer)
++    GstAdaptiveDemuxStream * stream)
 +{
 +  GstMssDemux *mssdemux =3D GST_MSS_DEMUX_CAST (demux);
 +  GstMssDemuxStream *mssstream =3D (GstMssDemuxStream *) stream;
@@ -110,27 +108,23 @@ index 12fb40497..120d9c22b 100644
 +
 +  if (!gst_mss_manifest_is_live (mssdemux->manifest)) {
 +    return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux,
-+        stream, buffer);
++        stream);
 +  }
 +
 +  if (gst_mss_stream_fragment_parsing_needed (mssstream->manifest_stream)=
) {
-+    gst_mss_manifest_live_adapter_push (mssstream->manifest_stream, buffe=
r);
-+    available =3D
-+        gst_mss_manifest_live_adapter_available (mssstream->manifest_stre=
am);
++    available =3D gst_adapter_available (stream->adapter);
 +    // FIXME: try to reduce this minimal size.
 +    if (available < 4096) {
 +      return GST_FLOW_OK;
 +    } else {
++      GstBuffer *buffer =3D gst_adapter_get_buffer (stream->adapter, avai=
lable);
 +      GST_LOG_OBJECT (stream->pad, "enough data, parsing fragment.");
-+      buffer =3D
-+          gst_mss_manifest_live_adapter_take_buffer (mssstream->manifest_=
stream,
-+          available);
-+      gst_mss_stream_parse_fragment (mssstream->manifest_stream, buffer);
++      gst_mss_stream_fragment_parse (mssstream->manifest_stream, buffer);
++      gst_buffer_unref (buffer);
 +    }
 +  }
 +
-+  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, s=
tream,
-+      buffer);
++  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, s=
tream);
 +}
 +
 +static gboolean
@@ -142,17 +136,17 @@ index 12fb40497..120d9c22b 100644
 +}
 diff --git a/ext/smoothstreaming/gstmssfragmentparser.c b/ext/smoothstream=
ing/gstmssfragmentparser.c
 new file mode 100644
-index 000000000..b554d4f31
+index 0000000..01c3b15
 --- /dev/null
 +++ b/ext/smoothstreaming/gstmssfragmentparser.c
-@@ -0,0 +1,266 @@
+@@ -0,0 +1,255 @@
 +/*
 + * Microsoft Smooth-Streaming fragment parsing library
 + *
 + * gstmssfragmentparser.h
 + *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
 + *   Author: Philippe Normand <philn@igalia.com>
 + *
 + * This library is free software; you can redistribute it and/or
@@ -333,12 +327,8 @@ index 000000000..b554d4f31
 +          size =3D gst_byte_reader_get_uint32_be_unchecked (&reader);
 +          fourcc =3D gst_byte_reader_get_uint32_le_unchecked (&reader);
 +          if (fourcc =3D=3D GST_MSS_FRAGMENT_FOURCC_TRUN) {
-+            GST_TRACE ("trun box found, size: %" G_GUINT32_FORMAT, size);
-+            if (!gst_byte_reader_skip (&reader, size - 8)) {
-+              GST_WARNING ("Failed to skip trun box, enough data?");
-+              error =3D TRUE;
-+              goto beach;
-+            }
++            gst_byte_reader_skip_unchecked (&reader, size - 8);
++            GST_TRACE ("trun box found, size: %u", size);
 +          }
 +        }
 +      }
@@ -354,11 +344,7 @@ index 000000000..b554d4f31
 +    }
 +
 +    GST_TRACE ("box size: %" G_GUINT32_FORMAT, size);
-+    if (!gst_byte_reader_get_uint32_le (&reader, &fourcc)) {
-+      GST_WARNING ("Failed to get fourcc, enough data?");
-+      error =3D TRUE;
-+      break;
-+    }
++    fourcc =3D gst_byte_reader_get_uint32_le_unchecked (&reader);
 +
 +    if (fourcc =3D=3D GST_MSS_FRAGMENT_FOURCC_MDAT) {
 +      GST_LOG ("mdat box found");
@@ -367,8 +353,7 @@ index 000000000..b554d4f31
 +    }
 +
 +    if (fourcc !=3D GST_MSS_FRAGMENT_FOURCC_UUID) {
-+      GST_ERROR ("invalid UUID fourcc: %" GST_FOURCC_FORMAT,
-+          GST_FOURCC_ARGS (fourcc));
++      GST_ERROR ("invalid UUID fourcc");
 +      error =3D TRUE;
 +      break;
 +    }
@@ -403,8 +388,6 @@ index 000000000..b554d4f31
 +    }
 +  }
 +
-+beach:
-+
 +  if (!error)
 +    parser->status =3D GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED;
 +
@@ -414,7 +397,7 @@ index 000000000..b554d4f31
 +}
 diff --git a/ext/smoothstreaming/gstmssfragmentparser.h b/ext/smoothstream=
ing/gstmssfragmentparser.h
 new file mode 100644
-index 000000000..cf4711865
+index 0000000..6626358
 --- /dev/null
 +++ b/ext/smoothstreaming/gstmssfragmentparser.h
 @@ -0,0 +1,84 @@
@@ -423,8 +406,8 @@ index 000000000..cf4711865
 + *
 + * gstmssfragmentparser.h
 + *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
 + *   Author: Philippe Normand <philn@igalia.com>
 + *
 + * This library is free software; you can redistribute it and/or
@@ -503,14 +486,14 @@ index 000000000..cf4711865
 +
 +#endif /* __GST_MSS_FRAGMENT_PARSER_H__ */
 diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gs=
tmssmanifest.c
-index 144bbb42d..e1031ba55 100644
+index 1b72e8d..d50a51a 100644
 --- a/ext/smoothstreaming/gstmssmanifest.c
 +++ b/ext/smoothstreaming/gstmssmanifest.c
 @@ -1,5 +1,7 @@
  /* GStreamer
   * Copyright (C) 2012 Smart TV Alliance
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
   *  Author: Thiago Sousa Santos <thiago.sousa.santos@collabora.com>, Coll=
abora Ltd.
   *
   * gstmssmanifest.c:
@@ -522,12 +505,12 @@ index 144bbb42d..e1031ba55 100644
 =20
  GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
  #define GST_CAT_DEFAULT mssdemux_debug
-@@ -74,12 +77,17 @@ struct _GstMssStream
+@@ -73,12 +76,17 @@ struct _GstMssStream
    gboolean active;              /* if the stream is currently being used =
*/
    gint selectedQualityIndex;
 =20
 +  gboolean has_live_fragments;
-+  GstAdapter *live_adapter;
++  GQueue live_fragments;
 +
    GList *fragments;
    GList *qualities;
@@ -540,15 +523,15 @@ index 144bbb42d..e1031ba55 100644
    guint fragment_repetition_index;
    GList *current_fragment;
    GList *current_quality;
-@@ -96,6 +104,7 @@ struct _GstMssManifest
+@@ -94,6 +102,7 @@ struct _GstMssManifest
+   xmlNodePtr xmlrootnode;
 =20
    gboolean is_live;
-   gint64 dvr_window;
 +  guint64 look_ahead_fragment_count;
 =20
    GString *protection_system_id;
    gchar *protection_data;
-@@ -235,7 +244,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStream=
Quality * b)
+@@ -233,7 +242,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStream=
Quality * b)
  }
 =20
  static void
@@ -558,7 +541,7 @@ index 144bbb42d..e1031ba55 100644
  {
    xmlNodePtr iter;
    GstMssFragmentListBuilder builder;
-@@ -248,9 +258,21 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodeP=
tr node)
+@@ -246,9 +256,18 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodeP=
tr node)
    stream->url =3D (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_URL);
    stream->lang =3D (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_LANGU=
AGE);
 =20
@@ -567,9 +550,6 @@ index 144bbb42d..e1031ba55 100644
 +   * playlist can be built incrementally from the first fragment
 +   * of the manifest.
 +   */
-+
-+  GST_DEBUG ("Live stream: %s, look-ahead fragments: %" G_GUINT64_FORMAT,
-+      manifest->is_live ? "yes" : "no", manifest->look_ahead_fragment_cou=
nt);
 +  stream->has_live_fragments =3D manifest->is_live
 +      && manifest->look_ahead_fragment_count;
 +
@@ -581,13 +561,15 @@ index 144bbb42d..e1031ba55 100644
      } else if (node_has_type (iter, MSS_NODE_STREAM_QUALITY)) {
        GstMssStreamQuality *quality =3D gst_mss_stream_quality_new (iter);
        stream->qualities =3D g_list_prepend (stream->qualities, quality);
-@@ -259,17 +281,24 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNode=
Ptr node)
+@@ -257,17 +276,26 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNode=
Ptr node)
      }
    }
 =20
 -  stream->fragments =3D g_list_reverse (builder.fragments);
 +  if (stream->has_live_fragments) {
-+    stream->live_adapter =3D gst_adapter_new ();
++    g_queue_init (&stream->live_fragments);
++    g_queue_push_tail (&stream->live_fragments, builder.fragments->data);
++    stream->current_fragment =3D g_queue_peek_head_link (&stream->live_fr=
agments);
 +  }
 +
 +  if (builder.fragments) {
@@ -609,7 +591,7 @@ index 144bbb42d..e1031ba55 100644
  }
 =20
 =20
-@@ -315,6 +344,7 @@ gst_mss_manifest_new (GstBuffer * data)
+@@ -313,6 +341,7 @@ gst_mss_manifest_new (GstBuffer * data)
    xmlNodePtr nodeiter;
    gchar *live_str;
    GstMapInfo mapinfo;
@@ -617,33 +599,21 @@ index 144bbb42d..e1031ba55 100644
 =20
    if (!gst_buffer_map (data, &mapinfo, GST_MAP_READ)) {
      return NULL;
-@@ -335,6 +365,7 @@ gst_mss_manifest_new (GstBuffer * data)
-   /* the entire file is always available for non-live streams */
-   if (!manifest->is_live) {
-     manifest->dvr_window =3D 0;
-+    manifest->look_ahead_fragment_count =3D 0;
-   } else {
-     /* if 0, or non-existent, the length is infinite */
-     gchar *dvr_window_str =3D (gchar *) xmlGetProp (root,
-@@ -346,6 +377,17 @@ gst_mss_manifest_new (GstBuffer * data)
-         manifest->dvr_window =3D 0;
-       }
-     }
-+
-+    look_ahead_fragment_count_str =3D
-+        (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount")=
;
-+    if (look_ahead_fragment_count_str) {
-+      manifest->look_ahead_fragment_count =3D
-+          g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
-+      xmlFree (look_ahead_fragment_count_str);
-+      if (manifest->look_ahead_fragment_count <=3D 0) {
-+        manifest->look_ahead_fragment_count =3D 0;
-+      }
-+    }
+@@ -330,13 +359,21 @@ gst_mss_manifest_new (GstBuffer * data)
+     xmlFree (live_str);
    }
 =20
++  look_ahead_fragment_count_str =3D
++      (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
++  if (look_ahead_fragment_count_str) {
++    manifest->look_ahead_fragment_count =3D
++        g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
++    xmlFree (look_ahead_fragment_count_str);
++  }
++
    for (nodeiter =3D root->children; nodeiter; nodeiter =3D nodeiter->next=
) {
-@@ -354,7 +396,7 @@ gst_mss_manifest_new (GstBuffer * data)
+     if (nodeiter->type =3D=3D XML_ELEMENT_NODE
+         && (strcmp ((const char *) nodeiter->name, "StreamIndex") =3D=3D =
0)) {
        GstMssStream *stream =3D g_new0 (GstMssStream, 1);
 =20
        manifest->streams =3D g_slist_append (manifest->streams, stream);
@@ -652,39 +622,56 @@ index 144bbb42d..e1031ba55 100644
      }
 =20
      if (nodeiter->type =3D=3D XML_ELEMENT_NODE
-@@ -371,6 +413,11 @@ gst_mss_manifest_new (GstBuffer * data)
+@@ -353,13 +390,19 @@ gst_mss_manifest_new (GstBuffer * data)
  static void
  gst_mss_stream_free (GstMssStream * stream)
  {
-+  if (stream->live_adapter) {
-+    gst_adapter_clear (stream->live_adapter);
-+    g_object_unref (stream->live_adapter);
+-  g_list_free_full (stream->fragments, g_free);
++  if (stream->has_live_fragments) {
++    g_queue_foreach (&stream->live_fragments, (GFunc) g_free, NULL);
++    g_queue_clear (&stream->live_fragments);
++  } else {
++    g_list_free_full (stream->fragments, g_free);
 +  }
-+
-   g_list_free_full (stream->fragments, g_free);
    g_list_free_full (stream->qualities,
        (GDestroyNotify) gst_mss_stream_quality_free);
-@@ -379,6 +426,7 @@ gst_mss_stream_free (GstMssStream * stream)
+   xmlFree (stream->url);
+   xmlFree (stream->lang);
    g_regex_unref (stream->regex_position);
    g_regex_unref (stream->regex_bitrate);
-   g_free (stream);
 +  gst_mss_fragment_parser_clear (&stream->fragment_parser);
+   g_free (stream);
  }
 =20
- void
-@@ -1079,6 +1127,9 @@ GstFlowReturn
+@@ -984,7 +1027,12 @@ gst_mss_stream_get_fragment_gst_timestamp (GstMssStr=
eam * stream)
+   g_return_val_if_fail (stream->active, GST_CLOCK_TIME_NONE);
+=20
+   if (!stream->current_fragment) {
+-    GList *last =3D g_list_last (stream->fragments);
++    GList *last;
++
++    if (stream->has_live_fragments)
++      last =3D g_queue_peek_tail_link (&stream->live_fragments);
++    else
++      last =3D g_list_last (stream->fragments);
+     if (last =3D=3D NULL)
+       return GST_CLOCK_TIME_NONE;
+=20
+@@ -1037,21 +1085,54 @@ GstFlowReturn
  gst_mss_stream_advance_fragment (GstMssStream * stream)
  {
    GstMssStreamFragment *fragment;
++  GstMssStreamFragment *prev_fragment;
 +  const gchar *stream_type_name =3D
 +      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
 +
    g_return_val_if_fail (stream->active, GST_FLOW_ERROR);
 =20
    if (stream->current_fragment =3D=3D NULL)
-@@ -1086,14 +1137,20 @@ gst_mss_stream_advance_fragment (GstMssStream * st=
ream)
+     return GST_FLOW_EOS;
 =20
-   fragment =3D stream->current_fragment->data;
+-  fragment =3D stream->current_fragment->data;
++  prev_fragment =3D fragment =3D stream->current_fragment->data;
    stream->fragment_repetition_index++;
 -  if (stream->fragment_repetition_index < fragment->repetitions) {
 -    return GST_FLOW_OK;
@@ -693,10 +680,34 @@ index 144bbb42d..e1031ba55 100644
 +    goto beach;
 =20
    stream->fragment_repetition_index =3D 0;
-   stream->current_fragment =3D g_list_next (stream->current_fragment);
+-  stream->current_fragment =3D g_list_next (stream->current_fragment);
++
++  if (stream->has_live_fragments)
++    stream->current_fragment =3D g_queue_pop_head_link (&stream->live_fra=
gments);
++  else
++    stream->current_fragment =3D g_list_next (stream->current_fragment);
++
++  if (stream->current_fragment !=3D NULL) {
++    fragment =3D stream->current_fragment->data;
++    if (fragment->time <=3D prev_fragment->time) {
++      while (fragment->time <=3D prev_fragment->time) {
++        if (stream->has_live_fragments)
++          stream->current_fragment =3D
++              g_queue_pop_head_link (&stream->live_fragments);
++        else
++          stream->current_fragment =3D g_list_next (stream->current_fragm=
ent);
++        if (stream->current_fragment =3D=3D NULL)
++          break;
++        fragment =3D stream->current_fragment->data;
++      }
++    }
++  }
 +
 +  GST_DEBUG ("Advanced to fragment #%d on %s stream", fragment->number,
 +      stream_type_name);
++  if (stream->has_live_fragments)
++    GST_LOG ("%u fragments left in the %s stream queue",
++        g_queue_get_length (&stream->live_fragments), stream_type_name);
    if (stream->current_fragment =3D=3D NULL)
      return GST_FLOW_EOS;
 +
@@ -706,57 +717,22 @@ index 144bbb42d..e1031ba55 100644
    return GST_FLOW_OK;
  }
 =20
-@@ -1173,6 +1230,11 @@ gst_mss_stream_seek (GstMssStream * stream, gboolea=
n forward,
-   GST_DEBUG ("Stream %s seeking to %" G_GUINT64_FORMAT, stream->url, time=
);
-   for (iter =3D stream->fragments; iter; iter =3D g_list_next (iter)) {
-     fragment =3D iter->data;
-+    if (stream->has_live_fragments) {
-+      if (fragment->time + fragment->repetitions * fragment->duration > t=
ime)
-+        stream->current_fragment =3D iter;
-+      break;
-+    }
-     if (fragment->time + fragment->repetitions * fragment->duration > tim=
e) {
-       stream->current_fragment =3D iter;
-       stream->fragment_repetition_index =3D
-@@ -1256,9 +1318,14 @@ static void
- gst_mss_stream_reload_fragments (GstMssStream * stream, xmlNodePtr stream=
Index)
- {
-   xmlNodePtr iter;
--  guint64 current_gst_time =3D gst_mss_stream_get_fragment_gst_timestamp =
(stream);
-+  guint64 current_gst_time;
-   GstMssFragmentListBuilder builder;
+@@ -1125,6 +1206,10 @@ gst_mss_stream_seek (GstMssStream * stream, gboolea=
n forward,
+   guint64 timescale;
+   GstMssStreamFragment *fragment =3D NULL;
 =20
++  // FIXME: Seek support for live scenario using DVR window.
 +  if (stream->has_live_fragments)
 +    return;
 +
-+  current_gst_time =3D gst_mss_stream_get_fragment_gst_timestamp (stream)=
;
-+
-   gst_mss_fragment_list_builder_init (&builder);
+   timescale =3D gst_mss_stream_get_timescale (stream);
+   time =3D gst_util_uint64_scale_round (time, timescale, GST_SECOND);
 =20
-   GST_DEBUG ("Current position: %" GST_TIME_FORMAT,
-@@ -1514,3 +1581,74 @@ gst_mss_manifest_get_live_seek_range (GstMssManifes=
t * manifest, gint64 * start,
-=20
-   return ret;
+@@ -1406,3 +1491,47 @@ gst_mss_stream_get_lang (GstMssStream * stream)
+ {
+   return stream->lang;
  }
 +
-+void
-+gst_mss_manifest_live_adapter_push (GstMssStream * stream, GstBuffer * bu=
ffer)
-+{
-+  gst_adapter_push (stream->live_adapter, buffer);
-+}
-+
-+gsize
-+gst_mss_manifest_live_adapter_available (GstMssStream * stream)
-+{
-+  return gst_adapter_available (stream->live_adapter);
-+}
-+
-+GstBuffer *
-+gst_mss_manifest_live_adapter_take_buffer (GstMssStream * stream, gsize n=
bytes)
-+{
-+  return gst_adapter_take_buffer (stream->live_adapter, nbytes);
-+}
-+
 +gboolean
 +gst_mss_stream_fragment_parsing_needed (GstMssStream * stream)
 +{
@@ -764,11 +740,11 @@ index 144bbb42d..e1031ba55 100644
 +}
 +
 +void
-+gst_mss_stream_parse_fragment (GstMssStream * stream, GstBuffer * buffer)
++gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
 +{
 +  GstMssStreamFragment *current_fragment =3D NULL;
-+  const gchar *stream_type_name;
-+  guint8 index;
++  const gchar *stream_type_name =3D
++      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
 +
 +  if (!stream->has_live_fragments)
 +    return;
@@ -780,29 +756,20 @@ index 144bbb42d..e1031ba55 100644
 +  current_fragment->time =3D stream->fragment_parser.tfxd.time;
 +  current_fragment->duration =3D stream->fragment_parser.tfxd.duration;
 +
-+  stream_type_name =3D
-+      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
-+
-+  for (index =3D 0; index < stream->fragment_parser.tfrf.entries_count; i=
ndex++) {
-+    GList *l =3D g_list_last (stream->fragments);
-+    GstMssStreamFragment *last;
++  for (guint8 index =3D 0; index < stream->fragment_parser.tfrf.entries_c=
ount;
++      index++) {
++    GstMssStreamFragment *last =3D g_queue_peek_tail (&stream->live_fragm=
ents);
 +    GstMssStreamFragment *fragment;
 +
-+    if (l =3D=3D NULL)
-+      break;
-+
-+    last =3D (GstMssStreamFragment *) l->data;
-+
-+    if (last->time =3D=3D stream->fragment_parser.tfrf.entries[index].tim=
e)
-+      continue;
-+
++    if (last =3D=3D NULL)
++        break;
 +    fragment =3D g_new (GstMssStreamFragment, 1);
 +    fragment->number =3D last->number + 1;
 +    fragment->repetitions =3D 1;
 +    fragment->time =3D stream->fragment_parser.tfrf.entries[index].time;
 +    fragment->duration =3D stream->fragment_parser.tfrf.entries[index].du=
ration;
 +
-+    stream->fragments =3D g_list_append (stream->fragments, fragment);
++    g_queue_push_tail (&stream->live_fragments, fragment);
 +    GST_LOG ("Adding fragment number: %u to %s stream, time: %" G_GUINT64=
_FORMAT
 +        ", duration: %" G_GUINT64_FORMAT ", repetitions: %u",
 +        fragment->number, stream_type_name,
@@ -810,31 +777,20 @@ index 144bbb42d..e1031ba55 100644
 +  }
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gs=
tmssmanifest.h
-index 6b7b1f971..03b066ae5 100644
+index af7419c..039877f 100644
 --- a/ext/smoothstreaming/gstmssmanifest.h
 +++ b/ext/smoothstreaming/gstmssmanifest.h
-@@ -26,6 +26,7 @@
- #include <glib.h>
- #include <gio/gio.h>
- #include <gst/gst.h>
-+#include <gst/base/gstadapter.h>
-=20
- G_BEGIN_DECLS
-=20
-@@ -73,5 +74,11 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * s=
tream);
+@@ -72,5 +72,8 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * st=
ream);
 =20
  const gchar * gst_mss_stream_type_name (GstMssStreamType streamtype);
 =20
-+void gst_mss_manifest_live_adapter_push(GstMssStream * stream, GstBuffer =
* buffer);
-+gsize gst_mss_manifest_live_adapter_available(GstMssStream * stream);
-+GstBuffer * gst_mss_manifest_live_adapter_take_buffer(GstMssStream * stre=
am, gsize nbytes);
 +gboolean gst_mss_stream_fragment_parsing_needed(GstMssStream * stream);
-+void gst_mss_stream_parse_fragment(GstMssStream * stream, GstBuffer * buf=
fer);
++void gst_mss_stream_fragment_parse(GstMssStream * stream, GstBuffer * buf=
fer);
 +
  G_END_DECLS
  #endif /* __GST_MSS_MANIFEST_H__ */
 diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/=
adaptivedemux/gstadaptivedemux.c
-index 634e4f388..ddca726b6 100644
+index bf311d3..20bd839 100644
 --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
 +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
 @@ -291,6 +291,9 @@ gst_adaptive_demux_wait_until (GstClock * clock, GCond=
 * cond, GMutex * mutex,
@@ -868,7 +824,7 @@ index 634e4f388..ddca726b6 100644
            }
          } else {
            /* no streams */
-@@ -2125,6 +2133,13 @@ gst_adaptive_demux_stream_data_received_default (Gs=
tAdaptiveDemux * demux,
+@@ -2113,6 +2121,13 @@ gst_adaptive_demux_stream_data_received_default (Gs=
tAdaptiveDemux * demux,
    return gst_adaptive_demux_stream_push_buffer (stream, buffer);
  }
 =20
@@ -882,25 +838,33 @@ index 634e4f388..ddca726b6 100644
  static GstFlowReturn
  _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
  {
-@@ -3338,7 +3353,15 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiv=
eDemuxStream * stream)
+@@ -2209,7 +2224,7 @@ _src_chain (GstPad * pad, GstObject * parent, GstBuf=
fer * buffer)
+       stream->download_chunk_start_time;
+   stream->download_total_bytes +=3D gst_buffer_get_size (buffer);
+=20
+-  GST_DEBUG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORM=
AT,
++  GST_LOG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORMAT=
,
+       gst_buffer_get_size (buffer));
+=20
+   ret =3D klass->data_received (demux, stream, buffer);
+@@ -3326,7 +3341,14 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiv=
eDemuxStream * stream)
        GST_DEBUG_OBJECT (stream->pad, "EOS, checking to stop download loop=
");
        /* we push the EOS after releasing the object lock */
        if (gst_adaptive_demux_is_live (demux)) {
 -        if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream=
)) {
 +        GstAdaptiveDemuxClass *demux_class =3D
-+            GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
++          GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
 +
 +        /* this might be a fragment download error, refresh the manifest,=
 just in case */
 +        if (!demux_class->requires_periodical_playlist_update (demux)) {
 +          ret =3D gst_adaptive_demux_update_manifest (demux);
 +          break;
-+        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux,
-+                stream)) {
++        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux,=
 stream)) {
            goto end;
          }
          gst_task_stop (stream->download_task);
 diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h b/gst-libs/gst/=
adaptivedemux/gstadaptivedemux.h
-index 780f4d93f..9a1a1b7d1 100644
+index 780f4d9..9a1a1b7 100644
 --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
 +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
 @@ -459,6 +459,20 @@ struct _GstAdaptiveDemuxClass
@@ -925,5 +889,5 @@ index 780f4d93f..9a1a1b7d1 100644
 =20
  GType    gst_adaptive_demux_get_type (void);
 --=20
-2.11.0
+2.7.4
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
1-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-impleme=
nt-adaptivedemux-s-get_live_s.patch
index 76d29e151b..c4639a2cda 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoot=
hstreaming-implement-adaptivedemux-s-get_live_s.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoot=
hstreaming-implement-adaptivedemux-s-get_live_s.patch
@@ -1,7 +1,7 @@
-From e9178fa082116d4bf733b184a8b6951112c17900 Mon Sep 17 00:00:00 2001
+From e8155c77d8dcaf39ec564b85c4a56e64fce6de2b Mon Sep 17 00:00:00 2001
 From: Matthew Waters <matthew@centricular.com>
 Date: Thu, 10 Nov 2016 17:18:36 +1100
-Subject: [PATCH] smoothstreaming: implement adaptivedemux's
+Subject: [PATCH 1/2] smoothstreaming: implement adaptivedemux's
  get_live_seek_range()
=20
 Allows seeking through the available fragments that are still available
@@ -10,40 +10,45 @@ manifest.
=20
 https://bugzilla.gnome.org/show_bug.cgi?id=3D774178
 ---
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- ext/smoothstreaming/gstmssdemux.c    | 13 ++++++
+ ext/smoothstreaming/gstmssdemux.c    | 14 +++++-
  ext/smoothstreaming/gstmssmanifest.c | 84 +++++++++++++++++++++++++++++++=
+++++
  ext/smoothstreaming/gstmssmanifest.h |  1 +
- 3 files changed, 98 insertions(+)
+ 3 files changed, 98 insertions(+), 1 deletion(-)
=20
 diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstms=
sdemux.c
-index 9d0aece2b..b66e19514 100644
+index 1a122d4..26147fd 100644
 --- a/ext/smoothstreaming/gstmssdemux.c
 +++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -138,6 +138,8 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiv=
eDemux * demux);
- static GstFlowReturn
- gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-     GstBuffer * buffer);
+@@ -146,6 +146,8 @@ static GstFlowReturn gst_mss_demux_data_received (GstA=
daptiveDemux * demux,
+     GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
+ static gboolean
+ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * dem=
ux);
 +static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * dem=
ux,
 +    gint64 * start, gint64 * stop);
 =20
  static void
  gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,6 +194,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
-       gst_mss_demux_stream_update_fragment_info;
-   gstadaptivedemux_class->update_manifest_data =3D
-       gst_mss_demux_update_manifest_data;
+@@ -206,6 +208,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+   gstadaptivedemux_class->data_received =3D gst_mss_demux_data_received;
+   gstadaptivedemux_class->requires_periodical_playlist_update =3D
+       gst_mss_demux_requires_periodical_playlist_update;
 +  gstadaptivedemux_class->get_live_seek_range =3D
 +      gst_mss_demux_get_live_seek_range;
 =20
    GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugi=
n");
  }
-@@ -659,3 +663,12 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux =
* demux,
-   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
+@@ -694,7 +698,6 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux *=
 demux,
    return GST_FLOW_OK;
  }
+=20
+-
+ static GstFlowReturn
+ gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+     GstAdaptiveDemuxStream * stream, GstBuffer *buffer)
+@@ -739,3 +742,12 @@ gst_mss_demux_requires_periodical_playlist_update (Gs=
tAdaptiveDemux * demux)
+=20
+   return (!gst_mss_manifest_is_live (mssdemux->manifest));
+ }
 +
 +static gboolean
 +gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * sta=
rt,
@@ -54,10 +59,10 @@ index 9d0aece2b..b66e19514 100644
 +  return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start,=
 stop);
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gs=
tmssmanifest.c
-index 1b72e8de1..317b3cef9 100644
+index b9dacb3..291080a 100644
 --- a/ext/smoothstreaming/gstmssmanifest.c
 +++ b/ext/smoothstreaming/gstmssmanifest.c
-@@ -42,6 +42,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
+@@ -45,6 +45,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
 =20
  #define MSS_PROP_BITRATE              "Bitrate"
  #define MSS_PROP_DURATION             "d"
@@ -65,16 +70,16 @@ index 1b72e8de1..317b3cef9 100644
  #define MSS_PROP_LANGUAGE             "Language"
  #define MSS_PROP_NUMBER               "n"
  #define MSS_PROP_REPETITIONS          "r"
-@@ -94,6 +95,7 @@ struct _GstMssManifest
-   xmlNodePtr xmlrootnode;
+@@ -103,6 +104,7 @@ struct _GstMssManifest
 =20
    gboolean is_live;
+   guint64 look_ahead_fragment_count;
 +  gint64 dvr_window;
 =20
    GString *protection_system_id;
    gchar *protection_data;
-@@ -330,6 +332,22 @@ gst_mss_manifest_new (GstBuffer * data)
-     xmlFree (live_str);
+@@ -367,6 +369,22 @@ gst_mss_manifest_new (GstBuffer * data)
+     xmlFree (look_ahead_fragment_count_str);
    }
 =20
 +  /* the entire file is always available for non-live streams */
@@ -96,9 +101,9 @@ index 1b72e8de1..317b3cef9 100644
    for (nodeiter =3D root->children; nodeiter; nodeiter =3D nodeiter->next=
) {
      if (nodeiter->type =3D=3D XML_ELEMENT_NODE
          && (strcmp ((const char *) nodeiter->name, "StreamIndex") =3D=3D =
0)) {
-@@ -1406,3 +1424,69 @@ gst_mss_stream_get_lang (GstMssStream * stream)
- {
-   return stream->lang;
+@@ -1546,3 +1564,69 @@ gst_mss_stream_fragment_parse (GstMssStream * strea=
m, GstBuffer * buffer)
+         fragment->time, fragment->duration, fragment->repetitions);
+   }
  }
 +
 +static GstClockTime
@@ -167,7 +172,7 @@ index 1b72e8de1..317b3cef9 100644
 +  return ret;
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gs=
tmssmanifest.h
-index af7419c23..6b7b1f971 100644
+index 039877f..29545af 100644
 --- a/ext/smoothstreaming/gstmssmanifest.h
 +++ b/ext/smoothstreaming/gstmssmanifest.h
 @@ -54,6 +54,7 @@ void gst_mss_manifest_reload_fragments (GstMssManifest *=
 manifest, GstBuffer * d
@@ -179,5 +184,5 @@ index af7419c23..6b7b1f971 100644
  GstMssStreamType gst_mss_stream_get_type (GstMssStream *stream);
  GstCaps * gst_mss_stream_get_caps (GstMssStream * stream);
 --=20
-2.11.0
+1.8.3.2
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
3-adaptivedemux-minimal-HTTP-context-support.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-contex=
t-support.patch
new file mode 100644
index 0000000000..8a4ca68d83
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adapt=
ivedemux-minimal-HTTP-context-support.patch
@@ -0,0 +1,142 @@
+From 992bd23193978742029966e0a2232b1bfcc06122 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <philn@igalia.com>
+Date: Wed, 28 Oct 2015 11:52:49 +0100
+Subject: [PATCH 3/6] adaptivedemux: minimal HTTP context support
+
+The uridownloader is now querying the source element for an HTTP
+context, which stores session data (cookies only for now), and reusing
+the data when fetching data over HTTP. Additionally the context is set
+on adaptivedemux, which allows it to also properly use session data
+when downloading fragments.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=3D726314
+---
+ gst-libs/gst/adaptivedemux/gstadaptivedemux.c | 16 ++++++++++++-
+ gst-libs/gst/uridownloader/gsturidownloader.c | 34 ++++++++++++++++++++++=
+++--
+ gst-libs/gst/uridownloader/gsturidownloader.h |  2 +-
+ 3 files changed, 48 insertions(+), 4 deletions(-)
+
+diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/=
adaptivedemux/gstadaptivedemux.c
+index 20bd839..1b5cace 100644
+--- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
++++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
+@@ -432,7 +432,7 @@ gst_adaptive_demux_init (GstAdaptiveDemux * demux,
+=20
+   demux->priv =3D GST_ADAPTIVE_DEMUX_GET_PRIVATE (demux);
+   demux->priv->input_adapter =3D gst_adapter_new ();
+-  demux->downloader =3D gst_uri_downloader_new ();
++  demux->downloader =3D gst_uri_downloader_new (GST_ELEMENT (demux));
+   demux->stream_struct_size =3D sizeof (GstAdaptiveDemuxStream);
+   demux->priv->segment_seqnum =3D gst_util_seqnum_next ();
+   demux->have_group_id =3D FALSE;
+@@ -2547,6 +2547,7 @@ gst_adaptive_demux_stream_update_source (GstAdaptive=
DemuxStream * stream,
+     GstPadLinkReturn pad_link_ret;
+     GObjectClass *gobject_class;
+     gchar *internal_name, *bin_name;
++    GstContext *context =3D NULL;
+=20
+     /* Our src consists of a bin containing uri_handler -> queue2 . The
+      * purpose of the queue2 is to allow the uri_handler to download an
+@@ -2598,6 +2599,19 @@ gst_adaptive_demux_stream_update_source (GstAdaptiv=
eDemuxStream * stream,
+       }
+     }
+=20
++    context =3D
++        gst_element_get_context (GST_ELEMENT_CAST (demux), "http-headers"=
);
++    if (context) {
++      const GstStructure *s =3D gst_context_get_structure (context);
++      const gchar **cookies =3D NULL;
++      gst_structure_get (s, "cookies", G_TYPE_STRV, &cookies, NULL);
++      if (cookies) {
++        GST_DEBUG_OBJECT (demux, "Passing cookies through");
++        g_object_set (uri_handler, "cookies", cookies, NULL);
++      }
++      gst_context_unref (context);
++    }
++
+     /* Source bin creation */
+     bin_name =3D g_strdup_printf ("srcbin-%s", GST_PAD_NAME (stream->pad)=
);
+     stream->src =3D gst_bin_new (bin_name);
+diff --git a/gst-libs/gst/uridownloader/gsturidownloader.c b/gst-libs/gst/=
uridownloader/gsturidownloader.c
+index 47b6f29..1f61250 100644
+--- a/gst-libs/gst/uridownloader/gsturidownloader.c
++++ b/gst-libs/gst/uridownloader/gsturidownloader.c
+@@ -33,6 +33,8 @@ GST_DEBUG_CATEGORY (uridownloader_debug);
+=20
+ struct _GstUriDownloaderPrivate
+ {
++  GstElement *parent;
++
+   /* Fragments fetcher */
+   GstElement *urisrc;
+   GstBus *bus;
+@@ -148,9 +150,11 @@ gst_uri_downloader_finalize (GObject * object)
+ }
+=20
+ GstUriDownloader *
+-gst_uri_downloader_new (void)
++gst_uri_downloader_new (GstElement * parent)
+ {
+-  return g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
++  GstUriDownloader *downloader =3D g_object_new (GST_TYPE_URI_DOWNLOADER,=
 NULL);
++  downloader->priv->parent =3D parent;
++  return downloader;
+ }
+=20
+ static gboolean
+@@ -413,6 +417,7 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloa=
der, const gchar * uri,
+ {
+   GstPad *pad;
+   GObjectClass *gobject_class;
++  GstContext *context =3D NULL;
+=20
+   if (!gst_uri_is_valid (uri))
+     return FALSE;
+@@ -449,6 +454,31 @@ gst_uri_downloader_set_uri (GstUriDownloader * downlo=
ader, const gchar * uri,
+     }
+   }
+=20
++  context =3D gst_element_get_context (downloader->priv->parent, "http-he=
aders");
++  if (!context) {
++    GstQuery *context_query =3D gst_query_new_context ("http-headers");
++    GstPad *parent_sink_pad =3D
++        gst_element_get_static_pad (downloader->priv->parent, "sink");
++    if (gst_pad_peer_query (parent_sink_pad, context_query)) {
++
++      gst_query_parse_context (context_query, &context);
++      gst_element_set_context (downloader->priv->parent, context);
++    }
++    gst_object_unref (parent_sink_pad);
++    gst_query_unref (context_query);
++  }
++
++  if (context) {
++    const GstStructure *s =3D gst_context_get_structure (context);
++    const gchar **cookies =3D NULL;
++    gst_structure_get (s, "cookies", G_TYPE_STRV, &cookies, NULL);
++    if (cookies) {
++      GST_DEBUG_OBJECT (downloader, "Passing cookies through");
++      g_object_set (downloader->priv->urisrc, "cookies", cookies, NULL);
++    }
++    gst_context_unref (context);
++  }
++
+   /* add a sync handler for the bus messages to detect errors in the down=
load */
+   gst_element_set_bus (GST_ELEMENT (downloader->priv->urisrc),
+       downloader->priv->bus);
+diff --git a/gst-libs/gst/uridownloader/gsturidownloader.h b/gst-libs/gst/=
uridownloader/gsturidownloader.h
+index 80b8a3e..36cbf65 100644
+--- a/gst-libs/gst/uridownloader/gsturidownloader.h
++++ b/gst-libs/gst/uridownloader/gsturidownloader.h
+@@ -60,7 +60,7 @@ struct _GstUriDownloaderClass
+=20
+ GType gst_uri_downloader_get_type (void);
+=20
+-GstUriDownloader * gst_uri_downloader_new (void);
++GstUriDownloader * gst_uri_downloader_new (GstElement * parent);
+ GstFragment * gst_uri_downloader_fetch_uri (GstUriDownloader * downloader=
, const gchar * uri, const gchar * referer, gboolean compress, gboolean ref=
resh, gboolean allow_cache, GError ** err);
+ GstFragment * gst_uri_downloader_fetch_uri_with_range (GstUriDownloader *=
 downloader, const gchar * uri, const gchar * referer, gboolean compress, g=
boolean refresh, gboolean allow_cache, gint64 range_start, gint64 range_end=
, GError ** err);
+ void gst_uri_downloader_reset (GstUriDownloader *downloader);
+--=20
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
5-mpdparser-MS-PlayReady-ContentProtection-parsing.patch b/meta/recipes-mul=
timedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-Cont=
entProtection-parsing.patch
new file mode 100644
index 0000000000..97d83aa4f7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdpa=
rser-MS-PlayReady-ContentProtection-parsing.patch
@@ -0,0 +1,109 @@
+From cbf3d75b3d693e50722534d30a8f51995a419803 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <philn@igalia.com>
+Date: Fri, 4 Nov 2016 09:56:33 +0100
+Subject: [PATCH 5/6] mpdparser: MS PlayReady ContentProtection parsing
+
+The "pro" (PlayReady Object) element contents are now base64-decoded
+and properly stored in Protection events.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=3D773936
+---
+ ext/dash/gstdashdemux.c |  2 +-
+ ext/dash/gstmpdparser.c | 41 ++++++++++++++++++++++++++++++++++++++++-
+ ext/dash/gstmpdparser.h |  1 +
+ 3 files changed, 42 insertions(+), 2 deletions(-)
+
+diff --git a/ext/dash/gstdashdemux.c b/ext/dash/gstdashdemux.c
+index 271f70f..b10465e 100644
+--- a/ext/dash/gstdashdemux.c
++++ b/ext/dash/gstdashdemux.c
+@@ -745,7 +745,7 @@ gst_dash_demux_send_content_protection_event (gpointer=
 data, gpointer userdata)
+   /* RFC 2141 states: The leading "urn:" sequence is case-insensitive */
+   schemeIdUri =3D g_ascii_strdown (cp->schemeIdUri, -1);
+   if (g_str_has_prefix (schemeIdUri, "urn:uuid:")) {
+-    pssi_len =3D strlen (cp->value);
++    pssi_len =3D cp->value_len;
+     pssi =3D gst_buffer_new_wrapped (g_memdup (cp->value, pssi_len), pssi=
_len);
+     GST_LOG_OBJECT (stream, "Queuing Protection event on source pad");
+     /* RFC 4122 states that the hex part of a UUID is in lower case,
+diff --git a/ext/dash/gstmpdparser.c b/ext/dash/gstmpdparser.c
+index 15d6d98..f0b3ceb 100644
+--- a/ext/dash/gstmpdparser.c
++++ b/ext/dash/gstmpdparser.c
+@@ -1313,6 +1313,7 @@ gst_mpdparser_parse_descriptor_type_node (GList ** l=
ist, xmlNode * a_node)
+     /* if no value attribute, use XML string representation of the node *=
/
+     gst_mpdparser_get_xml_node_as_string (a_node, &new_descriptor->value)=
;
+   }
++  new_descriptor->value_len =3D strlen(new_descriptor->value);
+ }
+=20
+ static void
+@@ -1734,6 +1735,44 @@ error:
+ }
+=20
+ static void
++gst_mpdparser_parse_content_protection_node (GList ** list, xmlNode * a_n=
ode)
++{
++  gchar *value =3D NULL;
++  if (gst_mpdparser_get_xml_prop_string (a_node, "value", &value)) {
++    if (!g_strcmp0 (value, "MSPR 2.0")) {
++      xmlNode *cur_node;
++      for (cur_node =3D a_node->children; cur_node; cur_node =3D cur_node=
->next) {
++        if (cur_node->type =3D=3D XML_ELEMENT_NODE) {
++          if (xmlStrcmp (cur_node->name, (xmlChar *) "pro") =3D=3D 0) {
++            gsize decoded_len;
++            GstDescriptorType *new_descriptor;
++            new_descriptor =3D g_slice_new0 (GstDescriptorType);
++            *list =3D g_list_append (*list, new_descriptor);
++
++            gst_mpdparser_get_xml_prop_string (a_node, "schemeIdUri",
++                &new_descriptor->schemeIdUri);
++
++            gst_mpdparser_get_xml_node_content (cur_node,
++                &new_descriptor->value);
++            g_base64_decode_inplace (new_descriptor->value, &decoded_len)=
;
++            *(new_descriptor->value + decoded_len) =3D '\0';
++            new_descriptor->value_len =3D decoded_len;
++            goto beach;
++          }
++        }
++      }
++    } else {
++      gst_mpdparser_parse_descriptor_type_node (list, a_node);
++    }
++  } else {
++    gst_mpdparser_parse_descriptor_type_node (list, a_node);
++  }
++beach:
++  if (value)
++    g_free (value);
++}
++
++static void
+ gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType *=
*
+     pointer, xmlNode * a_node)
+ {
+@@ -1788,7 +1827,7 @@ gst_mpdparser_parse_representation_base_type (GstRep=
resentationBaseType **
+             (&representation_base->AudioChannelConfiguration, cur_node);
+       } else if (xmlStrcmp (cur_node->name,
+               (xmlChar *) "ContentProtection") =3D=3D 0) {
+-        gst_mpdparser_parse_descriptor_type_node
++        gst_mpdparser_parse_content_protection_node
+             (&representation_base->ContentProtection, cur_node);
+       }
+     }
+diff --git a/ext/dash/gstmpdparser.h b/ext/dash/gstmpdparser.h
+index 85b97ea..738de68 100644
+--- a/ext/dash/gstmpdparser.h
++++ b/ext/dash/gstmpdparser.h
+@@ -277,6 +277,7 @@ struct _GstDescriptorType
+ {
+   gchar *schemeIdUri;
+   gchar *value;
++  glong value_len;
+ };
+=20
+ struct _GstContentComponentNode
+--=20
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.1=
0.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.=
bb
index 0bb4053e43..c894945748 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -11,13 +11,16 @@ SRC_URI =3D " \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+    file://0001-mssdemux-improved-live-playback-support.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch =
\
-    file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch=
 \
     file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch =
\
-    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch=
 \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch=
 \
-    file://0001-mssdemux-improved-live-playback-support.patch \
+    file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch=
 \
+    file://0003-adaptivedemux-minimal-HTTP-context-support.patch \
+    file://0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch \
+    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch=
 \
+    file://0009-glimagesink-Downrank-to-marginal.patch \
 "
 SRC_URI[md5sum] =3D "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] =3D "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97=
102ce13ecd6966"



--_98E94354-870E-4C5F-9F6D-324675C93620_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";
	color:black;}
span.stderr
	{mso-style-name:stderr;}
span.stdout
	{mso-style-name:stdout;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-US link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal>Yep my bad, still in the app layer t=
hat I was porting down from. Will update and include the patchwork feedback=
.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div style=3D'mso-element:pa=
ra-border-div;border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3DMsoNormal style=3D'border:none;padding:0in'><b>From: </=
b><a href=3D"mailto:akuster808@gmail.com">akuster808</a><br><b>Sent: </b>Sa=
turday, April 28, 2018 9:37 AM<br><b>To: </b><a href=3D"mailto:wouter@woute=
rlucas.com">wouterlucas</a>; <a href=3D"mailto:openembedded-core@lists.open=
embedded.org">openembedded-core@lists.openembedded.org</a><br><b>Subject: <=
/b>Re: [OE-core] [pyro][PATCH] gstreamer1.0-plugins-bad: Refresh patchesfor=
 live streaming and add mpdparser for Dash playready support</p></div><p cl=
ass=3DMsoNormal><o:p>&nbsp;</o:p></p><p><o:p>&nbsp;</o:p></p><p class=3DMso=
Normal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On 04/27/2018 08:38 P=
M, wouterlucas wrote:<o:p></o:p></p></div><blockquote style=3D'margin-top:5=
.0pt;margin-bottom:5.0pt'><pre>Signed-off-by: wouterlucas <a href=3D"mailto=
:wouter@wouterlucas.com">&lt;wouter@wouterlucas.com&gt;</a></pre><pre>---</=
pre><pre> ...demux-improved-live-playback-support.patch | 358 ++++++++-----=
-----</pre><pre> ...implement-adaptivedemux-s-get_live_s.patch |=C2=A0 63 +=
--</pre><pre> ...vedemux-minimal-HTTP-context-support.patch | 142 +++++++</=
pre><pre> ...-PlayReady-ContentProtection-parsing.patch | 109 ++++++</pre><=
pre> .../gstreamer1.0-plugins-bad_1.10.4.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-</pre><pre> 5 files changed, 452 insertions(=
+), 229 deletions(-)</pre><pre> create mode 100644 meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-=
support.patch</pre><pre> create mode 100644 meta/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-p=
arsing.patch</pre></blockquote><p class=3DMsoNormal style=3D'margin-bottom:=
12.0pt'><br>This fails with:<o:p></o:p></p><pre><span class=3Dstderr>RROR: =
gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure: Unable to fin=
d file <a href=3D"file://0002-mssdemux-Handle-the-adapter-in-the-subclass-a=
fter-bu.patch">file://0002-mssdemux-Handle-the-adapter-in-the-subclass-afte=
r-bu.patch</a> anywhere. The paths that were searched were:<o:p></o:p></spa=
n></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-=
autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-bad-1.10.4/poky<o:p></o:p></span></pre><pre>=
<span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gst=
reamer1.0-plugins-bad/poky<o:p></o:p></span></pre><pre><span class=3Dstderr=
>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-=
deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/poky<o:p></o:p></=
span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yoc=
to-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimed=
ia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemux86<o:p></o:p></span></pre=
><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-bad/qemux86<o:p></o:p></span></pre><pre><span class=
=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker=
/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/qemux86<=
o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemuall<o:p></o:p>=
</span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/y=
octo-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multim=
edia/gstreamer/gstreamer1.0-plugins-bad/qemuall<o:p></o:p></span></pre><pre=
><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/fi=
les/qemuall<o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=
=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/b=
uild/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/x86<=
o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-bad/x86<o:p></o:p></span></pr=
e><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobu=
ilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstrea=
mer/files/x86<o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=
=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/b=
uild/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/i586=
<o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/=
pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/rec=
ipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/i586<o:p></o:p></span></=
pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-auto=
builder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstr=
eamer/files/i586<o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=
=A0=C2=A0 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-de=
b/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/<=
o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-bad/<o:p></o:p></span></pre><=
pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0 /home/pokybuild/yocto-autobuild=
er/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer=
/files/<o:p></o:p></span></pre><pre><span class=3Dstderr>=C2=A0=C2=A0=C2=A0=
 /srv/autobuilder/autobuilder.yoctoproject.org/current_sources<o:p></o:p></=
span></pre><pre><span class=3Dstderr>ERROR: gstreamer1.0-plugins-bad-1.10.4=
-r0 do_fetch: Fetcher failure for URL: '<a href=3D"file://0002-mssdemux-Han=
dle-the-adapter-in-the-subclass-after-bu.patch">file://0002-mssdemux-Handle=
-the-adapter-in-the-subclass-after-bu.patch</a>'. Unable to fetch URL from =
any source.<o:p></o:p></span></pre><pre><span class=3Dstderr>ERROR: gstream=
er1.0-plugins-bad-1.10.4-r0 do_fetch: Function failed: base_do_fetch<o:p></=
o:p></span></pre><pre><span class=3Dstderr>ERROR: Logfile of failure stored=
 in: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/bui=
ld/build/tmp/work/i586-poky-linux/gstreamer1.0-plugins-bad/1.10.4-r0/temp/l=
og.do_fetch.1786<o:p></o:p></span></pre><pre><span class=3Dstdout>NOTE: rec=
ipe gstreamer1.0-plugins-bad-1.10.4-r0: task do_fetch: Failed<o:p></o:p></s=
pan></pre><pre><span class=3Dstderr>ERROR: Task (/home/pokybuild/yocto-auto=
builder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstr=
eamer/gstreamer1.0-plugins-bad_1.10.4.bb:do_fetch) </span><o:p></o:p></pre>=
<blockquote style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><pre><o:p>&nbsp;=
</o:p></pre><pre>diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch b/meta/rec=
ipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-l=
ive-playback-support.patch</pre><pre>index 4832c18e78..041a3d6313 100644</p=
re><pre>--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/00=
01-mssdemux-improved-live-playback-support.patch</pre><pre>+++ b/meta/recip=
es-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-liv=
e-playback-support.patch</pre><pre>@@ -1,7 +1,7 @@</pre><pre>-From 73721ad4=
e9e2d32e1c8b6a3b4aaa98401530e58a Mon Sep 17 00:00:00 2001</pre><pre>+From 1=
2b9645c4c5b94ff4fd5062bdb02b63db7648db9 Mon Sep 17 00:00:00 2001</pre><pre>=
 From: Philippe Normand <a href=3D"mailto:philn@igalia.com">&lt;philn@igali=
a.com&gt;</a></pre><pre>-Date: Tue, 29 Nov 2016 14:43:41 +0100</pre><pre>-S=
ubject: [PATCH] mssdemux: improved live playback support</pre><pre>+Date: T=
hu, 10 Sep 2015 16:13:30 +0200</pre><pre>+Subject: [PATCH 1/6] mssdemux: im=
proved live playback support</pre><pre> </pre><pre>=C2=A0When a MSS server =
hosts a live stream the fragments listed in the</pre><pre> manifest usually=
 don't have accurate timestamps and duration, except</pre><pre>@@ -12,23 +1=
2,20 @@ be incrementally built by parsing the first/current fragment.</pre>=
<pre> </pre><pre>=C2=A0<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?i=
d=3D755036">https://bugzilla.gnome.org/show_bug.cgi?id=3D755036</a></pre><p=
re> ---</pre><pre>-Upstream-Status: Backport</pre><pre>-Signed-off-by: Khem=
 Raj <a href=3D"mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></=
pre><pre>-</pre><pre>=C2=A0 ext/smoothstreaming/Makefile.am=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +</pre><pre>- ext/smoothstreaming/gstmssdemux.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 60 ++++++=
</pre><pre>- ext/smoothstreaming/gstmssfragmentparser.c=C2=A0=C2=A0=C2=A0 |=
 266 ++++++++++++++++++++++++++</pre><pre>- ext/smoothstreaming/gstmssfragm=
entparser.h=C2=A0=C2=A0=C2=A0 |=C2=A0 84 ++++++++</pre><pre>- ext/smoothstr=
eaming/gstmssmanifest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 158 ++++++++++++++-</pre><pre>- ext/smoothstreaming/gstmssmanifest.h=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +</p=
re><pre>- gst-libs/gst/adaptivedemux/gstadaptivedemux.c |=C2=A0 27 ++-</pre=
><pre>+ ext/smoothstreaming/gstmssdemux.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 61 ++++++</pre><pre>+ ext/s=
moothstreaming/gstmssfragmentparser.c=C2=A0=C2=A0=C2=A0 | 255 +++++++++++++=
+++++++++++++</pre><pre>+ ext/smoothstreaming/gstmssfragmentparser.h=C2=A0=
=C2=A0=C2=A0 |=C2=A0 84 +++++++++</pre><pre>+ ext/smoothstreaming/gstmssman=
ifest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 155 +++++++=
+++++++--</pre><pre>+ ext/smoothstreaming/gstmssmanifest.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +</pre><pre>+ gst-l=
ibs/gst/adaptivedemux/gstadaptivedemux.c |=C2=A0 28 ++-</pre><pre>=C2=A0 gs=
t-libs/gst/adaptivedemux/gstadaptivedemux.h |=C2=A0 14 ++</pre><pre>- 8 fil=
es changed, 606 insertions(+), 12 deletions(-)</pre><pre>+ 8 files changed,=
 586 insertions(+), 16 deletions(-)</pre><pre>=C2=A0 create mode 100644 ext=
/smoothstreaming/gstmssfragmentparser.c</pre><pre>=C2=A0 create mode 100644=
 ext/smoothstreaming/gstmssfragmentparser.h</pre><pre> </pre><pre>=C2=A0dif=
f --git a/ext/smoothstreaming/Makefile.am b/ext/smoothstreaming/Makefile.am=
</pre><pre>-index 4faf9df9f..a5e1ad6ae 100644</pre><pre>+index 4faf9df..a5e=
1ad6 100644</pre><pre> --- a/ext/smoothstreaming/Makefile.am</pre><pre> +++=
 b/ext/smoothstreaming/Makefile.am</pre><pre> @@ -13,8 +13,10 @@ libgstsmoo=
thstreaming_la_LIBADD =3D \</pre><pre>@@ -43,10 +40,10 @@ index 4faf9df9f..=
a5e1ad6ae 100644</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gstmssfra=
gmentparser.h \</pre><pre>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gstms=
smanifest.h</pre><pre> diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext=
/smoothstreaming/gstmssdemux.c</pre><pre>-index 12fb40497..120d9c22b 100644=
</pre><pre>+index 9d0aece..70b541e 100644</pre><pre> --- a/ext/smoothstream=
ing/gstmssdemux.c</pre><pre> +++ b/ext/smoothstreaming/gstmssdemux.c</pre><=
pre>-@@ -135,11 +135,18 @@ gst_mss_demux_stream_update_fragment_info (GstAd=
aptiveDemuxStream * stream);</pre><pre>+@@ -135,9 +135,16 @@ gst_mss_demux_=
stream_update_fragment_info (GstAdaptiveDemuxStream * stream);</pre><pre>=
=C2=A0 static gboolean gst_mss_demux_seek (GstAdaptiveDemux * demux, GstEve=
nt * seek);</pre><pre>=C2=A0 static gint64</pre><pre>=C2=A0 gst_mss_demux_g=
et_manifest_update_interval (GstAdaptiveDemux * demux);</pre><pre>@@ -56,16=
 +53,14 @@ index 12fb40497..120d9c22b 100644</pre><pre>=C2=A0 static GstFlo=
wReturn</pre><pre>=C2=A0 gst_mss_demux_update_manifest_data (GstAdaptiveDem=
ux * demux,</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GstBuffer * buffer);</=
pre><pre>- static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDe=
mux * demux,</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=A0 gint64 * start, gint64 * s=
top);</pre><pre> +static GstFlowReturn gst_mss_demux_data_received (GstAdap=
tiveDemux * demux,</pre><pre>-+=C2=A0=C2=A0=C2=A0 GstAdaptiveDemuxStream * =
stream, GstBuffer * buffer);</pre><pre>++=C2=A0=C2=A0=C2=A0 GstAdaptiveDemu=
xStream * stream);</pre><pre> +static gboolean</pre><pre> +gst_mss_demux_re=
quires_periodical_playlist_update (GstAdaptiveDemux * demux);</pre><pre>=C2=
=A0 </pre><pre>=C2=A0=C2=A0static void</pre><pre>=C2=A0 gst_mss_demux_class=
_init (GstMssDemuxClass * klass)</pre><pre>-@@ -192,10 +199,15 @@ gst_mss_d=
emux_class_init (GstMssDemuxClass * klass)</pre><pre>+@@ -190,8 +197,13 @@ =
gst_mss_demux_class_init (GstMssDemuxClass * klass)</pre><pre>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_stream_select_bitrate;</pre><p=
re>=C2=A0=C2=A0=C2=A0 gstadaptivedemux_class-&gt;stream_update_fragment_inf=
o =3D</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_st=
ream_update_fragment_info;</pre><pre>@@ -73,36 +68,39 @@ index 12fb40497..1=
20d9c22b 100644</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_st=
ream_get_fragment_waiting_time;</pre><pre>=C2=A0=C2=A0=C2=A0 gstadaptivedem=
ux_class-&gt;update_manifest_data =3D</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gst_mss_demux_update_manifest_data;</pre><pre>-=C2=A0=C2=A0=
 gstadaptivedemux_class-&gt;get_live_seek_range =3D</pre><pre>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_get_live_seek_range;</pre><pre> +=C2=
=A0 gstadaptivedemux_class-&gt;data_received =3D gst_mss_demux_data_receive=
d;</pre><pre> +=C2=A0 gstadaptivedemux_class-&gt;requires_periodical_playli=
st_update =3D</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_requ=
ires_periodical_playlist_update;</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0=
=C2=A0=C2=A0GST_DEBUG_CATEGORY_INIT (mssdemux_debug, &quot;mssdemux&quot;, =
0, &quot;mssdemux plugin&quot;);</pre><pre>=C2=A0 }</pre><pre>-@@ -650,6 +6=
62,13 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * dem=
ux)</pre><pre>+@@ -648,6 +660,17 @@ gst_mss_demux_get_manifest_update_inter=
val (GstAdaptiveDemux * demux)</pre><pre>=C2=A0=C2=A0=C2=A0 return interval=
;</pre><pre>=C2=A0 }</pre><pre>=C2=A0 </pre><pre>=C2=A0+static gint64</pre>=
<pre> +gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStre=
am * stream)</pre><pre> +{</pre><pre>-+=C2=A0 /* Wait a second for live str=
eams so we don't try premature fragments downloading */</pre><pre>-+=C2=A0 =
return GST_SECOND;</pre><pre>++=C2=A0 GstMssDemuxStream *mssstream =3D (Gst=
MssDemuxStream *) stream;</pre><pre>++=C2=A0 GstMssStreamType streamtype =
=3D</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_stream_get_type (mss=
stream-&gt;manifest_stream);</pre><pre>++</pre><pre>++=C2=A0 /* Wait a seco=
nd for live audio streams so we don't try premature fragments downloading *=
/</pre><pre>++=C2=A0 return streamtype =3D=3D MSS_STREAM_TYPE_AUDIO ? GST_S=
ECOND : 0;</pre><pre> +}</pre><pre> +</pre><pre>=C2=A0 static GstFlowReturn=
</pre><pre>=C2=A0 gst_mss_demux_update_manifest_data (GstAdaptiveDemux * de=
mux,</pre><pre>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0GstBuffer * buffer)</pre><pre=
>-@@ -670,3 +689,44 @@ gst_mss_demux_get_live_seek_range (GstAdaptiveDemux =
* demux, gint64 * start,</pre><pre>- </pre><pre>-=C2=A0=C2=A0 return gst_ms=
s_manifest_get_live_seek_range (mssdemux-&gt;manifest, start, stop);</pre><=
pre>+@@ -659,3 +682,41 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDe=
mux * demux,</pre><pre>+=C2=A0=C2=A0 gst_mss_manifest_reload_fragments (mss=
demux-&gt;manifest, buffer);</pre><pre>+=C2=A0=C2=A0 return GST_FLOW_OK;</p=
re><pre>=C2=A0 }</pre><pre> +</pre><pre>++</pre><pre> +static GstFlowReturn=
</pre><pre> +gst_mss_demux_data_received (GstAdaptiveDemux * demux,</pre><p=
re>-+=C2=A0=C2=A0=C2=A0 GstAdaptiveDemuxStream * stream, GstBuffer * buffer=
)</pre><pre>++=C2=A0=C2=A0=C2=A0 GstAdaptiveDemuxStream * stream)</pre><pre=
> +{</pre><pre> +=C2=A0 GstMssDemux *mssdemux =3D GST_MSS_DEMUX_CAST (demux=
);</pre><pre> +=C2=A0 GstMssDemuxStream *mssstream =3D (GstMssDemuxStream *=
) stream;</pre><pre>@@ -110,27 +108,23 @@ index 12fb40497..120d9c22b 100644=
</pre><pre> +</pre><pre> +=C2=A0 if (!gst_mss_manifest_is_live (mssdemux-&g=
t;manifest)) {</pre><pre> +=C2=A0=C2=A0=C2=A0 return GST_ADAPTIVE_DEMUX_CLA=
SS (parent_class)-&gt;data_received (demux,</pre><pre>-+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 stream, buffer);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 stream);</pre><pre> +=C2=A0 }</pre><pre> +</pre><pre>=
 +=C2=A0 if (gst_mss_stream_fragment_parsing_needed (mssstream-&gt;manifest=
_stream)) {</pre><pre>-+=C2=A0=C2=A0=C2=A0 gst_mss_manifest_live_adapter_pu=
sh (mssstream-&gt;manifest_stream, buffer);</pre><pre>-+=C2=A0=C2=A0=C2=A0 =
available =3D</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_ms=
s_manifest_live_adapter_available (mssstream-&gt;manifest_stream);</pre><pr=
e>++=C2=A0=C2=A0=C2=A0 available =3D gst_adapter_available (stream-&gt;adap=
ter);</pre><pre> +=C2=A0=C2=A0=C2=A0 // FIXME: try to reduce this minimal s=
ize.</pre><pre> +=C2=A0=C2=A0=C2=A0 if (available &lt; 4096) {</pre><pre> +=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return GST_FLOW_OK;</pre><pre> +=C2=A0=C2=A0=
=C2=A0 } else {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GstBuffer *buffe=
r =3D gst_adapter_get_buffer (stream-&gt;adapter, available);</pre><pre> +=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_LOG_OBJECT (stream-&gt;pad, &quot;enough=
 data, parsing fragment.&quot;);</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 buffer =3D</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gst_mss_manifest_live_adapter_take_buffer (mssstream-&gt;manifest_strea=
m,</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avail=
able);</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_stream_parse_frag=
ment (mssstream-&gt;manifest_stream, buffer);</pre><pre>++=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gst_mss_stream_fragment_parse (mssstream-&gt;manifest_strea=
m, buffer);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_buffer_unref (bu=
ffer);</pre><pre> +=C2=A0=C2=A0=C2=A0 }</pre><pre> +=C2=A0 }</pre><pre> +</=
pre><pre>-+=C2=A0 return GST_ADAPTIVE_DEMUX_CLASS (parent_class)-&gt;data_r=
eceived (demux, stream,</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buffer);=
</pre><pre>++=C2=A0 return GST_ADAPTIVE_DEMUX_CLASS (parent_class)-&gt;data=
_received (demux, stream);</pre><pre> +}</pre><pre> +</pre><pre> +static gb=
oolean</pre><pre>@@ -142,17 +136,17 @@ index 12fb40497..120d9c22b 100644</p=
re><pre> +}</pre><pre> diff --git a/ext/smoothstreaming/gstmssfragmentparse=
r.c b/ext/smoothstreaming/gstmssfragmentparser.c</pre><pre> new file mode 1=
00644</pre><pre>-index 000000000..b554d4f31</pre><pre>+index 0000000..01c3b=
15</pre><pre> --- /dev/null</pre><pre> +++ b/ext/smoothstreaming/gstmssfrag=
mentparser.c</pre><pre>-@@ -0,0 +1,266 @@</pre><pre>+@@ -0,0 +1,255 @@</pre=
><pre> +/*</pre><pre> + * Microsoft Smooth-Streaming fragment parsing libra=
ry</pre><pre> + *</pre><pre> + * gstmssfragmentparser.h</pre><pre> + *</pre=
><pre>-+ * Copyright (C) 2016 Igalia S.L</pre><pre>-+ * Copyright (C) 2016 =
Metrological</pre><pre>++ * Copyright (C) 2015 Igalia S.L</pre><pre>++ * Co=
pyright (C) 2015 Metrological</pre><pre> + *=C2=A0=C2=A0 Author: Philippe N=
ormand <a href=3D"mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a></pr=
e><pre> + *</pre><pre> + * This library is free software; you can redistrib=
ute it and/or</pre><pre>@@ -333,12 +327,8 @@ index 000000000..b554d4f31</pr=
e><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D gs=
t_byte_reader_get_uint32_be_unchecked (&amp;reader);</pre><pre> +=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fourcc =3D gst_byte_reader_ge=
t_uint32_le_unchecked (&amp;reader);</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fourcc =3D=3D GST_MSS_FRAGMENT_FOURCC_TR=
UN) {</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 GST_TRACE (&quot;trun box found, size: %&quot; G_GUINT32_FORMAT, =
size);</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!gst_byte_reader_skip (&amp;reader, size - 8)) {</pre><pre=
>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GST_WARNING (&quot;Failed to skip trun box, enough data?&quot;);</pr=
e><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 error =3D TRUE;</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto beach;</pre><pre>-+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre=
>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_b=
yte_reader_skip_unchecked (&amp;reader, size - 8);</pre><pre>++=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_TRACE (&quot;tru=
n box found, size: %u&quot;, size);</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>@@ -354,=
11 +344,7 @@ index 000000000..b554d4f31</pre><pre> +=C2=A0 =C2=A0=C2=A0}</p=
re><pre> +</pre><pre> +=C2=A0=C2=A0=C2=A0 GST_TRACE (&quot;box size: %&quot=
; G_GUINT32_FORMAT, size);</pre><pre>-+=C2=A0=C2=A0=C2=A0 if (!gst_byte_rea=
der_get_uint32_le (&amp;reader, &amp;fourcc)) {</pre><pre>-+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GST_WARNING (&quot;Failed to get fourcc, enough data?&quot;=
);</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error =3D TRUE;</pre><pre>-+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</pre><pre>-+=C2=A0=C2=A0=C2=A0 }</pre=
><pre>++=C2=A0=C2=A0=C2=A0 fourcc =3D gst_byte_reader_get_uint32_le_uncheck=
ed (&amp;reader);</pre><pre> +</pre><pre> +=C2=A0=C2=A0=C2=A0 if (fourcc =
=3D=3D GST_MSS_FRAGMENT_FOURCC_MDAT) {</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GST_LOG (&quot;mdat box found<a href=3D"mailto:);@@-367,8+353,7@@ind=
ex000000000..b554d4f31+%7d++if(fourcc!=3DGST_MSS_FRAGMENT_FOURCC_UUID)%7b-+=
GST_ERROR(">&quot;);<o:p></o:p></a></pre><pre><span class=3DMsoHyperlink><a=
 href=3D"mailto:);@@-367,8+353,7@@index000000000..b554d4f31+%7d++if(fourcc!=
=3DGST_MSS_FRAGMENT_FOURCC_UUID)%7b-+GST_ERROR(">@@ -367,8 +353,7 @@ index =
000000000..b554d4f31<o:p></o:p></a></span></pre><pre><span class=3DMsoHyper=
link><a href=3D"mailto:);@@-367,8+353,7@@index000000000..b554d4f31+%7d++if(=
fourcc!=3DGST_MSS_FRAGMENT_FOURCC_UUID)%7b-+GST_ERROR("> +=C2=A0=C2=A0=C2=
=A0 }<o:p></o:p></a></span></pre><pre><span class=3DMsoHyperlink><a href=3D=
"mailto:);@@-367,8+353,7@@index000000000..b554d4f31+%7d++if(fourcc!=3DGST_M=
SS_FRAGMENT_FOURCC_UUID)%7b-+GST_ERROR("> +<o:p></o:p></a></span></pre><pre=
><span class=3DMsoHyperlink><a href=3D"mailto:);@@-367,8+353,7@@index000000=
000..b554d4f31+%7d++if(fourcc!=3DGST_MSS_FRAGMENT_FOURCC_UUID)%7b-+GST_ERRO=
R("> +=C2=A0=C2=A0=C2=A0 if (fourcc !=3D GST_MSS_FRAGMENT_FOURCC_UUID) {<o:=
p></o:p></a></span></pre><pre><span class=3DMsoHyperlink><a href=3D"mailto:=
);@@-367,8+353,7@@index000000000..b554d4f31+%7d++if(fourcc!=3DGST_MSS_FRAGM=
ENT_FOURCC_UUID)%7b-+GST_ERROR(">-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_ERROR=
 (&quot;</a></span>invalid UUID fourcc: %&quot; GST_FOURCC_FORMAT,</pre><pr=
e>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_FOURCC_ARGS =
(fourcc));</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_ERROR (&quot;inva=
lid UUID fourcc&quot;);</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error =
=3D TRUE;</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</pre><pre> +=C2=
=A0=C2=A0=C2=A0 }</pre><pre>@@ -403,8 +388,6 @@ index 000000000..b554d4f31<=
/pre><pre> +=C2=A0=C2=A0=C2=A0 }</pre><pre> +=C2=A0 }</pre><pre> +</pre><pr=
e>-+beach:</pre><pre>-+</pre><pre> +=C2=A0 if (!error)</pre><pre> +=C2=A0=
=C2=A0=C2=A0 parser-&gt;status =3D GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED;=
</pre><pre> +</pre><pre>@@ -414,7 +397,7 @@ index 000000000..b554d4f31</pre=
><pre> +}</pre><pre> diff --git a/ext/smoothstreaming/gstmssfragmentparser.=
h b/ext/smoothstreaming/gstmssfragmentparser.h</pre><pre> new file mode 100=
644</pre><pre>-index 000000000..cf4711865</pre><pre>+index 0000000..6626358=
</pre><pre> --- /dev/null</pre><pre> +++ b/ext/smoothstreaming/gstmssfragme=
ntparser.h</pre><pre> @@ -0,0 +1,84 @@</pre><pre>@@ -423,8 +406,8 @@ index =
000000000..cf4711865</pre><pre> + *</pre><pre> + * gstmssfragmentparser.h</=
pre><pre> + *</pre><pre>-+ * Copyright (C) 2016 Igalia S.L</pre><pre>-+ * C=
opyright (C) 2016 Metrological</pre><pre>++ * Copyright (C) 2015 Igalia S.L=
</pre><pre>++ * Copyright (C) 2015 Metrological</pre><pre> + *=C2=A0=C2=A0 =
Author: Philippe Normand <a href=3D"mailto:philn@igalia.com">&lt;philn@igal=
ia.com&gt;</a></pre><pre> + *</pre><pre> + * This library is free software;=
 you can redistribute it and/or</pre><pre>@@ -503,14 +486,14 @@ index 00000=
0000..cf4711865</pre><pre> +</pre><pre> +#endif /* __GST_MSS_FRAGMENT_PARSE=
R_H__ */</pre><pre> diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext=
/smoothstreaming/gstmssmanifest.c</pre><pre>-index 144bbb42d..e1031ba55 100=
644</pre><pre>+index 1b72e8d..d50a51a 100644</pre><pre> --- a/ext/smoothstr=
eaming/gstmssmanifest.c</pre><pre> +++ b/ext/smoothstreaming/gstmssmanifest=
.c</pre><pre> @@ -1,5 +1,7 @@</pre><pre>=C2=A0 /* GStreamer</pre><pre>=C2=
=A0=C2=A0 * Copyright (C) 2012 Smart TV Alliance</pre><pre>-+ * Copyright (=
C) 2016 Igalia S.L</pre><pre>-+ * Copyright (C) 2016 Metrological</pre><pre=
>++ * Copyright (C) 2015 Igalia S.L</pre><pre>++ * Copyright (C) 2015 Metro=
logical</pre><pre>=C2=A0=C2=A0 *=C2=A0 Author: Thiago Sousa Santos <a href=
=3D"mailto:thiago.sousa.santos@collabora.com">&lt;thiago.sousa.santos@colla=
bora.com&gt;</a>, Collabora Ltd.</pre><pre>=C2=A0=C2=A0 *</pre><pre>=C2=A0=
=C2=A0 * gstmssmanifest.c:</pre><pre>@@ -522,12 +505,12 @@ index 144bbb42d.=
.e1031ba55 100644</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0GST_DEBUG_CATEGOR=
Y_EXTERN (mssdemux_debug);</pre><pre>=C2=A0 #define GST_CAT_DEFAULT mssdemu=
x_debug</pre><pre>-@@ -74,12 +77,17 @@ struct _GstMssStream</pre><pre>+@@ -=
73,12 +76,17 @@ struct _GstMssStream</pre><pre>=C2=A0=C2=A0=C2=A0 gboolean =
active;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* if the stream is currently being used */</pre><pre>=C2=A0=
=C2=A0=C2=A0 gint selectedQualityIndex;</pre><pre>=C2=A0 </pre><pre>=C2=A0+=
=C2=A0 gboolean has_live_fragments;</pre><pre>-+=C2=A0 GstAdapter *live_ada=
pter;</pre><pre>++=C2=A0 GQueue live_fragments;</pre><pre> +</pre><pre>=C2=
=A0=C2=A0=C2=A0 GList *fragments;</pre><pre>=C2=A0=C2=A0=C2=A0 GList *quali=
ties;</pre><pre>@@ -540,15 +523,15 @@ index 144bbb42d..e1031ba55 100644</pr=
e><pre>=C2=A0=C2=A0=C2=A0 guint fragment_repetition_index;</pre><pre>=C2=A0=
=C2=A0=C2=A0 GList *current_fragment;</pre><pre>=C2=A0=C2=A0=C2=A0 GList *c=
urrent_quality;</pre><pre>-@@ -96,6 +104,7 @@ struct _GstMssManifest</pre><=
pre>+@@ -94,6 +102,7 @@ struct _GstMssManifest</pre><pre>+=C2=A0=C2=A0 xmlN=
odePtr xmlrootnode;</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0gbo=
olean is_live;</pre><pre>-=C2=A0=C2=A0 gint64 dvr_window;</pre><pre> +=C2=
=A0 guint64 look_ahead_fragment_count;</pre><pre>=C2=A0 </pre><pre>=C2=A0=
=C2=A0=C2=A0=C2=A0GString *protection_system_id;</pre><pre>=C2=A0=C2=A0=C2=
=A0 gchar *protection_data;</pre><pre>-@@ -235,7 +244,8 @@ compare_bitrate =
(GstMssStreamQuality * a, GstMssStreamQuality * b)</pre><pre>+@@ -233,7 +24=
2,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)</=
pre><pre>=C2=A0 }</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0static void</pre>=
<pre>@@ -558,7 +541,7 @@ index 144bbb42d..e1031ba55 100644</pre><pre>=C2=A0=
 {</pre><pre>=C2=A0=C2=A0=C2=A0 xmlNodePtr iter;</pre><pre>=C2=A0=C2=A0=C2=
=A0 GstMssFragmentListBuilder builder;</pre><pre>-@@ -248,9 +258,21 @@ _gst=
_mss_stream_init (GstMssStream * stream, xmlNodePtr node)</pre><pre>+@@ -24=
6,9 +256,18 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node=
)</pre><pre>=C2=A0=C2=A0=C2=A0 stream-&gt;url =3D (gchar *) xmlGetProp (nod=
e, (xmlChar *) MSS_PROP_URL);</pre><pre>=C2=A0=C2=A0=C2=A0 stream-&gt;lang =
=3D (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_LANGUAGE);</pre><pre>=
=C2=A0 </pre><pre>@@ -567,9 +550,6 @@ index 144bbb42d..e1031ba55 100644</pr=
e><pre> +=C2=A0=C2=A0 * playlist can be built incrementally from the first =
fragment</pre><pre> +=C2=A0=C2=A0 * of the manifest.</pre><pre> +=C2=A0=C2=
=A0 */</pre><pre>-+</pre><pre>-+=C2=A0 GST_DEBUG (&quot;Live stream: %s, lo=
ok-ahead fragments: %&quot; G_GUINT64_FORMAT,</pre><pre>-+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 manifest-&gt;is_live ? &quot;yes&quot; : &quot;no&quot;, ma=
nifest-&gt;look_ahead_fragment_count);</pre><pre> +=C2=A0 stream-&gt;has_li=
ve_fragments =3D manifest-&gt;is_live</pre><pre> +=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0&amp;&amp; manifest-&gt;look_ahead_fragment_count;</pre><pre> +</pre>=
<pre>@@ -581,13 +561,15 @@ index 144bbb42d..e1031ba55 100644</pre><pre>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (node_has_type (iter, MSS_NODE_STREAM=
_QUALITY)) {</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GstMssStr=
eamQuality *quality =3D gst_mss_stream_quality_new (iter);</pre><pre>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream-&gt;qualities =3D g_list_prepen=
d (stream-&gt;qualities, quality);</pre><pre>-@@ -259,17 +281,24 @@ _gst_ms=
s_stream_init (GstMssStream * stream, xmlNodePtr node)</pre><pre>+@@ -257,1=
7 +276,26 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)<=
/pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>=C2=A0=C2=A0=C2=A0 }</=
pre><pre>=C2=A0 </pre><pre>=C2=A0-=C2=A0 stream-&gt;fragments =3D g_list_re=
verse (builder.fragments);</pre><pre> +=C2=A0 if (stream-&gt;has_live_fragm=
ents) {</pre><pre>-+=C2=A0=C2=A0=C2=A0 stream-&gt;live_adapter =3D gst_adap=
ter_new ();</pre><pre>++=C2=A0=C2=A0=C2=A0 g_queue_init (&amp;stream-&gt;li=
ve_fragments);</pre><pre>++=C2=A0=C2=A0=C2=A0 g_queue_push_tail (&amp;strea=
m-&gt;live_fragments, builder.fragments-&gt;data);</pre><pre>++=C2=A0=C2=A0=
=C2=A0 stream-&gt;current_fragment =3D g_queue_peek_head_link (&amp;stream-=
&gt;live_fragments);</pre><pre> +=C2=A0 }</pre><pre> +</pre><pre> +=C2=A0 i=
f (builder.fragments) {</pre><pre>@@ -609,7 +591,7 @@ index 144bbb42d..e103=
1ba55 100644</pre><pre>=C2=A0 }</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0</p=
re><pre>-@@ -315,6 +344,7 @@ gst_mss_manifest_new (GstBuffer * data)</pre><=
pre>+@@ -313,6 +341,7 @@ gst_mss_manifest_new (GstBuffer * data)</pre><pre>=
=C2=A0=C2=A0=C2=A0 xmlNodePtr nodeiter;</pre><pre>=C2=A0=C2=A0=C2=A0 gchar =
*live_str;</pre><pre>=C2=A0=C2=A0=C2=A0 GstMapInfo mapinfo;</pre><pre>@@ -6=
17,33 +599,21 @@ index 144bbb42d..e1031ba55 100644</pre><pre>=C2=A0 </pre><=
pre>=C2=A0=C2=A0=C2=A0=C2=A0if (!gst_buffer_map (data, &amp;mapinfo, GST_MA=
P_READ)) {</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;</pre><pre>=
-@@ -335,6 +365,7 @@ gst_mss_manifest_new (GstBuffer * data)</pre><pre>-=C2=
=A0=C2=A0 /* the entire file is always available for non-live streams */</p=
re><pre>-=C2=A0=C2=A0 if (!manifest-&gt;is_live) {</pre><pre>-=C2=A0=C2=A0=
=C2=A0=C2=A0 manifest-&gt;dvr_window =3D 0;</pre><pre>-+=C2=A0=C2=A0=C2=A0 =
manifest-&gt;look_ahead_fragment_count =3D 0;</pre><pre>-=C2=A0=C2=A0 } els=
e {</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=A0 /* if 0, or non-existent, the lengt=
h is infinite */</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=A0 gchar *dvr_window_str =
=3D (gchar *) xmlGetProp (root,</pre><pre>-@@ -346,6 +377,17 @@ gst_mss_man=
ifest_new (GstBuffer * data)</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 manifest-&gt;dvr_window =3D 0;</pre><pre>-=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>-+<=
/pre><pre>-+=C2=A0=C2=A0=C2=A0 look_ahead_fragment_count_str =3D</pre><pre>=
-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (gchar *) xmlGetProp (root, (x=
mlChar *) &quot;LookAheadFragmentCount&quot;);</pre><pre>-+=C2=A0=C2=A0=C2=
=A0 if (look_ahead_fragment_count_str) {</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 manifest-&gt;look_ahead_fragment_count =3D</pre><pre>-+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_ascii_strtoull (look_ahead_=
fragment_count_str, NULL, 10);</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x=
mlFree (look_ahead_fragment_count_str);</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (manifest-&gt;look_ahead_fragment_count &lt;=3D 0) {</pre><pre=
>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 manifest-&gt;look_ahead_fragm=
ent_count =3D 0;</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>-+=
=C2=A0=C2=A0=C2=A0 }</pre><pre>+@@ -330,13 +359,21 @@ gst_mss_manifest_new =
(GstBuffer * data)</pre><pre>+=C2=A0=C2=A0=C2=A0 =C2=A0xmlFree (live_str);<=
/pre><pre>=C2=A0=C2=A0=C2=A0 }</pre><pre>=C2=A0 </pre><pre>++=C2=A0 look_ah=
ead_fragment_count_str =3D</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (gcha=
r *) xmlGetProp (root, (xmlChar *) &quot;LookAheadFragmentCount&quot;);</pr=
e><pre>++=C2=A0 if (look_ahead_fragment_count_str) {</pre><pre>++=C2=A0=C2=
=A0=C2=A0 manifest-&gt;look_ahead_fragment_count =3D</pre><pre>++=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_ascii_strtoull (look_ahead_fragment_cou=
nt_str, NULL, 10);</pre><pre>++=C2=A0=C2=A0=C2=A0 xmlFree (look_ahead_fragm=
ent_count_str);</pre><pre>++=C2=A0 }</pre><pre>++</pre><pre>=C2=A0=C2=A0=C2=
=A0 for (nodeiter =3D root-&gt;children; nodeiter; nodeiter =3D nodeiter-&g=
t;next) {</pre><pre>-@@ -354,7 +396,7 @@ gst_mss_manifest_new (GstBuffer * =
data)</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 if (nodeiter-&gt;type =3D=3D XML_=
ELEMENT_NODE</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &a=
mp;&amp; (strcmp ((const char *) nodeiter-&gt;name, &quot;StreamIndex&quot;=
) =3D=3D 0)) {</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GstMssS=
tream *stream =3D g_new0 (GstMssStream, 1);</pre><pre>=C2=A0 </pre><pre>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0manifest-&gt;streams =3D g_sli=
st_append (manifest-&gt;streams, stream);</pre><pre>@@ -652,39 +622,56 @@ i=
ndex 144bbb42d..e1031ba55 100644</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (nodeit=
er-&gt;type =3D=3D XML_ELEMENT_NODE</pre><pre>-@@ -371,6 +413,11 @@ gst_mss=
_manifest_new (GstBuffer * data)</pre><pre>+@@ -353,13 +390,19 @@ gst_mss_m=
anifest_new (GstBuffer * data)</pre><pre>=C2=A0 static void</pre><pre>=C2=
=A0 gst_mss_stream_free (GstMssStream * stream)</pre><pre>=C2=A0 {</pre><pr=
e>-+=C2=A0 if (stream-&gt;live_adapter) {</pre><pre>-+=C2=A0=C2=A0=C2=A0 gs=
t_adapter_clear (stream-&gt;live_adapter);</pre><pre>-+=C2=A0=C2=A0=C2=A0 g=
_object_unref (stream-&gt;live_adapter);</pre><pre>+-=C2=A0 g_list_free_ful=
l (stream-&gt;fragments, g_free);</pre><pre>++=C2=A0 if (stream-&gt;has_liv=
e_fragments) {</pre><pre>++=C2=A0=C2=A0=C2=A0 g_queue_foreach (&amp;stream-=
&gt;live_fragments, (GFunc) g_free, NULL);</pre><pre>++=C2=A0=C2=A0=C2=A0 g=
_queue_clear (&amp;stream-&gt;live_fragments);</pre><pre>++=C2=A0 } else {<=
/pre><pre>++=C2=A0=C2=A0=C2=A0 g_list_free_full (stream-&gt;fragments, g_fr=
ee);</pre><pre> +=C2=A0 }</pre><pre>-+</pre><pre>-=C2=A0=C2=A0 g_list_free_=
full (stream-&gt;fragments, g_free);</pre><pre>=C2=A0=C2=A0=C2=A0 g_list_fr=
ee_full (stream-&gt;qualities,</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (GDestroyNotify) gst_mss_stream_quality_free);</pre><pre>-@@ -379=
,6 +426,7 @@ gst_mss_stream_free (GstMssStream * stream)</pre><pre>+=C2=A0=
=C2=A0 xmlFree (stream-&gt;url);</pre><pre>+=C2=A0=C2=A0 xmlFree (stream-&g=
t;lang);</pre><pre>=C2=A0=C2=A0=C2=A0 g_regex_unref (stream-&gt;regex_posit=
ion);</pre><pre>=C2=A0=C2=A0=C2=A0 g_regex_unref (stream-&gt;regex_bitrate)=
;</pre><pre>-=C2=A0=C2=A0 g_free (stream);</pre><pre> +=C2=A0 gst_mss_fragm=
ent_parser_clear (&amp;stream-&gt;fragment_parser);</pre><pre>+=C2=A0=C2=A0=
 g_free (stream);</pre><pre>=C2=A0 }</pre><pre>=C2=A0 </pre><pre>- void</pr=
e><pre>-@@ -1079,6 +1127,9 @@ GstFlowReturn</pre><pre>+@@ -984,7 +1027,12 @=
@ gst_mss_stream_get_fragment_gst_timestamp (GstMssStream * stream)</pre><p=
re>+=C2=A0=C2=A0 g_return_val_if_fail (stream-&gt;active, GST_CLOCK_TIME_NO=
NE);</pre><pre>+ </pre><pre>+=C2=A0=C2=A0 if (!stream-&gt;current_fragment)=
 {</pre><pre>+-=C2=A0=C2=A0=C2=A0 GList *last =3D g_list_last (stream-&gt;f=
ragments);</pre><pre>++=C2=A0=C2=A0=C2=A0 GList *last;</pre><pre>++</pre><p=
re>++=C2=A0=C2=A0=C2=A0 if (stream-&gt;has_live_fragments)</pre><pre>++=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 last =3D g_queue_peek_tail_link (&amp;stream-&g=
t;live_fragments);</pre><pre>++=C2=A0=C2=A0=C2=A0 else</pre><pre>++=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 last =3D g_list_last (stream-&gt;fragments);</pre>=
<pre>+=C2=A0=C2=A0=C2=A0=C2=A0 if (last =3D=3D NULL)</pre><pre>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return GST_CLOCK_TIME_NONE;</pre><pre>+ </pre><=
pre>+@@ -1037,21 +1085,54 @@ GstFlowReturn</pre><pre>=C2=A0 gst_mss_stream_=
advance_fragment (GstMssStream * stream)</pre><pre>=C2=A0 {</pre><pre>=C2=
=A0=C2=A0=C2=A0 GstMssStreamFragment *fragment;</pre><pre>++=C2=A0 GstMssSt=
reamFragment *prev_fragment;</pre><pre> +=C2=A0 const gchar *stream_type_na=
me =3D</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_stream_type_name =
(gst_mss_stream_get_type (stream));</pre><pre> +</pre><pre>=C2=A0=C2=A0=C2=
=A0 g_return_val_if_fail (stream-&gt;active, GST_FLOW_ERROR);</pre><pre>=C2=
=A0 </pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0if (stream-&gt;current_fragment =3D=
=3D NULL)</pre><pre>-@@ -1086,14 +1137,20 @@ gst_mss_stream_advance_fragmen=
t (GstMssStream * stream)</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 return GST_FL=
OW_EOS;</pre><pre>=C2=A0 </pre><pre>-=C2=A0=C2=A0 fragment =3D stream-&gt;c=
urrent_fragment-&gt;data;</pre><pre>+-=C2=A0 fragment =3D stream-&gt;curren=
t_fragment-&gt;data;</pre><pre>++=C2=A0 prev_fragment =3D fragment =3D stre=
am-&gt;current_fragment-&gt;data;</pre><pre>=C2=A0=C2=A0=C2=A0 stream-&gt;f=
ragment_repetition_index++;</pre><pre> -=C2=A0 if (stream-&gt;fragment_repe=
tition_index &lt; fragment-&gt;repetitions) {</pre><pre> -=C2=A0=C2=A0=C2=
=A0 return GST_FLOW_OK;</pre><pre>@@ -693,10 +680,34 @@ index 144bbb42d..e1=
031ba55 100644</pre><pre> +=C2=A0=C2=A0=C2=A0 goto beach;</pre><pre>=C2=A0 =
</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0stream-&gt;fragment_repetition_index =3D=
 0;</pre><pre>-=C2=A0=C2=A0 stream-&gt;current_fragment =3D g_list_next (st=
ream-&gt;current_fragment);</pre><pre>+-=C2=A0 stream-&gt;current_fragment =
=3D g_list_next (stream-&gt;current_fragment);</pre><pre>++</pre><pre>++=C2=
=A0 if (stream-&gt;has_live_fragments)</pre><pre>++=C2=A0=C2=A0=C2=A0 strea=
m-&gt;current_fragment =3D g_queue_pop_head_link (&amp;stream-&gt;live_frag=
ments);</pre><pre>++=C2=A0 else</pre><pre>++=C2=A0=C2=A0=C2=A0 stream-&gt;c=
urrent_fragment =3D g_list_next (stream-&gt;current_fragment);</pre><pre>++=
</pre><pre>++=C2=A0 if (stream-&gt;current_fragment !=3D NULL) {</pre><pre>=
++=C2=A0=C2=A0=C2=A0 fragment =3D stream-&gt;current_fragment-&gt;data;</pr=
e><pre>++=C2=A0=C2=A0=C2=A0 if (fragment-&gt;time &lt;=3D prev_fragment-&gt=
;time) {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (fragment-&gt;tim=
e &lt;=3D prev_fragment-&gt;time) {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (stream-&gt;has_live_fragments)</pre><pre>++=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream-&gt;current_fragment =3D<=
/pre><pre>++=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0g_queue_pop_head_link (&amp;stream-&gt;live_fragments);</=
pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else</pre><pre>++=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream-&gt;current_frag=
ment =3D g_list_next (stream-&gt;current_fragment);</pre><pre>++=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (stream-&gt;current_fragment =3D=3D NU=
LL)</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 brea=
k;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fragment =3D stre=
am-&gt;current_fragment-&gt;data;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }</pre><pre>++=C2=A0=C2=A0=C2=A0 }</pre><pre>++=C2=A0 }</pre><pre> +</p=
re><pre> +=C2=A0 GST_DEBUG (&quot;Advanced to fragment #%d on %s stream&quo=
t;, fragment-&gt;number,</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream_=
type_name);</pre><pre>++=C2=A0 if (stream-&gt;has_live_fragments)</pre><pre=
>++=C2=A0=C2=A0=C2=A0 GST_LOG (&quot;%u fragments left in the %s stream que=
ue&quot;,</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_queue_ge=
t_length (&amp;stream-&gt;live_fragments), stream_type_name);</pre><pre>=C2=
=A0=C2=A0=C2=A0 if (stream-&gt;current_fragment =3D=3D NULL)</pre><pre>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return GST_FLOW_EOS;</pre><pre> +</pre><pre>@@ =
-706,57 +717,22 @@ index 144bbb42d..e1031ba55 100644</pre><pre>=C2=A0=C2=A0=
=C2=A0 return GST_FLOW_OK;</pre><pre>=C2=A0 }</pre><pre>=C2=A0 </pre><pre>-=
@@ -1173,6 +1230,11 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean=
 forward,</pre><pre>-=C2=A0=C2=A0 GST_DEBUG (&quot;Stream %s seeking to %&q=
uot; G_GUINT64_FORMAT, stream-&gt;url, time);</pre><pre>-=C2=A0=C2=A0 for (=
iter =3D stream-&gt;fragments; iter; iter =3D g_list_next (iter)) {</pre><p=
re>-=C2=A0=C2=A0=C2=A0=C2=A0 fragment =3D iter-&gt;data;</pre><pre>-+=C2=A0=
=C2=A0=C2=A0 if (stream-&gt;has_live_fragments) {</pre><pre>-+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (fragment-&gt;time + fragment-&gt;repetitions * fragm=
ent-&gt;duration &gt; time)</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 stream-&gt;current_fragment =3D iter;</pre><pre>-+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;</pre><pre>-+=C2=A0=C2=A0=C2=A0 }</pre><pre>-=C2=A0=
=C2=A0=C2=A0=C2=A0 if (fragment-&gt;time + fragment-&gt;repetitions * fragm=
ent-&gt;duration &gt; time) {</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 stream-&gt;current_fragment =3D iter;</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 stream-&gt;fragment_repetition_index =3D</pre><pre>-@@ -125=
6,9 +1318,14 @@ static void</pre><pre>- gst_mss_stream_reload_fragments (Gs=
tMssStream * stream, xmlNodePtr streamIndex)</pre><pre>- {</pre><pre>-=C2=
=A0=C2=A0 xmlNodePtr iter;</pre><pre>--=C2=A0 guint64 current_gst_time =3D =
gst_mss_stream_get_fragment_gst_timestamp (stream);</pre><pre>-+=C2=A0 guin=
t64 current_gst_time;</pre><pre>-=C2=A0=C2=A0 GstMssFragmentListBuilder bui=
lder;</pre><pre>+@@ -1125,6 +1206,10 @@ gst_mss_stream_seek (GstMssStream *=
 stream, gboolean forward,</pre><pre>+=C2=A0=C2=A0 guint64 timescale;</pre>=
<pre>+=C2=A0=C2=A0 GstMssStreamFragment *fragment =3D NULL;</pre><pre>=C2=
=A0 </pre><pre>++=C2=A0 // FIXME: Seek support for live scenario using DVR =
window.</pre><pre> +=C2=A0 if (stream-&gt;has_live_fragments)</pre><pre> +=
=C2=A0=C2=A0=C2=A0 return;</pre><pre> +</pre><pre>-+=C2=A0 current_gst_time=
 =3D gst_mss_stream_get_fragment_gst_timestamp (stream);</pre><pre>-+</pre>=
<pre>-=C2=A0=C2=A0 gst_mss_fragment_list_builder_init (&amp;builder);</pre>=
<pre>+=C2=A0=C2=A0 timescale =3D gst_mss_stream_get_timescale (stream);</pr=
e><pre>+=C2=A0=C2=A0 time =3D gst_util_uint64_scale_round (time, timescale,=
 GST_SECOND);</pre><pre>=C2=A0 </pre><pre>-=C2=A0=C2=A0 GST_DEBUG (&quot;Cu=
rrent position: %&quot; GST_TIME_FORMAT,</pre><pre>-@@ -1514,3 +1581,74 @@ =
gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * s=
tart,</pre><pre>- </pre><pre>-=C2=A0=C2=A0 return ret;</pre><pre>+@@ -1406,=
3 +1491,47 @@ gst_mss_stream_get_lang (GstMssStream * stream)</pre><pre>+ {=
</pre><pre>+=C2=A0=C2=A0 return stream-&gt;lang;</pre><pre>=C2=A0 }</pre><p=
re> +</pre><pre>-+void</pre><pre>-+gst_mss_manifest_live_adapter_push (GstM=
ssStream * stream, GstBuffer * buffer)</pre><pre>-+{</pre><pre>-+=C2=A0 gst=
_adapter_push (stream-&gt;live_adapter, buffer);</pre><pre>-+}</pre><pre>-+=
</pre><pre>-+gsize</pre><pre>-+gst_mss_manifest_live_adapter_available (Gst=
MssStream * stream)</pre><pre>-+{</pre><pre>-+=C2=A0 return gst_adapter_ava=
ilable (stream-&gt;live_adapter);</pre><pre>-+}</pre><pre>-+</pre><pre>-+Gs=
tBuffer *</pre><pre>-+gst_mss_manifest_live_adapter_take_buffer (GstMssStre=
am * stream, gsize nbytes)</pre><pre>-+{</pre><pre>-+=C2=A0 return gst_adap=
ter_take_buffer (stream-&gt;live_adapter, nbytes);</pre><pre>-+}</pre><pre>=
-+</pre><pre> +gboolean</pre><pre> +gst_mss_stream_fragment_parsing_needed =
(GstMssStream * stream)</pre><pre> +{</pre><pre>@@ -764,11 +740,11 @@ index=
 144bbb42d..e1031ba55 100644</pre><pre> +}</pre><pre> +</pre><pre> +void</p=
re><pre>-+gst_mss_stream_parse_fragment (GstMssStream * stream, GstBuffer *=
 buffer)</pre><pre>++gst_mss_stream_fragment_parse (GstMssStream * stream, =
GstBuffer * buffer)</pre><pre> +{</pre><pre> +=C2=A0 GstMssStreamFragment *=
current_fragment =3D NULL;</pre><pre>-+=C2=A0 const gchar *stream_type_name=
;</pre><pre>-+=C2=A0 guint8 index;</pre><pre>++=C2=A0 const gchar *stream_t=
ype_name =3D</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_stream_type=
_name (gst_mss_stream_get_type (stream));</pre><pre> +</pre><pre> +=C2=A0 i=
f (!stream-&gt;has_live_fragments)</pre><pre> +=C2=A0=C2=A0=C2=A0 return;</=
pre><pre>@@ -780,29 +756,20 @@ index 144bbb42d..e1031ba55 100644</pre><pre>=
 +=C2=A0 current_fragment-&gt;time =3D stream-&gt;fragment_parser.tfxd.time=
;</pre><pre> +=C2=A0 current_fragment-&gt;duration =3D stream-&gt;fragment_=
parser.tfxd.duration;</pre><pre> +</pre><pre>-+=C2=A0 stream_type_name =3D<=
/pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_stream_type_name (gst_ms=
s_stream_get_type (stream));</pre><pre>-+</pre><pre>-+=C2=A0 for (index =3D=
 0; index &lt; stream-&gt;fragment_parser.tfrf.entries_count; index++) {</p=
re><pre>-+=C2=A0=C2=A0=C2=A0 GList *l =3D g_list_last (stream-&gt;fragments=
);</pre><pre>-+=C2=A0=C2=A0=C2=A0 GstMssStreamFragment *last;</pre><pre>++=
=C2=A0 for (guint8 index =3D 0; index &lt; stream-&gt;fragment_parser.tfrf.=
entries_count;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index++) {</pre><=
pre>++=C2=A0=C2=A0=C2=A0 GstMssStreamFragment *last =3D g_queue_peek_tail (=
&amp;stream-&gt;live_fragments);</pre><pre> +=C2=A0=C2=A0=C2=A0 GstMssStrea=
mFragment *fragment;</pre><pre> +</pre><pre>-+=C2=A0=C2=A0=C2=A0 if (l =3D=
=3D NULL)</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</pre><pre>-+</p=
re><pre>-+=C2=A0=C2=A0=C2=A0 last =3D (GstMssStreamFragment *) l-&gt;data;<=
/pre><pre>-+</pre><pre>-+=C2=A0=C2=A0=C2=A0 if (last-&gt;time =3D=3D stream=
-&gt;fragment_parser.tfrf.entries[index].time)</pre><pre>-+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 continue;</pre><pre>-+</pre><pre>++=C2=A0=C2=A0=C2=A0 if (l=
ast =3D=3D NULL)</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;</pre><pre> +=C2=A0=C2=A0=C2=A0 fragment =3D g_new (GstMssStreamFragment=
, 1);</pre><pre> +=C2=A0=C2=A0=C2=A0 fragment-&gt;number =3D last-&gt;numbe=
r + 1;</pre><pre> +=C2=A0=C2=A0=C2=A0 fragment-&gt;repetitions =3D 1;</pre>=
<pre> +=C2=A0=C2=A0=C2=A0 fragment-&gt;time =3D stream-&gt;fragment_parser.=
tfrf.entries[index].time;</pre><pre> + =C2=A0=C2=A0=C2=A0fragment-&gt;durat=
ion =3D stream-&gt;fragment_parser.tfrf.entries[index].duration;</pre><pre>=
 +</pre><pre>-+=C2=A0=C2=A0=C2=A0 stream-&gt;fragments =3D g_list_append (s=
tream-&gt;fragments, fragment);</pre><pre>++=C2=A0=C2=A0=C2=A0 g_queue_push=
_tail (&amp;stream-&gt;live_fragments, fragment);</pre><pre> +=C2=A0=C2=A0=
=C2=A0 GST_LOG (&quot;Adding fragment number: %u to %s stream, time: %&quot=
; G_GUINT64_FORMAT</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &=
quot;, duration: %&quot; G_GUINT64_FORMAT &quot;, repetitions: %u&quot;,</p=
re><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fragment-&gt;number, s=
tream_type_name,</pre><pre>@@ -810,31 +777,20 @@ index 144bbb42d..e1031ba55=
 100644</pre><pre> +=C2=A0 }</pre><pre> +}</pre><pre> diff --git a/ext/smoo=
thstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h</pre><p=
re>-index 6b7b1f971..03b066ae5 100644</pre><pre>+index af7419c..039877f 100=
644</pre><pre> --- a/ext/smoothstreaming/gstmssmanifest.h</pre><pre> +++ b/=
ext/smoothstreaming/gstmssmanifest.h</pre><pre>-@@ -26,6 +26,7 @@</pre><pre=
>- #include &lt;glib.h&gt;</pre><pre>- #include &lt;gio/gio.h&gt;</pre><pre=
>- #include &lt;gst/gst.h&gt;</pre><pre>-+#include &lt;gst/base/gstadapter.=
h&gt;</pre><pre>- </pre><pre>- G_BEGIN_DECLS</pre><pre>- </pre><pre>-@@ -73=
,5 +74,11 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);=
</pre><pre>+@@ -72,5 +72,8 @@ const gchar * gst_mss_stream_get_lang (GstMss=
Stream * stream);</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0const gchar * gst=
_mss_stream_type_name (GstMssStreamType streamtype);</pre><pre>=C2=A0 </pre=
><pre>-+void gst_mss_manifest_live_adapter_push(GstMssStream * stream, GstB=
uffer * buffer);</pre><pre>-+gsize gst_mss_manifest_live_adapter_available(=
GstMssStream * stream);</pre><pre>-+GstBuffer * gst_mss_manifest_live_adapt=
er_take_buffer(GstMssStream * stream, gsize nbytes);</pre><pre> +gboolean g=
st_mss_stream_fragment_parsing_needed(GstMssStream * stream);</pre><pre>-+v=
oid gst_mss_stream_parse_fragment(GstMssStream * stream, GstBuffer * buffer=
);</pre><pre>++void gst_mss_stream_fragment_parse(GstMssStream * stream, Gs=
tBuffer * buffer);</pre><pre> +</pre><pre>=C2=A0 G_END_DECLS</pre><pre>=C2=
=A0 #endif /* __GST_MSS_MANIFEST_H__ */</pre><pre> diff --git a/gst-libs/gs=
t/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptive=
demux.c</pre><pre>-index 634e4f388..ddca726b6 100644</pre><pre>+index bf311=
d3..20bd839 100644</pre><pre> --- a/gst-libs/gst/adaptivedemux/gstadaptived=
emux.c</pre><pre> +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c</pre>=
<pre> @@ -291,6 +291,9 @@ gst_adaptive_demux_wait_until (GstClock * clock, =
GCond * cond, GMutex * mutex,</pre><pre>@@ -868,7 +824,7 @@ index 634e4f388=
..ddca726b6 100644</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 } else {</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* no streams */</pre><pre>-@@ -2125,6 +2133,13=
 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * dem=
ux,</pre><pre>+@@ -2113,6 +2121,13 @@ gst_adaptive_demux_stream_data_receiv=
ed_default (GstAdaptiveDemux * demux,</pre><pre>=C2=A0=C2=A0=C2=A0 return g=
st_adaptive_demux_stream_push_buffer (stream, buffer);</pre><pre>=C2=A0 }</=
pre><pre>=C2=A0 </pre><pre>@@ -882,25 +838,33 @@ index 634e4f388..ddca726b6=
 100644</pre><pre>=C2=A0 static GstFlowReturn</pre><pre>=C2=A0 _src_chain (=
GstPad * pad, GstObject * parent, GstBuffer * buffer)</pre><pre>=C2=A0 {</p=
re><pre>-@@ -3338,7 +3353,15 @@ gst_adaptive_demux_stream_download_loop (Gs=
tAdaptiveDemuxStream * stream)</pre><pre>+@@ -2209,7 +2224,7 @@ _src_chain =
(GstPad * pad, GstObject * parent, GstBuffer * buffer)</pre><pre>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream-&gt;download_chunk_start_time;</pre><pre=
>+=C2=A0=C2=A0 stream-&gt;download_total_bytes +=3D gst_buffer_get_size (bu=
ffer);</pre><pre>+ </pre><pre>+-=C2=A0 GST_DEBUG_OBJECT (stream-&gt;pad, &q=
uot;Received buffer of size %&quot; G_GSIZE_FORMAT,</pre><pre>++=C2=A0 GST_=
LOG_OBJECT (stream-&gt;pad, &quot;Received buffer of size %&quot; G_GSIZE_F=
ORMAT,</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_buffer_get_size =
(buffer));</pre><pre>+ </pre><pre>+=C2=A0=C2=A0 ret =3D klass-&gt;data_rece=
ived (demux, stream, buffer);</pre><pre>+@@ -3326,7 +3341,14 @@ gst_adaptiv=
e_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)</pre><pre>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_DEBUG_OBJECT (stream-&gt;pad=
, &quot;EOS, checking to stop download loop&quot;);</pre><pre>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* we push the EOS after releasing the objec=
t lock */</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gst_adap=
tive_demux_is_live (demux)) {</pre><pre> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream=
)) {</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GstAdaptiveDemu=
xClass *demux_class =3D</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_ADAPTIVE_DEMUX_GET_CLASS (demux);</pre><pre=
>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_ADAPTIVE_DEMU=
X_GET_CLASS (demux);</pre><pre> +</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* this might be a fragment download error, refresh the man=
ifest, just in case */</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!demux_class-&gt;requires_periodical_playlist_update (demux)) {</pr=
e><pre> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D gst=
_adaptive_demux_update_manifest (demux);</pre><pre> +=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 } else if (gst_adaptive_demux_stream_wait_manifest_up=
date (demux,</pre><pre>-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream)) {</pre><pre>++=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (gst_adaptive_demux_stream_wait=
_manifest_update (demux, stream)) {</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto end;</pre><pre>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_task_stop (stream-&gt;download_task);=
</pre><pre> diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h b/gs=
t-libs/gst/adaptivedemux/gstadaptivedemux.h</pre><pre>-index 780f4d93f..9a1=
a1b7d1 100644</pre><pre>+index 780f4d9..9a1a1b7 100644</pre><pre> --- a/gst=
-libs/gst/adaptivedemux/gstadaptivedemux.h</pre><pre> +++ b/gst-libs/gst/ad=
aptivedemux/gstadaptivedemux.h</pre><pre> @@ -459,6 +459,20 @@ struct _GstA=
daptiveDemuxClass</pre><pre>@@ -925,5 +889,5 @@ index 780f4d93f..9a1a1b7d1 =
100644</pre><pre>=C2=A0 </pre><pre>=C2=A0=C2=A0GType=C2=A0=C2=A0=C2=A0 gst_=
adaptive_demux_get_type (void);</pre><pre> -- </pre><pre>-2.11.0</pre><pre>=
+2.7.4</pre><pre> </pre><pre>diff --git a/meta/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-ge=
t_live_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad=
/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch</pre><pre>=
index 76d29e151b..c4639a2cda 100644</pre><pre>--- a/meta/recipes-multimedia=
/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptive=
demux-s-get_live_s.patch</pre><pre>+++ b/meta/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get=
_live_s.patch</pre><pre>@@ -1,7 +1,7 @@</pre><pre>-From e9178fa082116d4bf73=
3b184a8b6951112c17900 Mon Sep 17 00:00:00 2001</pre><pre>+From e8155c77d8dc=
af39ec564b85c4a56e64fce6de2b Mon Sep 17 00:00:00 2001</pre><pre> From: Matt=
hew Waters <a href=3D"mailto:matthew@centricular.com">&lt;matthew@centricul=
ar.com&gt;</a></pre><pre> Date: Thu, 10 Nov 2016 17:18:36 +1100</pre><pre>-=
Subject: [PATCH] smoothstreaming: implement adaptivedemux's</pre><pre>+Subj=
ect: [PATCH 1/2] smoothstreaming: implement adaptivedemux's</pre><pre>=C2=
=A0 get_live_seek_range()</pre><pre> </pre><pre>=C2=A0Allows seeking throug=
h the available fragments that are still available</pre><pre>@@ -10,40 +10,=
45 @@ manifest.</pre><pre> </pre><pre>=C2=A0<a href=3D"https://bugzilla.gno=
me.org/show_bug.cgi?id=3D774178">https://bugzilla.gnome.org/show_bug.cgi?id=
=3D774178</a></pre><pre> ---</pre><pre>-Upstream-Status: Backport</pre><pre=
>-Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.com">&lt;raj.khe=
m@gmail.com&gt;</a></pre><pre>-</pre><pre>- ext/smoothstreaming/gstmssdemux=
.c=C2=A0=C2=A0=C2=A0 | 13 ++++++</pre><pre>+ ext/smoothstreaming/gstmssdemu=
x.c=C2=A0=C2=A0=C2=A0 | 14 +++++-</pre><pre>=C2=A0 ext/smoothstreaming/gstm=
ssmanifest.c | 84 ++++++++++++++++++++++++++++++++++++</pre><pre>=C2=A0 ext=
/smoothstreaming/gstmssmanifest.h |=C2=A0 1 +</pre><pre>- 3 files changed, =
98 insertions(+)</pre><pre>+ 3 files changed, 98 insertions(+), 1 deletion(=
-)</pre><pre> </pre><pre>=C2=A0diff --git a/ext/smoothstreaming/gstmssdemux=
.c b/ext/smoothstreaming/gstmssdemux.c</pre><pre>-index 9d0aece2b..b66e1951=
4 100644</pre><pre>+index 1a122d4..26147fd 100644</pre><pre> --- a/ext/smoo=
thstreaming/gstmssdemux.c</pre><pre> +++ b/ext/smoothstreaming/gstmssdemux.=
c</pre><pre>-@@ -138,6 +138,8 @@ gst_mss_demux_get_manifest_update_interval=
 (GstAdaptiveDemux * demux);</pre><pre>- static GstFlowReturn</pre><pre>- g=
st_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,</pre><pre>-=C2=
=A0=C2=A0=C2=A0=C2=A0 GstBuffer * buffer);</pre><pre>+@@ -146,6 +146,8 @@ s=
tatic GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,<=
/pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 GstAdaptiveDemuxStream * stream, GstBuf=
fer * buffer);</pre><pre>+ static gboolean</pre><pre>+ gst_mss_demux_requir=
es_periodical_playlist_update (GstAdaptiveDemux * demux);</pre><pre> +stati=
c gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,</pr=
e><pre> +=C2=A0=C2=A0=C2=A0 gint64 * start, gint64 * stop);</pre><pre>=C2=
=A0 </pre><pre>=C2=A0=C2=A0static void</pre><pre>=C2=A0 gst_mss_demux_class=
_init (GstMssDemuxClass * klass)</pre><pre>-@@ -192,6 +194,8 @@ gst_mss_dem=
ux_class_init (GstMssDemuxClass * klass)</pre><pre>-=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gst_mss_demux_stream_update_fragment_info;</pre><pre>-=C2=
=A0=C2=A0 gstadaptivedemux_class-&gt;update_manifest_data =3D</pre><pre>-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_update_manifest_data;</p=
re><pre>+@@ -206,6 +208,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * k=
lass)</pre><pre>+=C2=A0=C2=A0 gstadaptivedemux_class-&gt;data_received =3D =
gst_mss_demux_data_received;</pre><pre>+=C2=A0=C2=A0 gstadaptivedemux_class=
-&gt;requires_periodical_playlist_update =3D</pre><pre>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 gst_mss_demux_requires_periodical_playlist_update;</pre>=
<pre> +=C2=A0 gstadaptivedemux_class-&gt;get_live_seek_range =3D</pre><pre>=
 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mss_demux_get_live_seek_range;</pre><p=
re>=C2=A0 </pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0GST_DEBUG_CATEGORY_INIT (mssde=
mux_debug, &quot;mssdemux&quot;, 0, &quot;mssdemux plugin&quot;);</pre><pre=
>=C2=A0 }</pre><pre>-@@ -659,3 +663,12 @@ gst_mss_demux_update_manifest_dat=
a (GstAdaptiveDemux * demux,</pre><pre>-=C2=A0=C2=A0 gst_mss_manifest_reloa=
d_fragments (mssdemux-&gt;manifest, buffer);</pre><pre>+@@ -694,7 +698,6 @@=
 gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,</pre><pre>=
=C2=A0=C2=A0=C2=A0 return GST_FLOW_OK;</pre><pre>=C2=A0 }</pre><pre>+ </pre=
><pre>+-</pre><pre>+ static GstFlowReturn</pre><pre>+ gst_mss_demux_data_re=
ceived (GstAdaptiveDemux * demux,</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 GstAd=
aptiveDemuxStream * stream, GstBuffer *buffer)</pre><pre>+@@ -739,3 +742,12=
 @@ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * d=
emux)</pre><pre>+ </pre><pre>+=C2=A0=C2=A0 return (!gst_mss_manifest_is_liv=
e (mssdemux-&gt;manifest));</pre><pre>+ }</pre><pre> +</pre><pre> +static g=
boolean</pre><pre> +gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * d=
emux, gint64 * start,</pre><pre>@@ -54,10 +59,10 @@ index 9d0aece2b..b66e19=
514 100644</pre><pre> +=C2=A0 return gst_mss_manifest_get_live_seek_range (=
mssdemux-&gt;manifest, start, stop);</pre><pre> +}</pre><pre> diff --git a/=
ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c=
</pre><pre>-index 1b72e8de1..317b3cef9 100644</pre><pre>+index b9dacb3..291=
080a 100644</pre><pre> --- a/ext/smoothstreaming/gstmssmanifest.c</pre><pre=
> +++ b/ext/smoothstreaming/gstmssmanifest.c</pre><pre>-@@ -42,6 +42,7 @@ G=
ST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);</pre><pre>+@@ -45,6 +45,7 @@ GST=
_DEBUG_CATEGORY_EXTERN (mssdemux_debug);</pre><pre>=C2=A0 </pre><pre>=C2=A0=
=C2=A0#define MSS_PROP_BITRATE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Bitrate&quot;</pre><pre>=C2=A0 #def=
ine MSS_PROP_DURATION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;d<a href=3D"mailto:@@-65,16+70,16@@index1b72e8de1.=
.317b3cef9100644#defineMSS_PROP_LANGUAGE">&quot;<o:p></o:p></a></pre><pre><=
span class=3DMsoHyperlink><a href=3D"mailto:@@-65,16+70,16@@index1b72e8de1.=
.317b3cef9100644#defineMSS_PROP_LANGUAGE">@@ -65,16 +70,16 @@ index 1b72e8d=
e1..317b3cef9 100644<o:p></o:p></a></span></pre><pre><span class=3DMsoHyper=
link><a href=3D"mailto:@@-65,16+70,16@@index1b72e8de1..317b3cef9100644#defi=
neMSS_PROP_LANGUAGE">=C2=A0 #define MSS_PROP_LANGUAGE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;</a></span>Langua=
ge&quot;</pre><pre>=C2=A0 #define MSS_PROP_NUMBER=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;n&quot;<=
/pre><pre>=C2=A0 #define MSS_PROP_REPETITIONS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;r&quot;</pre><pre>-@@ -94,6 +95,7 @@ struct =
_GstMssManifest</pre><pre>-=C2=A0=C2=A0 xmlNodePtr xmlrootnode;</pre><pre>+=
@@ -103,6 +104,7 @@ struct _GstMssManifest</pre><pre>=C2=A0 </pre><pre>=C2=
=A0=C2=A0=C2=A0=C2=A0gboolean is_live;</pre><pre>+=C2=A0=C2=A0 guint64 look=
_ahead_fragment_count;</pre><pre> +=C2=A0 gint64 dvr_window;</pre><pre>=C2=
=A0 </pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0GString *protection_system_id;</pre>=
<pre>=C2=A0=C2=A0=C2=A0 gchar *protection_data;</pre><pre>-@@ -330,6 +332,2=
2 @@ gst_mss_manifest_new (GstBuffer * data)</pre><pre>-=C2=A0=C2=A0=C2=A0=
=C2=A0 xmlFree (live_str);</pre><pre>+@@ -367,6 +369,22 @@ gst_mss_manifest=
_new (GstBuffer * data)</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 xmlFree (look_a=
head_fragment_count_str);</pre><pre>=C2=A0=C2=A0=C2=A0 }</pre><pre>=C2=A0 <=
/pre><pre>=C2=A0+=C2=A0 /* the entire file is always available for non-live=
 streams */</pre><pre>@@ -96,9 +101,9 @@ index 1b72e8de1..317b3cef9 100644<=
/pre><pre>=C2=A0=C2=A0=C2=A0 for (nodeiter =3D root-&gt;children; nodeiter;=
 nodeiter =3D nodeiter-&gt;next) {</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (nodeiter-&gt;type =3D=3D XML_ELEMENT_NODE</pre><pre>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&amp; (strcmp ((const char *) nod=
eiter-&gt;name, &quot;StreamIndex&quot;) =3D=3D 0)) {</pre><pre>-@@ -1406,3=
 +1424,69 @@ gst_mss_stream_get_lang (GstMssStream * stream)</pre><pre>- {<=
/pre><pre>-=C2=A0=C2=A0 return stream-&gt;lang;</pre><pre>+@@ -1546,3 +1564=
,69 @@ gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * bu=
ffer)</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fragment-=
&gt;time, fragment-&gt;duration, fragment-&gt;repetitions);</pre><pre>+=C2=
=A0=C2=A0 }</pre><pre>=C2=A0 }</pre><pre> +</pre><pre> +static GstClockTime=
</pre><pre>@@ -167,7 +172,7 @@ index 1b72e8de1..317b3cef9 100644</pre><pre>=
 +=C2=A0 return ret;</pre><pre> +}</pre><pre> diff --git a/ext/smoothstream=
ing/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h</pre><pre>-inde=
x af7419c23..6b7b1f971 100644</pre><pre>+index 039877f..29545af 100644</pre=
><pre> --- a/ext/smoothstreaming/gstmssmanifest.h</pre><pre> +++ b/ext/smoo=
thstreaming/gstmssmanifest.h</pre><pre> @@ -54,6 +54,7 @@ void gst_mss_mani=
fest_reload_fragments (GstMssManifest * manifest, GstBuffer * d</pre><pre>@=
@ -179,5 +184,5 @@ index af7419c23..6b7b1f971 100644</pre><pre>=C2=A0 GstMs=
sStreamType gst_mss_stream_get_type (GstMssStream *stream);</pre><pre>=C2=
=A0 GstCaps * gst_mss_stream_get_caps (GstMssStream * stream);</pre><pre> -=
- </pre><pre>-2.11.0</pre><pre>+1.8.3.2</pre><pre> </pre><pre>diff --git a/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedem=
ux-minimal-HTTP-context-support.patch b/meta/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.pat=
ch</pre><pre>new file mode 100644</pre><pre>index 0000000000..8a4ca68d83</p=
re><pre>--- /dev/null</pre><pre>+++ b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch=
</pre><pre>@@ -0,0 +1,142 @@</pre><pre>+From 992bd23193978742029966e0a2232b=
1bfcc06122 Mon Sep 17 00:00:00 2001</pre><pre>+From: Philippe Normand <a hr=
ef=3D"mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a></pre><pre>+Date=
: Wed, 28 Oct 2015 11:52:49 +0100</pre><pre>+Subject: [PATCH 3/6] adaptived=
emux: minimal HTTP context support</pre><pre>+</pre><pre>+The uridownloader=
 is now querying the source element for an HTTP</pre><pre>+context, which s=
tores session data (cookies only for now), and reusing</pre><pre>+the data =
when fetching data over HTTP. Additionally the context is set</pre><pre>+on=
 adaptivedemux, which allows it to also properly use session data</pre><pre=
>+when downloading fragments.</pre><pre>+</pre><pre>+https://bugzilla.gnome=
.org/show_bug.cgi?id=3D726314</pre><pre>+---</pre><pre>+ gst-libs/gst/adapt=
ivedemux/gstadaptivedemux.c | 16 ++++++++++++-</pre><pre>+ gst-libs/gst/uri=
downloader/gsturidownloader.c | 34 +++++++++++++++++++++++++--</pre><pre>+ =
gst-libs/gst/uridownloader/gsturidownloader.h |=C2=A0 2 +-</pre><pre>+ 3 fi=
les changed, 48 insertions(+), 4 deletions(-)</pre><pre>+</pre><pre>+diff -=
-git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptiv=
edemux/gstadaptivedemux.c</pre><pre>+index 20bd839..1b5cace 100644</pre><pr=
e>+--- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c</pre><pre>++++ b/gst=
-libs/gst/adaptivedemux/gstadaptivedemux.c</pre><pre>+@@ -432,7 +432,7 @@ g=
st_adaptive_demux_init (GstAdaptiveDemux * demux,</pre><pre>+ </pre><pre>+=
=C2=A0=C2=A0 demux-&gt;priv =3D GST_ADAPTIVE_DEMUX_GET_PRIVATE (demux);</pr=
e><pre>+=C2=A0=C2=A0 demux-&gt;priv-&gt;input_adapter =3D gst_adapter_new (=
);</pre><pre>+-=C2=A0 demux-&gt;downloader =3D gst_uri_downloader_new ();</=
pre><pre>++=C2=A0 demux-&gt;downloader =3D gst_uri_downloader_new (GST_ELEM=
ENT (demux));</pre><pre>+=C2=A0=C2=A0 demux-&gt;stream_struct_size =3D size=
of (GstAdaptiveDemuxStream);</pre><pre>+=C2=A0=C2=A0 demux-&gt;priv-&gt;seg=
ment_seqnum =3D gst_util_seqnum_next ();</pre><pre>+=C2=A0=C2=A0 demux-&gt;=
have_group_id =3D FALSE;</pre><pre>+@@ -2547,6 +2547,7 @@ gst_adaptive_demu=
x_stream_update_source (GstAdaptiveDemuxStream * stream,</pre><pre>+=C2=A0=
=C2=A0=C2=A0=C2=A0 GstPadLinkReturn pad_link_ret;</pre><pre>+=C2=A0=C2=A0=
=C2=A0=C2=A0 GObjectClass *gobject_class;</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=
=A0 gchar *internal_name, *bin_name;</pre><pre>++=C2=A0=C2=A0=C2=A0 GstCont=
ext *context =3D NULL;</pre><pre>+ </pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Our src consists of a bin containing uri_handler -&gt; queue2 . The</pre><p=
re>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * purpose of the queue2 is to allow the =
uri_handler to download an</pre><pre>+@@ -2598,6 +2599,19 @@ gst_adaptive_d=
emux_stream_update_source (GstAdaptiveDemuxStream * stream,</pre><pre>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 }</=
pre><pre>+ </pre><pre>++=C2=A0=C2=A0=C2=A0 context =3D</pre><pre>++=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_element_get_context (GST_ELEMENT_C=
AST (demux), &quot;http-headers&quot;);</pre><pre>++=C2=A0=C2=A0=C2=A0 if (=
context) {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const GstStructure *s=
 =3D gst_context_get_structure (context);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const gchar **cookies =3D NULL;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 gst_structure_get (s, &quot;cookies&quot;, G_TYPE_STRV, &amp;cook=
ies, NULL);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cookies) {</pre>=
<pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GST_DEBUG_OBJECT (demux, =
&quot;Passing cookies through&quot;);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 g_object_set (uri_handler, &quot;cookies&quot;, cookies,=
 NULL);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>++=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gst_context_unref (context);</pre><pre>++=C2=A0=C2=A0=
=C2=A0 }</pre><pre>++</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 /* Source bin cre=
ation */</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 bin_name =3D g_strdup_printf (=
&quot;srcbin-%s&quot;, GST_PAD_NAME (stream-&gt;pad));</pre><pre>+=C2=A0=C2=
=A0=C2=A0=C2=A0 stream-&gt;src =3D gst_bin_new (bin_name);</pre><pre>+diff =
--git a/gst-libs/gst/uridownloader/gsturidownloader.c b/gst-libs/gst/uridow=
nloader/gsturidownloader.c</pre><pre>+index 47b6f29..1f61250 100644</pre><p=
re>+--- a/gst-libs/gst/uridownloader/gsturidownloader.c</pre><pre>++++ b/gs=
t-libs/gst/uridownloader/gsturidownloader.c</pre><pre>+@@ -33,6 +33,8 @@ GS=
T_DEBUG_CATEGORY (uridownloader_debug);</pre><pre>+ </pre><pre>+ struct _Gs=
tUriDownloaderPrivate</pre><pre>+ {</pre><pre>++=C2=A0 GstElement *parent;<=
/pre><pre>++</pre><pre>+=C2=A0=C2=A0 /* Fragments fetcher */</pre><pre>+=C2=
=A0=C2=A0 GstElement *urisrc;</pre><pre>+=C2=A0=C2=A0 GstBus *bus;</pre><pr=
e>+@@ -148,9 +150,11 @@ gst_uri_downloader_finalize (GObject * object)</pre=
><pre>+ }</pre><pre>+ </pre><pre>+ GstUriDownloader *</pre><pre>+-gst_uri_d=
ownloader_new (void)</pre><pre>++gst_uri_downloader_new (GstElement * paren=
t)</pre><pre>+ {</pre><pre>+-=C2=A0 return g_object_new (GST_TYPE_URI_DOWNL=
OADER, NULL);</pre><pre>++=C2=A0 GstUriDownloader *downloader =3D g_object_=
new (GST_TYPE_URI_DOWNLOADER, NULL);</pre><pre>++=C2=A0 downloader-&gt;priv=
-&gt;parent =3D parent;</pre><pre>++=C2=A0 return downloader;</pre><pre>+ }=
</pre><pre>+ </pre><pre>+ static gboolean</pre><pre>+@@ -413,6 +417,7 @@ gs=
t_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,=
</pre><pre>+ {</pre><pre>+=C2=A0=C2=A0 GstPad *pad;</pre><pre>+=C2=A0=C2=A0=
 GObjectClass *gobject_class;</pre><pre>++=C2=A0 GstContext *context =3D NU=
LL;</pre><pre>+ </pre><pre>+=C2=A0=C2=A0 if (!gst_uri_is_valid (uri))</pre>=
<pre>+=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;</pre><pre>+@@ -449,6 +454,31 @=
@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * =
uri,</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>+=C2=A0=C2=A0 }</pre><=
pre>+ </pre><pre>++=C2=A0 context =3D gst_element_get_context (downloader-&=
gt;priv-&gt;parent, &quot;http-headers&quot;);</pre><pre>++=C2=A0 if (!cont=
ext) {</pre><pre>++=C2=A0=C2=A0=C2=A0 GstQuery *context_query =3D gst_query=
_new_context (&quot;http-headers&quot;);</pre><pre>++=C2=A0=C2=A0=C2=A0 Gst=
Pad *parent_sink_pad =3D</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 gst_element_get_static_pad (downloader-&gt;priv-&gt;parent, &quot;si=
nk&quot;);</pre><pre>++=C2=A0=C2=A0=C2=A0 if (gst_pad_peer_query (parent_si=
nk_pad, context_query)) {</pre><pre>++</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 gst_query_parse_context (context_query, &amp;context);</pre><pre>++=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_element_set_context (downloader-&gt;priv=
-&gt;parent, context);</pre><pre>++=C2=A0=C2=A0=C2=A0 }</pre><pre>++=C2=A0=
=C2=A0=C2=A0 gst_object_unref (parent_sink_pad);</pre><pre>++=C2=A0=C2=A0=
=C2=A0 gst_query_unref (context_query);</pre><pre>++=C2=A0 }</pre><pre>++</=
pre><pre>++=C2=A0 if (context) {</pre><pre>++=C2=A0=C2=A0=C2=A0 const GstSt=
ructure *s =3D gst_context_get_structure (context);</pre><pre>++=C2=A0=C2=
=A0=C2=A0 const gchar **cookies =3D NULL;</pre><pre>++=C2=A0=C2=A0=C2=A0 gs=
t_structure_get (s, &quot;cookies&quot;, G_TYPE_STRV, &amp;cookies, NULL);<=
/pre><pre>++=C2=A0=C2=A0=C2=A0 if (cookies) {</pre><pre>++=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GST_DEBUG_OBJECT (downloader, &quot;Passing cookies through=
&quot;);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_object_set (downloade=
r-&gt;priv-&gt;urisrc, &quot;cookies&quot;, cookies, NULL);</pre><pre>++=C2=
=A0=C2=A0=C2=A0 }</pre><pre>++=C2=A0=C2=A0=C2=A0 gst_context_unref (context=
);</pre><pre>++=C2=A0 }</pre><pre>++</pre><pre>+=C2=A0=C2=A0 /* add a sync =
handler for the bus messages to detect errors in the download */</pre><pre>=
+=C2=A0=C2=A0 gst_element_set_bus (GST_ELEMENT (downloader-&gt;priv-&gt;uri=
src),</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 downloader-&gt;priv-&=
gt;bus);</pre><pre>+diff --git a/gst-libs/gst/uridownloader/gsturidownloade=
r.h b/gst-libs/gst/uridownloader/gsturidownloader.h</pre><pre>+index 80b8a3=
e..36cbf65 100644</pre><pre>+--- a/gst-libs/gst/uridownloader/gsturidownloa=
der.h</pre><pre>++++ b/gst-libs/gst/uridownloader/gsturidownloader.h</pre><=
pre>+@@ -60,7 +60,7 @@ struct _GstUriDownloaderClass</pre><pre>+ </pre><pre=
>+ GType gst_uri_downloader_get_type (void);</pre><pre>+ </pre><pre>+-GstUr=
iDownloader * gst_uri_downloader_new (void);</pre><pre>++GstUriDownloader *=
 gst_uri_downloader_new (GstElement * parent);</pre><pre>+ GstFragment * gs=
t_uri_downloader_fetch_uri (GstUriDownloader * downloader, const gchar * ur=
i, const gchar * referer, gboolean compress, gboolean refresh, gboolean all=
ow_cache, GError ** err);</pre><pre>+ GstFragment * gst_uri_downloader_fetc=
h_uri_with_range (GstUriDownloader * downloader, const gchar * uri, const g=
char * referer, gboolean compress, gboolean refresh, gboolean allow_cache, =
gint64 range_start, gint64 range_end, GError ** err);</pre><pre>+ void gst_=
uri_downloader_reset (GstUriDownloader *downloader);</pre><pre>+-- </pre><p=
re>+2.7.4</pre><pre>+</pre><pre>diff --git a/meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-=
parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/=
0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch</pre><pre>new f=
ile mode 100644</pre><pre>index 0000000000..97d83aa4f7</pre><pre>--- /dev/n=
ull</pre><pre>+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch</pre><pre>@=
@ -0,0 +1,109 @@</pre><pre>+From cbf3d75b3d693e50722534d30a8f51995a419803 M=
on Sep 17 00:00:00 2001</pre><pre>+From: Philippe Normand <a href=3D"mailto=
:philn@igalia.com">&lt;philn@igalia.com&gt;</a></pre><pre>+Date: Fri, 4 Nov=
 2016 09:56:33 +0100</pre><pre>+Subject: [PATCH 5/6] mpdparser: MS PlayRead=
y ContentProtection parsing</pre><pre>+</pre><pre>+The &quot;pro&quot; (Pla=
yReady Object) element contents are now base64-decoded</pre><pre>+and prope=
rly stored in Protection events.</pre><pre>+</pre><pre>+https://bugzilla.gn=
ome.org/show_bug.cgi?id=3D773936</pre><pre>+---</pre><pre>+ ext/dash/gstdas=
hdemux.c |=C2=A0 2 +-</pre><pre>+ ext/dash/gstmpdparser.c | 41 ++++++++++++=
++++++++++++++++++++++++++++-</pre><pre>+ ext/dash/gstmpdparser.h |=C2=A0 1=
 +</pre><pre>+ 3 files changed, 42 insertions(+), 2 deletions(-)</pre><pre>=
+</pre><pre>+diff --git a/ext/dash/gstdashdemux.c b/ext/dash/gstdashdemux.c=
</pre><pre>+index 271f70f..b10465e 100644</pre><pre>+--- a/ext/dash/gstdash=
demux.c</pre><pre>++++ b/ext/dash/gstdashdemux.c</pre><pre>+@@ -745,7 +745,=
7 @@ gst_dash_demux_send_content_protection_event (gpointer data, gpointer =
userdata)</pre><pre>+=C2=A0=C2=A0 /* RFC 2141 states: The leading &quot;urn=
:&quot; sequence is case-insensitive */</pre><pre>+=C2=A0=C2=A0 schemeIdUri=
 =3D g_ascii_strdown (cp-&gt;schemeIdUri, -1);</pre><pre>+=C2=A0=C2=A0 if (=
g_str_has_prefix (schemeIdUri, &quot;urn:uuid:&quot;)) {</pre><pre>+-=C2=A0=
=C2=A0=C2=A0 pssi_len =3D strlen (cp-&gt;value);</pre><pre>++=C2=A0=C2=A0=
=C2=A0 pssi_len =3D cp-&gt;value_len;</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 p=
ssi =3D gst_buffer_new_wrapped (g_memdup (cp-&gt;value, pssi_len), pssi_len=
);</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 GST_LOG_OBJECT (stream, &quot;Queuin=
g Protection event on source pad&quot;);</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=
=A0 /* RFC 4122 states that the hex part of a UUID is in lower case,</pre><=
pre>+diff --git a/ext/dash/gstmpdparser.c b/ext/dash/gstmpdparser.c</pre><p=
re>+index 15d6d98..f0b3ceb 100644</pre><pre>+--- a/ext/dash/gstmpdparser.c<=
/pre><pre>++++ b/ext/dash/gstmpdparser.c</pre><pre>+@@ -1313,6 +1313,7 @@ g=
st_mpdparser_parse_descriptor_type_node (GList ** list, xmlNode * a_node)</=
pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 /* if no value attribute, use XML string=
 representation of the node */</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0 gst_mpdp=
arser_get_xml_node_as_string (a_node, &amp;new_descriptor-&gt;value);</pre>=
<pre>+=C2=A0=C2=A0 }</pre><pre>++=C2=A0 new_descriptor-&gt;value_len =3D st=
rlen(new_descriptor-&gt;value);</pre><pre>+ }</pre><pre>+ </pre><pre>+ stat=
ic void</pre><pre>+@@ -1734,6 +1735,44 @@ error:</pre><pre>+ }</pre><pre>+ =
</pre><pre>+ static void</pre><pre>++gst_mpdparser_parse_content_protection=
_node (GList ** list, xmlNode * a_node)</pre><pre>++{</pre><pre>++=C2=A0 gc=
har *value =3D NULL;</pre><pre>++=C2=A0 if (gst_mpdparser_get_xml_prop_stri=
ng (a_node, &quot;value&quot;, &amp;value)) {</pre><pre>++=C2=A0=C2=A0=C2=
=A0 if (!g_strcmp0 (value, &quot;MSPR 2.0&quot;)) {</pre><pre>++=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 xmlNode *cur_node;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 for (cur_node =3D a_node-&gt;children; cur_node; cur_node =3D cur=
_node-&gt;next) {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (cur_node-&gt;type =3D=3D XML_ELEMENT_NODE) {</pre><pre>++=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (xmlStrcmp (cur_node-&gt;name, (=
xmlChar *) &quot;pro&quot;) =3D=3D 0) {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gsize decoded_len;</pre><pre>=
++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GstDes=
criptorType *new_descriptor;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_descriptor =3D g_slice_new0 (GstDescr=
iptorType);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *list =3D g_list_append (*list, new_descriptor);</pre><pre>=
++</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 gst_mpdparser_get_xml_prop_string (a_node, &quot;schemeIdUri&quot;,<=
/pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;new_descriptor-&gt;schemeIdUri);</pre><pre=
>++</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 gst_mpdparser_get_xml_node_content (cur_node,</pre><pre>++=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &amp;new_descriptor-&gt;value);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_base64_decode_inplace (new_=
descriptor-&gt;value, &amp;decoded_len);</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(new_descriptor-&gt;value + =
decoded_len) =3D '\0';</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_descriptor-&gt;value_len =3D decoded_len;</=
pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto beach;</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><=
pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>++=C2=A0=C2=A0=C2=A0 } els=
e {</pre><pre>++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mpdparser_parse_descript=
or_type_node (list, a_node);</pre><pre>++=C2=A0=C2=A0=C2=A0 }</pre><pre>++=
=C2=A0 } else {</pre><pre>++=C2=A0=C2=A0=C2=A0 gst_mpdparser_parse_descript=
or_type_node (list, a_node);</pre><pre>++=C2=A0 }</pre><pre>++beach:</pre><=
pre>++=C2=A0 if (value)</pre><pre>++=C2=A0=C2=A0=C2=A0 g_free (value);</pre=
><pre>++}</pre><pre>++</pre><pre>++static void</pre><pre>+ gst_mpdparser_pa=
rse_representation_base_type (GstRepresentationBaseType **</pre><pre>+=C2=
=A0=C2=A0=C2=A0=C2=A0 pointer, xmlNode * a_node)</pre><pre>+ {</pre><pre>+@=
@ -1788,7 +1827,7 @@ gst_mpdparser_parse_representation_base_type (GstRepre=
sentationBaseType **</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (&amp;representation_base-&gt;AudioChannelCo=
nfiguration, cur_node);</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } e=
lse if (xmlStrcmp (cur_node-&gt;name,</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (xmlChar *) &q=
uot;ContentProtection&quot;) =3D=3D 0) {</pre><pre>+-=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gst_mpdparser_parse_descriptor_type_node</pre><pre>++=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gst_mpdparser_parse_content_prot=
ection_node</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (&amp;representation_base-&gt;ContentProtection, cur_=
node);</pre><pre>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</pre><pre>+=C2=A0=
=C2=A0=C2=A0=C2=A0 }</pre><pre>+diff --git a/ext/dash/gstmpdparser.h b/ext/=
dash/gstmpdparser.h</pre><pre>+index 85b97ea..738de68 100644</pre><pre>+---=
 a/ext/dash/gstmpdparser.h</pre><pre>++++ b/ext/dash/gstmpdparser.h</pre><p=
re>+@@ -277,6 +277,7 @@ struct _GstDescriptorType</pre><pre>+ {</pre><pre>+=
=C2=A0=C2=A0 gchar *schemeIdUri;</pre><pre>+=C2=A0=C2=A0 gchar *value;</pre=
><pre>++=C2=A0 glong value_len;</pre><pre>+ };</pre><pre>+ </pre><pre>+ str=
uct _GstContentComponentNode</pre><pre>+-- </pre><pre>+2.7.4</pre><pre>+</p=
re><pre>diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad=
_1.10.4.bb</pre><pre>index 0bb4053e43..c894945748 100644</pre><pre>--- a/me=
ta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb</pre><pr=
e>+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.b=
b</pre><pre>@@ -11,13 +11,16 @@ SRC_URI =3D &quot; \</pre><pre>=C2=A0=C2=A0=
=C2=A0=C2=A0 <a href=3D"file://fix-maybe-uninitialized-warnings-when-compil=
ing-with-Os.patch">file://fix-maybe-uninitialized-warnings-when-compiling-w=
ith-Os.patch</a> \</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"file://avo=
id-including-sys-poll.h-directly.patch">file://avoid-including-sys-poll.h-d=
irectly.patch</a> \</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"file://en=
sure-valid-sentinels-for-gst_structure_get-etc.patch">file://ensure-valid-s=
entinels-for-gst_structure_get-etc.patch</a> \</pre><pre>+=C2=A0=C2=A0=C2=
=A0 <a href=3D"file://0001-mssdemux-improved-live-playback-support.patch">f=
ile://0001-mssdemux-improved-live-playback-support.patch</a> \</pre><pre>=
=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"file://0001-gstreamer-gl.pc.in-don-t-ap=
pend-GL_CFLAGS-to-CFLAGS.patch">file://0001-gstreamer-gl.pc.in-don-t-append=
-GL_CFLAGS-to-CFLAGS.patch</a> \</pre><pre>-=C2=A0=C2=A0=C2=A0 <a href=3D"f=
ile://0009-glimagesink-Downrank-to-marginal.patch">file://0009-glimagesink-=
Downrank-to-marginal.patch</a> \</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0 <a href=
=3D"file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"=
>file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch</a>=
 \</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"file://0001-Prepend-PKG_CO=
NFIG_SYSROOT_DIR-to-pkg-config-output.patch">file://0001-Prepend-PKG_CONFIG=
_SYSROOT_DIR-to-pkg-config-output.patch</a> \</pre><pre>-=C2=A0=C2=A0=C2=A0=
 <a href=3D"file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_=
s.patch">file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.p=
atch</a> \</pre><pre>=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"file://0001-smooth=
streaming-use-the-duration-from-the-list-of-fr.patch">file://0001-smoothstr=
eaming-use-the-duration-from-the-list-of-fr.patch</a> \</pre><pre>-=C2=A0=
=C2=A0=C2=A0 <a href=3D"file://0001-mssdemux-improved-live-playback-support=
.patch">file://0001-mssdemux-improved-live-playback-support.patch</a> \</pr=
e><pre>+=C2=A0=C2=A0=C2=A0 <a href=3D"file://0002-mssdemux-Handle-the-adapt=
er-in-the-subclass-after-bu.patch">file://0002-mssdemux-Handle-the-adapter-=
in-the-subclass-after-bu.patch</a> \</pre><pre>+=C2=A0=C2=A0=C2=A0 <a href=
=3D"file://0003-adaptivedemux-minimal-HTTP-context-support.patch">file://00=
03-adaptivedemux-minimal-HTTP-context-support.patch</a> \</pre><pre>+=C2=A0=
=C2=A0=C2=A0 <a href=3D"file://0005-mpdparser-MS-PlayReady-ContentProtectio=
n-parsing.patch">file://0005-mpdparser-MS-PlayReady-ContentProtection-parsi=
ng.patch</a> \</pre><pre>+=C2=A0=C2=A0=C2=A0 <a href=3D"file://0001-smooths=
treaming-implement-adaptivedemux-s-get_live_s.patch">file://0001-smoothstre=
aming-implement-adaptivedemux-s-get_live_s.patch</a> \</pre><pre>+=C2=A0=C2=
=A0=C2=A0 <a href=3D"file://0009-glimagesink-Downrank-to-marginal.patch">fi=
le://0009-glimagesink-Downrank-to-marginal.patch</a> \</pre><pre> &quot;</p=
re><pre> SRC_URI[md5sum] =3D &quot;2757103e57a096a1a05b3ab85b8381af&quot;</=
pre><pre> SRC_URI[sha256sum] =3D &quot;23ddae506b3a223b94869a0d3eea3e9a12e8=
47f94d2d0e0b97102ce13ecd6966&quot;</pre></blockquote><p class=3DMsoNormal><=
o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span style=3D'color:black'><o:p>&=
nbsp;</o:p></span></p></div></body></html>=

--_98E94354-870E-4C5F-9F6D-324675C93620_--
