Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9ED71978
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 17:59:00 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 15 Nov 2016 09:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,495,1473145200"; d="scan'208,217";a="31637194"
Received: from jgperezc.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2016 09:59:00 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <1369e521-e304-1b80-4229-2449718736a0@linux.intel.com>
Date: Tue, 15 Nov 2016 12:09:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 15 Nov 2016 17:59:03 -0000
Content-Type: multipart/alternative;
	boundary="------------BF4E3234C2AA2BC57497F5CD"

--------------BF4E3234C2AA2BC57497F5CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2016 11:16 AM, Burton, Ross wrote:
>
> On 15 November 2016 at 16:24, <jose.perez.carranza@linux.intel.com 
> <mailto:jose.perez.carranza@linux.intel.com>> wrote:
>
>     +class TestPackagesFilterOutSystem(oeSelfTest):
>
>
> As the tests don't need anything special that oeSelfTest provides, can 
> they remain as testcase.TestCase instances? There's a lot of 
> complication from oeSelfTest that isn't required.
>
In order to the test cases be recognized and executed as part of the 
suite they need to be in the same context of selftest hence be an 
instance of oeSelftest.
> Ross


--------------BF4E3234C2AA2BC57497F5CD
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
    <div class="moz-cite-prefix">On 11/15/2016 11:16 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 15 November 2016 at 16:24, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jose.perez.carranza@linux.intel.com"
                target="_blank">jose.perez.carranza@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2sc" class="a3s aXjCH m15868c796a11fd24">+class
                TestPackagesFilterOutSystem(<wbr>oeSelfTest):<br>
              </div>
            </blockquote>
          </div>
          <br>
          As the tests don't need anything special that oeSelfTest
          provides, can they remain as testcase.TestCase instances? 
          There's a lot of complication from oeSelfTest that isn't
          required.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    In order to the test cases be recognized and executed as part of the
    suite they need to be in the same context of selftest hence be an
    instance of oeSelftest.  <br>
    <blockquote
cite="mid:CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------BF4E3234C2AA2BC57497F5CD--
