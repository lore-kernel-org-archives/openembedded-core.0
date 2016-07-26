Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2D106606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 20:24:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jul 2016 13:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,426,1464678000"; 
	d="scan'208,217";a="740121575"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 13:24:01 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZG6Zqonn8miXcDzG=CxqcWgo67du49FX4ZMjw48nU1pw@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <5797C6EE.2080600@linux.intel.com>
Date: Tue, 26 Jul 2016 15:24:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZG6Zqonn8miXcDzG=CxqcWgo67du49FX4ZMjw48nU1pw@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Jul 2016 20:24:01 -0000
Content-Type: multipart/alternative;
	boundary="------------040809060700090407050605"

--------------040809060700090407050605
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/25/2016 05:38 PM, Burton, Ross wrote:
>
> On 13 June 2016 at 14:32, <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>     +   features = 'INHERIT += "testexport"\n'
>
>
> You mean testimage here as that class isn't inherited by default.
>
>     +        features = 'TEST_SUITES = "ping ssh selftest"\n'
>
>
> This overwrites the first assignment to features, and neither is 
> actually written using self.write_config().
>
>     +   # Build core-image-sato and testimage
>     +        bitbake('core-image-sato socat')
>     +        bitbake('-c testimage core-image-sato')
>
>
> I personally believe that core-image-sato is massive overkill for 
> selftest and core-image-full-cmdline is just as comprehensive (has 
> ssh, for example) without building all of Sato.

I don't know what happened when I made this commit and submitted the 
patch, this patch is just wrong. I swear I tested it locally, perhaps I 
messed up the branches or something like that. I'll work on a v2 of this.

Mariano

--------------040809060700090407050605
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 07/25/2016 05:38 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZG6Zqonn8miXcDzG=CxqcWgo67du49FX4ZMjw48nU1pw@mail.gmail.com"
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
              <div id=":132" class="a3s aXjCH m1554bb3cfec465aa">+     
                  features = 'INHERIT += "testexport"\n'<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>You mean testimage here as that class isn't inherited
              by default.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":132" class="a3s aXjCH m1554bb3cfec465aa">
                +        features = 'TEST_SUITES = "ping ssh
                selftest"\n'<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>This overwrites the first assignment to features, and
              neither is actually written using self.write_config().</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":132" class="a3s aXjCH m1554bb3cfec465aa">+     
                  # Build core-image-sato and testimage<br>
                +        bitbake('core-image-sato socat')<br>
                +        bitbake('-c testimage core-image-sato')</div>
            </blockquote>
          </div>
          <br>
          I personally believe that core-image-sato is massive overkill
          for selftest and core-image-full-cmdline is just as
          comprehensive (has ssh, for example) without building all of
          Sato.</div>
      </div>
    </blockquote>
    <br>
    I don't know what happened when I made this commit and submitted the
    patch, this patch is just wrong. I swear I tested it locally,
    perhaps I messed up the branches or something like that. I'll work
    on a v2 of this.<br>
    <div class="moz-signature"> <br>
      Mariano</div>
  </body>
</html>

--------------040809060700090407050605--
