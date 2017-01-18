Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4398571A62;
	Wed, 18 Jan 2017 14:46:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2017 06:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,249,1477983600"; d="scan'208,217";a="50067690"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga004.jf.intel.com with ESMTP; 18 Jan 2017 06:46:04 -0800
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
	<CAHiDW_F=ybZibjGyjMpg4Gi+sEhSQPw6eVmGm7yxeUAj9mqFtQ@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <981c058a-c2ca-ac37-f160-192c9c820563@linux.intel.com>
Date: Wed, 18 Jan 2017 08:52:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_F=ybZibjGyjMpg4Gi+sEhSQPw6eVmGm7yxeUAj9mqFtQ@mail.gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembedded-architecture@lists.openembedded.org,
	Jose Lamego <jose.a.lamego@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [Openembedded-architecture] Patchwork and incoming patch testing
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
X-List-Received-Date: Wed, 18 Jan 2017 14:46:05 -0000
Content-Type: multipart/alternative;
	boundary="------------25B27CDEBBBF6AF39190CC74"

--------------25B27CDEBBBF6AF39190CC74
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

+ Jose Lamego


Jose is doing recent work on the patchwork UI, perhaps there are already 
bugs for the items you are asking.


On 01/18/2017 02:40 AM, Jussi Kukkonen wrote:
> This looks great, thanks.
>
> On 17 January 2017 at 20:05, Paul Eggleton 
> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>> 
> wrote:
>
>     In any event we are now finally in the
>     position where our patchwork instance can be relied upon to
>     collect emails,
>     and the UI is much improved. This should give us a bit more
>     visibility into
>     where patches are at in the process, although we are still working
>     on a few
>     places where patch series status needs to be updated (e.g. when a
>     patch goes
>     into testing).
>
>
> What's the plan for these status updates -- is the idea that you go to 
> patchwork UI to see the state of a specific patch set?
> Or maybe a reply to either patch sender or even the ML?
>
>     On top of patchwork we have built a simple smoke-testing framework
>     called
>     "patchtest" [5] along with a suite of corresponding tests for OE
>     [6]. These
>     tests are fairly simplistic at this point but check the basics
>     such as whether
>     a patch has been properly signed off, etc. We should soon start
>     seeing replies
>     sent to the mailing list and to submitters with results if there
>     are any
>     failures, saving us from noticing and pointing out some of the
>     more obvious
>     classes of mistakes.
>
>
>  Is there a reason for patchwork only showing "success" or "failure" 
> in the web ui, instead of linking to test results at least in in the 
> failure case?

Jussi, that is a good idea. Right now we need to click into the series, 
then into the patches and then one can see the patch test results, 
obviously, not the best way.

>
>
>
>  - Jussi
>
>
>


--------------25B27CDEBBBF6AF39190CC74
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>+ Jose Lamego <br>
    </p>
    <p><br>
    </p>
    <p>Jose is doing recent work on the patchwork UI, perhaps there are
      already bugs for the items you are asking.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/18/2017 02:40 AM, Jussi Kukkonen
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAHiDW_F=ybZibjGyjMpg4Gi+sEhSQPw6eVmGm7yxeUAj9mqFtQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div>This looks great, thanks.</div>
          <div class="gmail_quote"><br>
          </div>
          <div class="gmail_quote">On 17 January 2017 at 20:05, Paul
            Eggleton <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:paul.eggleton@linux.intel.com"
                target="_blank">paul.eggleton@linux.intel.com</a>&gt;</span>
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"><span>In any event we are now
              finally in the<br>
            </span><span>position where our patchwork instance can be
              relied upon to collect emails,<br>
            </span><span>and the UI is much improved. This should give
              us a bit more visibility into<br>
            </span><span>where patches are at in the process, although
              we are still working on a few<br>
            </span><span>places where patch series status needs to be
              updated (e.g. when a patch goes<br>
            </span><span>into testing).</span></blockquote>
          <div class="gmail_quote"><span><br>
            </span></div>
          <div class="gmail_quote"><span>What's the plan for these
              status updates -- is the idea that you go to patchwork UI
              to see the state of a specific patch set?</span></div>
          <div class="gmail_quote"><span>Or maybe a reply to either
              patch sender or even the ML?</span></div>
          <div class="gmail_quote"><span><br>
            </span></div>
          <div class="gmail_quote">
            <blockquote class="gmail_quote">On top of patchwork we have
              built a simple smoke-testing framework called<br>
              "patchtest" [5] along with a suite of corresponding tests
              for OE [6]. These<br>
              tests are fairly simplistic at this point but check the
              basics such as whether<br>
              a patch has been properly signed off, etc. We should soon
              start seeing replies<br>
              sent to the mailing list and to submitters with results if
              there are any<br>
              failures, saving us from noticing and pointing out some of
              the more obvious<br>
              classes of mistakes.</blockquote>
            <div><br>
            </div>
            <div> Is there a reason for patchwork only showing "success"
              or "failure" in the web ui, instead of linking to test
              results at least in in the failure case?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Jussi, that is a good idea. Right now we need to click into the
    series, then into the patches and then one can see the patch test
    results, obviously, not the best way.<br>
    <br>
    <blockquote
cite="mid:CAHiDW_F=ybZibjGyjMpg4Gi+sEhSQPw6eVmGm7yxeUAj9mqFtQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote"><br>
            <div><br>
            </div>
            <div><br>
            </div>
            <div> - Jussi</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------25B27CDEBBBF6AF39190CC74--
