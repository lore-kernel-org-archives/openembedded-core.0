Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C4EAD719BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 15:16:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 17 Nov 2016 07:16:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,506,1473145200"; 
	d="scan'208,217";a="787615847"
Received: from jgperezc.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2016 07:16:12 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	"Esquivel, Benjamin" <benjamin.esquivel@intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com>
	<1369e521-e304-1b80-4229-2449718736a0@linux.intel.com>
	<005d01d23f73$e17e85c0$a47b9140$@linux.intel.com>
	<CAJTo0LYwVrdCUAXSz0VYKNt0TsETL2aZheVN+qv-HYi8jei6Aw@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <5ac0063b-061c-13b3-e5d0-42a5e35b7199@linux.intel.com>
Date: Thu, 17 Nov 2016 09:26:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYwVrdCUAXSz0VYKNt0TsETL2aZheVN+qv-HYi8jei6Aw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Thu, 17 Nov 2016 15:16:11 -0000
Content-Type: multipart/alternative;
	boundary="------------2D98EFE632DA3C495B148DF7"

--------------2D98EFE632DA3C495B148DF7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2016 03:11 PM, Burton, Ross wrote:
>
> On 15 November 2016 at 19:10, Benjamin Esquivel 
> <benjamin.esquivel@linux.intel.com 
> <mailto:benjamin.esquivel@linux.intel.com>> wrote:
>
>     The reason for the migration of the tests is for them to be
>     included in the selftest execution. And for that execution, it
>     needs to base off of the oeSelfTest class.
>
>
> Sounds like a problem with the discovery if it mandates oeselftest.  
> Is there a reason why it can't also execute bare unittests?
>
   You are right this is a problem on the suite right now AFAIK there 
will pbe a fix for this on oeqa2 framework adding Marian and Anibal to 
the loop to give an in put on this.
> Ross


--------------2D98EFE632DA3C495B148DF7
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
    <div class="moz-cite-prefix">On 11/15/2016 03:11 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYwVrdCUAXSz0VYKNt0TsETL2aZheVN+qv-HYi8jei6Aw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 15 November 2016 at 19:10,
            Benjamin Esquivel <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:benjamin.esquivel@linux.intel.com"
                target="_blank">benjamin.esquivel@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <p class="MsoNormal"><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f497d">The
                  reason for the migration of the tests is for them to
                  be included in the selftest execution. And for that
                  execution, it needs to base off of the oeSelfTest
                  class.</span></p>
            </blockquote>
          </div>
          <br>
          Sounds like a problem with the discovery if it mandates
          oeselftest.  Is there a reason why it can't also execute bare
          unittests?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
      You are right this is a problem on the suite right now AFAIK there
    will pbe a fix for this on oeqa2 framework adding Marian and Anibal
    to the loop to give an in put on this. <br>
    <blockquote
cite="mid:CAJTo0LYwVrdCUAXSz0VYKNt0TsETL2aZheVN+qv-HYi8jei6Aw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------2D98EFE632DA3C495B148DF7--
