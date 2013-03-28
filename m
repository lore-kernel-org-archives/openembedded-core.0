Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UL33Z-0007uV-Dp
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 03:59:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2S2g8h3008481
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Mar 2013 19:42:09 -0700 (PDT)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 27 Mar 2013 19:42:08 -0700
Message-ID: <5153AE01.1000401@windriver.com>
Date: Thu, 28 Mar 2013 10:42:09 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Anders Roxell <anders.roxell@gmail.com>
References: <1364286013-25970-1-git-send-email-anders.roxell@gmail.com>
	<515167BF.10305@windriver.com>
	<CAEUf8Fvh773fTq6SfS4nLtv1qkC95v5wByXyMY0bg0rWmLJqiQ@mail.gmail.com>
In-Reply-To: <CAEUf8Fvh773fTq6SfS4nLtv1qkC95v5wByXyMY0bg0rWmLJqiQ@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: RDEPENDS sed to remove "sed: command not found".
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
X-List-Received-Date: Thu, 28 Mar 2013 02:59:18 -0000
Content-Type: multipart/alternative;
	boundary="------------010700050305010008020806"

--------------010700050305010008020806
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2013 01:15 AM, Anders Roxell wrote:
>
>
>
> On Tue, Mar 26, 2013 at 10:17 AM, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     On 03/26/2013 04:20 PM, anders.roxell@gmail.com
>     <mailto:anders.roxell@gmail.com> wrote:
>
>         From: Anders Roxell <anders.roxell@enea.com
>         <mailto:anders.roxell@enea.com>>
>
>         Log:
>         /etc/rcS.d/S37populate-volatile.sh: line 13: sed: command not
>         found
>         /etc/rcS.d/S37populate-volatile.sh: line 152: sed: command not
>         found
>         /etc/rcS.d/S37populate-volatile.sh: line 152: sed: command not
>         found
>
>         Signed-off-by: Anders Roxell <anders.roxell@enea.com
>         <mailto:anders.roxell@enea.com>>
>         ---
>           meta/recipes-core/initscripts/initscripts_1.0.bb
>         <http://initscripts_1.0.bb> |    3 ++-
>           1 files changed, 2 insertions(+), 1 deletions(-)
>
>         diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb
>         <http://initscripts_1.0.bb>
>         b/meta/recipes-core/initscripts/initscripts_1.0.bb
>         <http://initscripts_1.0.bb>
>         index 649e182..bfd3d28 100644
>         --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>         <http://initscripts_1.0.bb>
>         +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>         <http://initscripts_1.0.bb>
>         @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic
>         system startup initialization scrip
>           SECTION = "base"
>           LICENSE = "GPLv2"
>           LIC_FILES_CHKSUM =
>         "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>         -PR = "r140"
>         +PR = "r141"
>             INHIBIT_DEFAULT_DEPS = "1"
>           @@ -39,6 +39,7 @@ KERNEL_VERSION = ""
>             inherit update-alternatives
>           DEPENDS_append = " update-rc.d-native"
>         +RDEPENDS_${PN} = " sed"
>             ALTERNATIVE_PRIORITY = "90"
>           ALTERNATIVE_${PN} = "functions"
>
>
>     busybox also provides sed if CONFIG_SED is enabled.
>     I'm wondering whether it's necessary to insert dependency here.
>     If so, then I think other packages which provide init scripts may
>     also rdepend on 'busybox' or 'coreutils' which provide basic
>     commands like 'chown' or 'sed'.
>
>
> aha... I missed that busybox could provide sed... I would like to do 
> some sort of rdepends on busybox or sed (because coreutils does not 
> provide the sed command).
> However, I only want sed if busybox isn't present and vice versa is 
> there a way to do this?
>
In this recipe? Maybe we could, but I don't know how.

Maybe you could look at the packagegroup 
concept(meta/recipes-core/packagegroups/packagegroup-core-boot.bb, for 
example, groups busybox and initscripts together).

Best Regards,
Chen Qi

> With kind regards,
> Anders
>
>
>     Best Regards,
>     Chen Qi
>
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


--------------010700050305010008020806
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 03/28/2013 01:15 AM, Anders Roxell
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAEUf8Fvh773fTq6SfS4nLtv1qkC95v5wByXyMY0bg0rWmLJqiQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Tue, Mar 26, 2013 at 10:17 AM,
            ChenQi <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="HOEnZb">
                <div class="h5">On 03/26/2013 04:20 PM, <a
                    moz-do-not-send="true"
                    href="mailto:anders.roxell@gmail.com"
                    target="_blank">anders.roxell@gmail.com</a> wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    From: Anders Roxell &lt;<a moz-do-not-send="true"
                      href="mailto:anders.roxell@enea.com"
                      target="_blank">anders.roxell@enea.com</a>&gt;<br>
                    <br>
                    Log:<br>
                    /etc/rcS.d/S37populate-volatile.sh: line 13: sed:
                    command not found<br>
                    /etc/rcS.d/S37populate-volatile.sh: line 152: sed:
                    command not found<br>
                    /etc/rcS.d/S37populate-volatile.sh: line 152: sed:
                    command not found<br>
                    <br>
                    Signed-off-by: Anders Roxell &lt;<a
                      moz-do-not-send="true"
                      href="mailto:anders.roxell@enea.com"
                      target="_blank">anders.roxell@enea.com</a>&gt;<br>
                    ---<br>
                    &nbsp; meta/recipes-core/initscripts/<a
                      moz-do-not-send="true"
                      href="http://initscripts_1.0.bb" target="_blank">initscripts_1.0.bb</a>
                    | &nbsp; &nbsp;3 ++-<br>
                    &nbsp; 1 files changed, 2 insertions(+), 1 deletions(-)<br>
                    <br>
                    diff --git a/meta/recipes-core/initscripts/<a
                      moz-do-not-send="true"
                      href="http://initscripts_1.0.bb" target="_blank">initscripts_1.0.bb</a>
                    b/meta/recipes-core/initscripts/<a
                      moz-do-not-send="true"
                      href="http://initscripts_1.0.bb" target="_blank">initscripts_1.0.bb</a><br>
                    index 649e182..bfd3d28 100644<br>
                    --- a/meta/recipes-core/initscripts/<a
                      moz-do-not-send="true"
                      href="http://initscripts_1.0.bb" target="_blank">initscripts_1.0.bb</a><br>
                    +++ b/meta/recipes-core/initscripts/<a
                      moz-do-not-send="true"
                      href="http://initscripts_1.0.bb" target="_blank">initscripts_1.0.bb</a><br>
                    @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide
                    the basic system startup initialization scrip<br>
                    &nbsp; SECTION = "base"<br>
                    &nbsp; LICENSE = "GPLv2"<br>
                    &nbsp; LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe">"file://COPYING;md5=751419260aa954499f7abaabaa882bbe"</a><br>
                    -PR = "r140"<br>
                    +PR = "r141"<br>
                    &nbsp; &nbsp; INHIBIT_DEFAULT_DEPS = "1"<br>
                    &nbsp; @@ -39,6 +39,7 @@ KERNEL_VERSION = ""<br>
                    &nbsp; &nbsp; inherit update-alternatives<br>
                    &nbsp; DEPENDS_append = " update-rc.d-native"<br>
                    +RDEPENDS_${PN} = " sed"<br>
                    &nbsp; &nbsp; ALTERNATIVE_PRIORITY = "90"<br>
                    &nbsp; ALTERNATIVE_${PN} = "functions"<br>
                  </blockquote>
                  <br>
                </div>
              </div>
              busybox also provides sed if CONFIG_SED is enabled.<br>
              I'm wondering whether it's necessary to insert dependency
              here.<br>
              If so, then I think other packages which provide init
              scripts may also rdepend on 'busybox' or 'coreutils' which
              provide basic commands like 'chown' or 'sed'.<br>
            </blockquote>
            <div style=""><br>
            </div>
            <div style="">aha... I missed that busybox could provide
              sed... I would like to do some sort of rdepends on busybox
              or sed (because coreutils does not provide the sed
              command).</div>
            <div style="">However, I only want sed if busybox isn't
              present and vice versa is there a way to do this?</div>
            <div style=""><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    In this recipe? Maybe we could, but I don't know how.<br>
    <br>
    Maybe you could look at the packagegroup
    concept(meta/recipes-core/packagegroups/packagegroup-core-boot.bb,
    for example, groups busybox and initscripts together).<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAEUf8Fvh773fTq6SfS4nLtv1qkC95v5wByXyMY0bg0rWmLJqiQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div style="">With kind regards,</div>
            <div style="">Anders</div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Best Regards,<br>
              Chen Qi
              <div class="HOEnZb">
                <div class="h5"><br>
                  <br>
                  _______________________________________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank">Openembedded-core@lists.openembedded.org</a><br>
                  <a moz-do-not-send="true"
href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core"
                    target="_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010700050305010008020806--
