Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6206173243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:06:47 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so115203744pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=g2CcUYl/+fAxfZZwIDv/fi4iZnxuEkCrreU9+GYW+Ek=;
	b=hcPRqm8xQrcM9YjyOVo5SxhL2715awVx4+vinSqVELCZcFYDTnVC35RGWbwSuob7IZ
	3mm0oShbNiB9/pInaYLPa6CxIFVkx6t/RZ8Jt2B/SGmIuGcLdHdZSol3QVd2VU1L50E3
	NfjXGY1eOe7hGK5loEHgQjyk/CHbQ04PLzpE66Cn0rxPjnbKTMzhj+THJaxSKfEr8g2z
	l0lPeJ5nV6yJEQJQIj6Z7mXQ8RjuBFtWZE6QC9j1vVbgWk3dymLfii+gmHU3001H/CJK
	uG0KyX2s6tAGypYk9bEmhH9fOhLbJGnuA0aZN7XIhyZ9ARBDK4eqOzD/TzrtD8wlJHSw
	JRSQ==
X-Received: by 10.68.107.5 with SMTP id gy5mr23836734pbb.121.1442837207889;
	Mon, 21 Sep 2015 05:06:47 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	iw10sm22181034pbc.10.2015.09.21.05.06.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 05:06:46 -0700 (PDT)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1442833766-16676-1-git-send-email-net147@gmail.com>
	<CAHiDW_EC9LGaxGA7b9=K4kH5iEsw1XrZ0Y2ngs0p-EG0_LN7gg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <55FFF2D0.6030609@gmail.com>
Date: Mon, 21 Sep 2015 22:06:40 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EC9LGaxGA7b9=K4kH5iEsw1XrZ0Y2ngs0p-EG0_LN7gg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Mon, 21 Sep 2015 12:06:49 -0000
Content-Type: multipart/alternative;
	boundary="------------000903060906080201080109"

--------------000903060906080201080109
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2015 10:02 PM, Jussi Kukkonen wrote:
> On 21 September 2015 at 14:09, Jonathan Liu <net147@gmail.com 
> <mailto:net147@gmail.com>> wrote:
>
>     This avoids a "Could not unlink" warning when extracting a /var/run
>     symbolic link pointing to /run from the base-files package as it is
>     unable to unlink the /var/run directory when it contains opkg.lock.
>
>     This also fixes an issue where /var/run is created as a directory
>     instead of a symbolic link to /run.
>
>     Signed-off-by: Jonathan Liu <net147@gmail.com
>     <mailto:net147@gmail.com>>
>     ---
>      ...reate-opkg.lock-in-run-instead-of-var-run.patch | 34
>     ++++++++++++++++++++++
>      meta/recipes-devtools/opkg/opkg_0.3.0.bb <http://opkg_0.3.0.bb> 
>              |  1 +
>      2 files changed, 35 insertions(+)
>      create mode 100644
>     meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
>
>     diff --git
>     a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
>     b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
>     new file mode 100644
>     index 0000000..255021b
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
>     @@ -0,0 +1,34 @@
>     +From a4628a6171f393add9a2b287483ca39bb72b4dd6 Mon Sep 17 00:00:00
>     2001
>     +From: Jonathan Liu <net147@gmail.com <mailto:net147@gmail.com>>
>     +Date: Mon, 21 Sep 2015 20:23:23 +1000
>     +Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of
>     /var/run
>     +
>     +This avoids a "Could not unlink" warning when extracting a /var/run
>     +symbolic link pointing to /run from a package as it is unable to
>     +unlink the /var/run directory when it contains opkg.lock.
>     +
>     +This also fixes an issue where /var/run is created as a directory
>     +instead of a symbolic link to /run.
>     +
>     +Upstream-Status: Inappropriate [OE-Specific]
>
>
> Isn't using /run for this appropriate for everyone? I would have 
> expected this to be an uncontroversial change.
>
> Jussi
I didn't want to create a behavior change for other projects using opkg 
that aren't necessarily following the FHS 3 Draft.

Regards,
Jonathan
>
>
>     +Signed-off-by: Jonathan Liu <net147@gmail.com
>     <mailto:net147@gmail.com>>
>     +---
>     + libopkg/opkg_conf.h | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
>     +index 7bca948..5a1bc44 100644
>     +--- a/libopkg/opkg_conf.h
>     ++++ b/libopkg/opkg_conf.h
>     +@@ -40,7 +40,7 @@ extern "C" {
>     + #define OPKG_CONF_DEFAULT_STATUS_FILE  "/var/lib/opkg/status"
>     + #define OPKG_CONF_DEFAULT_CACHE_DIR  "/var/cache/opkg"
>     + #define OPKG_CONF_DEFAULT_CONF_FILE_DIR "/etc/opkg"
>     +-#define OPKG_CONF_DEFAULT_LOCK_FILE  "/var/run/opkg.lock"
>     ++#define OPKG_CONF_DEFAULT_LOCK_FILE     "/run/opkg.lock"
>     +
>     + /* In case the config file defines no dest */
>     + #define OPKG_CONF_DEFAULT_DEST_NAME "root"
>     +--
>     +2.5.0
>     +
>     diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
>     <http://opkg_0.3.0.bb> b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
>     <http://opkg_0.3.0.bb>
>     index f4dbb2d..08fb62c 100644
>     --- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb <http://opkg_0.3.0.bb>
>     +++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb <http://opkg_0.3.0.bb>
>     @@ -15,6 +15,7 @@ SRC_URI =
>     "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>     <http://downloads.yoctoproject.org/releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz>
>                 file://opkg-configure.service \
>                 file://opkg.conf \
>     file://0001-opkg_archive-add-support-for-empty-compressed-files.patch
>     \
>     +
>      file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
>     \
>      "
>
>      SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
>     --
>     2.5.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------000903060906080201080109
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 21/09/2015 10:02 PM, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_EC9LGaxGA7b9=K4kH5iEsw1XrZ0Y2ngs0p-EG0_LN7gg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 21 September 2015 at 14:09,
            Jonathan Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com" target="_blank">net147@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">This
              avoids a "Could not unlink" warning when extracting a
              /var/run<br>
              symbolic link pointing to /run from the base-files package
              as it is<br>
              unable to unlink the /var/run directory when it contains
              opkg.lock.<br>
              <br>
              This also fixes an issue where /var/run is created as a
              directory<br>
              instead of a symbolic link to /run.<br>
              <br>
              Signed-off-by: Jonathan Liu &lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
              ---<br>
               ...reate-opkg.lock-in-run-instead-of-var-run.patch | 34
              ++++++++++++++++++++++<br>
               meta/recipes-devtools/opkg/<a moz-do-not-send="true"
                href="http://opkg_0.3.0.bb" rel="noreferrer"
                target="_blank">opkg_0.3.0.bb</a>           |  1 +<br>
               2 files changed, 35 insertions(+)<br>
               create mode 100644
meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch<br>
              <br>
              diff --git
              a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch<br>
              new file mode 100644<br>
              index 0000000..255021b<br>
              --- /dev/null<br>
              +++
b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch<br>
              @@ -0,0 +1,34 @@<br>
              +From a4628a6171f393add9a2b287483ca39bb72b4dd6 Mon Sep 17
              00:00:00 2001<br>
              +From: Jonathan Liu &lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
              +Date: Mon, 21 Sep 2015 20:23:23 +1000<br>
              +Subject: [PATCH] opkg_conf: create opkg.lock in /run
              instead of /var/run<br>
              +<br>
              +This avoids a "Could not unlink" warning when extracting
              a /var/run<br>
              +symbolic link pointing to /run from a package as it is
              unable to<br>
              +unlink the /var/run directory when it contains opkg.lock.<br>
              +<br>
              +This also fixes an issue where /var/run is created as a
              directory<br>
              +instead of a symbolic link to /run.<br>
              +<br>
              +Upstream-Status: Inappropriate [OE-Specific]<br>
            </blockquote>
            <div><br>
            </div>
            <div>Isn't using /run for this appropriate for everyone? I
              would have expected this to be an uncontroversial change.</div>
            <div><br>
            </div>
            <div>Jussi</div>
          </div>
        </div>
      </div>
    </blockquote>
    I didn't want to create a behavior change for other projects using
    opkg that aren't necessarily following the FHS 3 Draft.<br>
    <br>
    Regards,<br>
    Jonathan<br>
    <blockquote
cite="mid:CAHiDW_EC9LGaxGA7b9=K4kH5iEsw1XrZ0Y2ngs0p-EG0_LN7gg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+Signed-off-by:
              Jonathan Liu &lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com">net147@gmail.com</a>&gt;<br>
              +---<br>
              + libopkg/opkg_conf.h | 2 +-<br>
              + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
              +<br>
              +diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h<br>
              +index 7bca948..5a1bc44 100644<br>
              +--- a/libopkg/opkg_conf.h<br>
              ++++ b/libopkg/opkg_conf.h<br>
              +@@ -40,7 +40,7 @@ extern "C" {<br>
              + #define OPKG_CONF_DEFAULT_STATUS_FILE 
               "/var/lib/opkg/status"<br>
              + #define OPKG_CONF_DEFAULT_CACHE_DIR   
               "/var/cache/opkg"<br>
              + #define OPKG_CONF_DEFAULT_CONF_FILE_DIR "/etc/opkg"<br>
              +-#define OPKG_CONF_DEFAULT_LOCK_FILE   
               "/var/run/opkg.lock"<br>
              ++#define OPKG_CONF_DEFAULT_LOCK_FILE     "/run/opkg.lock"<br>
              +<br>
              + /* In case the config file defines no dest */<br>
              + #define OPKG_CONF_DEFAULT_DEST_NAME "root"<br>
              +--<br>
              +2.5.0<br>
              +<br>
              diff --git a/meta/recipes-devtools/opkg/<a
                moz-do-not-send="true" href="http://opkg_0.3.0.bb"
                rel="noreferrer" target="_blank">opkg_0.3.0.bb</a>
              b/meta/recipes-devtools/opkg/<a moz-do-not-send="true"
                href="http://opkg_0.3.0.bb" rel="noreferrer"
                target="_blank">opkg_0.3.0.bb</a><br>
              index f4dbb2d..08fb62c 100644<br>
              --- a/meta/recipes-devtools/opkg/<a moz-do-not-send="true"
                href="http://opkg_0.3.0.bb" rel="noreferrer"
                target="_blank">opkg_0.3.0.bb</a><br>
              +++ b/meta/recipes-devtools/opkg/<a moz-do-not-send="true"
                href="http://opkg_0.3.0.bb" rel="noreferrer"
                target="_blank">opkg_0.3.0.bb</a><br>
              @@ -15,6 +15,7 @@ SRC_URI = "<a moz-do-not-send="true"
href="http://downloads.yoctoproject.org/releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz"
                rel="noreferrer" target="_blank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz</a><br>
                          <a class="moz-txt-link-freetext" href="file://opkg-configure.service">file://opkg-configure.service</a> \<br>
                          <a class="moz-txt-link-freetext" href="file://opkg.conf">file://opkg.conf</a> \<br>
                         
              <a class="moz-txt-link-freetext" href="file://0001-opkg_archive-add-support-for-empty-compressed-files.patch">file://0001-opkg_archive-add-support-for-empty-compressed-files.patch</a>
              \<br>
              +         
               <a class="moz-txt-link-freetext" href="file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch">file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch</a>
              \<br>
               "<br>
              <br>
               SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"<br>
              <span class="HOEnZb"><font color="#888888">--<br>
                  2.5.0<br>
                  <br>
                  --<br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                </font></span></blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000903060906080201080109--
