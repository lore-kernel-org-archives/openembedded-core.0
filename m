Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05AC774EC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:11:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5MAAwdv017885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jun 2018 03:11:19 -0700
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 22 Jun 2018 03:10:58 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180619102418.116397-1-zhixiong.chi@windriver.com>
	<CA+chaQfC+a1md3jn3CMe192Rt1Yfj2kgh+rwcPgmVnbtaBDLJA@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <f2f85bea-2f75-63d0-83b7-2a3c2d2476a6@windriver.com>
Date: Fri, 22 Jun 2018 18:11:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfC+a1md3jn3CMe192Rt1Yfj2kgh+rwcPgmVnbtaBDLJA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] findutils: make -delete honour the -ignore_readdir_race option
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
X-List-Received-Date: Fri, 22 Jun 2018 10:11:45 -0000
Content-Type: multipart/alternative;
	boundary="------------30DF3DC43AE6E2DD5F219D7D"
Content-Language: en-US

--------------30DF3DC43AE6E2DD5F219D7D
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I have a try it by using the latest version, I can see it now and I will 
resend a patch to update the old patch.

Thanks.


On 2018年06月22日 17:23, Martin Jansa wrote:
> Does it apply cleanly for you? I'm seeing:
>
> WARNING: findutils-4.6.0-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to 
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch 
> 0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
> patching file NEWS
> Hunk #1 succeeded at 42 with fuzz 2.
> patching file doc/find.texi
> patching file find/find.1
> Hunk #1 succeeded at 479 with fuzz 1.
> patching file find/pred.c
>
> Now at patch 
> 0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>
> On Tue, Jun 19, 2018 at 12:25 PM Zhixiong Chi 
> <zhixiong.chi@windriver.com <mailto:zhixiong.chi@windriver.com>> wrote:
>
>     the '-delete' action no longer complains about disappeared files
>     when the '-ignore_readdir_race' option is given, too. That action
>     will also returns true in such a case now.
>
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com
>     <mailto:zhixiong.chi@windriver.com>>
>     ---
>      ...-honour-the-ignore_readdir_race-opti.patch | 145
>     ++++++++++++++++++
>      .../findutils/findutils_4.6.0.bb <http://findutils_4.6.0.bb>    
>             |   4 +-
>      2 files changed, 148 insertions(+), 1 deletion(-)
>      create mode 100644
>     meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>
>     diff --git
>     a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>     b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>     new file mode 100644
>     index 0000000000..45e499a184
>     --- /dev/null
>     +++
>     b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>     @@ -0,0 +1,145 @@
>     +From 0afb2efada7e435ae18ef7d3db0758464189f44f Mon Sep 17 00:00:00
>     2001
>     +From: Bernhard Voelker <mail@bernhard-voelker.de
>     <mailto:mail@bernhard-voelker.de>>
>     +Date: Tue, 30 Jan 2018 23:30:09 +0100
>     +Subject: find: make -delete honour the -ignore_readdir_race option
>     +
>     +* find/pred.c (pred_delete): Return true when the
>     -ignore_readdir_race
>     +option is active and unlinkat() came back with ENOENT.
>     +* doc/find.texi (Option -ignore_readdir_race): Document the change.
>     +(Action -delete): Likewise.
>     +* find/find.1: Likewise.
>     +* NEWS (Bug Fixes): Mention the fix.
>     +
>     +For now, it seems a bit hard to add a proper test for this,
>     +so the following shell snippet demonstrates the race:
>     +
>     +  $ seq 10 | xargs touch
>     +  $ env time -f 'find exit status: %x\nfind time: %e' \
>     +      find -ignore_readdir_race -type f \
>     +        -delete \
>     +        -exec sh -c 'sleep $(basename {})' \; \
>     +        -printf 'find deleted: %p\n' \
>     +        & \
>     +    sleep 20; \
>     +    seq 10 | xargs rm -fv; \
>     +    wait $!
>     +
>     +Reported by Alexander Golubev in
>     +https://savannah.gnu.org/bugs/?52981
>     +
>     +Upstream-Status: Backport
>     +Signed-off-by : Zhixiong Chi <zhixiong.chi@windriver.com
>     <mailto:zhixiong.chi@windriver.com>>
>     +---
>     + NEWS          |  4 ++++
>     + doc/find.texi | 15 ++++++++++++++-
>     + find/find.1   | 22 ++++++++++++++++++++++
>     + find/pred.c   |  6 ++++++
>     + 4 files changed, 46 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/NEWS b/NEWS
>     +index 88cf17d..9809bf4 100644
>     +--- a/NEWS
>     ++++ b/NEWS
>     +@@ -42,6 +42,10 @@
>     +
>     + ** Bug Fixes
>     +
>     ++#52981: find: the '-delete' action no longer complains about
>     disappeared files
>     ++        when the '-ignore_readdir_race' option is given, too. 
>     That action will
>     ++        also returns true in such a case now.
>     ++
>     + Applied patch #8688: Spelling fixes.
>     +
>     + * Major changes in release 4.5.18, 2015-12-27
>     +diff --git a/doc/find.texi b/doc/find.texi
>     +index 3580be7..0089193 100644
>     +--- a/doc/find.texi
>     ++++ b/doc/find.texi
>     +@@ -1418,7 +1418,15 @@ gives a significant increase in search speed.
>     + If a file disappears after its name has been read from a
>     directory but
>     + before @code{find} gets around to examining the file with
>     @code{stat},
>     + don't issue an error message.  If you don't specify this option, an
>     +-error message will be issued.  This option can be useful in system
>     ++error message will be issued.
>     ++
>     ++Furthermore, @code{find} with the @samp{-ignore_readdir_race} option
>     ++will ignore errors of the @samp{-delete} action in the case the file
>     ++has disappeared since the parent directory was read: it will not
>     output
>     ++an error diagnostic, and the return code of the @samp{-delete}
>     action
>     ++will be true.
>     ++
>     ++This option can be useful in system
>     + scripts (cron scripts, for example) that examine areas of the
>     + filesystem that change frequently (mail queues, temporary
>     directories,
>     + and so forth), because this scenario is common for those sorts of
>     +@@ -2779,6 +2787,11 @@ explicitly.
>     +
>     + If @samp{-delete} fails, @code{find}'s exit status will be nonzero
>     + (when it eventually exits).
>     ++
>     ++Together with the @samp{-ignore_readdir_race} option,
>     @code{find} will
>     ++ignore errors of the @samp{-delete} action in the case the file
>     has disappeared
>     ++since the parent directory was read: it will not output an error
>     diagnostic, and
>     ++the return code of the @samp{-delete} action will be true.
>     + @end deffn
>     +
>     + @node Adding Tests
>     +diff --git a/find/find.1 b/find/find.1
>     +index 0437cd8..0d44c37 100644
>     +--- a/find/find.1
>     ++++ b/find/find.1
>     +@@ -479,6 +479,17 @@ this option on and part of it with this
>     option off
>     + (if you need to do that, you will need to issue two \fBfind\fR
>     commands
>     + instead, one with the option and one without it).
>     +
>     ++Furthermore,
>     ++.B find
>     ++with the
>     ++.B \-ignore_readdir_race
>     ++option will ignore errors of the
>     ++.B \-delete
>     ++action in the case the file has disappeared since the parent
>     directory was read:
>     ++it will not output an error diagnostic, and the return code of the
>     ++.B \-delete
>     ++action will be true.
>     ++
>     + .IP "\-maxdepth \fIlevels\fR"
>     + Descend at most \fIlevels\fR (a non-negative integer) levels of
>     + directories below the starting-points.
>     +@@ -1030,6 +1041,17 @@ and
>     + .B \-delete
>     + together.
>     +
>     ++Together with the
>     ++.B \-ignore_readdir_race
>     ++option,
>     ++.B find
>     ++will ignore errors of the
>     ++.B \-delete
>     ++action in the case the file has disappeared since the parent
>     directory was
>     ++read: it will not output an error diagnostic, and the return
>     code of the
>     ++.B \-delete
>     ++action will be true.
>     ++
>     + .IP "\-exec \fIcommand\fR ;"
>     + Execute \fIcommand\fR; true if 0 status is returned.  All following
>     + arguments to
>     +diff --git a/find/pred.c b/find/pred.c
>     +index 7e2a7bd..af3bacb 100644
>     +--- a/find/pred.c
>     ++++ b/find/pred.c
>     +@@ -324,6 +324,12 @@ pred_delete (const char *pathname, struct
>     stat *stat_buf, struct predicate *pred
>     +       }
>     +       else
>     +       {
>     ++        if (ENOENT == errno && options.ignore_readdir_race)
>     ++          {
>     ++            /* Ignore unlink() error for vanished files.  */
>     ++            errno = 0;
>     ++            return true;
>     ++          }
>     +         if (EISDIR == errno)
>     +           {
>     +             if ((flags & AT_REMOVEDIR) == 0)
>     +--
>     +cgit v1.0-41-gc330
>     diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb
>     <http://findutils_4.6.0.bb>
>     b/meta/recipes-extended/findutils/findutils_4.6.0.bb
>     <http://findutils_4.6.0.bb>
>     index 072d3b3c05..db03252f54 100644
>     --- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
>     <http://findutils_4.6.0.bb>
>     +++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
>     <http://findutils_4.6.0.bb>
>     @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
>
>      DEPENDS = "bison-native"
>
>     -SRC_URI +=
>     "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
>     +SRC_URI +=
>     "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>     +
>     file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
>     \
>     +"
>
>      SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
>      SRC_URI[sha256sum] =
>     "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


--------------30DF3DC43AE6E2DD5F219D7D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,</p>
    <p>I have a try it by using the latest version, I can see it now and
      I will resend a patch to update the old patch.</p>
    <p>Thanks.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018年06月22日 17:23, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQfC+a1md3jn3CMe192Rt1Yfj2kgh+rwcPgmVnbtaBDLJA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Does it apply cleanly for you? I'm seeing:
        <div><br>
        </div>
        <div>
          <div>WARNING: findutils-4.6.0-r0 do_patch: </div>
          <div>Some of the context lines in patches were ignored. This
            can lead to incorrectly applied patches.</div>
          <div>The context lines in the patches can be updated with
            devtool:</div>
          <div><br>
          </div>
          <div>    devtool modify &lt;recipe&gt;</div>
          <div>    devtool finish --force-patch-refresh &lt;recipe&gt;
            &lt;layer_path&gt;</div>
          <div><br>
          </div>
          <div>Then the updated patches and the source tree (in
            devtool's workspace)</div>
          <div>should be reviewed to make sure the patches apply in the
            correct place</div>
          <div>and don't introduce duplicate lines (which can, and does
            happen</div>
          <div>when some of the context is ignored). Further
            information:</div>
          <div><a
href="http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html"
              moz-do-not-send="true">http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html</a></div>
          <div><a
              href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450"
              moz-do-not-send="true">https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450</a></div>
          <div>Details:</div>
          <div>Applying patch
            0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch</div>
          <div>patching file NEWS</div>
          <div>Hunk #1 succeeded at 42 with fuzz 2.</div>
          <div>patching file doc/find.texi</div>
          <div>patching file find/find.1</div>
          <div>Hunk #1 succeeded at 479 with fuzz 1.</div>
          <div>patching file find/pred.c</div>
          <div><br>
          </div>
          <div>Now at patch
            0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch</div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Tue, Jun 19, 2018 at 12:25 PM Zhixiong Chi
          &lt;<a href="mailto:zhixiong.chi@windriver.com"
            moz-do-not-send="true">zhixiong.chi@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">the
          '-delete' action no longer complains about disappeared files<br>
          when the '-ignore_readdir_race' option is given, too. That
          action<br>
          will also returns true in such a case now.<br>
          <br>
          Signed-off-by: Zhixiong Chi &lt;<a
            href="mailto:zhixiong.chi@windriver.com" target="_blank"
            moz-do-not-send="true">zhixiong.chi@windriver.com</a>&gt;<br>
          ---<br>
           ...-honour-the-ignore_readdir_race-opti.patch | 145
          ++++++++++++++++++<br>
           .../findutils/<a href="http://findutils_4.6.0.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">findutils_4.6.0.bb</a> 
                      |   4 +-<br>
           2 files changed, 148 insertions(+), 1 deletion(-)<br>
           create mode 100644
meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch<br>
          <br>
          diff --git
a/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch
b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch<br>
          new file mode 100644<br>
          index 0000000000..45e499a184<br>
          --- /dev/null<br>
          +++
b/meta/recipes-extended/findutils/findutils/0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch<br>
          @@ -0,0 +1,145 @@<br>
          +From 0afb2efada7e435ae18ef7d3db0758464189f44f Mon Sep 17
          00:00:00 2001<br>
          +From: Bernhard Voelker &lt;<a
            href="mailto:mail@bernhard-voelker.de" target="_blank"
            moz-do-not-send="true">mail@bernhard-voelker.de</a>&gt;<br>
          +Date: Tue, 30 Jan 2018 23:30:09 +0100<br>
          +Subject: find: make -delete honour the -ignore_readdir_race
          option<br>
          +<br>
          +* find/pred.c (pred_delete): Return true when the
          -ignore_readdir_race<br>
          +option is active and unlinkat() came back with ENOENT.<br>
          +* doc/find.texi (Option -ignore_readdir_race): Document the
          change.<br>
          +(Action -delete): Likewise.<br>
          +* find/find.1: Likewise.<br>
          +* NEWS (Bug Fixes): Mention the fix.<br>
          +<br>
          +For now, it seems a bit hard to add a proper test for this,<br>
          +so the following shell snippet demonstrates the race:<br>
          +<br>
          +  $ seq 10 | xargs touch<br>
          +  $ env time -f 'find exit status: %x\nfind time: %e' \<br>
          +      find -ignore_readdir_race -type f \<br>
          +        -delete \<br>
          +        -exec sh -c 'sleep $(basename {})' \; \<br>
          +        -printf 'find deleted: %p\n' \<br>
          +        &amp; \<br>
          +    sleep 20; \<br>
          +    seq 10 | xargs rm -fv; \<br>
          +    wait $!<br>
          +<br>
          +Reported by Alexander Golubev in<br>
          +<a href="https://savannah.gnu.org/bugs/?52981"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://savannah.gnu.org/bugs/?52981</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +Signed-off-by : Zhixiong Chi &lt;<a
            href="mailto:zhixiong.chi@windriver.com" target="_blank"
            moz-do-not-send="true">zhixiong.chi@windriver.com</a>&gt;<br>
          +---<br>
          + NEWS          |  4 ++++<br>
          + doc/find.texi | 15 ++++++++++++++-<br>
          + find/find.1   | 22 ++++++++++++++++++++++<br>
          + find/pred.c   |  6 ++++++<br>
          + 4 files changed, 46 insertions(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/NEWS b/NEWS<br>
          +index 88cf17d..9809bf4 100644<br>
          +--- a/NEWS<br>
          ++++ b/NEWS<br>
          +@@ -42,6 +42,10 @@<br>
          +<br>
          + ** Bug Fixes<br>
          +<br>
          ++#52981: find: the '-delete' action no longer complains about
          disappeared files<br>
          ++        when the '-ignore_readdir_race' option is given,
          too.  That action will<br>
          ++        also returns true in such a case now.<br>
          ++<br>
          + Applied patch #8688: Spelling fixes.<br>
          +<br>
          + * Major changes in release 4.5.18, 2015-12-27<br>
          +diff --git a/doc/find.texi b/doc/find.texi<br>
          +index 3580be7..0089193 100644<br>
          +--- a/doc/find.texi<br>
          ++++ b/doc/find.texi<br>
          +@@ -1418,7 +1418,15 @@ gives a significant increase in search
          speed.<br>
          + If a file disappears after its name has been read from a
          directory but<br>
          + before @code{find} gets around to examining the file with
          @code{stat},<br>
          + don't issue an error message.  If you don't specify this
          option, an<br>
          +-error message will be issued.  This option can be useful in
          system<br>
          ++error message will be issued.<br>
          ++<br>
          ++Furthermore, @code{find} with the
          @samp{-ignore_readdir_race} option<br>
          ++will ignore errors of the @samp{-delete} action in the case
          the file<br>
          ++has disappeared since the parent directory was read: it will
          not output<br>
          ++an error diagnostic, and the return code of the
          @samp{-delete} action<br>
          ++will be true.<br>
          ++<br>
          ++This option can be useful in system<br>
          + scripts (cron scripts, for example) that examine areas of
          the<br>
          + filesystem that change frequently (mail queues, temporary
          directories,<br>
          + and so forth), because this scenario is common for those
          sorts of<br>
          +@@ -2779,6 +2787,11 @@ explicitly.<br>
          + <br>
          + If @samp{-delete} fails, @code{find}'s exit status will be
          nonzero<br>
          + (when it eventually exits).<br>
          ++<br>
          ++Together with the @samp{-ignore_readdir_race} option,
          @code{find} will<br>
          ++ignore errors of the @samp{-delete} action in the case the
          file has disappeared<br>
          ++since the parent directory was read: it will not output an
          error diagnostic, and<br>
          ++the return code of the @samp{-delete} action will be true.<br>
          + @end deffn<br>
          + <br>
          + @node Adding Tests<br>
          +diff --git a/find/find.1 b/find/find.1<br>
          +index 0437cd8..0d44c37 100644<br>
          +--- a/find/find.1<br>
          ++++ b/find/find.1<br>
          +@@ -479,6 +479,17 @@ this option on and part of it with this
          option off<br>
          + (if you need to do that, you will need to issue two
          \fBfind\fR commands<br>
          + instead, one with the option and one without it).<br>
          + <br>
          ++Furthermore,<br>
          ++.B find<br>
          ++with the<br>
          ++.B \-ignore_readdir_race<br>
          ++option will ignore errors of the<br>
          ++.B \-delete<br>
          ++action in the case the file has disappeared since the parent
          directory was read:<br>
          ++it will not output an error diagnostic, and the return code
          of the<br>
          ++.B \-delete<br>
          ++action will be true.<br>
          ++<br>
          + .IP "\-maxdepth \fIlevels\fR"<br>
          + Descend at most \fIlevels\fR (a non-negative integer) levels
          of<br>
          + directories below the starting-points.<br>
          +@@ -1030,6 +1041,17 @@ and<br>
          + .B \-delete<br>
          + together.<br>
          + <br>
          ++Together with the<br>
          ++.B \-ignore_readdir_race<br>
          ++option,<br>
          ++.B find<br>
          ++will ignore errors of the<br>
          ++.B \-delete<br>
          ++action in the case the file has disappeared since the parent
          directory was<br>
          ++read: it will not output an error diagnostic, and the return
          code of the<br>
          ++.B \-delete<br>
          ++action will be true.<br>
          ++<br>
          + .IP "\-exec \fIcommand\fR ;"<br>
          + Execute \fIcommand\fR; true if 0 status is returned.  All
          following<br>
          + arguments to<br>
          +diff --git a/find/pred.c b/find/pred.c<br>
          +index 7e2a7bd..af3bacb 100644<br>
          +--- a/find/pred.c<br>
          ++++ b/find/pred.c<br>
          +@@ -324,6 +324,12 @@ pred_delete (const char *pathname,
          struct stat *stat_buf, struct predicate *pred<br>
          +       }<br>
          +       else<br>
          +       {<br>
          ++        if (ENOENT == errno &amp;&amp;
          options.ignore_readdir_race)<br>
          ++          {<br>
          ++            /* Ignore unlink() error for vanished files.  */<br>
          ++            errno = 0;<br>
          ++            return true;<br>
          ++          }<br>
          +         if (EISDIR == errno)<br>
          +           {<br>
          +             if ((flags &amp; AT_REMOVEDIR) == 0)<br>
          +--<br>
          +cgit v1.0-41-gc330<br>
          diff --git a/meta/recipes-extended/findutils/<a
            href="http://findutils_4.6.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">findutils_4.6.0.bb</a>
          b/meta/recipes-extended/findutils/<a
            href="http://findutils_4.6.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">findutils_4.6.0.bb</a><br>
          index 072d3b3c05..db03252f54 100644<br>
          --- a/meta/recipes-extended/findutils/<a
            href="http://findutils_4.6.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">findutils_4.6.0.bb</a><br>
          +++ b/meta/recipes-extended/findutils/<a
            href="http://findutils_4.6.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">findutils_4.6.0.bb</a><br>
          @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949">"file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"</a><br>
          <br>
           DEPENDS = "bison-native"<br>
          <br>
          -SRC_URI +=
          <a class="moz-txt-link-rfc2396E" href="file://0001-Unset-need_charset_alias-when-building-for-musl.patch">"file://0001-Unset-need_charset_alias-when-building-for-musl.patch"</a><br>
          +SRC_URI +=
          "<a class="moz-txt-link-freetext" href="file://0001-Unset-need_charset_alias-when-building-for-musl.patch">file://0001-Unset-need_charset_alias-when-building-for-musl.patch</a>
          \<br>
          +           
          <a class="moz-txt-link-freetext" href="file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch">file://0001-find-make-delete-honour-the-ignore_readdir_race-opti.patch</a>
          \<br>
          +"<br>
          <br>
           SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"<br>
           SRC_URI[sha256sum] =
          "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"<br>
          -- <br>
          2.17.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036
</pre>
  </body>
</html>

--------------30DF3DC43AE6E2DD5F219D7D--
