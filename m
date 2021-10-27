Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <c5e7c54d-b08f-908c-f60c-d5b54ad66ec4@oleksandr-kravchuk.com>
Date: Wed, 27 Oct 2021 23:18:55 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libxcvt: add recipe
References: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1spyTN8SHPdw+OyF5qoOKZfyMmg2zzPOzWBRt2tTJNbZUg@mail.gmail.com>
 <bca08ee4-f424-5eb8-9d1d-5bd22e7971d6@oleksandr-kravchuk.com>
 <CAMKF1sqUNt=aRYX6Wiq1RNPvGYa1CqQJv-S7fH5=iyuutzt+4Q@mail.gmail.com>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
In-Reply-To: <CAMKF1sqUNt=aRYX6Wiq1RNPvGYa1CqQJv-S7fH5=iyuutzt+4Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DVxQyeSDNJnZvcacYXx0vRgl"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org

--------------DVxQyeSDNJnZvcacYXx0vRgl
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 27/10/2021 23:15, Khem Raj wrote:
>
>
> On Wed, Oct 27, 2021 at 2:12 PM Oleksandr Kravchuk 
> <open.source@oleksandr-kravchuk.com> wrote:
>
>     On 27/10/2021 23:09, Khem Raj wrote:
>>
>>
>>     On Wed, Oct 27, 2021 at 2:03 PM Oleksandr Kravchuk
>>     <open.source@oleksandr-kravchuk.com> wrote:
>>
>>         This library is a dependancy of xserver-xorg 21.1.0.
>>
>>
>>     I wonder if we need this to be in core layer though
>     Could you please clarify why it shouldn't if the package that
>     needs is part of the core layer?
>
>
> I read the dependency in reverse however the next question is that is 
> this new dependency or else how did we manage up until this point?
I am sorry if I was not clear enough. This is a dependency of the 
v21.1.0 that was released a couple of hours ago. I have started working 
on upgrading xserver-xorg, but since I'm not sure I will have enough 
patience and expertise to finish it, I thought I would at least help 
with this small part.
>
>>
>>
>>         Signed-off-by: Oleksandr Kravchuk
>>         <open.source@oleksandr-kravchuk.com>
>>         ---
>>          .../xorg-lib/libxcvt_0.1.1.bb <http://libxcvt_0.1.1.bb>    
>>                | 19 +++++++++++++++++++
>>          1 file changed, 19 insertions(+)
>>          create mode 100644
>>         meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>         <http://libxcvt_0.1.1.bb>
>>
>>         diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>         <http://libxcvt_0.1.1.bb>
>>         b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>         <http://libxcvt_0.1.1.bb>
>>         new file mode 100644
>>         index 0000000000..628ccfb647
>>         --- /dev/null
>>         +++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>         <http://libxcvt_0.1.1.bb>
>>         @@ -0,0 +1,19 @@
>>         +SUMMARY = "Library providing a standalone version of the X
>>         server \
>>         +implementation of the VESA CVT standard timing modelines
>>         generator"
>>         +HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
>>         +BUGTRACKER =
>>         "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
>>         +LICENSE = "MIT"
>>         +LIC_FILES_CHKSUM =
>>         "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
>>         +SECTION = "x11/libs"
>>         +
>>         +SRC_URI =
>>         "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https
>>         <http://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https>"
>>         +SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
>>         +
>>         +S = "${WORKDIR}/git"
>>         +
>>         +inherit meson
>>         +
>>         +FILES:${PN} = " \
>>         +    ${libdir}/libxcvt.so.0* \
>>         +    ${bindir}/cvt \
>>         +"
>>         -- 
>>         2.25.1
>>
>>
>>         
>>

--------------DVxQyeSDNJnZvcacYXx0vRgl
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 27/10/2021 23:15, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqUNt=aRYX6Wiq1RNPvGYa1CqQJv-S7fH5=iyuutzt+4Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Oct 27, 2021 at 2:12
            PM Oleksandr Kravchuk &lt;<a
              href="mailto:open.source@oleksandr-kravchuk.com"
              moz-do-not-send="true" class="moz-txt-link-freetext">open.source@oleksandr-kravchuk.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div>
              <div>On 27/10/2021 23:09, Khem Raj wrote:<br>
              </div>
              <blockquote type="cite">
                <div><br>
                </div>
                <div><br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Wed, Oct 27,
                      2021 at 2:03 PM Oleksandr Kravchuk &lt;<a
                        href="mailto:open.source@oleksandr-kravchuk.com"
                        target="_blank" moz-do-not-send="true"
                        class="moz-txt-link-freetext">open.source@oleksandr-kravchuk.com</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">This
                      library is a dependancy of xserver-xorg 21.1.0.<br>
                    </blockquote>
                    <div dir="auto"><br>
                    </div>
                    <div dir="auto">I wonder if we need this to be in
                      core layer though</div>
                  </div>
                </div>
              </blockquote>
              Could you please clarify why it shouldn't if the package
              that needs is part of the core layer?</div>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I read the dependency in reverse however the
            next question is that is this new dependency or else how did
            we manage up until this point? <br>
          </div>
        </div>
      </div>
    </blockquote>
    I am sorry if I was not clear enough. This is a dependency of the
    v21.1.0 that was released a couple of hours ago. I have started
    working on upgrading xserver-xorg, but since I'm not sure I will
    have enough patience and expertise to finish it, I thought I would
    at least help with this small part.<br>
    <blockquote type="cite"
cite="mid:CAMKF1sqUNt=aRYX6Wiq1RNPvGYa1CqQJv-S7fH5=iyuutzt+4Q@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="auto"> </div>
            <div>
              <blockquote type="cite">
                <div>
                  <div class="gmail_quote">
                    <div dir="auto"><br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
                      Signed-off-by: Oleksandr Kravchuk &lt;<a
                        href="mailto:open.source@oleksandr-kravchuk.com"
                        target="_blank" moz-do-not-send="true"
                        class="moz-txt-link-freetext">open.source@oleksandr-kravchuk.com</a>&gt;<br>
                      ---<br>
                       .../xorg-lib/<a href="http://libxcvt_0.1.1.bb"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">libxcvt_0.1.1.bb</a>     
                                 | 19 +++++++++++++++++++<br>
                       1 file changed, 19 insertions(+)<br>
                       create mode 100644
                      meta/recipes-graphics/xorg-lib/<a
                        href="http://libxcvt_0.1.1.bb" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">libxcvt_0.1.1.bb</a><br>
                      <br>
                      diff --git a/meta/recipes-graphics/xorg-lib/<a
                        href="http://libxcvt_0.1.1.bb" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">libxcvt_0.1.1.bb</a>
                      b/meta/recipes-graphics/xorg-lib/<a
                        href="http://libxcvt_0.1.1.bb" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">libxcvt_0.1.1.bb</a><br>
                      new file mode 100644<br>
                      index 0000000000..628ccfb647<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-graphics/xorg-lib/<a
                        href="http://libxcvt_0.1.1.bb" rel="noreferrer"
                        target="_blank" moz-do-not-send="true">libxcvt_0.1.1.bb</a><br>
                      @@ -0,0 +1,19 @@<br>
                      +SUMMARY = "Library providing a standalone version
                      of the X server \<br>
                      +implementation of the VESA CVT standard timing
                      modelines generator"<br>
                      +HOMEPAGE = "<a
                        href="https://gitlab.freedesktop.org/xorg/lib/libxcvt"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true"
                        class="moz-txt-link-freetext">https://gitlab.freedesktop.org/xorg/lib/libxcvt</a>"<br>
                      +BUGTRACKER = "<a
                        href="https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true"
                        class="moz-txt-link-freetext">https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues</a>"<br>
                      +LICENSE = "MIT"<br>
                      +LIC_FILES_CHKSUM = <a moz-do-not-send="true">"file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"</a><br>
                      +SECTION = "x11/libs"<br>
                      +<br>
                      +SRC_URI = "<a moz-do-not-send="true">git://</a><a
href="http://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https</a>"<br>
                      +SRCREV =
                      "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"<br>
                      +<br>
                      +S = "${WORKDIR}/git"<br>
                      +<br>
                      +inherit meson<br>
                      +<br>
                      +FILES:${PN} = " \<br>
                      +    ${libdir}/libxcvt.so.0* \<br>
                      +    ${bindir}/cvt \<br>
                      +"<br>
                      -- <br>
                      2.25.1<br>
                      <br>
                      <br>
                      <br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------DVxQyeSDNJnZvcacYXx0vRgl--
