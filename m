Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5BE773288
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:28:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 12:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,137,1486454400"; 
	d="scan'208,217";a="234301884"
Received: from jgperezc-mobl1.zpn.intel.com (HELO [10.219.4.33])
	([10.219.4.33])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2017 12:28:57 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1485209611-23858-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <d1ddc89b-02a0-a4c7-6e13-45fc917d8e10@linux.intel.com>
Date: Thu, 9 Mar 2017 14:29:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>,
	Jose Perez Carranza <jose.perez.carranza@linux-ntel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/devtool: Add test to verify "modify virtual/kernel"
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
X-List-Received-Date: Thu, 09 Mar 2017 20:28:58 -0000
Content-Type: multipart/alternative;
	boundary="------------FB9C4AC5441A20D6C10E89F0"

--------------FB9C4AC5441A20D6C10E89F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/09/2017 01:57 PM, Burton, Ross wrote:
>
> On 23 January 2017 at 22:13, <jose.perez.carranza@linux.intel.com 
> <mailto:jose.perez.carranza@linux.intel.com>> wrote:
> >
> > +        checkmodcode = runCmd("strings %s | head -n 10 | grep '%s'" 
> % (bzimagefile, modstring))
>
>
> Annoyingly this bit is failing on some autobuilders:
>
Do you have a list of workers where this is failing ?
> AssertionError: Command 'strings 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard 
> | head -n 10 | grep 'use a boot loader - Devtool kernel testing'' 
> returned non-zero exit status 1:
> BFD: 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard: 
> Warning: Ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .bss
>
> I'm wondering if grep on its own - not strings|head|grep - would work 
> around this?
>
I will try using grep and do some test to see if everything is OK. on 
local AB's
> (note that strings is "smart" and if executed on an ELF will use 
> libbfd to extract the segments with human strings in, which is why 
> it's returning errors from BFD)
>
> Ross

-- 
Saludos
José


--------------FB9C4AC5441A20D6C10E89F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 03/09/2017 01:57 PM, Burton, Ross wrote:<br>
    <blockquote
cite="mid:CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        On 23 January 2017 at 22:13, &lt;<a moz-do-not-send="true"
          href="mailto:jose.perez.carranza@linux.intel.com">jose.perez.carranza@linux.intel.com</a>&gt;
        wrote:<br>
        &gt;<br>
        &gt; +        checkmodcode = runCmd("strings %s | head -n 10 |
        grep '%s'" % (bzimagefile, modstring))<br>
        <br>
        <br>
        Annoyingly this bit is failing on some autobuilders:<br>
        <br>
      </div>
    </blockquote>
    Do you have a list of workers where this is failing ? <br>
    <blockquote
cite="mid:CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com"
      type="cite">
      <div dir="ltr">AssertionError: Command 'strings
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard
        | head -n 10 | grep 'use a boot loader - Devtool kernel
        testing'' returned non-zero exit status 1:<br>
        BFD:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard:
        Warning: Ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in
        section .bss
        <div><br>
        </div>
        <div>I'm wondering if grep on its own - not strings|head|grep -
          would work around this?</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    I will try using grep and do some test to see if everything is OK.
    on local AB's <br>
    <blockquote
cite="mid:CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>(note that strings is "smart" and if executed on an ELF
          will use libbfd to extract the segments with human strings in,
          which is why it's returning errors from BFD)</div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Saludos 
José </pre>
  </body>
</html>

--------------FB9C4AC5441A20D6C10E89F0--
