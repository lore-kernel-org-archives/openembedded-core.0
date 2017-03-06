Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id D052B774FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 14:01:02 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id f54so21661589uaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 06:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=GO0TG3MTp1zOUD6EBcEkvA1PGjdzRUZRQYrj8+tiIi0=;
	b=Y7K7bUeWZgNNIxFJK2gMk6arKTeWOxiRAb8hlYSEynpH4OO6Hb8CLLy3AcEu6Slt88
	dsFy6vK4wXyjsi6fTej/aXTjtzol5OiGrqMi2QwXxsEwKmgOiZWjsRWlTbG0zHKm9BBY
	gPvug4hsv6TrmEDcZjuaN3y1qK4a9SarJtDy15T1a2n5MCKnkVCSbIVGj/L5NkrNeKbZ
	N+mf2bCdrCJDe55T5ATa1yowel5ZhaJ9c+mB4Ug0HPepf8kHkB/BTxWWEVId4nIsP5/B
	8hCfLORAUDa9eMrkhYMQMdk8tNGXqqq+RPPeWMIAbJ0OZw9X3AKtqRQMyRPb1MA768Pu
	5qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=GO0TG3MTp1zOUD6EBcEkvA1PGjdzRUZRQYrj8+tiIi0=;
	b=PyPTmv/XlbhVnXHG/vKJJjQAZ1zpIziaAHJ9ZlKUqNEhAxU4XQQ4Vkh5IWouVV7Pss
	NO9WBW0bpkPJtUnex/S6UT92B1hREjj8x9gx4gFjMBlT8vHQT+1IQVqcn1Zjg1mr0pwa
	Q9QiDWNBIbDuwsdcLF4nmCq6YOC9Z1bqxaVbvmI3t4FosZUbJ3N1G3IrZpROVO26ATnp
	+OXE25yartMrrrtoWXQcC9myAkKUH3jMS+ST5X7rksA+A4vnXG1EmKcsQzRcZUZmKiiQ
	tEYlpMXO0mADETk+18bxNcaU/LVWRU29UJxBGJYrI9SOqi2sOkwoiyQrqNFh06nYP6Oh
	iOBQ==
X-Gm-Message-State: AMke39m7YpadjjyAwPM8kUCSgjIsb8trnBUbscGxCtTLapmjGsXIc2cbBYgXIcvlkLSY9w==
X-Received: by 10.31.74.135 with SMTP id x129mr6861365vka.20.1488808863926;
	Mon, 06 Mar 2017 06:01:03 -0800 (PST)
Received: from [10.5.3.7] ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	g25sm5207711uaf.23.2017.03.06.06.01.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 06:01:02 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
Date: Mon, 6 Mar 2017 11:00:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Mon, 06 Mar 2017 14:01:06 -0000
Content-Type: multipart/alternative;
	boundary="------------8A38E4F0189931527DEB2BD8"

--------------8A38E4F0189931527DEB2BD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Same error with poky-contrib:ed/wic/wip, we need to add --fstype= to 
part /boot line in all wks files.


On 03/03/2017 10:49 AM, Burton, Ross wrote:
>
> On 3 March 2017 at 12:12, Fabio Berton <fabio.berton@ossystems.com.br 
> <mailto:fabio.berton@ossystems.com.br>> wrote:
>
>     Sorry for delay. This error for qemux86 is because common.wks.inc
>     and directdisk-gpt.wks files in scripts/lib/wic/canned-wks
>     directory doesn't have option --fstype= for part /boot.
>
>     For qemuarm machines I get the error:
>
>     | DEBUG: Executing python function set_image_size
>     | DEBUG: Python function set_image_size finished
>     | DEBUG: Executing shell function do_image_wic
>     | Error: Please build syslinux first
>
>
> There's patches queued that will change the behaviour here and likely 
> cause your patch to not apply - can you rebase on top of 
> poky-contrib:ed/wic/wip and see what happens?  The build dependency is 
> now wic-tools.
>
> Ross


--------------8A38E4F0189931527DEB2BD8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><tt>Same error with poky-contrib:ed/wic/wip, we need to add </tt><tt>--fstype=
        to </tt><tt>part /boot line in all wks files.</tt></p>
    <br>
    <div class="moz-cite-prefix">On 03/03/2017 10:49 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 3 March 2017 at 12:12, Fabio
            Berton <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:fabio.berton@ossystems.com.br"
                target="_blank">fabio.berton@ossystems.com.br</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <p><tt>Sorry for delay. This error for qemux86 is because
                  common.wks.inc and directdisk-gpt.wks files in
                  scripts/lib/wic/canned-wks directory doesn't have
                  option --fstype= for part /boot.<br>
                </tt></p>
              <p><tt>For qemuarm machines I get the error:</tt></p>
              <p><tt>| DEBUG: Executing python function set_image_size<br>
                  | DEBUG: Python function set_image_size finished<br>
                  | DEBUG: Executing shell function do_image_wic<br>
                  | Error: Please build syslinux first</tt></p>
            </blockquote>
            <div><br>
            </div>
            <div>There's patches queued that will change the behaviour
              here and likely cause your patch to not apply - can you
              rebase on top of poky-contrib:ed/wic/wip and see what
              happens?  The build dependency is now wic-tools. </div>
          </div>
          <br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8A38E4F0189931527DEB2BD8--
