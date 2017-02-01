Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C20DE6079E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 22:36:33 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 01 Feb 2017 14:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,322,1477983600"; d="scan'208,217";a="59811132"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by orsmga005.jf.intel.com with ESMTP; 01 Feb 2017 14:36:32 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1485972323-9884-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LaE6VRgK_say=emAmTVOOho0BmuStCoCfAeuCWKNwUvDw@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <2ec8737b-cfd1-6778-7d3a-0fa416cac304@linux.intel.com>
Date: Wed, 1 Feb 2017 16:43:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaE6VRgK_say=emAmTVOOho0BmuStCoCfAeuCWKNwUvDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/archiver: invalidate stamps instead of removing TMPDIR
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
X-List-Received-Date: Wed, 01 Feb 2017 22:36:37 -0000
Content-Type: multipart/alternative;
	boundary="------------8FB641E99E6F5A9406DBA305"

--------------8FB641E99E6F5A9406DBA305
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/01/2017 02:42 PM, Burton, Ross wrote:
>
> On 1 February 2017 at 18:05, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     -   shutil.rmtree(get_bb_var('TMPDIR'))
>     -        bitbake("%s %s" % (include_recipe, exclude_recipe))
>     +        bitbake("-C fetch %s" % include_recipe)
>     +        bitbake("-C fetch %s" % exclude_recipe)
>
>
> You'll probably want to have a cleanup of the recipes to remove the 
> tainted stamps: bitbake -cclean for the recipes will do it.
Got it, so -c and -C left .taint files. I send a v2 soon.

Leo
>
> Ross


--------------8FB641E99E6F5A9406DBA305
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
    <div class="moz-cite-prefix">On 02/01/2017 02:42 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaE6VRgK_say=emAmTVOOho0BmuStCoCfAeuCWKNwUvDw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 1 February 2017 at 18:05, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
                target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":66o" class="a3s aXjCH m159fad411d836936">-     
                  shutil.rmtree(get_bb_var('<wbr>TMPDIR'))<br>
                -        bitbake("%s %s" % (include_recipe,
                exclude_recipe))<br>
                +        bitbake("-C fetch %s" % include_recipe)<br>
                +        bitbake("-C fetch %s" % exclude_recipe)</div>
            </blockquote>
          </div>
          <br>
          You'll probably want to have a cleanup of the recipes to
          remove the tainted stamps: bitbake -cclean for the recipes
          will do it.</div>
      </div>
    </blockquote>
    Got it, so -c and -C left .taint files. I send a v2 soon.<br>
    <br>
    Leo<br>
    <blockquote
cite="mid:CAJTo0LaE6VRgK_say=emAmTVOOho0BmuStCoCfAeuCWKNwUvDw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8FB641E99E6F5A9406DBA305--
