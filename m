Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCDA65C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:47:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8L1lbF2001792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 20 Sep 2016 18:47:37 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 18:47:36 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
	<CAJTo0LZaBtwGJDHcAQ1Z0oMeqYKHAFD+k0YqbEYX5LjmDEbmDw@mail.gmail.com>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <ce02644c-a5e2-b792-883d-1e8a10942533@windriver.com>
Date: Wed, 21 Sep 2016 09:47:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZaBtwGJDHcAQ1Z0oMeqYKHAFD+k0YqbEYX5LjmDEbmDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Wed, 21 Sep 2016 01:47:37 -0000
X-Groupsio-MsgNum: 87328
Content-Type: multipart/mixed; boundary="------------27F9111CCC6928F46E21A37F"

--------------27F9111CCC6928F46E21A37F
Content-Type: multipart/alternative;
	boundary="------------2F44F15EEDA17ACC407E0040"

--------------2F44F15EEDA17ACC407E0040
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, commit message revised.

Best,
Yuanjie

On 09/20/2016 09:35 PM, Burton, Ross wrote:
>
> On 20 September 2016 at 10:19, Yuanjie Huang 
> <Yuanjie.Huang@windriver.com <mailto:Yuanjie.Huang@windriver.com>> wrote:
>
>     Upstream-Status: Inappropriate [embedded specific]
>     (LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-09-20
>
>
> You don't need upstream-status tags in commit messages, only patches 
> that the recipe is applying.
>
> Also please remove your internal tracking data from the commit message.
>
> Ross


--------------2F44F15EEDA17ACC407E0040
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Thanks, commit message revised.<br>
    </p>
    Best,<br>
    Yuanjie<br>
    <br>
    <div class="moz-cite-prefix">On 09/20/2016 09:35 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZaBtwGJDHcAQ1Z0oMeqYKHAFD+k0YqbEYX5LjmDEbmDw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 20 September 2016 at 10:19,
            Yuanjie Huang <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Yuanjie.Huang@windriver.com"
                target="_blank">Yuanjie.Huang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2y7" class="a3s aXjCH m15746e5ea2c5b0fc">Upstream-Status:
                Inappropriate [embedded specific]<br>
                (LOCAL REV; NOT UPSTREAM) -- sent to oe-core on
                2016-09-20</div>
            </blockquote>
          </div>
          <br>
          You don't need upstream-status tags in commit messages, only
          patches that the recipe is applying.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Also please remove your internal
          tracking data from the commit message.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2F44F15EEDA17ACC407E0040--

--------------27F9111CCC6928F46E21A37F
Content-Type: text/x-patch;
	name="0001-gcc-sanitizers-Fix-libtool-library-files.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-gcc-sanitizers-Fix-libtool-library-files.patch"

From 6ceafbc3a69a0b87bcddf718050c6958baab7759 Mon Sep 17 00:00:00 2001
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Date: Sun, 18 Sep 2016 16:36:55 +0800
Subject: [PATCH V2] gcc-sanitizers: Fix libtool library files

Since libtool sysroot is not set when compiling sanitizers, the libtool
does no prefix the dependency path correctly. Fix it, so that programs
can link to sanitizer libraries without error.

This patch changes the depenedency_libs line in libasan.la and
libusan.la from
	dependency_libs=' -lpthread -ldl '/usr/lib'/libstdc++.la '/usr/lib'/libstdc++.la'
to
	dependency_libs=' -lpthread -ldl =/usr/lib/libstdc++.la =/usr/lib/libstdc++.la'

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index c987ccb..5fe5eaf 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -50,6 +50,8 @@ do_install () {
         rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
     fi
     chown -R root:root ${D}
+    # Fix broken libtool with stdc++, as sysroot is not set.
+    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'/usr/lib'@=/usr/lib@g" {} \;
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.9.1


--------------27F9111CCC6928F46E21A37F--
