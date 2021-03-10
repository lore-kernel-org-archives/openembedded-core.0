Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
 by mx.groups.io with SMTP id smtpd.web08.110.1615395829910186150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 09:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=0UdVv0hE;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.13, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:to:
	 subject:from;
	bh=DUiJQKuZeF2F3tfMC9YRjqV4fIm40vdg+RFVmZRl+hA=;
	b=0UdVv0hEfHGmp2lphsQL/hjNoWk/cdeCfHGFgTQ6ulVSSQCA9K2XaZja8kp+WtKXvgmT9BSwHW7fn
	 XjxQoPugiHUmKnP88w54Gkb461KFt0VZVkOPWfNX5CCWZR3mJ24erBdysdmWLq/lcmRtcB0Svl37nr
	 pNCqOhXyD0sTvjRa49JZlFIUmxm/VfIFgbFThMp1ba7qQOzt7WqlPInmj20zvaIgYlw5U07yLAB1KE
	 LILpT+xfTr1jEdhtLWSNuyYcrFB0Nr5F9zNYY+VKFFdxD+b7ydVBaYJF1D31h2aP3ymmUdNpJwZMEA
	 v3ojZJzDl2JEuDdRxhwNo0MdVuMxGnw==
X-HalOne-Cookie: 6ae6c036cb89980572d44a3c92e7a1d1478d9b0f
X-HalOne-ID: 93e7aac0-81c2-11eb-a8f8-d0431ea8bb10
Received: from [192.168.178.41] (x4db63d71.dyn.telefonica.de [77.182.61.113])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 93e7aac0-81c2-11eb-a8f8-d0431ea8bb10;
	Wed, 10 Mar 2021 17:03:47 +0000 (UTC)
Subject: Re: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
To: openembedded-core@lists.openembedded.org
References: <20210306112822.11668-1-klaus@linux.vnet.ibm.com>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Message-ID: <0ef798a2-c67a-e023-a9b0-917bf7597f4f@embexus.com>
Date: Wed, 10 Mar 2021 18:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210306112822.11668-1-klaus@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------974CFD67720B4AE3081BAA77"
Content-Language: en-US

--------------974CFD67720B4AE3081BAA77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,


On 3/6/21 12:28 PM, Klaus Heinrich Kiwi wrote:
> This patch series aims at extending U-Boot's verified boot support to
> also include SPL signing.


If u-boot is signed, which part is responsible of the signature 
verification ?

doesn't each CPU vendor provide it's own way of signing the first 
component that will be loader by the ROM code ?

so I'm wondering in which case does this apply ?


>
> The proposal is to some of the infrastructure (variables, functions)
> used to sign the Kernel FitImage to more common locations, and then
> essentially duplicate the method currently used to sign the Kernel
> fitImage to also sign the U-Boot fitImage.
>
> In the UBOOT_SIGN_ENABLE = "1" scenario, nothing really changes: The
> Kernel fitImage is created, then signed, and the pubkey is added to
> u-boot.dtb which is concatenated with the u-boot-nodtb.bin to create the
> u-boot final image.
>
> In case SPL_SIGN_ENABLE = "1", The U-Boot PN will take care of (re-)
> creating the U-Boot fitImage (using custom .its script) after compile,
> sign it, and contatenate the u-boot-spl.dtb (with the public key) with
> u-boot-spl-nodtb.bin to create the final U-Boot SPl on deploy.
>
> In case both UBOOT_SIGN_ENABLE and SPL_SIGN_ENABLE are set, the Kernel
> PN will take care of creating and signing the U-Boot fitImage (becase we
> need to also sign the FDT image containing the Kernel pubkey), and take
> care of deploying it.
>
> I tested all three scenarios using OpenBMC upstream, and although there
> might be some areas of improvement (like deploying the new binaries and
> symlinks with more useful names), it appears to work well.
>
> One caveat is that when moving between the scenarios above, the user
> might need to remove the tmp/ directory, since there could be a
> collision for some of the files deployed into the images directory,
> since the configuration may determine which PN does that.
>
> Reviews, thoughts and comments are very very welcome,
>
> Thanks,
>
>   -Klaus
>
>
>
> 
>
Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


--------------974CFD67720B4AE3081BAA77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/6/21 12:28 PM, Klaus Heinrich Kiwi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210306112822.11668-1-klaus@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">This patch series aims at extending U-Boot's verified boot support to
also include SPL signing.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>If u-boot is signed, which part is responsible of the signature
      verification ?</p>
    <p>doesn't each CPU vendor provide it's own way of signing the first
      component that will be loader by the ROM code ?</p>
    <p>so I'm wondering in which case does this apply ?</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20210306112822.11668-1-klaus@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">

The proposal is to some of the infrastructure (variables, functions)
used to sign the Kernel FitImage to more common locations, and then
essentially duplicate the method currently used to sign the Kernel
fitImage to also sign the U-Boot fitImage.

In the UBOOT_SIGN_ENABLE = "1" scenario, nothing really changes: The
Kernel fitImage is created, then signed, and the pubkey is added to
u-boot.dtb which is concatenated with the u-boot-nodtb.bin to create the
u-boot final image.

In case SPL_SIGN_ENABLE = "1", The U-Boot PN will take care of (re-)
creating the U-Boot fitImage (using custom .its script) after compile,
sign it, and contatenate the u-boot-spl.dtb (with the public key) with
u-boot-spl-nodtb.bin to create the final U-Boot SPl on deploy.

In case both UBOOT_SIGN_ENABLE and SPL_SIGN_ENABLE are set, the Kernel
PN will take care of creating and signing the U-Boot fitImage (becase we
need to also sign the FDT image containing the Kernel pubkey), and take
care of deploying it.

I tested all three scenarios using OpenBMC upstream, and although there
might be some areas of improvement (like deploying the new binaries and
symlinks with more useful names), it appears to work well.

One caveat is that when moving between the scenarios above, the user
might need to remove the tmp/ directory, since there could be a
collision for some of the files deployed into the images directory,
since the configuration may determine which PN does that.

Reviews, thoughts and comments are very very welcome,

Thanks,

 -Klaus


</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com">https://embexus.com</a>
VAT No.  : DE313902634</pre>
  </body>
</html>

--------------974CFD67720B4AE3081BAA77--
