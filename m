Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U2Z1y-0001te-A3
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 04:17:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1531Gdj011852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Feb 2013 19:01:17 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 4 Feb 2013 19:01:15 -0800
Message-ID: <51107615.2060807@windriver.com>
Date: Tue, 5 Feb 2013 11:01:41 +0800
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
X-List-Received-Date: Tue, 05 Feb 2013 03:17:13 -0000
Content-Type: multipart/alternative;
	boundary="------------060706040409070704080005"

--------------060706040409070704080005
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

I thought about keeping the codes in sync but couldn't figure out a nice 
way.
It would be great if you do so.

Thanks in advance :)

Best Regards,
Chen Qi

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
>
>     Sau!
>
>         To be clear, I'm not talking about the entire kern-tools here,
>         just the
>         config parts.
>
>         Cheers,
>
>         Bruce
>
>
>             [YOCTO #3379]
>
>             Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>
>             <mailto:Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>>
>
>             ---
>               meta/recipes-core/busybox/busybox.inc |   45
>             +++++++++++++++++++++++++++++++++
>               1 file changed, 45 insertions(+)
>
>             diff --git a/meta/recipes-core/busybox/busybox.inc
>             b/meta/recipes-core/busybox/busybox.inc
>             index 972e7d0..66044f8 100644
>             --- a/meta/recipes-core/busybox/busybox.inc
>             +++ b/meta/recipes-core/busybox/busybox.inc
>             @@ -112,8 +112,53 @@ do_prepare_config () {
>                      fi
>               }
>
>             +# returns all the elements from the src uri that are .cfg
>         files
>             +def find_cfgs(d):
>             +    sources=src_patches(d, True)
>             +    sources_list=[]
>             +    for s in sources:
>             +        if s.endswith('.cfg'):
>             +            sources_list.append(s)
>             +
>             +    return sources_list
>             +
>             +# Merge config fragments
>             +# All config fragments for busybox should end with .cfg
>             +do_merge_config() {
>             +        SED_CONFIG_EXP="s/^\(#
>         \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[=
>             ].*/\2/p"
>             +        MERGE_LIST="${@" ".join(find_cfgs(d))}"
>             +        if [ -n "$MERGE_LIST" ]; then
>             +                # Make a temp file, merge .config and
>         .cfg files
>             into it
>             +                TMP_FILE=`mktemp .tmp.config.XXXXXXXX`
>             +                cp .config $TMP_FILE
>             +                for MERGE_FILE in $MERGE_LIST; do
>             +                        CFG_LIST=`sed -n "${SED_CONFIG_EXP}"
>             $MERGE_FILE`
>             +                        for CFG in $CFG_LIST ; do
>             +                                grep -q -w $CFG $TMP_FILE
>             +                                if [ $? -eq 0 ] ; then
>             +  PREV_VAL=`grep -w $CFG
>             $TMP_FILE`
>             +  NEW_VAL=`grep -w $CFG
>             $MERGE_FILE`
>             +                                        if [ "x$PREV_VAL" !=
>             "x$NEW_VAL" ] ; then
>             +  echo Value of $CFG
>             is redefined by fragment $MERGE_FILE:
>             +  echo Previous
>               value: $PREV_VAL
>             +  echo New value:
>                $NEW_VAL
>             +  echo
>             +                                        fi
>             +                                        sed -i "/$CFG[
>         =]/d" $TMP_FILE
>             +                                fi
>             +                        done
>             +                        echo >> $TMP_FILE
>             +                        cat $MERGE_FILE >> $TMP_FILE
>             +                done
>             +                # Copy the temp file to .config, do some
>         cleanup
>             +               cp $TMP_FILE .config
>             +               rm $TMP_FILE
>             +        fi
>             +}
>             +
>               do_configure () {
>                      do_prepare_config
>             +       do_merge_config
>                      cml1_do_configure
>               }
>
>             --
>             1.7.9.5
>
>
>             _______________________________________________
>             Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>             <mailto:Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>>
>
>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
>         --
>         "Thou shalt not follow the NULL pointer, for chaos and madness
>         await
>         thee at its end"
>
>
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------060706040409070704080005
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
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I thought about keeping the codes in sync but couldn't figure out a
    nice way.<br>
    It would be great if you do so.<br>
    <br>
    Thanks in advance :)<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CADkTA4OuDqRE25oNRbFJCyrWpkkj62HpHHNN4qOFocNnrgSY_w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
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
            <div style=""><br>
            </div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Sau!<br>
              <br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                <div class="im">
                  To be clear, I'm not talking about the entire
                  kern-tools here, just the<br>
                  config parts.<br>
                  <br>
                  Cheers,<br>
                  <br>
                  Bruce<br>
                  <br>
                  <br>
                  &nbsp; &nbsp; [YOCTO #3379]<br>
                  <br>
                  &nbsp; &nbsp; Signed-off-by: Chen Qi &lt;<a
                    moz-do-not-send="true"
                    href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a><br>
                </div>
                &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
                  href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;&gt;
                <div>
                  <div class="h5"><br>
                    &nbsp; &nbsp; ---<br>
                    &nbsp; &nbsp; &nbsp; meta/recipes-core/busybox/busybox.inc | &nbsp; 45<br>
                    &nbsp; &nbsp; +++++++++++++++++++++++++++++++++<br>
                    &nbsp; &nbsp; &nbsp; 1 file changed, 45 insertions(+)<br>
                    <br>
                    &nbsp; &nbsp; diff --git a/meta/recipes-core/busybox/busybox.inc<br>
                    &nbsp; &nbsp; b/meta/recipes-core/busybox/busybox.inc<br>
                    &nbsp; &nbsp; index 972e7d0..66044f8 100644<br>
                    &nbsp; &nbsp; --- a/meta/recipes-core/busybox/busybox.inc<br>
                    &nbsp; &nbsp; +++ b/meta/recipes-core/busybox/busybox.inc<br>
                    &nbsp; &nbsp; @@ -112,8 +112,53 @@ do_prepare_config () {<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
                    &nbsp; &nbsp; &nbsp; }<br>
                    <br>
                    &nbsp; &nbsp; +# returns all the elements from the src uri
                    that are .cfg files<br>
                    &nbsp; &nbsp; +def find_cfgs(d):<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp;sources=src_patches(d, True)<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp;sources_list=[]<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp;for s in sources:<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp;if s.endswith('.cfg'):<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sources_list.append(s)<br>
                    &nbsp; &nbsp; +<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp;return sources_list<br>
                    &nbsp; &nbsp; +<br>
                    &nbsp; &nbsp; +# Merge config fragments<br>
                    &nbsp; &nbsp; +# All config fragments for busybox should end
                    with .cfg<br>
                    &nbsp; &nbsp; +do_merge_config() {<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp;SED_CONFIG_EXP="s/^\(#
                    \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[=<br>
                    &nbsp; &nbsp; ].*/\2/p"<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp;MERGE_LIST="${@" ".join(find_cfgs(d))}"<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp;if [ -n "$MERGE_LIST" ]; then<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Make a temp file, merge
                    .config and .cfg files<br>
                    &nbsp; &nbsp; into it<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TMP_FILE=`mktemp
                    .tmp.config.XXXXXXXX`<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cp .config $TMP_FILE<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for MERGE_FILE in $MERGE_LIST;
                    do<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CFG_LIST=`sed -n
                    "${SED_CONFIG_EXP}"<br>
                    &nbsp; &nbsp; $MERGE_FILE`<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for CFG in $CFG_LIST ;
                    do<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;grep -q -w $CFG
                    $TMP_FILE<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ $? -eq 0 ]
                    ; then<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;PREV_VAL=`grep -w $CFG<br>
                    &nbsp; &nbsp; $TMP_FILE`<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;NEW_VAL=`grep -w $CFG<br>
                    &nbsp; &nbsp; $MERGE_FILE`<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [
                    "x$PREV_VAL" !=<br>
                    &nbsp; &nbsp; "x$NEW_VAL" ] ; then<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;echo Value of $CFG<br>
                    &nbsp; &nbsp; is redefined by fragment $MERGE_FILE:<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;echo Previous<br>
                    &nbsp; &nbsp; &nbsp; value: $PREV_VAL<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;echo New value:<br>
                    &nbsp; &nbsp; &nbsp; &nbsp;$NEW_VAL<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;echo<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i
                    "/$CFG[ =]/d" $TMP_FILE<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;done<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo &gt;&gt; $TMP_FILE<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cat $MERGE_FILE
                    &gt;&gt; $TMP_FILE<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;done<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Copy the temp file to
                    .config, do some cleanup<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cp $TMP_FILE .config<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rm $TMP_FILE<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
                    &nbsp; &nbsp; +}<br>
                    &nbsp; &nbsp; +<br>
                    &nbsp; &nbsp; &nbsp; do_configure () {<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_prepare_config<br>
                    &nbsp; &nbsp; + &nbsp; &nbsp; &nbsp; do_merge_config<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cml1_do_configure<br>
                    &nbsp; &nbsp; &nbsp; }<br>
                    <br>
                    &nbsp; &nbsp; --<br>
                    &nbsp; &nbsp; 1.7.9.5<br>
                    <br>
                    <br>
                    &nbsp; &nbsp; _______________________________________________<br>
                    &nbsp; &nbsp; Openembedded-core mailing list<br>
                    &nbsp; &nbsp; <a moz-do-not-send="true"
                      href="mailto:Openembedded-core@lists.openembedded.org"
                      target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                  </div>
                </div>
                &nbsp; &nbsp; &lt;mailto:<a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank">Openembedded-core@lists.openembedded.org</a>&gt;
                <div class="im"><br>
                  &nbsp; &nbsp; <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                    target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                  <br>
                  <br>
                  <br>
                  <br>
                  --<br>
                  "Thou shalt not follow the NULL pointer, for chaos and
                  madness await<br>
                  thee at its end"<br>
                  <br>
                  <br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                  <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                    target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                  <br>
                </div>
              </blockquote>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          "Thou shalt not follow the NULL pointer, for chaos and madness
          await thee at its end"
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060706040409070704080005--
