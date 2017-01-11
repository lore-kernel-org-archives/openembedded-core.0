Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id ED7A46FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 20:02:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 11 Jan 2017 12:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; 
	d="scan'208,217";a="921463200"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga003.jf.intel.com with ESMTP; 11 Jan 2017 12:02:01 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<aef76aaebfb78d7e724d695d6702d55a962992d1.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbVjZ1w-navSNGkRNfOyHuDCCGF3KQYt5TGqHDo=Mkxig@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <a406a70c-6348-3d68-bfb5-7840499856c2@linux.intel.com>
Date: Wed, 11 Jan 2017 14:08:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbVjZ1w-navSNGkRNfOyHuDCCGF3KQYt5TGqHDo=Mkxig@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 4/4] selftest: sstatetests: skip glibc-initial tests and use a more generic image
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
X-List-Received-Date: Wed, 11 Jan 2017 20:02:02 -0000
Content-Type: multipart/alternative;
	boundary="------------2373568FAC6375215025C262"

--------------2373568FAC6375215025C262
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/11/2017 11:29 AM, Burton, Ross wrote:
>
> On 9 January 2017 at 17:45, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     -   bitbake("core-image-sato -S none")
>     +        bitbake("core-image-minimal -S none")
>
>
> As this is just stamp calculation, could we just do "world" instead...
>
I tried s/core-image-sato/world/ but asserts are not prepared for the 
latter. Let me double check and provide log.

> Ross


--------------2373568FAC6375215025C262
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
    <div class="moz-cite-prefix">On 01/11/2017 11:29 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbVjZ1w-navSNGkRNfOyHuDCCGF3KQYt5TGqHDo=Mkxig@mail.gmail.com"
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
              <div id=":2r1" class="a3s aXjCH m1598450bb8bce8eb">-     
                  bitbake("core-image-sato -S none")<br>
                +        bitbake("core-image-minimal -S none")<br>
              </div>
            </blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">As this is just stamp calculation,
          could we just do "world" instead...</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    I tried s/core-image-sato/world/ but asserts are not prepared for
    the latter. Let me double check and provide log.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbVjZ1w-navSNGkRNfOyHuDCCGF3KQYt5TGqHDo=Mkxig@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2373568FAC6375215025C262--
