Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A59CD7316D
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:04:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0KE4dXF028185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Jan 2017 06:04:39 -0800 (PST)
Received: from [172.25.59.218] (172.25.59.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 06:04:38 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
	<20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LaFMD3cFHR2d_1W4pM3cy7ekhM21UpBRz_Ec+C4tYigQQ@mail.gmail.com>
	<63d74901-4f7e-292f-8163-445006e226d2@windriver.com>
	<CAJTo0LZ+C=_cz3wdvtqmYJBrNHR-UBX9fasrg_T632G_u43itA@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <869ff8ea-8803-2751-3d2f-187eff4755b5@windriver.com>
Date: Fri, 20 Jan 2017 08:04:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+C=_cz3wdvtqmYJBrNHR-UBX9fasrg_T632G_u43itA@mail.gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Fri, 20 Jan 2017 14:04:40 -0000
Content-Type: multipart/alternative;
	boundary="------------548C08B3DCEF3B0FCA9C681C"

--------------548C08B3DCEF3B0FCA9C681C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2017 07:52 AM, Burton, Ross wrote:
>
> On 20 January 2017 at 13:48, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>     WARNING: linux-yocto-4.8.12+gitAUTOINC+3edb4de355_9bcb4ea3fa-r0 do_package: QA Issue: linux-yocto: Files/directories were installed but not shipped in any package:
>       /lib64
>       /lib/modules/4.8.17-yocto-standard/modules.builtin
>       /lib64/firmware
>       /lib64/firmware/cpia2
>       /lib64/firmware/cpia2/stv0672_vp4.bin
>     Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>     linux-yocto: 5 installed and not shipped files. [installed-vs-shipped]
>
> I suspect this is trivial with fresh eyes.  What multilib configuration are you using?  My usual "test multilib" stanza is:
>
> #require conf/multilib.conf
> #MULTILIBS_x86-64 = "multilib:lib32"
> #DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>
> I'm guessing this isn't going to produce the same paths that you're seeing problems with.
>
> Ross


It looks like it probably should.

MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"


If for some reason you wanted to perform the exact same build I have the instructions to do so:

https://github.com/WindRiver-OpenSourceLabs/wr-core/blob/master/docs/README-intel-x86.TXT

That basically amounts to:

git clone -b master --recurse-submodules https://github.com/WindRiver-OpenSourceLabs/wr-core

cd wr-core

. init-intel-x86-env


Jason.


--------------548C08B3DCEF3B0FCA9C681C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/20/2017 07:52 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ+C=_cz3wdvtqmYJBrNHR-UBX9fasrg_T632G_u43itA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 20 January 2017 at 13:48, Jason
            Wessel <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jason.wessel@windriver.com" target="_blank">jason.wessel@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote">
              <p>WARNING: linux-yocto-4.8.12+gitAUTOINC+<wbr>3edb4de355_9bcb4ea3fa-r0
                do_package: QA Issue: linux-yocto: Files/directories
                were installed but not shipped in any package:<br>
                  /lib64<br>
                  /lib/modules/4.8.17-yocto-<wbr>standard/modules.builtin<br>
                  /lib64/firmware<br>
                  /lib64/firmware/cpia2<br>
                  /lib64/firmware/cpia2/stv0672_<wbr>vp4.bin<br>
                Please set FILES such that these items are packaged.
                Alternatively if they are unneeded, avoid installing
                them or delete them within do_install.<br>
                linux-yocto: 5 installed and not shipped files.
                [installed-vs-shipped]</p>
            </blockquote>
          </div>
          I suspect this is trivial with fresh eyes.  What multilib
          configuration are you using?  My usual "test multilib" stanza
          is:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">
          <div class="gmail_extra">#require conf/multilib.conf</div>
          <div class="gmail_extra">#MULTILIBS_x86-64 = "multilib:lib32"</div>
          <div class="gmail_extra">#DEFAULTTUNE_virtclass-multilib-lib32
            = "x86"</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">I'm guessing this isn't going to
            produce the same paths that you're seeing problems with.</div>
          <div class="gmail_extra"><br>
          </div>
          <div class="gmail_extra">Ross</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>It looks like it probably should. <br>
    </p>
    <p>MULTILIBS = "multilib:lib32"<br>
      DEFAULTTUNE_virtclass-multilib-lib32 = "x86"<br>
    </p>
    <p><br>
    </p>
    <p>If for some reason you wanted to perform the exact same build I
      have the instructions to do so:</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/WindRiver-OpenSourceLabs/wr-core/blob/master/docs/README-intel-x86.TXT">https://github.com/WindRiver-OpenSourceLabs/wr-core/blob/master/docs/README-intel-x86.TXT</a><br>
    </p>
    <p>That basically amounts to:</p>
    <p>git clone -b master --recurse-submodules
      <a class="moz-txt-link-freetext" href="https://github.com/WindRiver-OpenSourceLabs/wr-core">https://github.com/WindRiver-OpenSourceLabs/wr-core</a></p>
    <p>cd wr-core</p>
    <p>. init-intel-x86-env</p>
    <p><br>
    </p>
    <p>Jason. <br>
    </p>
  </body>
</html>

--------------548C08B3DCEF3B0FCA9C681C--
