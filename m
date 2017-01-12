Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6929A6025E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 18:41:24 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jan 2017 10:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,219,1477983600"; d="scan'208,217";a="48224224"
Received: from aehernan-mobl1.zpn.intel.com (HELO [10.219.5.166])
	([10.219.5.166])
	by orsmga004.jf.intel.com with ESMTP; 12 Jan 2017 10:41:23 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
	<b15cc7cffbf3ef385dd6c4afb8f3d80d37082576.1484164023.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LYzaFMY7mNS3fDtiRrhzZ-G0558Mp=dKxHppVVtons11A@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <5d0ccb7d-3b57-4a48-456d-053bab9b2d0a@linux.intel.com>
Date: Thu, 12 Jan 2017 12:41:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYzaFMY7mNS3fDtiRrhzZ-G0558Mp=dKxHppVVtons11A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] image-.bbclass: standarize usage of DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Thu, 12 Jan 2017 18:41:26 -0000
Content-Type: multipart/alternative;
	boundary="------------A452EE68BDBA46407D5181EC"

--------------A452EE68BDBA46407D5181EC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/12/2017 11:10 AM, Burton, Ross wrote:
>
> On 11 January 2017 at 19:55, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     Since wic now looks for boot artifacts on DEPLOY_DIR_IMAGE,
>     we need to standarize the usage of this variable and drop
>     HDDDIR to avoid confusion, which will let us drop support
>     for hddimg in the future.
>
>     Signed-off-by: Alejandro Hernandez
>     <alejandro.hernandez@linux.intel.com
>     <mailto:alejandro.hernandez@linux.intel.com>>
>     ---
>      meta/classes/image-live.bbclass | 18 +++++++++---------
>      meta/classes/image-vm.bbclass   | 12 ++++++------
>

Yes, these are changed on the previous patch (2/7)
>
> There's other places that use this variable:
>
> meta/lib/oeqa/selftest/wic.py:  wicvars = 
> wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
> scripts/lib/wic/plugins/source/bootimg-efi.py:            bootimg_dir 
> = get_bitbake_var("HDDDIR")
> scripts/lib/wic/plugins/source/bootimg-efi.py:               
>  msger.error("Couldn't find HDDDIR, exiting\n")
> scripts/lib/wic/plugins/source/isoimage-isohybrid.py:        hdd_dir = 
> get_bitbake_var("HDDDIR")
>
> Ross


--------------A452EE68BDBA46407D5181EC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 01/12/2017 11:10 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYzaFMY7mNS3fDtiRrhzZ-G0558Mp=dKxHppVVtons11A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 11 January 2017 at 19:55,
            Alejandro Hernandez <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id="gmail-:1x9" class="gmail-a3s gmail-aXjCH
                gmail-m1598f1c5e4330547">Since wic now looks for boot
                artifacts on DEPLOY_DIR_IMAGE,<br>
                we need to standarize the usage of this variable and
                drop<br>
                <span class="gmail-il">HDDDIR</span> to avoid confusion,
                which will let us drop support<br>
                for hddimg in the future.<br>
                <br>
                Signed-off-by: Alejandro Hernandez &lt;<a
                  moz-do-not-send="true"
                  href="mailto:alejandro.hernandez@linux.intel.com">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
                ---<br>
                 meta/classes/image-live.<wbr>bbclass | 18
                +++++++++---------<br>
                 meta/classes/image-vm.bbclass   | 12 ++++++------</div>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, these are changed on the previous patch (2/7)<br>
    <blockquote
cite="mid:CAJTo0LYzaFMY7mNS3fDtiRrhzZ-G0558Mp=dKxHppVVtons11A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_extra"><br>
          </div>
          There's other places that use this variable:</div>
        <div class="gmail_extra"><br>
          <div class="gmail_extra">meta/lib/oeqa/selftest/wic.py:      
             wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',</div>
          <div class="gmail_extra">scripts/lib/wic/plugins/source/bootimg-efi.py:
                       bootimg_dir = get_bitbake_var("HDDDIR")</div>
          <div class="gmail_extra">scripts/lib/wic/plugins/source/bootimg-efi.py:
                           msger.error("Couldn't find HDDDIR,
            exiting\n")</div>
          <div class="gmail_extra">scripts/lib/wic/plugins/source/isoimage-isohybrid.py:
                   hdd_dir = get_bitbake_var("HDDDIR")</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A452EE68BDBA46407D5181EC--
