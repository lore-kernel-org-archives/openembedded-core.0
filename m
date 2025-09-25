Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE83CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 10:58:18 +0000 (UTC)
Received: from mailrelay-egress8.pub.mailoutpod2-cph3.one.com (mailrelay-egress8.pub.mailoutpod2-cph3.one.com [46.30.211.183])
 by mx.groups.io with SMTP id smtpd.web10.8589.1758797887517237534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 03:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=gKNiiVBP;
 dkim=pass header.i=@berginkonsult.se header.s=ed1 header.b=mnUvLTQG;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.183, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1758797885; x=1759402685;
	d=berginkonsult.se; s=rsa1;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=2PSpcVzTIRXV2Fej7qbk3JsRVe8kNC/uuCDtCc9fHUc=;
	b=gKNiiVBP1I8OV6aOMogllipb9LjWFellxl2ngUbGd6WakNBbJ4FGHdz8XNNxr8/uqdO+gQFTwuUh2
	 tc5L+XcgXn3/ppTdeTm1KRAIhJr9+rTCkVDrPNgHZIZW8ivw4T38cVp1rZ4X4+UVSqSXDBJ6TvZlfK
	 vjZ4R2JhKodG5JkOSUsyw+TJ3B0hXzDSwtbQ1huN1Hqem8zEC6WdF/K7l97qFdTkbGrcEGYShV/xVZ
	 mmwS2FLjsL5l8H2EU2uBvd8aX5EUtQCwvbHmGnNDC4gPbAvYR3ENkL8MuPqVod20PX3LAjbrY0tswa
	 Mqkjgh+xVFMDI/mT9z2/FgfhE+xPvsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1758797885; x=1759402685;
	d=berginkonsult.se; s=ed1;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=2PSpcVzTIRXV2Fej7qbk3JsRVe8kNC/uuCDtCc9fHUc=;
	b=mnUvLTQGzoeiCEcrLJ1M8BttolEaHKDq3OpQ03q9pnEPIFStmjB7Kwv8Kmd+VcQTg1K61+VgL4n5q
	 EIG7ybBCg==
X-HalOne-ID: 82b41c13-99fe-11f0-917a-494313b7f784
Received: from [192.168.100.34] (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 82b41c13-99fe-11f0-917a-494313b7f784;
	Thu, 25 Sep 2025 10:58:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------V6H1r6xUDaYK49tWvJHqhQmG"
Message-ID: <6371e7d1-1d57-4b6a-bb6d-eb3ce0f0ba9d@berginkonsult.se>
Date: Thu, 25 Sep 2025 12:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/1] wic: extra partition plugin
To: pierre-loup.gosse@smile.fr, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
 <20250925072203.3490596-2-pierre-loup.gosse@smile.fr>
 <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
 <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
 <CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com>
Content-Language: en-US, sv-SE
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 10:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224014

This is a multi-part message in MIME format.
--------------V6H1r6xUDaYK49tWvJHqhQmG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/25/25 11:13, Pierre-loup GOSSE via lists.openembedded.org wrote:
> Maybe these 'extra' partitions are populated at runtime (first boot) 
> from the rootfs?
> I wrote this plugin for a project because I couldn’t find an easy way 
> like |bootimg_partition to install 'extra' files at build time.|
> If a similar solution already exists in Yocto, I’d be interested to know.
>
in the past I have used to rootfs plugin with '--exclude-path' [1] and 
'--change-directory' [2] assuming that I have isolated all files going 
in to the extra partition in to one directory of rootfs.

   part / --source rootfs --exclude-path=config/ ...
   part /config --source rootfs --change-directory=config

[1] https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n987

[2] https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n1007

Best regards,
/Peter
--------------V6H1r6xUDaYK49tWvJHqhQmG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 9/25/25 11:13, Pierre-loup GOSSE via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Maybe these 'extra' partitions are populated at runtime
          (first boot) from the rootfs?</div>
        <div>I wrote this plugin for a project because I couldn’t find
          an easy way like <code
class="gmail-font-weight-400 gmail-rounded-md gmail-bg-state-ghost-hover gmail-p-1 gmail-text-sm gmail-whitespace-normal">bootimg_partition<font
              face="arial,sans-serif"> to install 'extra' files at build
              time.</font></code></div>
        <div>If a similar solution already exists in Yocto, I’d be
          interested to know.</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>in the past I have used to rootfs plugin with '--exclude-path'
      [1] and '--change-directory' [2] assuming that I have isolated all
      files going in to the extra partition in to one directory of
      rootfs.</p>
    <p>  part / --source rootfs --exclude-path=config/ ...<br>
        part /config --source rootfs --change-directory=config</p>
    <p>[1]
      <a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n987">https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n987</a></p>
    <p>[2]
      <a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n1007">https://git.yoctoproject.org/poky/tree/scripts/lib/wic/help.py#n1007</a></p>
    Best regards,<br>
    /Peter
  </body>
</html>

--------------V6H1r6xUDaYK49tWvJHqhQmG--

