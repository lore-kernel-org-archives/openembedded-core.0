Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9928C62135
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 22:08:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2016 15:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,472,1459839600"; 
	d="scan'208,217";a="987522715"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2016 15:08:59 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
	<CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <57608079.2020008@linux.intel.com>
Date: Tue, 14 Jun 2016 17:08:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] selftest/runtime-test.py: Add test for import test from other layers
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
X-List-Received-Date: Tue, 14 Jun 2016 22:08:58 -0000
Content-Type: multipart/alternative;
	boundary="------------090003080006000002010309"

--------------090003080006000002010309
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/14/2016 04:26 AM, Burton, Ross wrote:
>
> On 13 June 2016 at 14:32, <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>     +   features = 'INHERIT += "testexport"\n'
>     +        features = 'TEST_SUITES = "ping ssh selftest"\n'
>     +
>     +        # Build core-image-sato and testimage
>     +        bitbake('core-image-sato socat')
>     +        bitbake('-c testimage core-image-sato')
>
>
> If we're just running ping/ssh/selftest, can the image be something a 
> lot smaller such as core-image-base?
>
> Ross

Unfortunately, base or minimal don't have ssh installed, and ssh it is 
required for the runtime tests.
I could add the ssh to DISTRO_FEATURES but personally I think that is 
not clean. What do you think?

Mariano

--------------090003080006000002010309
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 06/14/2016 04:26 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 13 June 2016 at 14:32, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:mariano.lopez@linux.intel.com"
                target="_blank">mariano.lopez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":48m" class="a3s aXjCH m1554bb3cfec465aa">+     
                  features = 'INHERIT += "testexport"\n'<br>
                +        features = 'TEST_SUITES = "ping ssh
                selftest"\n'<br>
                +<br>
                +        # Build core-image-sato and testimage<br>
                +        bitbake('core-image-sato socat')<br>
                +        bitbake('-c testimage core-image-sato')</div>
            </blockquote>
          </div>
          <br>
          If we're just running ping/ssh/selftest, can the image be
          something a lot smaller such as core-image-base?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <div class="moz-signature">Unfortunately, base or minimal don't have
      ssh installed, and ssh it is required for the runtime tests.<br>
      I could add the ssh to DISTRO_FEATURES but personally I think that
      is not clean. What do you think?<br>
      <br>
      Mariano<br>
    </div>
  </body>
</html>

--------------090003080006000002010309--
