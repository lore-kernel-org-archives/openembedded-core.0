Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEBD700FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 16:47:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2016 08:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; 
	d="scan'208,217";a="897451185"
Received: from unknown (HELO [10.219.16.227]) ([10.219.16.227])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2016 08:47:36 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1453307585.git.alejandro.hernandez@linux.intel.com>
	<8a9e3e9cbe3a314c2ad9a2d5f7bfde4752cf2cfa.1453307585.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LZE-_XMvYjANPYDJBoJ9-wNgxap7-k9EbzXrjxXTSZB3g@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <569FBA47.4050907@linux.intel.com>
Date: Wed, 20 Jan 2016 10:48:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZE-_XMvYjANPYDJBoJ9-wNgxap7-k9EbzXrjxXTSZB3g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-nose: Fixes python-unittest-native RPROVIDES error after upgrade
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
X-List-Received-Date: Wed, 20 Jan 2016 16:47:46 -0000
Content-Type: multipart/alternative;
	boundary="------------000904080804050005020701"

--------------000904080804050005020701
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/20/2016 10:43 AM, Burton, Ross wrote:
>
> On 20 January 2016 at 16:33, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     The python-nose upgrade to 1.3.7 required a new unittest runtime
>     dependency
>     after this, bitbake cant find a runtime provider for it when
>     trying to build
>     python-nose-native, this patch makes python-native RPROVIDES
>     python-unittest-native
>     to fix the issue.
>
>

I agree

> A more accurate shortlog would be "python-native also RPROVIDE 
> python-unittest-native".
>
> Ross


--------------000904080804050005020701
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 01/20/2016 10:43 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZE-_XMvYjANPYDJBoJ9-wNgxap7-k9EbzXrjxXTSZB3g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 20 January 2016 at 16:33,
            Alejandro Hernandez <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:alejandro.hernandez@linux.intel.com">alejandro.hernandez@linux.intel.com</a></a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":iui" class="a3s" style="overflow:hidden">The
                python-nose upgrade to 1.3.7 required a new unittest
                runtime dependency<br>
                after this, bitbake cant find a runtime provider for it
                when trying to build<br>
                python-nose-native, this patch makes python-native
                RPROVIDES python-unittest-native<br>
                to fix the issue.</div>
            </blockquote>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    I agree<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZE-_XMvYjANPYDJBoJ9-wNgxap7-k9EbzXrjxXTSZB3g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">A more accurate shortlog would be
          "python-native also RPROVIDE python-unittest-native".</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000904080804050005020701--
