Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 69B096093E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:55:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 17 Oct 2016 07:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; 
	d="scan'208,217";a="1045848173"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2016 07:55:53 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<c41808ff150629815c3dc6cd6291ebcc305e6025.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LZSNzif29-=uU-jqCF5Es0BiUPfGg+XD7aggrQuacyL6w@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <d1967f8c-9b67-3082-3c45-1776f17d65b7@linux.intel.com>
Date: Mon, 17 Oct 2016 10:00:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZSNzif29-=uU-jqCF5Es0BiUPfGg+XD7aggrQuacyL6w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] selftest: skip test_read_only_image on poky-tiny distro
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
X-List-Received-Date: Mon, 17 Oct 2016 14:55:53 -0000
Content-Type: multipart/alternative;
	boundary="------------94EE693D344DB4C5364540D3"

--------------94EE693D344DB4C5364540D3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/2016 06:48 AM, Burton, Ross wrote:
>
> On 14 October 2016 at 17:40, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     + if self.distro == 'poky-tiny':
>     +            self.skipTest('core-image-sato is not buildable with
>     poky-tiny')
>
>
> DISTRO_FEATURE check - sato needs opengl x11 so this is the actual 
> blocker.
>
> For a read_only_image test, switching the image to core-image-base or 
> similar would exercise the code just as well without needing as much 
> building or assumptions on DISTRO/MACHINE.
>
I see. So instead of using the distro value, I will use the 'libx11 in 
DISTRO_FEATURE' check. Sending V2 today.
> Ross


--------------94EE693D344DB4C5364540D3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/17/2016 06:48 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZSNzif29-=uU-jqCF5Es0BiUPfGg+XD7aggrQuacyL6w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 October 2016 at 17:40, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
                target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":cc" class="a3s aXjCH m157c4109d99db774">+       
                if self.distro == 'poky-tiny':<br>
                +            self.skipTest('core-image-sato is not
                buildable with poky-tiny')</div>
            </blockquote>
          </div>
          <br>
          DISTRO_FEATURE check - sato needs opengl x11 so this is the
          actual blocker.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">For a read_only_image test, switching
          the image to core-image-base or similar would exercise the
          code just as well without needing as much building or
          assumptions on DISTRO/MACHINE.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    I see. So instead of using the distro value, I will use the 'libx11
    in DISTRO_FEATURE' check. Sending V2 today.<br>
    <blockquote
cite="mid:CAJTo0LZSNzif29-=uU-jqCF5Es0BiUPfGg+XD7aggrQuacyL6w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------94EE693D344DB4C5364540D3--
