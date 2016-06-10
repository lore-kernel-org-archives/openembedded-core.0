Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF756FF73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 16:19:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jun 2016 09:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,450,1459839600"; 
	d="scan'208,217";a="717063230"
Received: from unknown (HELO [10.252.197.155]) ([10.252.197.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2016 09:19:01 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
	<a71f92e38782662b823eba9811ed2407fc689789.1465365165.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LaQmz6jeCbtR-QmXOMNaLzg-HFFJBOakVb21v9sDZfj_w@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <575AE87D.8070703@linux.intel.com>
Date: Fri, 10 Jun 2016 11:19:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaQmz6jeCbtR-QmXOMNaLzg-HFFJBOakVb21v9sDZfj_w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] python-git: Upgrade from 1.0.2 to 2.0.5
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
X-List-Received-Date: Fri, 10 Jun 2016 16:19:09 -0000
Content-Type: multipart/alternative;
	boundary="------------020009020303040703050107"

--------------020009020303040703050107
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2016 11:16 AM, Burton, Ross wrote:
>
> On 8 June 2016 at 06:56, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>      meta/recipes-devtools/python/python-git.inc                     
>        | 6 +++---
>      .../python/{python-git_1.0.2.bb <http://python-git_1.0.2.bb> =>
>     python-git_2.0.5.bb <http://python-git_2.0.5.bb>}            | 0
>
>
> Any reason why this didn't do python3-git?
>
> This causes problems as the checksums are in the .inc, which doesn't 
> make sense if multiple versions are sharing it.  I'm carrying 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=5767caa2ea0d1504b5c3f212fdcda3e918e967e0 
> right now to fix this.
>
> Ross

The reason is that I forgot, I'll send a v2 containing python3-git too.

Alejandro


--------------020009020303040703050107
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 06/10/2016 11:16 AM, Burton, Ross wrote:<br>
    <blockquote
cite="mid:CAJTo0LaQmz6jeCbtR-QmXOMNaLzg-HFFJBOakVb21v9sDZfj_w@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 8 June 2016 at 06:56, Alejandro
            Hernandez <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":5g5" class=""> meta/recipes-devtools/<span
                  class="">python</span>/<span class="">python</span>-<span
                  class="">git</span>.inc                         | 6
                +++---<br>
                 .../<span class="">python</span>/{<a
                  moz-do-not-send="true"
                  href="http://python-git_1.0.2.bb" rel="noreferrer"
                  target="_blank"><span class="">python</span>-git_1.0.2.bb</a>
                =&gt; <a moz-do-not-send="true"
                  href="http://python-git_2.0.5.bb" rel="noreferrer"
                  target="_blank"><span class="">python</span>-git_2.0.5.bb</a>} 
                           | 0<br>
              </div>
            </blockquote>
          </div>
          <br>
          Any reason why this didn't do python3-git?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">This causes problems as the checksums
          are in the .inc, which doesn't make sense if multiple versions
          are sharing it.  I'm carrying <a moz-do-not-send="true"
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut&amp;id=5767caa2ea0d1504b5c3f212fdcda3e918e967e0">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut&amp;id=5767caa2ea0d1504b5c3f212fdcda3e918e967e0</a>
          right now to fix this.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    The reason is that I forgot, I'll send a v2 containing python3-git
    too.<br>
    <br>
    Alejandro<br>
    <br>
  </body>
</html>

--------------020009020303040703050107--
