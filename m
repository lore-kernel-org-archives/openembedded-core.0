Return-Path: <peter@berginkonsult.se>
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com
	(mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
	by mail.openembedded.org (Postfix) with ESMTP id 81C517F8F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	subject:from; bh=yaam45kmVEnL8YpBInq91nFBeBVOKuqs6XQ2BxhoA1k=;
	b=lLejxaVodB5SSkiCo0LosT+ukgxTUt/J6E/7loW6crSBRkIiUkaAqs/AXxJdO3z9o9zwO0RT8AHm+
	C+kV89WkPtdheDi202H5+DtYCd5y554OkrAch4b1ESg0Zv9Gk7B9g9GyHVrS9c2elSIAsE5tWDe12B
	1eMpR8m+sIJWGBc6/MkDV3LgB7o18Qpw+ZyTzX41t0SY9SCeMqm2k/Unz2mlLJWY4VrExRyTlYontv
	T4eEUwIaAJGABZeaFCTQwVM9Ydaz/yUHQC0xPvEHM0KyFfwsVrYYhtcmBT8KOlVMm6rBDDO3j8bOZg
	QzGE4nWqiw+UNAffZHGSsawo0Zee99w==
X-HalOne-Cookie: edd88e972285d4436d5f6b83e95b349a3e953867
X-HalOne-ID: 0320b559-11ef-11ea-ba02-d0431ea8a290
Received: from [192.168.149.50] (unknown [80.252.208.151])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 0320b559-11ef-11ea-ba02-d0431ea8a290;
	Thu, 28 Nov 2019 14:54:43 +0000 (UTC)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1574921664-22600-1-git-send-email-peter@berginkonsult.se>
	<CADkTA4NJAbLORAJXBgFtRt_NKjoipB0FusM7UKs=FNyKP=rFZQ@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
Message-ID: <4bc9dd83-e4cb-fe7f-ef68-23246f7ad98d@berginkonsult.se>
Date: Thu, 28 Nov 2019 15:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NJAbLORAJXBgFtRt_NKjoipB0FusM7UKs=FNyKP=rFZQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix error with old (<4.2) x86 kernels
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
X-List-Received-Date: Thu, 28 Nov 2019 14:54:45 -0000
Content-Type: multipart/alternative;
	boundary="------------97B5539CE68FD30CF42B50D3"
Content-Language: en-US

--------------97B5539CE68FD30CF42B50D3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2019-11-28 15:08, Bruce Ashfield wrote:
>
>
> On Thu, Nov 28, 2019 at 1:14 AM Peter Bergin <peter@berginkonsult.se 
> <mailto:peter@berginkonsult.se>> wrote:
>
>     When using kernel-devsrc for older kernels do_install fails with:
>
>     | cp: failed to get attributes of 'arch/x86/entry': No such file
>     or directory
>
>     In the Linux kernel commit 1f57d5d85
>     "x86/asm/entry: Move the arch/x86/syscalls/ definitions to
>     arch/x86/entry/syscalls/"
>     moved some files copied in the kernel-devsrc recipe. Commit
>     1f57d5d85 was added in
>     v4.2.
>
>     To be able to use kernel-devsrc for kernels older than v4.2 this
>     commit make use of find
>     for the files that shall be copied.
>
>     Signed-off-by: Peter Bergin <peter@berginkonsult.se
>     <mailto:peter@berginkonsult.se>>
>     ---
>      meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb> | 10 +++++-----
>      1 file changed, 5 insertions(+), 5 deletions(-)
>
>     diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb>
>     b/meta/recipes-kernel/linux/kernel-devsrc.bb <http://kernel-devsrc.bb>
>     index b68d945..b6f2dbc 100644
>     --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb>
>     +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>     <http://kernel-devsrc.bb>
>     @@ -185,14 +185,14 @@ do_install() {
>             cp -a --parents tools/include/tools/be_byteshift.h
>     $kerneldir/build/
>
>             # required for generate missing syscalls prepare phase
>     -       cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl
>     $kerneldir/build
>     +       cp -a --parents $(find arch/x86 -type f -name
>     "syscall_32.tbl") $kerneldir/build
>
>
> Potentially stupid question (since obviously you've tested this on 
> versions less than v4.2) ..
>
> Doesn't that find command return nothing in kernels < 4.1 and hence is 
> a cp -a --parents <nothing> $kerneldir/build ?
>
I have tested this on v4.1 and v5.2 for qemux86-64 target. Both works 
well as I can see. I added '-v' flag to the changed cp statements in the 
kernel-devsrc recipe. The outputs in log.do_install was:

For v4.1:
'arch/x86/syscalls/syscall_32.tbl' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_32.tbl'
'arch/x86/syscalls/syscall_32.tbl' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_32.tbl'
'arch/x86/syscalls/syscalltbl.sh' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscalltbl.sh'
'arch/x86/syscalls/syscallhdr.sh' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscallhdr.sh'
'arch/x86/syscalls/syscall_64.tbl' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_64.tbl'

For v5.2:
'arch/x86/entry/syscalls/syscall_32.tbl' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_32.tbl'
'arch/x86/entry/syscalls/syscall_32.tbl' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_32.tbl'
'arch/x86/entry/syscalls/syscalltbl.sh' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscalltbl.sh'
'arch/x86/entry/syscalls/syscallhdr.sh' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscallhdr.sh'
'arch/x86/entry/syscalls/syscall_64.tbl' -> 
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_64.tbl'

Best regards,
/Peter

> I haven't tested it myself (yet), so I thought I'd ask.
>
> Thanks for fixing up the older kernel support!
>
> Bruce
>
>
>             if [ "${ARCH}" = "x86" ]; then
>                 # files for 'make prepare' to succeed with kernel-devel
>     -           cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl
>     $kerneldir/build/
>     -           cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh
>     $kerneldir/build/
>     -           cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh
>     $kerneldir/build/
>     -           cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl
>     $kerneldir/build/
>     +           cp -a --parents $(find arch/x86 -type f -name
>     "syscall_32.tbl") $kerneldir/build/
>     +           cp -a --parents $(find arch/x86 -type f -name
>     "syscalltbl.sh") $kerneldir/build/
>     +           cp -a --parents $(find arch/x86 -type f -name
>     "syscallhdr.sh") $kerneldir/build/
>     +           cp -a --parents $(find arch/x86 -type f -name
>     "syscall_64.tbl") $kerneldir/build/
>                 cp -a --parents arch/x86/tools/relocs_32.c
>     $kerneldir/build/
>                 cp -a --parents arch/x86/tools/relocs_64.c
>     $kerneldir/build/
>                 cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
>     -- 
>     2.7.4
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--------------97B5539CE68FD30CF42B50D3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2019-11-28 15:08, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NJAbLORAJXBgFtRt_NKjoipB0FusM7UKs=FNyKP=rFZQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Nov 28, 2019 at 1:14
            AM Peter Bergin &lt;<a href="mailto:peter@berginkonsult.se"
              moz-do-not-send="true">peter@berginkonsult.se</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">When using kernel-devsrc
            for older kernels do_install fails with:<br>
            <br>
            | cp: failed to get attributes of 'arch/x86/entry': No such
            file or directory<br>
            <br>
            In the Linux kernel commit 1f57d5d85<br>
            "x86/asm/entry: Move the arch/x86/syscalls/ definitions to
            arch/x86/entry/syscalls/"<br>
            moved some files copied in the kernel-devsrc recipe. Commit
            1f57d5d85 was added in<br>
            v4.2.<br>
            <br>
            To be able to use kernel-devsrc for kernels older than v4.2
            this commit make use of find<br>
            for the files that shall be copied.<br>
            <br>
            Signed-off-by: Peter Bergin &lt;<a
              href="mailto:peter@berginkonsult.se" target="_blank"
              moz-do-not-send="true">peter@berginkonsult.se</a>&gt;<br>
            ---<br>
             meta/recipes-kernel/linux/<a href="http://kernel-devsrc.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">kernel-devsrc.bb</a>
            | 10 +++++-----<br>
             1 file changed, 5 insertions(+), 5 deletions(-)<br>
            <br>
            diff --git a/meta/recipes-kernel/linux/<a
              href="http://kernel-devsrc.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">kernel-devsrc.bb</a>
            b/meta/recipes-kernel/linux/<a
              href="http://kernel-devsrc.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">kernel-devsrc.bb</a><br>
            index b68d945..b6f2dbc 100644<br>
            --- a/meta/recipes-kernel/linux/<a
              href="http://kernel-devsrc.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">kernel-devsrc.bb</a><br>
            +++ b/meta/recipes-kernel/linux/<a
              href="http://kernel-devsrc.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">kernel-devsrc.bb</a><br>
            @@ -185,14 +185,14 @@ do_install() {<br>
                    cp -a --parents tools/include/tools/be_byteshift.h
            $kerneldir/build/<br>
            <br>
                    # required for generate missing syscalls prepare
            phase<br>
            -       cp -a --parents
            arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build<br>
            +       cp -a --parents $(find arch/x86 -type f -name
            "syscall_32.tbl") $kerneldir/build<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">Potentially
              stupid question (since obviously you've tested this on
              versions less than v4.2) .. </div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Doesn't
              that find command return nothing in kernels &lt; 4.1 and
              hence is a cp -a --parents &lt;nothing&gt;
              $kerneldir/build ?<br>
            </div>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    I have tested this on v4.1 and v5.2 for qemux86-64 target. Both
    works well as I can see. I added '-v' flag to the changed cp
    statements in the kernel-devsrc recipe. The outputs in
    log.do_install was:<br>
    <br>
    For v4.1:<br>
    'arch/x86/syscalls/syscall_32.tbl' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_32.tbl'<br>
    'arch/x86/syscalls/syscall_32.tbl' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_32.tbl'<br>
    'arch/x86/syscalls/syscalltbl.sh' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscalltbl.sh'<br>
    'arch/x86/syscalls/syscallhdr.sh' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscallhdr.sh'<br>
    'arch/x86/syscalls/syscall_64.tbl' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/4.1.0-yocto-standard-upstream/build/arch/x86/syscalls/syscall_64.tbl'<br>
    <br>
    For v5.2:<br>
    'arch/x86/entry/syscalls/syscall_32.tbl' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_32.tbl'<br>
    'arch/x86/entry/syscalls/syscall_32.tbl' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_32.tbl'<br>
    'arch/x86/entry/syscalls/syscalltbl.sh' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscalltbl.sh'<br>
    'arch/x86/entry/syscalls/syscallhdr.sh' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscallhdr.sh'<br>
    'arch/x86/entry/syscalls/syscall_64.tbl' -&gt;
'/work/yocto/master/qemux86-64/tmp/work/qemux86_64-poky-linux/kernel-devsrc/1.0-r0/image/lib/modules/5.2.20-yocto-standard/build/arch/x86/entry/syscalls/syscall_64.tbl'<br>
    <br>
    Best regards,<br>
    /Peter<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4NJAbLORAJXBgFtRt_NKjoipB0FusM7UKs=FNyKP=rFZQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small">I haven't
              tested it myself (yet), so I thought I'd ask.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Thanks
              for fixing up the older kernel support!</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
                    if [ "${ARCH}" = "x86" ]; then<br>
                        # files for 'make prepare' to succeed with
            kernel-devel<br>
            -           cp -a --parents
            arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build/<br>
            -           cp -a --parents
            arch/x86/entry/syscalls/syscalltbl.sh $kerneldir/build/<br>
            -           cp -a --parents
            arch/x86/entry/syscalls/syscallhdr.sh $kerneldir/build/<br>
            -           cp -a --parents
            arch/x86/entry/syscalls/syscall_64.tbl $kerneldir/build/<br>
            +           cp -a --parents $(find arch/x86 -type f -name
            "syscall_32.tbl") $kerneldir/build/<br>
            +           cp -a --parents $(find arch/x86 -type f -name
            "syscalltbl.sh") $kerneldir/build/<br>
            +           cp -a --parents $(find arch/x86 -type f -name
            "syscallhdr.sh") $kerneldir/build/<br>
            +           cp -a --parents $(find arch/x86 -type f -name
            "syscall_64.tbl") $kerneldir/build/<br>
                        cp -a --parents arch/x86/tools/relocs_32.c
            $kerneldir/build/<br>
                        cp -a --parents arch/x86/tools/relocs_64.c
            $kerneldir/build/<br>
                        cp -a --parents arch/x86/tools/relocs.c
            $kerneldir/build/<br>
            -- <br>
            2.7.4<br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------97B5539CE68FD30CF42B50D3--
