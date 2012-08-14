Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T1GDc-0001wW-0P
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:27:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2012 05:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; 
	d="scan'208,217";a="208120841"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 05:15:03 -0700
Message-ID: <502A41C7.4030009@intel.com>
Date: Tue, 14 Aug 2012 15:17:11 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
	<20120814112542.GA3444@ad.chargestorm.se>
	<502A3A08.8020506@intel.com>
	<20120814120153.GB3444@ad.chargestorm.se>
In-Reply-To: <20120814120153.GB3444@ad.chargestorm.se>
Subject: Re: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:33 -0000
Content-Type: multipart/alternative;
	boundary="------------010103060605030603000308"

--------------010103060605030603000308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/14/2012 03:01 PM, Anders Darander wrote:
> * Radu Moisan <radu.moisan@intel.com> [120814 13:42]:
>
>
>> On 08/14/2012 02:25 PM, Anders Darander wrote:
>>> * Radu Moisan <radu.moisan@intel.com> [120814 11:01]:
>>>
>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>> ---
>>>>    .../B921600.patch                                  |    0
>>>>    .../busybox-appletlib-dependency.patch             |    0
>>>>    .../busybox-mkfs-minix-tests_bigendian.patch       |    0
>>>>    .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++-----------
>>>>    .../{busybox-1.19.4 => busybox-1.20.2}/defconfig   |    0
>>> Are there no changes to the configuration file? I.e. new and removed
>>> options?
>> None that I know about, I've took a quick look over the changelog but
>> nothing cought my eye. I you find anything, just point it out and I'll
>> deep dive on it.
> Could you diff the generated .config between 1.19.4 and 1.20.2?
>
> This would allow us to see the differences.
diff --git a/../../busybox-1.19.4-r13/busybox-1.19.4/.config b/.config
index 61321dd..9be989b 100644
--- a/../../busybox-1.19.4-r13/busybox-1.19.4/.config
+++ b/.config
@@ -1,7 +1,7 @@
  #
  # Automatically generated make config: don't edit
-# Busybox version: 1.19.4
-# Tue Aug 14 11:20:02 2012
+# Busybox version: 1.20.2
+# Tue Aug 14 12:31:54 2012
  #
  CONFIG_HAVE_DOT_CONFIG=y

@@ -62,7 +62,10 @@ CONFIG_FEATURE_HAVE_RPC=y
  # CONFIG_FEATURE_SHARED_BUSYBOX is not set
  CONFIG_LFS=y
  CONFIG_CROSS_COMPILER_PREFIX="i586-poky-linux-"
+CONFIG_SYSROOT=""
  CONFIG_EXTRA_CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types"
+CONFIG_EXTRA_LDFLAGS=""
+CONFIG_EXTRA_LDLIBS=""

  #
  # Debugging Options
@@ -92,7 +95,7 @@ CONFIG_PREFIX="./_install"
  CONFIG_FEATURE_SYSTEMD=y
  CONFIG_FEATURE_RTMINMAX=y
  CONFIG_PASSWORD_MINLEN=6
-CONFIG_MD5_SIZE_VS_SPEED=2
+CONFIG_MD5_SMALL=1
  CONFIG_FEATURE_FAST_TOP=y
  # CONFIG_FEATURE_ETC_NETWORKS is not set
  CONFIG_FEATURE_USE_TERMIOS=y
@@ -101,6 +104,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024
  # CONFIG_FEATURE_EDITING_VI is not set
  CONFIG_FEATURE_EDITING_HISTORY=15
  CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
  # CONFIG_FEATURE_REVERSE_SEARCH is not set
  CONFIG_FEATURE_TAB_COMPLETION=y
  CONFIG_FEATURE_USERNAME_COMPLETION=y
@@ -140,6 +144,7 @@ CONFIG_CPIO=y
  CONFIG_GUNZIP=y
  CONFIG_GZIP=y
  # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
+CONFIG_GZIP_FAST=0
  # CONFIG_LZOP is not set
  # CONFIG_LZOP_COMPR_HIGH is not set
  # CONFIG_RPM2CPIO is not set
@@ -173,11 +178,13 @@ CONFIG_DATE=y
  # CONFIG_FEATURE_DATE_ISOFMT is not set
  # CONFIG_FEATURE_DATE_NANO is not set
  CONFIG_FEATURE_DATE_COMPAT=y
+# CONFIG_HOSTID is not set
  CONFIG_ID=y
  CONFIG_GROUPS=y
  CONFIG_TEST=y
  CONFIG_FEATURE_TEST_64=y
  CONFIG_TOUCH=y
+CONFIG_FEATURE_TOUCH_SUSV3=y
  CONFIG_TR=y
  CONFIG_FEATURE_TR_CLASSES=y
  # CONFIG_FEATURE_TR_EQUIV is not set
@@ -220,7 +227,6 @@ CONFIG_FALSE=y
  # CONFIG_FSYNC is not set
  CONFIG_HEAD=y
  # CONFIG_FEATURE_FANCY_HEAD is not set
-# CONFIG_HOSTID is not set
  # CONFIG_INSTALL is not set
  # CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
  CONFIG_LN=y
@@ -461,6 +467,7 @@ CONFIG_LAST_SYSTEM_ID=0
  # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
  # CONFIG_GETTY is not set
  # CONFIG_LOGIN is not set
+# CONFIG_LOGIN_SESSION_AS_CHILD is not set
  # CONFIG_PAM is not set
  # CONFIG_LOGIN_SCRIPTS is not set
  # CONFIG_FEATURE_NOLOGIN is not set
@@ -469,6 +476,7 @@ CONFIG_LAST_SYSTEM_ID=0
  # CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
  # CONFIG_CRYPTPW is not set
  # CONFIG_CHPASSWD is not set
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
  # CONFIG_SU is not set
  # CONFIG_FEATURE_SU_SYSLOG is not set
  # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
@@ -518,6 +526,12 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
  # Linux System Utilities
  #
  # CONFIG_BLOCKDEV is not set
+# CONFIG_MDEV is not set
+# CONFIG_FEATURE_MDEV_CONF is not set
+# CONFIG_FEATURE_MDEV_RENAME is not set
+# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
+# CONFIG_FEATURE_MDEV_EXEC is not set
+# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
  # CONFIG_REV is not set
  # CONFIG_ACPID is not set
  # CONFIG_FEATURE_ACPID_COMPAT is not set
@@ -561,12 +575,6 @@ CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
  CONFIG_LOSETUP=y
  # CONFIG_LSPCI is not set
  # CONFIG_LSUSB is not set
-# CONFIG_MDEV is not set
-# CONFIG_FEATURE_MDEV_CONF is not set
-# CONFIG_FEATURE_MDEV_RENAME is not set
-# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
-# CONFIG_FEATURE_MDEV_EXEC is not set
-# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
  CONFIG_MKSWAP=y
  # CONFIG_FEATURE_MKSWAP_UUID is not set
  CONFIG_MORE=y
@@ -831,6 +839,7 @@ CONFIG_TRACEROUTE=y
  # CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
  # CONFIG_TUNCTL is not set
  # CONFIG_FEATURE_TUNCTL_UG is not set
+# CONFIG_UDHCPC6 is not set
  CONFIG_UDHCPD=y
  # CONFIG_DHCPRELAY is not set
  CONFIG_DUMPLEASES=y
@@ -877,6 +886,7 @@ CONFIG_FEATURE_MIME_CHARSET=""
  # Process Utilities
  #
  # CONFIG_IOSTAT is not set
+CONFIG_LSOF=y
  # CONFIG_MPSTAT is not set
  # CONFIG_NMETER is not set
  # CONFIG_PMAP is not set
@@ -898,6 +908,7 @@ CONFIG_PIDOF=y
  # CONFIG_PKILL is not set
  CONFIG_PS=y
  CONFIG_FEATURE_PS_WIDE=y
+CONFIG_FEATURE_PS_LONG=y
  # CONFIG_FEATURE_PS_TIME is not set
  # CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
  # CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set


--------------010103060605030603000308
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 08/14/2012 03:01 PM, Anders Darander
      wrote:<br>
    </div>
    <blockquote cite="mid:20120814120153.GB3444@ad.chargestorm.se"
      type="cite">
      <pre wrap="">* Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a> [120814 13:42]:


</pre>
      <blockquote type="cite">
        <pre wrap="">On 08/14/2012 02:25 PM, Anders Darander wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">* Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a> [120814 11:01]:

</pre>
          <blockquote type="cite">
            <pre wrap="">Signed-off-by: Radu Moisan <a class="moz-txt-link-rfc2396E" href="mailto:radu.moisan@intel.com">&lt;radu.moisan@intel.com&gt;</a>
---
  .../B921600.patch                                  |    0
  .../busybox-appletlib-dependency.patch             |    0
  .../busybox-mkfs-minix-tests_bigendian.patch       |    0
  .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++-----------
  .../{busybox-1.19.4 =&gt; busybox-1.20.2}/defconfig   |    0
</pre>
          </blockquote>
          <pre wrap="">Are there no changes to the configuration file? I.e. new and removed
options?
</pre>
        </blockquote>
        <pre wrap="">None that I know about, I've took a quick look over the changelog but 
nothing cought my eye. I you find anything, just point it out and I'll 
deep dive on it.
</pre>
      </blockquote>
      <pre wrap="">
Could you diff the generated .config between 1.19.4 and 1.20.2?

This would allow us to see the differences.
</pre>
    </blockquote>
    <small><font face="Droid Sans Mono">diff --git
        a/../../busybox-1.19.4-r13/busybox-1.19.4/.config b/.config<br>
        index 61321dd..9be989b 100644<br>
        --- a/../../busybox-1.19.4-r13/busybox-1.19.4/.config<br>
        +++ b/.config<br>
        @@ -1,7 +1,7 @@<br>
        &nbsp;#<br>
        &nbsp;# Automatically generated make config: don't edit<br>
        -# Busybox version: 1.19.4<br>
        -# Tue Aug 14 11:20:02 2012<br>
        +# Busybox version: 1.20.2<br>
        +# Tue Aug 14 12:31:54 2012<br>
        &nbsp;#<br>
        &nbsp;CONFIG_HAVE_DOT_CONFIG=y<br>
        &nbsp;<br>
        @@ -62,7 +62,10 @@ CONFIG_FEATURE_HAVE_RPC=y<br>
        &nbsp;# CONFIG_FEATURE_SHARED_BUSYBOX is not set<br>
        &nbsp;CONFIG_LFS=y<br>
        &nbsp;CONFIG_CROSS_COMPILER_PREFIX="i586-poky-linux-"<br>
        +CONFIG_SYSROOT=""<br>
        &nbsp;CONFIG_EXTRA_CFLAGS=" -O2 -pipe -g
        -feliminate-unused-debug-types"<br>
        +CONFIG_EXTRA_LDFLAGS=""<br>
        +CONFIG_EXTRA_LDLIBS=""<br>
        &nbsp;<br>
        &nbsp;#<br>
        &nbsp;# Debugging Options<br>
        @@ -92,7 +95,7 @@ CONFIG_PREFIX="./_install"<br>
        &nbsp;CONFIG_FEATURE_SYSTEMD=y<br>
        &nbsp;CONFIG_FEATURE_RTMINMAX=y<br>
        &nbsp;CONFIG_PASSWORD_MINLEN=6<br>
        -CONFIG_MD5_SIZE_VS_SPEED=2<br>
        +CONFIG_MD5_SMALL=1<br>
        &nbsp;CONFIG_FEATURE_FAST_TOP=y<br>
        &nbsp;# CONFIG_FEATURE_ETC_NETWORKS is not set<br>
        &nbsp;CONFIG_FEATURE_USE_TERMIOS=y<br>
        @@ -101,6 +104,7 @@ CONFIG_FEATURE_EDITING_MAX_LEN=1024<br>
        &nbsp;# CONFIG_FEATURE_EDITING_VI is not set<br>
        &nbsp;CONFIG_FEATURE_EDITING_HISTORY=15<br>
        &nbsp;CONFIG_FEATURE_EDITING_SAVEHISTORY=y<br>
        +# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set<br>
        &nbsp;# CONFIG_FEATURE_REVERSE_SEARCH is not set<br>
        &nbsp;CONFIG_FEATURE_TAB_COMPLETION=y<br>
        &nbsp;CONFIG_FEATURE_USERNAME_COMPLETION=y<br>
        @@ -140,6 +144,7 @@ CONFIG_CPIO=y<br>
        &nbsp;CONFIG_GUNZIP=y<br>
        &nbsp;CONFIG_GZIP=y<br>
        &nbsp;# CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set<br>
        +CONFIG_GZIP_FAST=0<br>
        &nbsp;# CONFIG_LZOP is not set<br>
        &nbsp;# CONFIG_LZOP_COMPR_HIGH is not set<br>
        &nbsp;# CONFIG_RPM2CPIO is not set<br>
        @@ -173,11 +178,13 @@ CONFIG_DATE=y<br>
        &nbsp;# CONFIG_FEATURE_DATE_ISOFMT is not set<br>
        &nbsp;# CONFIG_FEATURE_DATE_NANO is not set<br>
        &nbsp;CONFIG_FEATURE_DATE_COMPAT=y<br>
        +# CONFIG_HOSTID is not set<br>
        &nbsp;CONFIG_ID=y<br>
        &nbsp;CONFIG_GROUPS=y<br>
        &nbsp;CONFIG_TEST=y<br>
        &nbsp;CONFIG_FEATURE_TEST_64=y<br>
        &nbsp;CONFIG_TOUCH=y<br>
        +CONFIG_FEATURE_TOUCH_SUSV3=y<br>
        &nbsp;CONFIG_TR=y<br>
        &nbsp;CONFIG_FEATURE_TR_CLASSES=y<br>
        &nbsp;# CONFIG_FEATURE_TR_EQUIV is not set<br>
        @@ -220,7 +227,6 @@ CONFIG_FALSE=y<br>
        &nbsp;# CONFIG_FSYNC is not set<br>
        &nbsp;CONFIG_HEAD=y<br>
        &nbsp;# CONFIG_FEATURE_FANCY_HEAD is not set<br>
        -# CONFIG_HOSTID is not set<br>
        &nbsp;# CONFIG_INSTALL is not set<br>
        &nbsp;# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set<br>
        &nbsp;CONFIG_LN=y<br>
        @@ -461,6 +467,7 @@ CONFIG_LAST_SYSTEM_ID=0<br>
        &nbsp;# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set<br>
        &nbsp;# CONFIG_GETTY is not set<br>
        &nbsp;# CONFIG_LOGIN is not set<br>
        +# CONFIG_LOGIN_SESSION_AS_CHILD is not set<br>
        &nbsp;# CONFIG_PAM is not set<br>
        &nbsp;# CONFIG_LOGIN_SCRIPTS is not set<br>
        &nbsp;# CONFIG_FEATURE_NOLOGIN is not set<br>
        @@ -469,6 +476,7 @@ CONFIG_LAST_SYSTEM_ID=0<br>
        &nbsp;# CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set<br>
        &nbsp;# CONFIG_CRYPTPW is not set<br>
        &nbsp;# CONFIG_CHPASSWD is not set<br>
        +CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""<br>
        &nbsp;# CONFIG_SU is not set<br>
        &nbsp;# CONFIG_FEATURE_SU_SYSLOG is not set<br>
        &nbsp;# CONFIG_FEATURE_SU_CHECKS_SHELLS is not set<br>
        @@ -518,6 +526,12 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"<br>
        &nbsp;# Linux System Utilities<br>
        &nbsp;#<br>
        &nbsp;# CONFIG_BLOCKDEV is not set<br>
        +# CONFIG_MDEV is not set<br>
        +# CONFIG_FEATURE_MDEV_CONF is not set<br>
        +# CONFIG_FEATURE_MDEV_RENAME is not set<br>
        +# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set<br>
        +# CONFIG_FEATURE_MDEV_EXEC is not set<br>
        +# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set<br>
        &nbsp;# CONFIG_REV is not set<br>
        &nbsp;# CONFIG_ACPID is not set<br>
        &nbsp;# CONFIG_FEATURE_ACPID_COMPAT is not set<br>
        @@ -561,12 +575,6 @@ CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y<br>
        &nbsp;CONFIG_LOSETUP=y<br>
        &nbsp;# CONFIG_LSPCI is not set<br>
        &nbsp;# CONFIG_LSUSB is not set<br>
        -# CONFIG_MDEV is not set<br>
        -# CONFIG_FEATURE_MDEV_CONF is not set<br>
        -# CONFIG_FEATURE_MDEV_RENAME is not set<br>
        -# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set<br>
        -# CONFIG_FEATURE_MDEV_EXEC is not set<br>
        -# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set<br>
        &nbsp;CONFIG_MKSWAP=y<br>
        &nbsp;# CONFIG_FEATURE_MKSWAP_UUID is not set<br>
        &nbsp;CONFIG_MORE=y<br>
        @@ -831,6 +839,7 @@ CONFIG_TRACEROUTE=y<br>
        &nbsp;# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set<br>
        &nbsp;# CONFIG_TUNCTL is not set<br>
        &nbsp;# CONFIG_FEATURE_TUNCTL_UG is not set<br>
        +# CONFIG_UDHCPC6 is not set<br>
        &nbsp;CONFIG_UDHCPD=y<br>
        &nbsp;# CONFIG_DHCPRELAY is not set<br>
        &nbsp;CONFIG_DUMPLEASES=y<br>
        @@ -877,6 +886,7 @@ CONFIG_FEATURE_MIME_CHARSET=""<br>
        &nbsp;# Process Utilities<br>
        &nbsp;#<br>
        &nbsp;# CONFIG_IOSTAT is not set<br>
        +CONFIG_LSOF=y<br>
        &nbsp;# CONFIG_MPSTAT is not set<br>
        &nbsp;# CONFIG_NMETER is not set<br>
        &nbsp;# CONFIG_PMAP is not set<br>
        @@ -898,6 +908,7 @@ CONFIG_PIDOF=y<br>
        &nbsp;# CONFIG_PKILL is not set<br>
        &nbsp;CONFIG_PS=y<br>
        &nbsp;CONFIG_FEATURE_PS_WIDE=y<br>
        +CONFIG_FEATURE_PS_LONG=y<br>
        &nbsp;# CONFIG_FEATURE_PS_TIME is not set<br>
        &nbsp;# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set<br>
        &nbsp;# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set<br>
      </font></small><br>
  </body>
</html>

--------------010103060605030603000308--
