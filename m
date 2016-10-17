Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 38082719CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:29:59 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 07:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208,217";a="20382888"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2016 07:30:00 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<4139c9aa1622a83597d0b6ea336923686f844bd1.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LYQucFaMjB1qksJtEfpp6-UJdek_3K4jrjM72LDO3+4jA@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <d02cc941-da32-d0b6-3cce-bb760b70ab7b@linux.intel.com>
Date: Mon, 17 Oct 2016 09:34:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQucFaMjB1qksJtEfpp6-UJdek_3K4jrjM72LDO3+4jA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] selftest: set correct linux-yocto recipe when distro is poky-tiny
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
X-List-Received-Date: Mon, 17 Oct 2016 14:30:04 -0000
Content-Type: multipart/alternative;
	boundary="------------B8A802DFE6D368F26828465B"

--------------B8A802DFE6D368F26828465B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/17/2016 06:30 AM, Burton, Ross wrote:
>
> On 14 October 2016 at 17:40, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>      result = runCmd('bitbake-layers show-recipes -i kernel')
>     -        self.assertIn('linux-yocto:', result.output)
>     +        linux_yocto = 'linux-yocto-tiny' if distro == 'poky-tiny'
>     else 'linux-yocto'
>     +        self.assertIn(linux_yocto, result.output)
>
>
> If we want this test to be distro- and machine-agnostic then we should 
> handle other BSPs that don't use linux-yocto.  As this is just a test 
> for bitbake-layers, I'd say we can just delete the "inherits kernel" 
> block.
>
Agreed. Removed all the kernel checks, so sending a v2 today.

> Ross


--------------B8A802DFE6D368F26828465B
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
    <div class="moz-cite-prefix">On 10/17/2016 06:30 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYQucFaMjB1qksJtEfpp6-UJdek_3K4jrjM72LDO3+4jA@mail.gmail.com"
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
              <div id=":1d9" class="a3s aXjCH m157c41063d8bb95e">       
                 result = runCmd('bitbake-layers show-recipes -i
                kernel')<br>
                -        self.assertIn('linux-yocto:', result.output)<br>
                +        linux_yocto = 'linux-yocto-tiny' if distro ==
                'poky-tiny' else 'linux-yocto'<br>
                +        self.assertIn(linux_yocto, result.output)</div>
            </blockquote>
          </div>
          <br>
          If we want this test to be distro- and machine-agnostic then
          we should handle other BSPs that don't use linux-yocto.  As
          this is just a test for bitbake-layers, I'd say we can just
          delete the "inherits kernel" block.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    Agreed. Removed all the kernel checks, so sending a v2 today.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYQucFaMjB1qksJtEfpp6-UJdek_3K4jrjM72LDO3+4jA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------B8A802DFE6D368F26828465B--
