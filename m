Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 10A606FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 17:05:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 19 Sep 2016 10:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,362,1470726000"; 
	d="scan'208,217";a="1053406117"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2016 10:05:23 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
	<CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
Date: Mon, 19 Sep 2016 10:05:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Mon, 19 Sep 2016 17:05:23 -0000
Content-Type: multipart/alternative;
	boundary="------------0CA99F17088136025FF0234A"

--------------0CA99F17088136025FF0234A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

It looks like the function is doing as its supposed to, and we need to 
update some PVs or SRCREVs to match PVs.

E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.

---
Cal

On 09/19/2016 09:22 AM, Burton, Ross wrote:
>
> On 19 September 2016 at 16:09, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     This is being fired on the AB:
>
>     ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0
>     do_kernel_version_sanity_check: Package Version
>     (4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24) does not match of kernel
>     being built (4.1.31). Please update the PV variable to match the
>     kernel source.
>     ERROR: linux-yocto-4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0
>     do_kernel_version_sanity_check: Function failed:
>     do_kernel_version_sanity_check (log file is located at
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0/temp/log.do_kernel_version_sanity_check.9143)
>     ERROR: Logfile of failure stored in:
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/4.1.32+gitAUTOINC+b30b6b9ef2_d6237b3b24-r0/temp/log.do_kernel_version_sanity_check.9143
>
>
> (This has happened for all the LSB builds so far)


--------------0CA99F17088136025FF0234A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    It looks like the function is doing as its supposed to, and we need
    to update some PVs or SRCREVs to match PVs.<br>
    <br>
    E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.<br>
    <br>
    ---<br>
    Cal<br>
    <br>
    <div class="moz-cite-prefix">On 09/19/2016 09:22 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 September 2016 at 16:09,
            Burton, Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="gmail_extra">This is being fired on the AB:</div>
              <div class="gmail_extra"><br>
              </div>
              ERROR: linux-yocto-4.1.32+gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0
              do_kernel_version_sanity_<wbr>check: Package Version
              (4.1.32+gitAUTOINC+b30b6b9ef2_<wbr>d6237b3b24) does not
              match of kernel being built (4.1.31). Please update the PV
              variable to match the kernel source.<br>
              ERROR: linux-yocto-4.1.32+gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0
              do_kernel_version_sanity_<wbr>check: Function failed:
              do_kernel_version_sanity_check (log file is located at
              /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-mips-lsb/build/build/<wbr>tmp/work/qemumips-poky-linux/<wbr>linux-yocto/4.1.32+gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0/temp/<wbr>log.do_kernel_version_sanity_<wbr>check.9143)<br>
              ERROR: Logfile of failure stored in:
              /home/pokybuild/yocto-<wbr>autobuilder/yocto-worker/<wbr>nightly-mips-lsb/build/build/<wbr>tmp/work/qemumips-poky-linux/<wbr>linux-yocto/4.1.32+gitAUTOINC+<wbr>b30b6b9ef2_d6237b3b24-r0/temp/<wbr>log.do_kernel_version_sanity_<wbr>check.9143</blockquote>
          </div>
          <br>
          (This has happened for all the LSB builds so far)</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------0CA99F17088136025FF0234A--
