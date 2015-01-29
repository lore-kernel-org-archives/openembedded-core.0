Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB7AF601DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 16:11:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Jan 2015 08:07:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,486,1418112000"; 
	d="scan'208,217";a="669770654"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.43])
	([10.219.4.43])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2015 08:11:46 -0800
Message-ID: <54CA5BC8.4000201@linux.intel.com>
Date: Thu, 29 Jan 2015 10:11:52 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1422401819-24209-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<CAJTo0LYWqiy+dKjECTUm4pZogAwh=X7eb4P06S6Gg=ct=QcJ3g@mail.gmail.com>
In-Reply-To: <CAJTo0LYWqiy+dKjECTUm4pZogAwh=X7eb4P06S6Gg=ct=QcJ3g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.py: fixes launching multiple windows of gnome-terminal
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
X-List-Received-Date: Thu, 29 Jan 2015 16:11:47 -0000
Content-Type: multipart/alternative;
	boundary="------------090207020106040707060303"

--------------090207020106040707060303
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/15 04:56, Burton, Ross wrote:
>
> On 27 January 2015 at 23:36, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     When resolving a patch, a new process of gnome-terminal
>
>     is created for every patch to be resolved, it "waits"
>
>     for the previous one to end, instead of launching
>
>     multiple windows at the same time.
>
>
> I wish I knew what causes some of your commit messages to end up being 
> double-line-spaced!
>
> Ross

I was copying and pasting, will stop now.

--------------090207020106040707060303
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 29/01/15 04:56, Burton, Ross wrote:<br>
    <blockquote
cite="mid:CAJTo0LYWqiy+dKjECTUm4pZogAwh=X7eb4P06S6Gg=ct=QcJ3g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 27 January 2015 at 23:36,
            Alejandro Hernandez <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":21u" class="a3s" style="overflow:hidden">When
                resolving a patch, a new process of gnome-terminal<br>
                <br>
                is created for every patch to be resolved, it "waits"<br>
                <br>
                for the previous one to end, instead of launching<br>
                <br>
                multiple windows at the same time.</div>
            </blockquote>
          </div>
          <br>
          I wish I knew what causes some of your commit messages to end
          up being double-line-spaced!</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    I was copying and pasting, will stop now.<br>
  </body>
</html>

--------------090207020106040707060303--
