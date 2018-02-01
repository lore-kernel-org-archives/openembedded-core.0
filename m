Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 186FF78544
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 15:00:30 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id s5so19328644wra.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 07:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=ObGb5nnCj5qDSNC+fQ/qekpy1t6ZBaWrVjjYgRfD7p0=;
	b=aXUIDnNyzD2CnIdp3ioNgEH9z5lNwkfZa0YQiwqrTgCYMtOMDrypBKq5Rv4MUFs2ZC
	OoIHpT1iY3eLO7+Q5AfLOOa77WU5fOH7z6n16dMZeW5NdnZfK6CGgOC5j6rrCyVWarUB
	J/QH/ynaxPhD1iKCc/Q50j/u7zgzuA7wDtnKOipm7DEka5ZcQ3TdDzB2qb2LOBYGwzmy
	m9LWs6QLUSz6SOMyjQWkTAtJ0AwHepJRaOrt1lmUzKNwY2raHtP4GtgxhCiUmg56gE6l
	EQSLR3xrNQHWxxhuiAyv5Sz/5jPPWT+xFE7Haz2i882yej3d625H4Ijtb02lw6he5BLM
	KmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=ObGb5nnCj5qDSNC+fQ/qekpy1t6ZBaWrVjjYgRfD7p0=;
	b=Z+DcO9I8veCod5XH+wqWFQFgNJ8yKWiVvtHESvEO6GKTnw6bEAWbJRLLrXrVHk+2jx
	8zI9OsHjw+L/B55u1SaQqHnOEpe1+rApkJyEup6Tj8Af9dsvKCm3eimb6yfpZyZZ4Jnv
	EC3jNVILABJdk+8WDB4hal4PsCUPqifdzXBUiYvcBhzNzxerV4T+5qbNhvizsxxxmx/M
	wWH3Zz83HI3e4J1qu/7AmDMgbHLsPmQ4FpMc+IiEoy6vWcSl8FRuLB4loumfNyIorKhA
	+aELWt7TRdM8NzL/RlnLUxQTeNgTttNcteFuO6Tlefv8r1nkUouD2suQMPYV1b3rTcT+
	We3g==
X-Gm-Message-State: AKwxytdVsd+x9T0SmGJ00mgebVBLKSc/TUs9ACIb3fBXljuFPzZlsOF5
	ZBy2CNTNEdewufUQO856olMqDeW2a78=
X-Google-Smtp-Source: AH8x2240pxsWk0zyX6lh5r/XuTK5rSi6vRIy4hc3youeqBSrDC02Xhri0CcmxO1JhGMQTyM8ch8/wA==
X-Received: by 10.223.195.49 with SMTP id n46mr4044250wrf.191.1517497231464;
	Thu, 01 Feb 2018 07:00:31 -0800 (PST)
Received: from [192.168.2.129] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114])
	by smtp.gmail.com with ESMTPSA id t141sm91332wmd.34.2018.02.01.07.00.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 07:00:30 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <8c548149-e116-4b1f-8bfc-86099ac32e93@elfin.de>
	<CAJTo0Lbb8jH_uyoiD4OsBgf8xsMOdz8a1CjCkoBmKmTwF_3q+g@mail.gmail.com>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <a7dc8b5e-b277-27c7-b879-4405c1bb04ac@elfin.de>
Date: Thu, 1 Feb 2018 16:00:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbb8jH_uyoiD4OsBgf8xsMOdz8a1CjCkoBmKmTwF_3q+g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: recipe using environment variable does not refresh / rebuild
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
X-List-Received-Date: Thu, 01 Feb 2018 15:00:31 -0000
Content-Type: multipart/alternative;
	boundary="------------6C416B5496F11DAB72EFCEBE"
Content-Language: en-US

--------------6C416B5496F11DAB72EFCEBE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,

Good idea, but I'm using gitlab to perform autobuilds and I want to set 
the variable there (the "ADD_UBOOT_TO_UPDATE" variable) so that it's 
propagated to the image recipe.

I'm want to differentiate the image with and without u-boot only by 
setting this one environment variable and without additional mangling 
with local.conf.


If that's not possible- I'll use your idea with setting it in 
local.conf, but before that I'm trying to understand- why my recipe is 
not rebuilt?


Thanks,

Piotr


On 01.02.2018 15:50, Burton, Ross wrote:
> On 1 February 2018 at 14:46, Piotr Lewicki <piotr.lewicki@elfin.de 
> <mailto:piotr.lewicki@elfin.de>> wrote:
>
>     Hi,
>
>     I have a problem with forcing rebuild of the recipe depending on
>     the environment variable.
>
>     In my recipe I have an anonymous python function that obtains the
>     env variable and depending on it sets some other internal
>     variables (needed by swupdate recipe):
>
>
>     python() {
>         origenv = d.getVar("BB_ORIGENV", False)
>         u_boot_enabled = origenv.getVar("ADD_UBOOT_TO_UPDATE", False)
>
>         if u_boot_enabled == None:
>             bb.warn("Not adding u-boot to the image")
>         else:
>             bb.warn("Adding u-boot to the image")
>             d.appendVar("SWUPDATE_IMAGES", " u-boot.imx")
>             d.setVarFlag("SWUPDATE_IMAGES_NOAPPEND_MACHINE",
>     "u-boot.imx", "1")
>     }
>
>
>     My issue is that there is no difference when I either set or unset
>     my environment variable "ADD_UBOOT_TO_UPDATE".
>
>
>     Can you point me a solution how I could force checking this
>     variable and rerunning/rebuilding the recipe?
>
>
> Can't you use a variable set in local.conf instead?
>
> Ross


--------------6C416B5496F11DAB72EFCEBE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Ross,</p>
    <p>Good idea, but I'm using gitlab to perform autobuilds and I want
      to set the variable there (the "ADD_UBOOT_TO_UPDATE" variable) so
      that it's propagated to the image recipe.</p>
    <p>I'm want to differentiate the image with and without u-boot only
      by setting this one environment variable and without additional
      mangling with local.conf.</p>
    <p><br>
    </p>
    <p>If that's not possible- I'll use your idea with setting it in
      local.conf, but before that I'm trying to understand- why my
      recipe is not rebuilt?</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Piotr<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01.02.2018 15:50, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lbb8jH_uyoiD4OsBgf8xsMOdz8a1CjCkoBmKmTwF_3q+g@mail.gmail.com">
      <div dir="ltr">On 1 February 2018 at 14:46, Piotr Lewicki <span
          dir="ltr">&lt;<a href="mailto:piotr.lewicki@elfin.de"
            target="_blank" moz-do-not-send="true">piotr.lewicki@elfin.de</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
              <br>
              I have a problem with forcing rebuild of the recipe
              depending on the environment variable.<br>
              <br>
              In my recipe I have an anonymous python function that
              obtains the env variable and depending on it sets some
              other internal variables (needed by swupdate recipe):<br>
              <br>
              <br>
              python() {<br>
                  origenv = d.getVar("BB_ORIGENV", False)<br>
                  u_boot_enabled = origenv.getVar("ADD_UBOOT_TO_U<wbr>PDATE",
              False)<br>
              <br>
                  if u_boot_enabled == None:<br>
                      bb.warn("Not adding u-boot to the image")<br>
                  else:<br>
                      bb.warn("Adding u-boot to the image")<br>
                      d.appendVar("SWUPDATE_IMAGES", " u-boot.imx")<br>
                      d.setVarFlag("SWUPDATE_IMAGES_<wbr>NOAPPEND_MACHINE",
              "u-boot.imx", "1")<br>
              }<br>
              <br>
              <br>
              My issue is that there is no difference when I either set
              or unset my environment variable "ADD_UBOOT_TO_UPDATE".<br>
              <br>
              <br>
              Can you point me a solution how I could force checking
              this variable and rerunning/rebuilding the recipe?<br>
            </blockquote>
            <div><br>
            </div>
            <div>Can't you use a variable set in local.conf instead?</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------6C416B5496F11DAB72EFCEBE--
