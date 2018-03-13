Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EC4E97198F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 00:09:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 17:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,463,1515484800"; d="scan'208,217";a="38198754"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2018 17:09:23 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180310002346.6086-1-california.l.sullivan@intel.com>
	<CAJTo0Lbw3obJmC44nLGXxNGb1AuVFxGQzH69ckDZzM76qOkwLQ@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <e95861b3-527a-7f70-b572-0b38ee7647b8@intel.com>
Date: Mon, 12 Mar 2018 17:09:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbw3obJmC44nLGXxNGb1AuVFxGQzH69ckDZzM76qOkwLQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc: use xf86-video-modesettings as default xserver
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
X-List-Received-Date: Tue, 13 Mar 2018 00:09:23 -0000
Content-Type: multipart/alternative;
	boundary="------------A1ACDF342AF3660B21C6BF18"
Content-Language: en-US

--------------A1ACDF342AF3660B21C6BF18
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

It looks like Fedora doesn't patch the -intel driver anymore, instead 
they patch xserver to fiddle with the defaults.

https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d?branch=master

Given the comment and commit description, I'm guessing that list is 
everything older than gen4 (haswell) not already defaulting to something 
else.

I can't find any attempts to upstream the patch... Also, given the 
different formatting, what would be the proper way to bring this into 
OE? Rewrite the commit message, leave Author field intact and add a link?

Thanks,
Cal

On 03/10/2018 09:55 AM, Burton, Ross wrote:
> From memory there are some chipsets which the Intel driver *is* better 
> on.  I recommend we look at the Fedora patches for the intel driver, I 
> believe that massively reduces the chips that the intel driver will be 
> the primary driver for. We can then continue to ship both and not 
> break anything.
>
> Ross
>
> On 10 March 2018 at 00:23, California Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     Most distros have switched to this, and we're seeing better results in
>     some areas as well. E.g., on a NUC6CAYS the x11perf -aa10text and
>     -rgb10text results see a 20x increase.
>
>     [YOCTO #12019].
>     [YOCTO #12590].
>
>     Signed-off-by: California Sullivan
>     <california.l.sullivan@intel.com
>     <mailto:california.l.sullivan@intel.com>>
>     ---
>      meta/conf/machine/include/x86-base.inc | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/conf/machine/include/x86-base.inc
>     b/meta/conf/machine/include/x86-base.inc
>     index f8aacea64cc..e6bfdc6f770 100644
>     --- a/meta/conf/machine/include/x86-base.inc
>     +++ b/meta/conf/machine/include/x86-base.inc
>     @@ -34,11 +34,11 @@ XSERVER_X86_EXT = " \
>                 xserver-xorg-module-libint10 \
>                 "
>
>     -XSERVER_X86_I915 = "xf86-video-intel \
>     +XSERVER_X86_I915 = "xf86-video-modesetting \
>                 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
>     'mesa-driver-i915', '', d)} \
>                 "
>
>     -XSERVER_X86_I965 = "xf86-video-intel \
>     +XSERVER_X86_I965 = "xf86-video-modesetting \
>                 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
>     'mesa-driver-i965', '', d)} \
>                 "
>
>     --
>     2.14.3
>
>


--------------A1ACDF342AF3660B21C6BF18
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>It looks like Fedora doesn't patch the -intel driver anymore,
      instead they patch xserver to fiddle with the defaults.<br>
      <br>
<a class="moz-txt-link-freetext" href="https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d?branch=master">https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d?branch=master</a><br>
      <br>
      Given the comment and commit description, I'm guessing that list
      is everything older than gen4 (haswell) not already defaulting to
      something else.<br>
      <br>
      I can't find any attempts to upstream the patch... Also, given the
      different formatting, what would be the proper way to bring this
      into OE? Rewrite the commit message, leave Author field intact and
      add a link?<br>
      <br>
      Thanks,<br>
      Cal<br>
    </tt><br>
    <div class="moz-cite-prefix">On 03/10/2018 09:55 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lbw3obJmC44nLGXxNGb1AuVFxGQzH69ckDZzM76qOkwLQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">From memory there are some chipsets which the Intel
        driver *is* better on.  I recommend we look at the Fedora
        patches for the intel driver, I believe that massively reduces
        the chips that the intel driver will be the primary driver for. 
        We can then continue to ship both and not break anything.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 10 March 2018 at 00:23, California
          Sullivan <span dir="ltr">&lt;<a
              href="mailto:california.l.sullivan@intel.com"
              target="_blank" moz-do-not-send="true">california.l.sullivan@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Most
            distros have switched to this, and we're seeing better
            results in<br>
            some areas as well. E.g., on a NUC6CAYS the x11perf
            -aa10text and<br>
            -rgb10text results see a 20x increase.<br>
            <br>
            [YOCTO #12019].<br>
            [YOCTO #12590].<br>
            <br>
            Signed-off-by: California Sullivan &lt;<a
              href="mailto:california.l.sullivan@intel.com"
              moz-do-not-send="true">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
            ---<br>
             meta/conf/machine/include/x86-<wbr>base.inc | 4 ++--<br>
             1 file changed, 2 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/meta/conf/machine/include/<wbr>x86-base.inc
            b/meta/conf/machine/include/<wbr>x86-base.inc<br>
            index f8aacea64cc..e6bfdc6f770 100644<br>
            --- a/meta/conf/machine/include/<wbr>x86-base.inc<br>
            +++ b/meta/conf/machine/include/<wbr>x86-base.inc<br>
            @@ -34,11 +34,11 @@ XSERVER_X86_EXT = " \<br>
                        xserver-xorg-module-libint10 \<br>
                        "<br>
            <br>
            -XSERVER_X86_I915 = "xf86-video-intel \<br>
            +XSERVER_X86_I915 = "xf86-video-modesetting \<br>
                        ${@bb.utils.contains('DISTRO_<wbr>FEATURES',
            'opengl', 'mesa-driver-i915', '', d)} \<br>
                        "<br>
            <br>
            -XSERVER_X86_I965 = "xf86-video-intel \<br>
            +XSERVER_X86_I965 = "xf86-video-modesetting \<br>
                        ${@bb.utils.contains('DISTRO_<wbr>FEATURES',
            'opengl', 'mesa-driver-i965', '', d)} \<br>
                        "<br>
            <span class="HOEnZb"><font color="#888888"><br>
                --<br>
                2.14.3<br>
                <br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A1ACDF342AF3660B21C6BF18--
