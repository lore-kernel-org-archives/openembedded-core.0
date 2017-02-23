Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0AC7307D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 23:27:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 15:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,199,1484035200"; 
	d="scan'208,217";a="937464051"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 15:27:16 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1486684537-17517-1-git-send-email-california.l.sullivan@intel.com>
	<1487889124-8585-1-git-send-email-california.l.sullivan@intel.com>
	<CAJTo0LaBPhygGF8NgjNOMPrHFS3Pa2F29PRviZDPB=+JjbBdkw@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <41a7389d-25a3-3002-ffdd-25f2e4dda494@intel.com>
Date: Thu, 23 Feb 2017 15:27:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaBPhygGF8NgjNOMPrHFS3Pa2F29PRviZDPB=+JjbBdkw@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2017 23:27:16 -0000
Content-Type: multipart/alternative;
	boundary="------------398B5D82E72E0293AF1547A2"

--------------398B5D82E72E0293AF1547A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/23/2017 03:07 PM, Burton, Ross wrote:
>
> On 23 February 2017 at 22:32, California Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     The only change from V1 to V2 is the updated commit message, changing
>     AUTOINC to AUTOREV and adding the blurb about impacting outside
>     recipes.
>
>     I also agree with Richard in that this is a significant
>     functionality change
>     and should not be backported.
>
>
> I failed to say that I suspected this patch was to blame for SDK 
> generation failing on the autobuilder earlier.  Can you try generating 
> a eSDK (bitbake core-image-minimal -c populate_sdk_ext)  with this patch?
>
> Ross
Will do. Any specific configuration I should use, or should it fail in 
most/all situations?

Thanks,
Cal

--------------398B5D82E72E0293AF1547A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 02/23/2017 03:07 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaBPhygGF8NgjNOMPrHFS3Pa2F29PRviZDPB=+JjbBdkw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
                only change from V1 to V2 is the updated commit message,
                changing<br>
                AUTOINC to AUTOREV and adding the blurb about impacting
                outside recipes.<br>
                <br>
                I also agree with Richard in that this is a significant
                functionality change<br>
                and should not be backported.</div>
            </blockquote>
          </div>
          <br>
          I failed to say that I suspected this patch was to blame for
          SDK generation failing on the autobuilder earlier.  Can you
          try generating a eSDK (bitbake core-image-minimal -c
          populate_sdk_ext)  with this patch?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    Will do. Any specific configuration I should use, or should it fail
    in most/all situations?<br>
    <br>
    Thanks,<br>
    Cal<br>
  </body>
</html>

--------------398B5D82E72E0293AF1547A2--
