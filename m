Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9663C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 04:55:15 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.5234.1635828904278014164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 21:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 34E87E00CA;
	Tue,  2 Nov 2021 17:45:31 +1300 (NZDT)
Content-Type: multipart/alternative;
 boundary="------------kEMYCmwA5RMlqtN60YHWbUjx"
Message-ID: <fe10267e-595f-c0ab-3074-d899d48d61f1@taitradio.com>
Date: Tue, 2 Nov 2021 17:45:31 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [OE-core] [PATCH 1/1] sanity.bbclass: Update required gcc version
 to v7.5
Content-Language: en-GB
To: Khem Raj <raj.khem@gmail.com>, Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1635778787.git.liezhi.yang@windriver.com>
 <9afb661854796b8ec836b94cca1cebf7aa382655.1635778787.git.liezhi.yang@windriver.com>
 <CAMKF1soeGMgzS7uz6M27+SaNv4YmnHEAJavTgZxcyjenyNpmfw@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
In-Reply-To: 
 <CAMKF1soeGMgzS7uz6M27+SaNv4YmnHEAJavTgZxcyjenyNpmfw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 04:55:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157735

This is a multi-part message in MIME format.
--------------kEMYCmwA5RMlqtN60YHWbUjx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/21 4:18 am, Khem Raj wrote:
> On Mon, Nov 1, 2021 at 8:05 AM Robert Yang <liezhi.yang@windriver.com> 
> wrote:
>
>     qemu-native 6.1.0 requires at least gcc v7.5:
>     ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)
>
>
> Which supported distros still ship gcc < 7.5


Ubuntu 18.04 is on gcc 7.4

--------------kEMYCmwA5RMlqtN60YHWbUjx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/11/21 4:18 am, Khem Raj wrote:</div>
    <blockquote type="cite"
cite="mid:CAMKF1soeGMgzS7uz6M27+SaNv4YmnHEAJavTgZxcyjenyNpmfw@mail.gmail.com">
      <div>On Mon, Nov 1, 2021 at 8:05 AM Robert Yang &lt;<a
          href="mailto:liezhi.yang@windriver.com" moz-do-not-send="true"
          class="moz-txt-link-freetext">liezhi.yang@windriver.com</a>&gt;
        wrote:<br>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">qemu-native
            6.1.0 requires at least gcc v7.5:<br>
            ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode
            Clang v10.0)</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Which supported distros still ship gcc &lt;
            7.5</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Ubuntu 18.04 is on gcc 7.4<br>
    </p>
  </body>
</html>
--------------kEMYCmwA5RMlqtN60YHWbUjx--


