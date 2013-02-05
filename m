Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U2cTT-0002H9-ON
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 07:57:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r156ft0X002294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Feb 2013 22:41:55 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 4 Feb 2013 22:41:54 -0800
Message-ID: <5110A9D1.20208@windriver.com>
Date: Tue, 5 Feb 2013 14:42:25 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
	<510C0FF1.2010400@linux.intel.com>
	<CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
In-Reply-To: <CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Patches,
	Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 06:57:49 -0000
X-Groupsio-MsgNum: 34968
Content-Type: multipart/mixed; boundary="------------050105040600050402060206"

--------------050105040600050402060206
Content-Type: multipart/alternative;
	boundary="------------040200000107030609000303"

--------------040200000107030609000303
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2013 03:08 AM, Bruce Ashfield wrote:
>
>
>
> On Fri, Feb 1, 2013 at 1:56 PM, Saul Wold <sgw@linux.intel.com 
> <mailto:sgw@linux.intel.com>> wrote:
>
>     On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
>
>
>
>
>         On Fri, Feb 1, 2013 at 4:00 AM, <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>
>         <mailto:Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>>
>         wrote:
>
>             From: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com> <mailto:Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>>
>
>
>             Add config fragments to busybox.
>
>             Both the implementation and the use case are similar to
>         yocto kernel's
>             configuration fragments.
>
>
>         I can fairly easily tweak the configuration parts of the
>         kern-tools to
>         handle this
>         use case as well. That would allow us to re-use the kernel's
>         merge_config.sh
>         script (with a minor dependency change) and save some
>         duplicated code. It
>         also gets you the advantage that you can consolidate
>         configuration fragments
>         outside of any build system, which isn't as critical here, but
>         something
>         that
>         is used quite a bit during kernel testing.
>
>     Bruce,
>
>     Where is the merge_config.sh script today?  Would you propose
>     moving it to the scripts dir and have the busybox recipe call it?
>
>
> It's part of the mainline kernel, hence why grabbing the guts out of 
> it reproducing
> it here isn't the best idea, we'll have a need to keep them in sync. 
> In fact, I have
> 2 or 3 pending patches for it in the kern-tools repository that I need 
> to get upstream
> (as an example).
>
> I'd propose either creating a separate recipe for it (i.e. like 
> kconfig-frontends) or I could
> keep it in kern-tools (badly named, but we can work on that ;) and 
> maintain / coordinate
> changes to it.
>
> I just don't want to see the effort happen twice, we are busy enough!
>
>
>     What would be your timing on making such a change, ie hold this
>     patch until your get it merge or merge this and then fix it when
>     you merge your changes?
>
>
> I could feasibly get it done in the next few weeks, the changes aren't 
> bug, I just
> have to avoid regressions on either side (kernel or busy box).
>
> That being said, the interface to the SRC_URI is the same for the two, 
> so if we are
> ok with me arriving and removing the in-recipe support, I guess I 
> can't object too
> much :) The only risk is that if anyone starts using this first 
> support immediately,
> I do risk regressing their use case, where if it never goes in, that 
> won't happen.
>
> Cheers,
>
> Bruce
>
>

Hi Bruce,

I just tried to reuse the kernel's merge_config.sh script, and it turned 
out well.
The patch is in attachment.

Is it enough for now?
If so, I'll send out the patch.

Thanks,
Chen Qi

--------------040200000107030609000303
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/02/2013 03:08 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Fri, Feb 1, 2013 at 1:56 PM, Saul
            Wold <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:sgw@linux.intel.com" target="_blank">sgw@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="im">On 02/01/2013 06:18 AM, Bruce Ashfield
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div class="im">
                  <br>
                  <br>
                  <br>
                  On Fri, Feb 1, 2013 at 4:00 AM, &lt;<a
                    moz-do-not-send="true"
                    href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a><br>
                </div>
                &lt;mailto:<a moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;&gt;
                wrote:<br>
                <br>
                &nbsp; &nbsp; From: Chen Qi &lt;<a moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>
                &lt;mailto:<a moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;&gt;
                <div class="im">
                  <br>
                  <br>
                  &nbsp; &nbsp; Add config fragments to busybox.<br>
                  <br>
                  &nbsp; &nbsp; Both the implementation and the use case are
                  similar to yocto kernel's<br>
                  &nbsp; &nbsp; configuration fragments.<br>
                  <br>
                  <br>
                  I can fairly easily tweak the configuration parts of
                  the kern-tools to<br>
                  handle this<br>
                  use case as well. That would allow us to re-use the
                  kernel's merge_config.sh<br>
                  script (with a minor dependency change) and save some
                  duplicated code. It<br>
                  also gets you the advantage that you can consolidate
                  configuration fragments<br>
                  outside of any build system, which isn't as critical
                  here, but something<br>
                  that<br>
                  is used quite a bit during kernel testing.<br>
                  <br>
                </div>
              </blockquote>
              Bruce,<br>
              <br>
              Where is the merge_config.sh script today? &nbsp;Would you
              propose moving it to the scripts dir and have the busybox
              recipe call it?<br>
            </blockquote>
            <div><br>
            </div>
            <div style="">It's part of the mainline kernel, hence why
              grabbing the guts out of it reproducing&nbsp;</div>
            <div style="">it here isn't the best idea, we'll have a need
              to keep them in sync. In fact, I have</div>
            <div style="">2 or 3 pending patches for it in the
              kern-tools repository that I need to get upstream</div>
            <div style="">
              (as an example).</div>
            <div style=""><br>
            </div>
            <div style="">I'd propose either creating a separate recipe
              for it (i.e. like kconfig-frontends) or I could</div>
            <div style="">keep it in kern-tools (badly named, but we can
              work on that ;) and maintain / coordinate</div>
            <div style="">changes to it.</div>
            <div style=""><br>
            </div>
            <div style="">I just don't want to see the effort happen
              twice, we are busy enough!</div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              What would be your timing on making such a change, ie hold
              this patch until your get it merge or merge this and then
              fix it when you merge your changes?<br>
            </blockquote>
            <div><br>
            </div>
            <div style="">I could feasibly get it done in the next few
              weeks, the changes aren't bug, I just</div>
            <div style="">have to avoid regressions on either side
              (kernel or busy box).&nbsp;</div>
            <div style=""><br>
            </div>
            <div style="">That being said, the interface to the SRC_URI
              is the same for the two, so if we are</div>
            <div style="">ok with me arriving and removing the in-recipe
              support, I guess I can't object too</div>
            <div style="">much :) The only risk is that if anyone starts
              using this first support immediately,&nbsp;</div>
            <div style="">I do risk regressing their use case, where if
              it never goes in, that won't happen.</div>
            <div style=""><br>
            </div>
            <div style="">Cheers,</div>
            <div style=""><br>
            </div>
            <div style="">Bruce</div>
            <div style=""><br>
            </div>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Bruce,<br>
    <br>
    I just tried to reuse the kernel's merge_config.sh script, and it
    turned out well.<br>
    The patch is in attachment.<br>
    <br>
    Is it enough for now?<br>
    If so, I'll send out the patch.<br>
    <br>
    Thanks,<br>
    Chen Qi<br>
  </body>
</html>

--------------040200000107030609000303--

--------------050105040600050402060206
Content-Type: text/x-patch; name="0001-busybox-add-config-fragments.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-busybox-add-config-fragments.patch"

From a9d36bf24f349f046e9b65ccf4af3352c4dedabf Mon Sep 17 00:00:00 2001
From: Chen Qi <Qi.Chen@windriver.com>
Date: Tue, 5 Feb 2013 14:36:40 +0800
Subject: [PATCH] busybox: add config fragments

Add config fragments to busybox.

The implementation makes use of merge_config.sh script in kern-tools-native.
The use case is similar to the yocto kernel's configuration fragments.

[YOCTO #3379]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 972e7d0..6ed5e09 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -37,6 +37,8 @@ RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
 inherit cml1 update-rc.d
 
+do_config[depends] = "kern-tools-native:do_populate_sysroot"
+
 # internal helper
 def busybox_cfg(feature, features, tokens, cnf, rem):
 	if type(tokens) == type(""):
@@ -112,8 +114,19 @@ do_prepare_config () {
 	fi
 }
 
+# returns all the elements from the src uri that are .cfg files
+def find_cfgs(d):
+    sources=src_patches(d, True)
+    sources_list=[]
+    for s in sources:
+        if s.endswith('.cfg'):
+            sources_list.append(s)
+
+    return sources_list
+
 do_configure () {
 	do_prepare_config
+	merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
 	cml1_do_configure
 }
 
-- 
1.7.9.5


--------------050105040600050402060206--
