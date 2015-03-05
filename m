Return-Path: <scerveau@connected-labs.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D4EFE71637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:26:45 +0000 (UTC)
Received: by wibbs8 with SMTP id bs8so8303812wib.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 08:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:message-id:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type;
	bh=7x8hCK92Uy699prh3AHSmz2M6nFQY/Z4kqzNTXRQsTQ=;
	b=Wch+5J4hBC8IeCxWu2WMpfOu1hS0TQluqHdTgnr626GV4LFTI8DzLCe1fafTXtqLkh
	3OOiiaDxmYRNXZPbBAF4IsEJwlYYc3gdMFm5H3NwoUIHRdV9gt74jHRTsEUHOp3OnD8r
	+hmiVPogh/iXcUYz7OkFohaHysNuE5lUkRcVsHBzlheZR/EW3aXkbwtAWOUrBNrrdMAI
	yE+FTbla1DQfF32MASgO9bAgayWQOx3FiFMt+GUpAUHYD7r+WTAe/6WmO5IG8kzt56Z1
	RD8ZAYgxyWBJyWVoEnqVLEPkf0hSlire7ZdAgzBIX4OF2kAFETZxqUJkAP7lN20zGSGl
	4wgA==
X-Gm-Message-State: ALoCoQkW3mKCetk/eyq/RYZTJbYeao/B+/g7f5yyKOcEAYF7L1EPR/joTY4u0w0XHvCoeT8+C9Vo
X-Received: by 10.194.62.198 with SMTP id a6mr20579150wjs.90.1425572806355;
	Thu, 05 Mar 2015 08:26:46 -0800 (PST)
Received: from [172.24.63.26]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	lj13sm12314950wic.9.2015.03.05.08.26.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 08:26:44 -0800 (PST)
Sender: Stephane Cerveau <scerveau@connected-labs.com>
Message-ID: <54F883C3.3050407@voxtok.com>
Date: Thu, 05 Mar 2015 17:26:43 +0100
From: scerveau <scerveau@voxtok.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54F88355.1090908@gmail.com>
In-Reply-To: <54F88355.1090908@gmail.com>
X-Forwarded-Message-Id: <54F88355.1090908@gmail.com>
Subject: [PATCH] GstVolume with dizzy is not working when changing to a value inferior to 1
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
X-List-Received-Date: Thu, 05 Mar 2015 16:26:46 -0000
X-Groupsio-MsgNum: 63018
Content-Type: multipart/mixed; boundary="------------070006070008000908060708"

--------------070006070008000908060708
Content-Type: multipart/alternative;
 boundary="------------040300030403000908020308"

--------------040300030403000908020308
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Dear all,

Here is a patch which fixes the use of gstvolume in 
gstreamer1.0-plugins-base-1.4.1.
The patch has been submitted to gstreamer1.0 master branch

https://bugzilla.gnome.org/show_bug.cgi?id=745667
http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=40f4daffd12b84dceb23942a992815e11b5a0839

Best regards.

Stéphane

-------- Forwarded Message --------
Subject: 	Re: [meta-freescale] GstVolume with dizzy is not working when 
changing to a value inferior to 1
Date: 	Thu, 5 Mar 2015 10:39:28 -0300
From: 	Otavio Salvador <otavio@ossystems.com.br>
To: 	scerveau <scerveau@gmail.com>
CC: 	Carlos Rafael Giani <dv@pseudoterminal.org>, 
meta-freescale@yoctoproject.org <meta-freescale@yoctoproject.org>



On Thu, Mar 5, 2015 at 10:34 AM, scerveau<scerveau@gmail.com>  wrote:
> Dear all,
>
> Here is the patch who can be merged in meta-freescale concerning gstvolume.c
> in gstreamer1.0-plugins-base
> I guess this patch should be merged in poky and not in meta-freescale seen
> that the bug is also on raspberry pi 2 by example.
>
> A bug entry has been submitted to gcc bug tracker system:
>
>https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65325

Yes; this should be done in OE-Core so it fixes the problem in the
base. We shouldn't handle this in the BSP.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br         http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750






--------------040300030403000908020308
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-forward-container">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      Dear all,<br>
      <br>
      Here is a patch which fixes the use of gstvolume in
      gstreamer1.0-plugins-base-1.4.1.<br>
      The patch has been submitted to gstreamer1.0 master branch <br>
      <div class="moz-forward-container"><br>
        <a moz-do-not-send="true" class="moz-txt-link-freetext"
          href="https://bugzilla.gnome.org/show_bug.cgi?id=745667">https://bugzilla.gnome.org/show_bug.cgi?id=745667</a><br>
        <a moz-do-not-send="true" class="moz-txt-link-freetext"
href="http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=40f4daffd12b84dceb23942a992815e11b5a0839">http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=40f4daffd12b84dceb23942a992815e11b5a0839</a><br>
        <br>
        Best regards.<br>
        <br>
        Stéphane<br>
        <br>
        -------- Forwarded Message --------
        <table class="moz-email-headers-table" border="0"
          cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Subject:

              </th>
              <td>Re: [meta-freescale] GstVolume with dizzy is not
                working when changing to a value inferior to 1</td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Date:
              </th>
              <td>Thu, 5 Mar 2015 10:39:28 -0300</td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">From:
              </th>
              <td>Otavio Salvador <a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:otavio@ossystems.com.br">&lt;otavio@ossystems.com.br&gt;</a></td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">To: </th>
              <td>scerveau <a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:scerveau@gmail.com">&lt;scerveau@gmail.com&gt;</a></td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">CC: </th>
              <td>Carlos Rafael Giani <a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:dv@pseudoterminal.org">&lt;dv@pseudoterminal.org&gt;</a>,
                <a moz-do-not-send="true"
                  class="moz-txt-link-abbreviated"
                  href="mailto:meta-freescale@yoctoproject.org">meta-freescale@yoctoproject.org</a>
                <a moz-do-not-send="true" class="moz-txt-link-rfc2396E"
                  href="mailto:meta-freescale@yoctoproject.org">&lt;meta-freescale@yoctoproject.org&gt;</a></td>
            </tr>
          </tbody>
        </table>
        <br>
        <br>
        <pre>On Thu, Mar 5, 2015 at 10:34 AM, scerveau <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:scerveau@gmail.com">&lt;scerveau@gmail.com&gt;</a> wrote:
&gt; Dear all,
&gt;
&gt; Here is the patch who can be merged in meta-freescale concerning gstvolume.c
&gt; in gstreamer1.0-plugins-base
&gt; I guess this patch should be merged in poky and not in meta-freescale seen
&gt; that the bug is also on raspberry pi 2 by example.
&gt;
&gt; A bug entry has been submitted to gcc bug tracker system:
&gt;
&gt; <a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65325">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65325</a>

Yes; this should be done in OE-Core so it fixes the problem in the
base. We shouldn't handle this in the BSP.

-- 
Otavio Salvador                             O.S. Systems
<a moz-do-not-send="true" class="moz-txt-link-freetext" href="http://www.ossystems.com.br">http://www.ossystems.com.br</a>        <a moz-do-not-send="true" class="moz-txt-link-freetext" href="http://code.ossystems.com.br">http://code.ossystems.com.br</a>
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
</pre>
        <br>
      </div>
      <br>
      <br>
    </div>
    <br>
  </body>
</html>

--------------040300030403000908020308--

--------------070006070008000908060708
Content-Type: text/x-patch;
 name="0001-GSTVolume-setting-volume-to-less-than-1.0.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-GSTVolume-setting-volume-to-less-than-1.0.patch"

From d48ce237e7641d896948b75eb5867be78037a5d3 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@connected-labs.com>
Date: Thu, 5 Mar 2015 17:20:19 +0100
Subject: [PATCH] GSTVolume: setting volume to less than 1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The volume element in gstreamer1.0-plugins-base was not working
properly on arm platform if the volume is less 1.0.

https://bugzilla.gnome.org/show_bug.cgi?id=745667

Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
---
 ...olume_explicitely_cast_integers_to_double.patch |   23 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.1.bb   |    1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/volume_explicitely_cast_integers_to_double.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/volume_explicitely_cast_integers_to_double.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/volume_explicitely_cast_integers_to_double.patch
new file mode 100644
index 0000000..f67a840
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/volume_explicitely_cast_integers_to_double.patch
@@ -0,0 +1,23 @@
+diff --git a/gst/volume/gstvolume.c b/gst/volume/gstvolume.c
+index 0f5b362..94d03a3 100644
+--- a/gst/volume/gstvolume.c
++++ b/gst/volume/gstvolume.c
+@@ -250,10 +250,14 @@ volume_update_volume (GstVolume * self, const GstAudioInfo * info,
+     self->current_mute = FALSE;
+     self->current_volume = volume;
+ 
+-    self->current_vol_i8 = volume * VOLUME_UNITY_INT8;
+-    self->current_vol_i16 = volume * VOLUME_UNITY_INT16;
+-    self->current_vol_i24 = volume * VOLUME_UNITY_INT24;
+-    self->current_vol_i32 = volume * VOLUME_UNITY_INT32;
++    self->current_vol_i8 =
++        (gint) ((gdouble) volume * (gdouble) VOLUME_UNITY_INT8);
++    self->current_vol_i16 =
++        (gint) ((gdouble) volume * (gdouble) VOLUME_UNITY_INT16);
++    self->current_vol_i24 =
++        (gint) ((gdouble) volume * (gdouble) VOLUME_UNITY_INT24);
++    self->current_vol_i32 =
++        (gint) ((gdouble) volume * (gdouble) VOLUME_UNITY_INT32);
+ 
+     passthrough = (self->current_vol_i16 == VOLUME_UNITY_INT16);
+   }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
index 0db42ce..4198b1a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
 
 SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
+            file://volume_explicitely_cast_integers_to_double.patch \
 "
 
 SRC_URI[md5sum] = "a825628225bd0a58c0df87cdd2a5db91"
-- 
1.7.9.5



--------------070006070008000908060708--
