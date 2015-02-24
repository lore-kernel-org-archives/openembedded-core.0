Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD8571633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:29:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Feb 2015 08:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,639,1418112000"; 
	d="scan'208,217";a="670879121"
Received: from besabasr-mobl1.amr.corp.intel.com (HELO [10.252.248.205])
	([10.252.248.205])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2015 08:29:30 -0800
Message-ID: <54ECA6EB.5010707@linux.intel.com>
Date: Tue, 24 Feb 2015 10:29:31 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1424758088-31785-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<CAJTo0LbRTqtSbeJoczLBHKQgKuZsyhjfcYgBeTUb0tuadM0goA@mail.gmail.com>
In-Reply-To: <CAJTo0LbRTqtSbeJoczLBHKQgKuZsyhjfcYgBeTUb0tuadM0goA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-native: Fixes PGEN linking errors Changes Makefile rules to avoid parallel make races when trying to build Parser/PGEN
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
X-List-Received-Date: Tue, 24 Feb 2015 16:29:36 -0000
Content-Type: multipart/alternative;
	boundary="------------070607070905020408070405"

--------------070607070905020408070405
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/02/15 06:02, Burton, Ross wrote:
> Hi Alejandro,
>
> On 24 February 2015 at 06:08, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     +Upstream-Status: Inappropriate [embedded specific]
>
>
> This is a genuine build race in the make files and entirely 
> appropriate for upstream.  Can you send them a patch?
>
> Ross

Will do, should I send the patch again to the list without that info?


--------------070607070905020408070405
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 24/02/15 06:02, Burton, Ross wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbRTqtSbeJoczLBHKQgKuZsyhjfcYgBeTUb0tuadM0goA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Hi Alejandro,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 24 February 2015 at 06:08,
            Alejandro Hernandez <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":fl" class="a3s" style="overflow:hidden">+Upstream-Status:
                Inappropriate [embedded specific]<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>This is a genuine build race in the make files and
              entirely appropriate for upstream.  Can you send them a
              patch?</div>
            <div><br>
            </div>
            <div>Ross <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Will do, should I send the patch again to the list without that
    info?<br>
    <br>
  </body>
</html>

--------------070607070905020408070405--
