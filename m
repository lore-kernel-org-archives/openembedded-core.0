Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CC5906FF04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 14:42:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2016 07:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,339,1455004800"; 
	d="scan'208,217";a="924511810"
Received: from unknown (HELO [10.219.16.70]) ([10.219.16.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2016 07:42:03 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1457996977-24572-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<CAJTo0La-tCOJsXY29+VL0wD_G9vK-2XSzGoA-SsYF4kgYs0N_g@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <56E81F99.7020003@linux.intel.com>
Date: Tue, 15 Mar 2016 08:43:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La-tCOJsXY29+VL0wD_G9vK-2XSzGoA-SsYF4kgYs0N_g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eudev: split eudev-hwdb from eudev
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
X-List-Received-Date: Tue, 15 Mar 2016 14:42:05 -0000
Content-Type: multipart/alternative;
	boundary="------------030002000505030907080306"

--------------030002000505030907080306
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2016 07:32 AM, Burton, Ross wrote:
>
> On 14 March 2016 at 23:09, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     +   ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb
>     --update \
>     +            --root $D
>
>
> udevadm is at ${bindir} with eudev, which means this script delays 
> until first boot.  I've fixed locally, and will file a bug about how 
> hard it is to tell when a postinst is delayed due to errors...
>
> Ross

Thanks Ross

Alejandro


--------------030002000505030907080306
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 03/15/2016 07:32 AM, Burton, Ross wrote:<br>
    <blockquote
cite="mid:CAJTo0La-tCOJsXY29+VL0wD_G9vK-2XSzGoA-SsYF4kgYs0N_g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 March 2016 at 23:09, Alejandro
            Hernandez <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1np" class="a3s" style="overflow:hidden">+     
                  ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')}
                <span class="il">hwdb</span> --update \<br>
                +            --root $D<br>
              </div>
            </blockquote>
          </div>
          <br>
          udevadm is at ${bindir} with eudev, which means this script
          delays until first boot.  I've fixed locally, and will file a
          bug about how hard it is to tell when a postinst is delayed
          due to errors...</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Thanks Ross<br>
    <br>
    Alejandro<br>
    <br>
  </body>
</html>

--------------030002000505030907080306--
