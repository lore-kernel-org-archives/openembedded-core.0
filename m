Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A278C71B14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 18:19:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 10:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; 
	d="scan'208,217";a="1101955252"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2017 10:19:49 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
	<1487889124-8585-1-git-send-email-california.l.sullivan@intel.com>
	<CAJTo0LaBPhygGF8NgjNOMPrHFS3Pa2F29PRviZDPB=+JjbBdkw@mail.gmail.com>
	<41a7389d-25a3-3002-ffdd-25f2e4dda494@intel.com>
	<b00d7924-b690-e568-e9d9-a31b76f6db79@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <501e70af-504f-6b8d-b99d-562e2c028061@intel.com>
Date: Fri, 24 Feb 2017 10:19:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <b00d7924-b690-e568-e9d9-a31b76f6db79@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] kernel.bbclass: Make sanity check opt-out and provide easy opt-out
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
X-List-Received-Date: Fri, 24 Feb 2017 18:19:49 -0000
Content-Type: multipart/alternative;
	boundary="------------25D6D31DAADAFCA5ECABE0C7"

--------------25D6D31DAADAFCA5ECABE0C7
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/23/2017 04:13 PM, Cal Sullivan wrote:
> On 02/23/2017 03:27 PM, Cal Sullivan wrote:
>>
>>
>> On 02/23/2017 03:07 PM, Burton, Ross wrote:
>>>
>>> On 23 February 2017 at 22:32, California Sullivan 
>>> <california.l.sullivan@intel.com 
>>> <mailto:california.l.sullivan@intel.com>> wrote:
>>>
>>>     The only change from V1 to V2 is the updated commit message,
>>>     changing
>>>     AUTOINC to AUTOREV and adding the blurb about impacting outside
>>>     recipes.
>>>
>>>     I also agree with Richard in that this is a significant
>>>     functionality change
>>>     and should not be backported.
>>>
>>>
>>> I failed to say that I suspected this patch was to blame for SDK 
>>> generation failing on the autobuilder earlier. Can you try 
>>> generating a eSDK (bitbake core-image-minimal -c populate_sdk_ext) 
>>>  with this patch?
>>>
>>> Ross
>> Will do. Any specific configuration I should use, or should it fail 
>> in most/all situations?
>>
>> Thanks,
>> Cal
>>
>>
>
> [clsulliv@clsulliv build]$ bitbake core-image-minimal -c populate_sdk_ext
> WARNING: Host distribution "fedora-23" has not been validated with 
> this version of the build system; you may possibly experience 
> unexpected failures. It is recommended that you use a tested distribution.
> Loading cache: 100% 
> |##############################################################################################################| 
> Time: 0:00:00
> Loaded 1346 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.33.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "x86_64-poky-linux"
> MACHINE           = "intel-corei7-64"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.2+snapshot-20170223"
> TUNE_FEATURES     = "m64 corei7"
> TARGET_FPU        = ""
> meta
> meta-poky
> meta-yocto-bsp    = 
> "clsulliv/sanity:53c2449017a3312a2e65720a23ef654924eef0b4"
> meta-intel        = "master:5153dad2fa695bbb579c03ff795ef649269e8420"
>
> Initialising tasks: 100% 
> |#########################################################################################################| 
> Time: 0:00:06
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 3362 tasks of which 2752 didn't need to 
> be rerun and all succeeded.
>
> Summary: There was 1 WARNING message shown.
>
>
> I'll rerun the build with no meta-intel and qemux86 overnight.
>
> p.s., upgrading my fedora system now :)
>
> ---
> Cal
>
>
Same results with qemux86.

Thanks,
Cal

--------------25D6D31DAADAFCA5ECABE0C7
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 02/23/2017 04:13 PM, Cal Sullivan
      wrote:<br>
    </div>
    <blockquote
      cite="mid:b00d7924-b690-e568-e9d9-a31b76f6db79@intel.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      On 02/23/2017 03:27 PM, Cal Sullivan wrote:<br>
      <blockquote
        cite="mid:41a7389d-25a3-3002-ffdd-25f2e4dda494@intel.com"
        type="cite"> <br>
        <br>
        <div class="moz-cite-prefix">On 02/23/2017 03:07 PM, Burton,
          Ross wrote:<br>
        </div>
        <blockquote
cite="mid:CAJTo0LaBPhygGF8NgjNOMPrHFS3Pa2F29PRviZDPB=+JjbBdkw@mail.gmail.com"
          type="cite">
          <div dir="ltr">
            <div class="gmail_extra"><br>
              <div class="gmail_quote">On 23 February 2017 at 22:32,
                California Sullivan <span dir="ltr">&lt;<a
                    moz-do-not-send="true"
                    href="mailto:california.l.sullivan@intel.com"
                    target="_blank">california.l.sullivan@intel.com</a>&gt;</span>
                wrote:<br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  <div id=":449" class="a3s aXjCH m15a6d1aea290b109">The
                    only change from V1 to V2 is the updated commit
                    message, changing<br>
                    AUTOINC to AUTOREV and adding the blurb about
                    impacting outside recipes.<br>
                    <br>
                    I also agree with Richard in that this is a
                    significant functionality change<br>
                    and should not be backported.</div>
                </blockquote>
              </div>
              <br>
              I failed to say that I suspected this patch was to blame
              for SDK generation failing on the autobuilder earlier. 
              Can you try generating a eSDK (bitbake core-image-minimal
              -c populate_sdk_ext)  with this patch?</div>
            <div class="gmail_extra"><br>
            </div>
            <div class="gmail_extra">Ross</div>
          </div>
        </blockquote>
        Will do. Any specific configuration I should use, or should it
        fail in most/all situations?<br>
        <br>
        Thanks,<br>
        Cal<br>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
      </blockquote>
      <tt><br>
        [clsulliv@clsulliv build]$ bitbake core-image-minimal -c
        populate_sdk_ext<br>
        WARNING: Host distribution "fedora-23" has not been validated
        with this version of the build system; you may possibly
        experience unexpected failures. It is recommended that you use a
        tested distribution.<br>
        Loading cache: 100%
|##############################################################################################################|
        Time: 0:00:00<br>
        Loaded 1346 entries from dependency cache.<br>
        NOTE: Resolving any missing task queue dependencies<br>
        <br>
        Build Configuration:<br>
        BB_VERSION        = "1.33.1"<br>
        BUILD_SYS         = "x86_64-linux"<br>
        NATIVELSBSTRING   = "universal"<br>
        TARGET_SYS        = "x86_64-poky-linux"<br>
        MACHINE           = "intel-corei7-64"<br>
        DISTRO            = "poky"<br>
        DISTRO_VERSION    = "2.2+snapshot-20170223"<br>
        TUNE_FEATURES     = "m64 corei7"<br>
        TARGET_FPU        = ""<br>
        meta              <br>
        meta-poky         <br>
        meta-yocto-bsp    =
        "clsulliv/sanity:53c2449017a3312a2e65720a23ef654924eef0b4"<br>
        meta-intel        =
        "master:5153dad2fa695bbb579c03ff795ef649269e8420"<br>
        <br>
        Initialising tasks: 100%
|#########################################################################################################|
        Time: 0:00:06<br>
        NOTE: Executing SetScene Tasks<br>
        NOTE: Executing RunQueue Tasks<br>
        NOTE: Tasks Summary: Attempted 3362 tasks of which 2752 didn't
        need to be rerun and all succeeded.<br>
        <br>
        Summary: There was 1 WARNING message shown.<br>
        <br>
        <br>
        I'll rerun the build with no meta-intel and qemux86 overnight.<br>
        <br>
        p.s., upgrading my fedora system now :)<br>
        <br>
        ---<br>
        Cal<br>
      </tt> <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    Same results with qemux86.<br>
    <br>
    Thanks,<br>
    Cal<br>
  </body>
</html>

--------------25D6D31DAADAFCA5ECABE0C7--
