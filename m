Return-Path: <mike@foundries.io>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1092A7DA9A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 04:38:00 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t21so6076899pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 21:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=G7VD/s/PGX1U5mu7wBqZEFN+n75/vGgYO/rgLBnOaig=;
	b=T7/MyLQQxxIdfOlR/pZVcZg7+vr0lxpM97j2/GH5zTfXGIG9V96FwhiOWfUIHsJkwZ
	35dotp4AWlY/Mdcdn8Hd0Iqm2BXuivejV752HCRu1Etn5jbdjDKyTRAzAqstIkVgViiN
	iNVFnkC/OS37J/kchhjMnuhdaUcTc9An+wUTy+jEIqySiObo2EGA317aVkUqdi26jvja
	uoHaP2d8ZAtP+qBs0DYuKSAFsVTFRx126E5qSbm9S0LLxST71Uq8UV3GaD/ydeCXqC3F
	xmjGs4Z6ft4H4l0hzer+Sivno5NjyqXsFdnZWh6ZJ6BYVNp9gV6CIutLPTEIC/MgcG+A
	rw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=G7VD/s/PGX1U5mu7wBqZEFN+n75/vGgYO/rgLBnOaig=;
	b=ejC9mWZML+PFi+f5km9zxddPEDE70X8+/+UF8TbHa3qKsHrBVwCaQm93UKUpghXhKx
	m4tHK7RssPN+yTR62caR57+IKhX8IrFYRiaYHQcvw52XJQErwvKgRNGJKaZ7/vL4v9tz
	tm8CemrfndFJa1pcrOu7QyvoE1RPYTBamiuofaUtslcLynkYMZjETTco0SirzRHSKUNQ
	xpMqNWEaIKLMuetok2Z6KvLps05/lHxzT13yZ/WWPzAWsipTgMVaF9Ijvui7ayoWF6pT
	9dKOholVzSiWBCD/6BV6jsrws8keu75ROqn6Xn/7a/1Nce/+EQxKD7I46omqhMhBaAI6
	rD/Q==
X-Gm-Message-State: APjAAAW23Y23WsJAMw2IL/9mdyfgjSFsIpKyOUHyJGjuXxXWes6Mbm5O
	nmapTkjgzEeQiZxy6YPBqVm5uULh0uA=
X-Google-Smtp-Source: APXvYqz3u8iN8lkigQvxJSJJSvofnPHXxr9zMRCG3F6WpRnhwfyXTq5yIxsapA2pURxi+a/jVTY1iA==
X-Received: by 2002:a62:1b8a:: with SMTP id b132mr61662537pfb.19.1555130281429;
	Fri, 12 Apr 2019 21:38:01 -0700 (PDT)
Received: from [172.20.2.133] ([207.183.242.50])
	by smtp.gmail.com with ESMTPSA id
	c1sm20198075pgq.33.2019.04.12.21.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 21:38:00 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190412054625.9447-1-mike@foundries.io>
	<CAMKF1sqvdAkHU+htzTcoGgtWrSrp2t76CAYxvDJpxRroKn6+gA@mail.gmail.com>
From: Michael Scott <mike@foundries.io>
Message-ID: <324d471a-c746-455c-5412-1efaf3517b12@foundries.io>
Date: Fri, 12 Apr 2019 21:37:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqvdAkHU+htzTcoGgtWrSrp2t76CAYxvDJpxRroKn6+gA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Sat, 13 Apr 2019 04:38:01 -0000
Content-Type: multipart/alternative;
	boundary="------------060134FE09C73C76A4B1D2FD"
Content-Language: en-US

--------------060134FE09C73C76A4B1D2FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/12/19 9:35 AM, Khem Raj wrote:
>
>
> On Thu, Apr 11, 2019 at 10:46 PM Michael Scott <mike@foundries.io 
> <mailto:mike@foundries.io>> wrote:
>
>     Support RISC-V kernel image, using the "Image" target.
>
>     This change allows RISC-V support for fitImage via the following
>     flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
>     with ramdisk and dtb).
>
>     This was tested using QEMU RISC-V 64-bit.
>
>     Signed-off-by: Michael Scott <mike@foundries.io
>     <mailto:mike@foundries.io>>
>     ---
>      meta/classes/kernel-fitimage.bbclass | 2 ++
>      1 file changed, 2 insertions(+)
>
>     diff --git a/meta/classes/kernel-fitimage.bbclass
>     b/meta/classes/kernel-fitimage.bbclass
>     index 2517d75746..2820ff9689 100644
>     --- a/meta/classes/kernel-fitimage.bbclass
>     +++ b/meta/classes/kernel-fitimage.bbclass
>     @@ -10,6 +10,8 @@ python __anonymous () {
>              uarch = d.getVar("UBOOT_ARCH")
>              if uarch == "arm64":
>                  replacementtype = "Image"
>     +        elif uarch == "riscv":
>     +            replacementtype = "Image"
>
>
> Make it or condition along with arm64 check
Sure, sending v2.
>
>
>              elif uarch == "mips":
>                  replacementtype = "vmlinuz.bin"
>              elif uarch == "x86":
>     -- 
>     2.21.0
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
-- 
Michael Scott
Embedded Software Engineer at Foundries.io
"microPlatforms™ for Connected Products"
E: mike@foundries.io
W: https://www.foundries.io


--------------060134FE09C73C76A4B1D2FD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/12/19 9:35 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqvdAkHU+htzTcoGgtWrSrp2t76CAYxvDJpxRroKn6+gA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Apr 11, 2019 at
            10:46 PM Michael Scott &lt;<a
              href="mailto:mike@foundries.io" moz-do-not-send="true">mike@foundries.io</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Support
            RISC-V kernel image, using the "Image" target.<br>
            <br>
            This change allows RISC-V support for fitImage via the
            following<br>
            flow: OpenSBI -&gt; u-boot (as payload) -&gt; Linux kernel
            (as fitImage<br>
            with ramdisk and dtb).<br>
            <br>
            This was tested using QEMU RISC-V 64-bit.<br>
            <br>
            Signed-off-by: Michael Scott &lt;<a
              href="mailto:mike@foundries.io" target="_blank"
              moz-do-not-send="true">mike@foundries.io</a>&gt;<br>
            ---<br>
             meta/classes/kernel-fitimage.bbclass | 2 ++<br>
             1 file changed, 2 insertions(+)<br>
            <br>
            diff --git a/meta/classes/kernel-fitimage.bbclass
            b/meta/classes/kernel-fitimage.bbclass<br>
            index 2517d75746..2820ff9689 100644<br>
            --- a/meta/classes/kernel-fitimage.bbclass<br>
            +++ b/meta/classes/kernel-fitimage.bbclass<br>
            @@ -10,6 +10,8 @@ python __anonymous () {<br>
                     uarch = d.getVar("UBOOT_ARCH")<br>
                     if uarch == "arm64":<br>
                         replacementtype = "Image"<br>
            +        elif uarch == "riscv":<br>
            +            replacementtype = "Image"</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Make it or condition along with arm64 check <br>
          </div>
        </div>
      </div>
    </blockquote>
    Sure, sending v2.<br>
    <blockquote type="cite"
cite="mid:CAMKF1sqvdAkHU+htzTcoGgtWrSrp2t76CAYxvDJpxRroKn6+gA@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
                     elif uarch == "mips":<br>
                         replacementtype = "vmlinuz.bin"<br>
                     elif uarch == "x86":<br>
            -- <br>
            2.21.0<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Michael Scott
Embedded Software Engineer at Foundries.io
"microPlatforms™ for Connected Products"
E: <a class="moz-txt-link-abbreviated" href="mailto:mike@foundries.io">mike@foundries.io</a>
W: <a class="moz-txt-link-freetext" href="https://www.foundries.io">https://www.foundries.io</a></pre>
  </body>
</html>

--------------060134FE09C73C76A4B1D2FD--
