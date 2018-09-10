Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB407548B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 03:45:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8A3jWMn021242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Sep 2018 20:45:32 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Sep 2018 20:45:31 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
	<CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com>
	<4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com>
	<ab609cc5-dd34-bbc1-294f-be6985a30a2a@windriver.com>
	<CA+chaQfWbCDxvytN8-akLY7B4Ymo7HnGU4s2CL=u4BahZ+bCfw@mail.gmail.com>
	<CA+chaQdRbdwPWYKZMmWzHwLv4vRd=79dTCrEE4sepvE=5-RRGg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <9b21eac0-adf3-d0be-d795-11f5671f13f5@windriver.com>
Date: Mon, 10 Sep 2018 11:44:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQdRbdwPWYKZMmWzHwLv4vRd=79dTCrEE4sepvE=5-RRGg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Mon, 10 Sep 2018 03:45:33 -0000
Content-Type: multipart/alternative;
	boundary="------------F676326AE1D9DC003B8D7C0A"
Content-Language: en-US

--------------F676326AE1D9DC003B8D7C0A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月10日 06:58, Martin Jansa wrote:
> And it fails in regular image build as well, because of qemu segfault:

What do you mean regulare image here? core-image-minimal, -sato or fails 
with all of them? I can't reproduce the failure, would you like to paste 
you local.conf here?

Regards,
Kai

>
> NOTE: > Executing update_gio_module_cache intercept ...
> NOTE: Exit code 139. Output:
> + [ True = False ]
> + qemu-i386 -r 3.2.0 -E 
> LD_LIBRARY_PATH=WORKDIR/rootfs/usr/lib:WORKDIR/rootfs/lib -L 
> WORKDIR/rootfs WORKDIR/rootfs/usr/libexec/gio-querymodules 
> WORKDIR/rootfs/usr/lib/gio/modules/
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> Segmentation fault
>
> ERROR: The postinstall intercept hook 'update_gio_module_cache' 
> failed, details in WORKDIR/temp/log.do_rootfs
>
>
> On Sun, Sep 9, 2018 at 10:39 PM Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     I'm still able to reproduce the issue in my builds, I'll find out
>     what's different here.
>
>     It fails because of missing nativesdk-qemuwrapper here:
>
>     NOTE: Running intercept scripts:
>     NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
>     NOTE: Exit code 127. Output:
>     SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b676ebe12fb99/update_gio_module_cache-nativesdk:
>     10:
>     SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b676ebe12fb99/update_gio_module_cache-nativesdk:
>     nativesdk-qemuwrapper: not found
>
>     WARNING: The postinstall intercept hook
>     'update_gio_module_cache-nativesdk' failed, details in
>     SDK/temp/log.do_populate_sdk
>
>
>     On Thu, Sep 6, 2018 at 5:28 PM Kang Kai <Kai.Kang@windriver.com
>     <mailto:Kai.Kang@windriver.com>> wrote:
>
>         On 2018年09月04日 18:02, Kang Kai wrote:
>>         On 2018年09月04日 17:44, Martin Jansa wrote:
>>>         Hi Kai,
>>>
>>>         do you have similar fix for update_gio_module_cache
>>>         intercept? It seems to fail similarly with multilib enabled.
>>
>>         The fix is from script update_gio_module_cache, so I thought
>>         it works and didn't meet the failure. I'll check it.
>         Hi Martin,
>
>         It has been done by
>         http://git.openembedded.org/openembedded-core/commit/?id=1f53140528d79c38d4f3a82cd0a03bd0ddc87275
>         Add lib23-gconf to image which inherits gio-module-cache, then
>         build image successfully.
>
>         Regards,
>         Kai
>
>
>>
>>         Thanks,
>>         Kai
>>
>>>
>>>         Regards,
>>>
>>>         On Sat, Aug 25, 2018 at 7:14 PM Kai Kang
>>>         <kai.kang@windriver.com <mailto:kai.kang@windriver.com>> wrote:
>>>
>>>             Packages which inherit fontcache.bbclass call
>>>             postinstall script
>>>             update_font_cache. And in update_font_cache, it calls
>>>             ${bindir}/fc-cache
>>>             by qemuwrapper. When multilib is enabled, both packages
>>>             foo and lib32-foo
>>>             will call ${bindir}/fc-cache and one of them will fail
>>>             to run obviously.
>>>
>>>             Duplicate install file fc-cache to ${libexecdir} with
>>>             ${MLPREFIX} and
>>>             call proper fc-cache in update_font_cache.
>>>
>>>             Signed-off-by: Kai Kang <kai.kang@windriver.com
>>>             <mailto:kai.kang@windriver.com>>
>>>             ---
>>>              meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>>             <http://fontconfig_2.12.6.bb> | 8 +++++++-
>>>              scripts/postinst-intercepts/update_font_cache        | 2 +-
>>>              2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>>             diff --git
>>>             a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>>             <http://fontconfig_2.12.6.bb>
>>>             b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>>             <http://fontconfig_2.12.6.bb>
>>>             index d4cbce80b45..db36c867741 100644
>>>             ---
>>>             a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>>             <http://fontconfig_2.12.6.bb>
>>>             +++
>>>             b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>>             <http://fontconfig_2.12.6.bb>
>>>             @@ -35,9 +35,15 @@ do_configure_prepend() {
>>>                  rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>>>              }
>>>
>>>             +do_install_append_class-target() {
>>>             +    # duplicate fc-cache for postinstall script
>>>             +    mkdir -p ${D}${libexecdir}
>>>             +    cp ${D}${bindir}/fc-cache
>>>             ${D}${libexecdir}/${MLPREFIX}fc-cache
>>>             +}
>>>             +
>>>              PACKAGES =+ "fontconfig-utils"
>>>              FILES_${PN} =+ "${datadir}/xml/*"
>>>             -FILES_fontconfig-utils = "${bindir}/*"
>>>             +FILES_fontconfig-utils = "${bindir}/* ${libexecdir}/*"
>>>
>>>              # Work around past breakage in debian.bbclass
>>>              RPROVIDES_fontconfig-utils = "libfontconfig-utils"
>>>             diff --git
>>>             a/scripts/postinst-intercepts/update_font_cache
>>>             b/scripts/postinst-intercepts/update_font_cache
>>>             index 20e9048adfc..e0ec471964c 100644
>>>             --- a/scripts/postinst-intercepts/update_font_cache
>>>             +++ b/scripts/postinst-intercepts/update_font_cache
>>>             @@ -2,5 +2,5 @@
>>>
>>>              set -e
>>>
>>>             -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
>>>             ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=$D
>>>             --system-only ${fontconfigcacheparams}
>>>             +PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
>>>             ${fontconfigcacheenv}
>>>             $D${libexecdir}/${binprefix}fc-cache --sysroot=$D
>>>             --system-only ${fontconfigcacheparams}
>>>              chown -R root:root $D${fontconfigcachedir}
>>>             -- 
>>>             2.11.0
>>>
>>>             -- 
>>>             _______________________________________________
>>>             Openembedded-core mailing list
>>>             Openembedded-core@lists.openembedded.org
>>>             <mailto:Openembedded-core@lists.openembedded.org>
>>>             http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>         -- 
>>         Regards,
>>         Neil | Kai Kang
>
>
>         -- 
>         Regards,
>         Neil | Kai Kang
>

-- 
Regards,
Neil | Kai Kang


--------------F676326AE1D9DC003B8D7C0A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年09月10日 06:58, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQdRbdwPWYKZMmWzHwLv4vRd=79dTCrEE4sepvE=5-RRGg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div dir="ltr">
          <div>And it fails in regular image build as well, because of
            qemu segfault:</div>
        </div>
      </div>
    </blockquote>
    <br>
    What do you mean regulare image here? core-image-minimal, -sato or
    fails with all of them? I can't reproduce the failure, would you
    like to paste you local.conf here? <br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQdRbdwPWYKZMmWzHwLv4vRd=79dTCrEE4sepvE=5-RRGg@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div><br>
          </div>
          <div>NOTE: &gt; Executing update_gio_module_cache intercept
            ...</div>
          <div>NOTE: Exit code 139. Output:</div>
          <div>+ [ True = False ]</div>
          <div>+ qemu-i386 -r 3.2.0 -E
            LD_LIBRARY_PATH=WORKDIR/rootfs/usr/lib:WORKDIR/rootfs/lib -L
            WORKDIR/rootfs WORKDIR/rootfs/usr/libexec/gio-querymodules
            WORKDIR/rootfs/usr/lib/gio/modules/</div>
          <div>qemu: uncaught target signal 11 (Segmentation fault) -
            core dumped</div>
          <div>Segmentation fault</div>
          <div><br>
          </div>
          <div>ERROR: The postinstall intercept hook
            'update_gio_module_cache' failed, details in
            WORKDIR/temp/log.do_rootfs</div>
          <div><br>
          </div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Sun, Sep 9, 2018 at 10:39 PM Martin Jansa &lt;<a
            href="mailto:martin.jansa@gmail.com" moz-do-not-send="true">martin.jansa@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div dir="ltr">
            <div dir="ltr">I'm still able to reproduce the issue in my
              builds, I'll find out what's different here.
              <div><br>
              </div>
              <div>It fails because of missing nativesdk-qemuwrapper
                here:</div>
              <div><br>
              </div>
              <div>
                <div>NOTE: Running intercept scripts:</div>
                <div>NOTE: &gt; Executing
                  update_gio_module_cache-nativesdk intercept ...</div>
                <div>NOTE: Exit code 127. Output:</div>
                <div>SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b676ebe12fb99/update_gio_module_cache-nativesdk:
                  10:
SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b676ebe12fb99/update_gio_module_cache-nativesdk:
                  nativesdk-qemuwrapper: not found</div>
                <div><br>
                </div>
                <div>WARNING: The postinstall intercept hook
                  'update_gio_module_cache-nativesdk' failed, details in
                  SDK/temp/log.do_populate_sdk</div>
              </div>
              <div><br>
              </div>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr">On Thu, Sep 6, 2018 at 5:28 PM Kang Kai &lt;<a
                href="mailto:Kai.Kang@windriver.com" target="_blank"
                moz-do-not-send="true">Kai.Kang@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF">
                <div
                  class="m_-2700466882960693652m_7851569581499868850moz-cite-prefix">On
                  2018年09月04日 18:02, Kang Kai wrote:<br>
                </div>
                <blockquote type="cite">
                  <div
                    class="m_-2700466882960693652m_7851569581499868850moz-cite-prefix">On
                    2018年09月04日 17:44, Martin Jansa wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div dir="ltr">Hi Kai,
                        <div><br>
                        </div>
                        <div>do you have similar fix
                          for update_gio_module_cache intercept? It
                          seems to fail similarly with multilib enabled.</div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                  The fix is from script update_gio_module_cache, so I
                  thought it works and didn't meet the failure. I'll
                  check it.<br>
                </blockquote>
                Hi Martin,<br>
                <br>
                It has been done by
                <a
                  class="m_-2700466882960693652m_7851569581499868850moz-txt-link-freetext"
href="http://git.openembedded.org/openembedded-core/commit/?id=1f53140528d79c38d4f3a82cd0a03bd0ddc87275"
                  target="_blank" moz-do-not-send="true">http://git.openembedded.org/openembedded-core/commit/?id=1f53140528d79c38d4f3a82cd0a03bd0ddc87275</a><br>
                Add lib23-gconf to image which inherits
                gio-module-cache, then build image successfully.<br>
                <br>
                Regards,<br>
                Kai<br>
                <br>
                <br>
                <blockquote type="cite"> <br>
                  Thanks,<br>
                  Kai<br>
                  <br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div dir="ltr">
                        <div><br>
                        </div>
                        <div>Regards,</div>
                      </div>
                    </div>
                    <br>
                    <div class="gmail_quote">
                      <div dir="ltr">On Sat, Aug 25, 2018 at 7:14 PM Kai
                        Kang &lt;<a href="mailto:kai.kang@windriver.com"
                          target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
                        wrote:<br>
                      </div>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">Packages which inherit
                        fontcache.bbclass call postinstall script<br>
                        update_font_cache. And in update_font_cache, it
                        calls ${bindir}/fc-cache<br>
                        by qemuwrapper. When multilib is enabled, both
                        packages foo and lib32-foo<br>
                        will call ${bindir}/fc-cache and one of them
                        will fail to run obviously.<br>
                        <br>
                        Duplicate install file fc-cache to ${libexecdir}
                        with ${MLPREFIX} and<br>
                        call proper fc-cache in update_font_cache.<br>
                        <br>
                        Signed-off-by: Kai Kang &lt;<a
                          href="mailto:kai.kang@windriver.com"
                          target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
                        ---<br>
                         meta/recipes-graphics/fontconfig/<a
                          href="http://fontconfig_2.12.6.bb"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">fontconfig_2.12.6.bb</a>
                        | 8 +++++++-<br>
                         scripts/postinst-intercepts/update_font_cache 
                               | 2 +-<br>
                         2 files changed, 8 insertions(+), 2
                        deletions(-)<br>
                        <br>
                        diff --git a/meta/recipes-graphics/fontconfig/<a
                          href="http://fontconfig_2.12.6.bb"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">fontconfig_2.12.6.bb</a>
                        b/meta/recipes-graphics/fontconfig/<a
                          href="http://fontconfig_2.12.6.bb"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">fontconfig_2.12.6.bb</a><br>
                        index d4cbce80b45..db36c867741 100644<br>
                        --- a/meta/recipes-graphics/fontconfig/<a
                          href="http://fontconfig_2.12.6.bb"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">fontconfig_2.12.6.bb</a><br>
                        +++ b/meta/recipes-graphics/fontconfig/<a
                          href="http://fontconfig_2.12.6.bb"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">fontconfig_2.12.6.bb</a><br>
                        @@ -35,9 +35,15 @@ do_configure_prepend() {<br>
                             rm -f ${S}/src/fcobjshash.h
                        ${S}/src/fcobjshash.gperf<br>
                         }<br>
                        <br>
                        +do_install_append_class-target() {<br>
                        +    # duplicate fc-cache for postinstall script<br>
                        +    mkdir -p ${D}${libexecdir}<br>
                        +    cp ${D}${bindir}/fc-cache
                        ${D}${libexecdir}/${MLPREFIX}fc-cache<br>
                        +}<br>
                        +<br>
                         PACKAGES =+ "fontconfig-utils"<br>
                         FILES_${PN} =+ "${datadir}/xml/*"<br>
                        -FILES_fontconfig-utils = "${bindir}/*"<br>
                        +FILES_fontconfig-utils = "${bindir}/*
                        ${libexecdir}/*"<br>
                        <br>
                         # Work around past breakage in debian.bbclass<br>
                         RPROVIDES_fontconfig-utils =
                        "libfontconfig-utils"<br>
                        diff --git
                        a/scripts/postinst-intercepts/update_font_cache
                        b/scripts/postinst-intercepts/update_font_cache<br>
                        index 20e9048adfc..e0ec471964c 100644<br>
                        ---
                        a/scripts/postinst-intercepts/update_font_cache<br>
                        +++
                        b/scripts/postinst-intercepts/update_font_cache<br>
                        @@ -2,5 +2,5 @@<br>
                        <br>
                         set -e<br>
                        <br>
                        -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
                        -E ${fontconfigcacheenv} $D${bindir}/fc-cache
                        --sysroot=$D --system-only
                        ${fontconfigcacheparams}<br>
                        +PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
                        -E ${fontconfigcacheenv}
                        $D${libexecdir}/${binprefix}fc-cache
                        --sysroot=$D --system-only
                        ${fontconfigcacheparams}<br>
                         chown -R root:root $D${fontconfigcachedir}<br>
                        -- <br>
                        2.11.0<br>
                        <br>
                        -- <br>
                        _______________________________________________<br>
                        Openembedded-core mailing list<br>
                        <a
                          href="mailto:Openembedded-core@lists.openembedded.org"
                          target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                        <a
                          href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                      </blockquote>
                    </div>
                  </blockquote>
                  <p><br>
                  </p>
                  <pre class="m_-2700466882960693652m_7851569581499868850moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
                </blockquote>
                <p><br>
                </p>
                <pre class="m_-2700466882960693652m_7851569581499868850moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------F676326AE1D9DC003B8D7C0A--
