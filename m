Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C637D71C24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:59:49 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2017 11:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208,217";a="47916910"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga004.jf.intel.com with ESMTP; 11 Jan 2017 11:59:49 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<bd50489338d4e001bc7f5511db02792b311a3672.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LYDAbGZ4E_adYLFGCQ84Fq7Cfs6PJsBqJmapzkemTnAdw@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <7761b4f4-aa4b-bf5b-646a-e5af208a8d7e@linux.intel.com>
Date: Wed, 11 Jan 2017 14:06:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYDAbGZ4E_adYLFGCQ84Fq7Cfs6PJsBqJmapzkemTnAdw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/4] selftest: imagefeatures: skip tests based on distro features and supported fstypes
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
X-List-Received-Date: Wed, 11 Jan 2017 19:59:50 -0000
Content-Type: multipart/alternative;
	boundary="------------CB31BE5160DCA3B6A2257134"

--------------CB31BE5160DCA3B6A2257134
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/11/2017 11:27 AM, Burton, Ross wrote:
>
> On 9 January 2017 at 17:45, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     +++ b/meta/lib/oeqa/selftest/imagefeatures.py
>     @@ -77,6 +77,9 @@ class ImageFeatures(oeSelfTest):
>              AutomatedBy: Daniel Istrate
>     <daniel.alexandrux.istrate@intel.com
>     <mailto:daniel.alexandrux.istrate@intel.com>>
>              """
>
>     +        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
>     +            self.skipTest('opengl not present on DISTRO_FEATURES
>     so core-image-clutter cannot be built')
>     +
>              # Build a core-image-clutter
>              bitbake('core-image-clutter')
>
>
> This test is pretty pointless, lets just delete it.

why is this pointless? if this is the case, we should then remove the 
core-image-clutter.bb target.


>     @@ -91,6 +94,10 @@ class ImageFeatures(oeSelfTest):
>              AutomatedBy: Daniel Istrate
>     <daniel.alexandrux.istrate@intel.com
>     <mailto:daniel.alexandrux.istrate@intel.com>>
>              """
>
>     +        distro_features = get_bb_var('DISTRO_FEATURES')
>     +        if not ('opengl' in distro_features and 'wayland' in
>     distro_features):
>     +            self.skipTest('neither opengl nor wayland present on
>     DISTRO_FEATURES so core-image-weston cannot be built')
>     +
>              features = 'DISTRO_FEATURES_append = " wayland"\n'
>              features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
>              self.write_config(features)
>
>
> This test is 90% nonsense, let's fix it whilst we're here.  After 
> checking that opengl and wayland are in DISTRO_FEATURES it can just 
> build core-image-weston: DISTRO_FEATURES doesn't need appending as it 
> already has wayland in, and CORE_IMAGE_EXTRA_INSTALL doesn't need 
> extending as core-image-weston obviously already contains weston.
>
> Ross


--------------CB31BE5160DCA3B6A2257134
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/11/2017 11:27 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYDAbGZ4E_adYLFGCQ84Fq7Cfs6PJsBqJmapzkemTnAdw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 January 2017 at 17:45, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
                target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4lo" class="a3s aXjCH m15984507a75cf04f">+++
                b/meta/lib/oeqa/selftest/<wbr>imagefeatures.py<br>
                @@ -77,6 +77,9 @@ class ImageFeatures(oeSelfTest):<br>
                         AutomatedBy: Daniel Istrate &lt;<a
                  moz-do-not-send="true"
                  href="mailto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@<wbr>intel.com</a>&gt;<br>
                         """<br>
                <br>
                +        if 'opengl' not in
                get_bb_var('DISTRO_FEATURES'):<br>
                +            self.skipTest('opengl not present on
                DISTRO_FEATURES so core-image-clutter cannot be built')<br>
                +<br>
                         # Build a core-image-clutter<br>
                         bitbake('core-image-clutter')<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>This test is pretty pointless, lets just delete it.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    why is this pointless? if this is the case, we should then remove
    the core-image-clutter.bb target.<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LYDAbGZ4E_adYLFGCQ84Fq7Cfs6PJsBqJmapzkemTnAdw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4lo" class="a3s aXjCH m15984507a75cf04f">
                @@ -91,6 +94,10 @@ class ImageFeatures(oeSelfTest):<br>
                         AutomatedBy: Daniel Istrate &lt;<a
                  moz-do-not-send="true"
                  href="mailto:daniel.alexandrux.istrate@intel.com">daniel.alexandrux.istrate@<wbr>intel.com</a>&gt;<br>
                         """<br>
                <br>
                +        distro_features = get_bb_var('DISTRO_FEATURES')<br>
                +        if not ('opengl' in distro_features and
                'wayland' in distro_features):<br>
                +            self.skipTest('neither opengl nor wayland
                present on DISTRO_FEATURES so core-image-weston cannot
                be built')<br>
                +<br>
                         features = 'DISTRO_FEATURES_append = "
                wayland"\n'<br>
                         features += 'CORE_IMAGE_EXTRA_INSTALL +=
                "wayland weston"'<br>
                         self.write_config(features)</div>
            </blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">This test is 90% nonsense, let's fix it
          whilst we're here.  After checking that opengl and wayland are
          in DISTRO_FEATURES it can just build core-image-weston:
          DISTRO_FEATURES doesn't need appending as it already has
          wayland in, and CORE_IMAGE_EXTRA_INSTALL doesn't need
          extending as core-image-weston obviously already contains
          weston.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------CB31BE5160DCA3B6A2257134--
