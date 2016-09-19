Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8482660620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 19:53:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2016 12:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,363,1470726000"; d="scan'208,217";a="11084670"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 19 Sep 2016 12:53:25 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
	<CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
	<db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
	<CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <3b43b291-4f81-f801-4f23-cf5647bd37fb@intel.com>
Date: Mon, 19 Sep 2016 12:53:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 19 Sep 2016 19:53:44 -0000
Content-Type: multipart/alternative;
	boundary="------------DD6CEBA0BC4685357606B797"

--------------DD6CEBA0BC4685357606B797
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Yep, these all have incorrect PVs.
628bf62756 Merge tag 'v4.4.11' into standard/base
The problem seems fairly wide spread.

Bruce, do you suggest updating PVs or updating the SRCREVs (is there a 
good reason to keep using old SRCREVs?)?

---
Cal


On 09/19/2016 11:54 AM, Burton, Ross wrote:
>
> On 19 September 2016 at 18:05, Cal Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     It looks like the function is doing as its supposed to, and we
>     need to update some PVs or SRCREVs to match PVs.
>
>     E.g., on the error below, SRCREV d6237b3b24 is indeed 4.1.31.
>
>
> And some more builders failed with 4.4:
>
> ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0 
> do_kernel_version_sanity_check: Package Version 
> (4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does not match of kernel 
> being built (4.4.11). Please update the PV variable to match the 
> kernel source.
> ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0 
> do_kernel_version_sanity_check: Function failed: 
> do_kernel_version_sanity_check (log file is located at 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kernel_version_sanity_check.30210)
> NOTE: recipe usbutils-008-r0: task do_fetch: Started
> ERROR: Logfile of failure stored in: 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kernel_version_sanity_check.30210
> ERROR: Task 
> (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/linux/linux-yocto_4.4.bb:do_kernel_version_sanity_check) 
> failed with exit code '1'
>
> (ditto for ppc and x86)
>
> Ross


--------------DD6CEBA0BC4685357606B797
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>Yep, these all have incorrect PVs.</tt><br>
    <tt>628bf62756 Merge tag 'v4.4.11' into standard/base<br>
      The problem seems fairly wide spread.<br>
      <br>
      Bruce, do you suggest updating PVs or updating the SRCREVs (is
      there a good reason to keep using old SRCREVs?)?<br>
      <br>
      ---<br>
      Cal<br>
      <br>
    </tt><br>
    <div class="moz-cite-prefix">On 09/19/2016 11:54 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 September 2016 at 18:05, Cal
            Sullivan <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:california.l.sullivan@intel.com"
                target="_blank">california.l.sullivan@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div bgcolor="#FFFFFF">It looks like the function is doing
                as its supposed to, and we need to update some PVs or
                SRCREVs to match PVs.<br>
                <br>
                E.g., on the error below, SRCREV d6237b3b24 is indeed
                4.1.31.</div>
            </blockquote>
          </div>
          <br>
          And some more builders failed with 4.4:</div>
        <br>
        ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
        do_kernel_version_sanity_check: Package Version
        (4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does not match of
        kernel being built (4.4.11). Please update the PV variable to
        match the kernel source.<br>
        ERROR: linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
        do_kernel_version_sanity_check: Function failed:
        do_kernel_version_sanity_check (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kernel_version_sanity_check.30210)<br>
        NOTE: recipe usbutils-008-r0: task do_fetch: Started<br>
        ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0/temp/log.do_kernel_version_sanity_check.30210<br>
        ERROR: Task
(/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/linux/linux-yocto_4.4.bb:do_kernel_version_sanity_check)
        failed with exit code '1'
        <div><br>
        </div>
        <div>(ditto for ppc and x86)</div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------DD6CEBA0BC4685357606B797--
