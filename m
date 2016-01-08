Return-Path: <Fupan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3E6C7317D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 01:53:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u081rQhU007788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jan 2016 17:53:26 -0800 (PST)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Jan 2016 17:53:26 -0800
Message-ID: <568F1691.2070108@windriver.com>
Date: Fri, 8 Jan 2016 09:53:21 +0800
From: fupan <fupan.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1450936283-177234-1-git-send-email-fupan.li@windriver.com>
	<CAJTo0LYOiCPGMYE2BTeZD0hyhfLcO0KALR7pmDhr23jGNcdytg@mail.gmail.com>
In-Reply-To: <CAJTo0LYOiCPGMYE2BTeZD0hyhfLcO0KALR7pmDhr23jGNcdytg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-core:package_manager extract target arch from TARGET_SYS and add it into package_archs
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
X-List-Received-Date: Fri, 08 Jan 2016 01:53:28 -0000
X-Groupsio-MsgNum: 75622
Content-Type: multipart/mixed; boundary="------------010609070909070303040803"

--------------010609070909070303040803
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/07/2016 10:23 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYOiCPGMYE2BTeZD0hyhfLcO0KALR7pmDhr23jGNcdytg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 24 December 2015 at 05:51, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:fupan.li@windriver.com" target="_blank">fupan.li@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2v9" class="a3s" style="overflow:hidden">+     
                      #add the compatible arch extracted from <span
                  class="il">TARGET_SYS</span>.<br>
                +            #<span class="il">TARGET_SYS</span> usually
                values as "arm-poky-linux-gnueabi",<br>
                +            #so the arch is 'arm'<br>
                +            <span class="il">target_sys</span> =
                self.d.getVar("<span class="il">TARGET_SYS</span>",
                True)<br>
                +            if <span class="il">target_sys</span>:<br>
                +                target_arch = <span class="il">target_sys</span>.split('-')[0]<br>
                +            if target_arch not in
                package_archs['default']:<br>
                +               
                package_archs['default'].append(target_arch)<br>
                +</div>
            </blockquote>
          </div>
          <br>
          Isn't this a long-winded way of getting ${TARGET_ARCH}?</div>
      </div>
    </blockquote>
    Hi, Ross<br>
    <br>
    You are right, actually <span class="il">TARGET_SYS's arch
      substring comes from<br>
    </span><span class="il">TARGET_ARCH.<br>
      Thanks for pointing it out. <br>
      <br>
      I formated a V2 patch using </span><span class="il">TARGET_ARCH
      directly!<br>
      <br>
      <br>
      Fupan<br>
    </span>
    <blockquote
cite="mid:CAJTo0LYOiCPGMYE2BTeZD0hyhfLcO0KALR7pmDhr23jGNcdytg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010609070909070303040803
Content-Type: text/x-diff;
	name="0001-oe-core-package_manager-add-TARGET_ARCH-into-package.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-oe-core-package_manager-add-TARGET_ARCH-into-package.pa";
	filename*1="tch"

From 705e8b05d97b23aec40d5b84208531f0d5b8391e Mon Sep 17 00:00:00 2001
From: fli <fupan.li@windriver.com>
Date: Thu, 17 Dec 2015 22:19:27 -0800
Subject: [PATCH] V2 oe-core:package_manager add TARGET_ARCH into package_archs

Since the rpmbuild on the target will use TARGET_SYS as the
'target' to build the source rpm packages, which will extracted
the target arch from TARGET_SYS, such as if TARGET_SYS values
'arm-wrs-linux-gnueabi', the target arch will be 'arm'.

And TARGET_SYS's arch substring comes from 'TARGET_ARCH', thus
in order to make the rpm pkgs built out on the target compatilbe
with target, add 'TARGET_ARCH' into package archs which will be
write into the rootfs's /etc/rpm/platform.

Signed-off-by: fli <fupan.li@windriver.com>
---
 meta/lib/oe/package_manager.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 30f998a..fbd4563 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -55,6 +55,12 @@ class RpmIndexer(Indexer):
             target_os['default'] = self.d.getVar(os_var, True).strip()
         else:
             package_archs['default'] = self.d.getVar("PACKAGE_ARCHS", True).split()
+
+            #add the TARGET_ARCH to target package archs.
+            target_arch = self.d.getVar("TARGET_ARCH", True)
+            if target_arch not in package_archs['default']:
+                package_archs['default'].append(target_arch)
+                
             # arch order is reversed.  This ensures the -best- match is
             # listed first!
             package_archs['default'].reverse()
-- 
1.9.1


--------------010609070909070303040803--
