Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2D76010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 23:02:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP; 19 Sep 2016 16:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,364,1470726000"; d="scan'208,217";a="11154870"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 19 Sep 2016 16:02:30 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1474069704-24428-1-git-send-email-california.l.sullivan@intel.com>
	<2c06b548-62b4-5766-4ac4-6a18972be549@windriver.com>
	<CAJTo0LbqExZ796Jn1_mtJBFjoLoFZ76VzgwAMB_Bm6NWUGAvVw@mail.gmail.com>
	<CAJTo0LbQKKuWXfWuPw4R1uh_A8R=NM4YEpaR2yOH3ePs40FbqA@mail.gmail.com>
	<db821c4f-4099-94de-f2d2-17ddf2486bbc@intel.com>
	<CAJTo0LYTP5LGgxDxJj1Y+88YnoXDQa8G7yD2QyU5dF3kKN+1TQ@mail.gmail.com>
	<3b43b291-4f81-f801-4f23-cf5647bd37fb@intel.com>
	<6c08189b-9ac1-d239-c324-c9d04e38ed2d@windriver.com>
	<1474318190.24399.19.camel@intel.com>
	<28095475-0487-d01c-e90e-147f03091758@intel.com>
	<CADkTA4Ptre9P4MUr9D6dfxhHek8d5X3owr+q5mVWVFWWLxZKFA@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <9b22685c-2fae-0b02-899d-eced3e69a931@intel.com>
Date: Mon, 19 Sep 2016 16:02:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ptre9P4MUr9D6dfxhHek8d5X3owr+q5mVWVFWWLxZKFA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Saul Wold <saul.wold@intel.com>
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
X-List-Received-Date: Mon, 19 Sep 2016 23:02:30 -0000
Content-Type: multipart/alternative;
	boundary="------------CFF9EDE5D2C7592786827857"

--------------CFF9EDE5D2C7592786827857
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/19/2016 03:55 PM, Bruce Ashfield wrote:
>
>
> On Mon, Sep 19, 2016 at 6:02 PM, Cal Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     I don't have time to smoke test a SRCREV update for so many
>     machines right now, so I think for now I will just set the correct
>     PV in the various linux-yocto recipes so we don't block
>     master-next builds.
>
>     Is this acceptable?
>
>
> In the linux-yocto bbappends of the various layers ? I keep track of 
> the PV's in the
> core recipes themselves, so they shouldn't need to be modified.
You're right. Only the linux-yocto bbappends in meta-yocto-bsp need 
MACHINE-specific PVs right now.
The issue with 4.1 (used by lsb right now) in oe-core is that 
LINUX_VERSION was bumped to 4.1.32 rather than 4.1.31 in error.

---
Cal

>
> Bruce
>
>
>     Thanks,
>     Cal
>
>
>     On 09/19/2016 01:49 PM, Saul Wold wrote:
>
>         On Mon, 2016-09-19 at 15:55 -0400, Bruce Ashfield wrote:
>
>             On 2016-09-19 03:53 PM, Cal Sullivan wrote:
>
>                 Yep, these all have incorrect PVs.
>                 628bf62756 Merge tag 'v4.4.11' into standard/base
>                 The problem seems fairly wide spread.
>
>                 Bruce, do you suggest updating PVs or updating the
>                 SRCREVs (is
>                 there a
>                 good reason to keep using old SRCREVs?)?
>
>             Updating the SRCREVs is the right thing to do to sync them
>             up now.
>
>             but ..
>
>             at the same time, they should probably have their own PVs,
>             since
>             next time up update 4.4.x, they'll fall out of sync and
>             fail again.
>
>         +1, I think that these need their own PV since they also don't
>         update
>         as fast as the base qemu recipes do.
>
>         Sau!
>
>             We want them to be aligned with the latest -stable, but we
>             also
>             don't need failures every time I push a new SRCREV and
>             update the
>             PV of the base recipe.
>
>             Bruce
>
>
>                 ---
>                 Cal
>
>
>                 On 09/19/2016 11:54 AM, Burton, Ross wrote:
>
>
>                     On 19 September 2016 at 18:05, Cal Sullivan
>                     <california.l.sullivan@intel.com
>                     <mailto:california.l.sullivan@intel.com>
>                     <mailto:california.l.sullivan@intel.com
>                     <mailto:california.l.sullivan@intel.com>>> wrote:
>
>                          It looks like the function is doing as its
>                     supposed to, and
>                     we
>                          need to update some PVs or SRCREVs to match PVs.
>
>                          E.g., on the error below, SRCREV d6237b3b24
>                     is indeed 4.1.31.
>
>
>                     And some more builders failed with 4.4:
>
>                     ERROR:
>                     linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
>                     do_kernel_version_sanity_check: Package Version
>                     (4.4.20+gitAUTOINC+e66032e2d9_628bf62756) does not
>                     match of
>                     kernel
>                     being built (4.4.11). Please update the PV
>                     variable to match the
>                     kernel source.
>                     ERROR:
>                     linux-yocto-4.4.20+gitAUTOINC+e66032e2d9_628bf62756-r0
>                     do_kernel_version_sanity_check: Function failed:
>                     do_kernel_version_sanity_check (log file is located at
>                     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>                     arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-
>                     yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-
>                     r0/temp/log.do_kernel_version_sanity_check.30210)
>                     NOTE: recipe usbutils-008-r0: task do_fetch: Started
>                     ERROR: Logfile of failure stored in:
>                     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>                     arm/build/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-
>                     yocto/4.4.20+gitAUTOINC+e66032e2d9_628bf62756-
>                     r0/temp/log.do_kernel_version_sanity_check.30210
>                     ERROR: Task
>                     (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
>                     arm/build/meta/recipes-kernel/linux/linux-
>                     yocto_4.4.bb:do_kernel_version_sanity_check)
>                     failed with exit code '1'
>
>                     (ditto for ppc and x86)
>
>                     Ross
>
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------CFF9EDE5D2C7592786827857
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 09/19/2016 03:55 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4Ptre9P4MUr9D6dfxhHek8d5X3owr+q5mVWVFWWLxZKFA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Sep 19, 2016 at 6:02 PM, Cal
            Sullivan <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:california.l.sullivan@intel.com"
                target="_blank">california.l.sullivan@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">I don't
              have time to smoke test a SRCREV update for so many
              machines right now, so I think for now I will just set the
              correct PV in the various linux-yocto recipes so we don't
              block master-next builds.<br>
              <br>
              Is this acceptable?<br>
            </blockquote>
            <div><br>
            </div>
            <div>In the linux-yocto bbappends of the various layers ? I
              keep track of the PV's in the</div>
            <div>core recipes themselves, so they shouldn't need to be
              modified.</div>
          </div>
        </div>
      </div>
    </blockquote>
    You're right. Only the linux-yocto bbappends in meta-yocto-bsp need
    MACHINE-specific PVs right now.<br>
    The issue with 4.1 (used by lsb right now) in oe-core is that
    LINUX_VERSION was bumped to 4.1.32 rather than 4.1.31 in error.<br>
    <br>
    ---<br>
    Cal<br>
    <br>
    <blockquote
cite="mid:CADkTA4Ptre9P4MUr9D6dfxhHek8d5X3owr+q5mVWVFWWLxZKFA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Thanks,<br>
              Cal
              <div class="HOEnZb">
                <div class="h5"><br>
                  <br>
                  On 09/19/2016 01:49 PM, Saul Wold wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On Mon, 2016-09-19 at 15:55 -0400, Bruce Ashfield
                    wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On 2016-09-19 03:53 PM, Cal Sullivan wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        Yep, these all have incorrect PVs.<br>
                        628bf62756 Merge tag 'v4.4.11' into
                        standard/base<br>
                        The problem seems fairly wide spread.<br>
                        <br>
                        Bruce, do you suggest updating PVs or updating
                        the SRCREVs (is<br>
                        there a<br>
                        good reason to keep using old SRCREVs?)?<br>
                      </blockquote>
                      Updating the SRCREVs is the right thing to do to
                      sync them up now.<br>
                      <br>
                      but ..<br>
                      <br>
                      at the same time, they should probably have their
                      own PVs, since<br>
                      next time up update 4.4.x, they'll fall out of
                      sync and fail again.<br>
                      <br>
                    </blockquote>
                    +1, I think that these need their own PV since they
                    also don't update<br>
                    as fast as the base qemu recipes do.<br>
                    <br>
                    Sau!<br>
                    <br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      We want them to be aligned with the latest
                      -stable, but we also<br>
                      don't need failures every time I push a new SRCREV
                      and update the<br>
                      PV of the base recipe.<br>
                      <br>
                      Bruce<br>
                      <br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <br>
                        ---<br>
                        Cal<br>
                        <br>
                        <br>
                        On 09/19/2016 11:54 AM, Burton, Ross wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">
                          <br>
                          On 19 September 2016 at 18:05, Cal Sullivan<br>
                          &lt;<a moz-do-not-send="true"
                            href="mailto:california.l.sullivan@intel.com"
                            target="_blank">california.l.sullivan@intel.c<wbr>om</a><br>
                          &lt;mailto:<a moz-do-not-send="true"
                            href="mailto:california.l.sullivan@intel.com"
                            target="_blank">california.l.sullivan@<wbr>intel.com</a>&gt;&gt;
                          wrote:<br>
                          <br>
                               It looks like the function is doing as
                          its supposed to, and<br>
                          we<br>
                               need to update some PVs or SRCREVs to
                          match PVs.<br>
                          <br>
                               E.g., on the error below, SRCREV
                          d6237b3b24 is indeed 4.1.31.<br>
                          <br>
                          <br>
                          And some more builders failed with 4.4:<br>
                          <br>
                          ERROR: linux-yocto-4.4.20+gitAUTOINC+<wbr>e66032e2d9_628bf62756-r0<br>
                          do_kernel_version_sanity_check<wbr>: Package
                          Version<br>
                          (4.4.20+gitAUTOINC+e66032e2d9_<wbr>628bf62756)
                          does not match of<br>
                          kernel<br>
                          being built (4.4.11). Please update the PV
                          variable to match the<br>
                          kernel source.<br>
                          ERROR: linux-yocto-4.4.20+gitAUTOINC+<wbr>e66032e2d9_628bf62756-r0<br>
                          do_kernel_version_sanity_check<wbr>: Function
                          failed:<br>
                          do_kernel_version_sanity_check (log file is
                          located at<br>
                          /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-<br>
                          arm/build/build/tmp/work/beagl<wbr>ebone-poky-linux-gnueabi/linux<wbr>-<br>
                          yocto/4.4.20+gitAUTOINC+e66032<wbr>e2d9_628bf62756-<br>
                          r0/temp/log.do_kernel_version_<wbr>sanity_check.30210)<br>
                          NOTE: recipe usbutils-008-r0: task do_fetch:
                          Started<br>
                          ERROR: Logfile of failure stored in:<br>
                          /home/pokybuild/yocto-autobuil<wbr>der/yocto-worker/nightly-<br>
                          arm/build/build/tmp/work/beagl<wbr>ebone-poky-linux-gnueabi/linux<wbr>-<br>
                          yocto/4.4.20+gitAUTOINC+e66032<wbr>e2d9_628bf62756-<br>
                          r0/temp/log.do_kernel_version_<wbr>sanity_check.30210<br>
                          ERROR: Task<br>
                          (/home/pokybuild/yocto-autobui<wbr>lder/yocto-worker/nightly-<br>
                          arm/build/meta/recipes-kernel/<wbr>linux/linux-<br>
                          yocto_4.4.bb:do_kernel_version<wbr>_sanity_check)<br>
                          failed with exit code '1'<br>
                          <br>
                          (ditto for ppc and x86)<br>
                          <br>
                          Ross<br>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                  <br>
                  -- <br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:Openembedded-core@lists.openembedded.org"
                    target="_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a moz-do-not-send="true"
                    href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                    rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------CFF9EDE5D2C7592786827857--
