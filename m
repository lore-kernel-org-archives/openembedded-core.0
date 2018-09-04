Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A729A74A35
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 02:12:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w842Cw8S008405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2018 19:12:58 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 3 Sep 2018 19:12:57 -0700
Reply-To: <lu.jiang@windriver.com>
To: Tim Orling <ticotimo@gmail.com>, Tom Rini <trini@konsulko.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-3-git-send-email-lu.jiang@windriver.com>
	<20180831135324.GO26633@bill-the-cat>
	<e7261e4b-1d4b-afaf-7078-3884021878d3@windriver.com>
	<20180903025056.GE26633@bill-the-cat>
	<CANx9H-A0SdVkXY-Nyb91WSJU4Xp9bWYwOtmep9Jgd2P-_hGiJw@mail.gmail.com>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <1551786b-ce15-921c-2a87-ecb6c9ae581a@windriver.com>
Date: Tue, 4 Sep 2018 10:10:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-A0SdVkXY-Nyb91WSJU4Xp9bWYwOtmep9Jgd2P-_hGiJw@mail.gmail.com>
X-Originating-IP: [128.224.162.214]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic
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
X-List-Received-Date: Tue, 04 Sep 2018 02:12:59 -0000
Content-Type: multipart/alternative;
	boundary="------------6BE1B5D8011C052F3DBE4492"
Content-Language: en-US

--------------6BE1B5D8011C052F3DBE4492
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

The patch move source code for wic from lib/script into 
meta/receipt-support/wic. Then wic compiled as an individual package.

When building wic image on host, imagetype-wic.bbclass invoke 
wic-native. This is almost same as before.

After applied those patch, wic also run on target, allow user create wic 
image on target board based on supplied components image or based on a 
running system.

BTW, I checked code moved in this patch, didn't found reference path in 
code.

Thanks
Jiang Lu

在 2018年09月03日 23:14, Tim Orling 写道:
> Also, what is the reason for the move? What problem does it solve? Why 
> is it better to move it?
> On Sun, Sep 2, 2018 at 7:51 PM Tom Rini <trini@konsulko.com 
> <mailto:trini@konsulko.com>> wrote:
>
>     On Mon, Sep 03, 2018 at 09:58:01AM +0800, Lu.Jiang wrote:
>
>     > This patch simply move code from script/lib/wic into
>     > meta/recipes-support/wic/files. I didn't touch code in this patch.
>     >
>     > Please see attachment for patch formatted with -M.
>
>     Exactly, formatted with -M it's clear and a short patch.  A follow-up
>     question now, are there any comment paths, etc, that should be changed
>     as part of the move?
>
>     -- 
>     Tom
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------6BE1B5D8011C052F3DBE4492
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">The patch move source code for wic from
      lib/script into meta/receipt-support/wic. Then wic compiled as an
      individual package. <br>
      <br>
      When building wic image on host, imagetype-wic.bbclass invoke
      wic-native. This is almost same as before.<br>
      <br>
      After applied those patch, wic also run on target, allow user
      create wic image on target board based on supplied components
      image or based on a running system.<br>
      <br>
      BTW, I checked code moved in this patch, didn't found reference
      path in code.<br>
      <br>
      Thanks<br>
      Jiang Lu <br>
      <br>
      在 2018年09月03日 23:14, Tim Orling 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-A0SdVkXY-Nyb91WSJU4Xp9bWYwOtmep9Jgd2P-_hGiJw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      Also, what is the reason for the move? What problem does it solve?
      Why is it better to move it?<br>
      <div class="gmail_quote">
        <div dir="ltr">On Sun, Sep 2, 2018 at 7:51 PM Tom Rini &lt;<a
            href="mailto:trini@konsulko.com" moz-do-not-send="true">trini@konsulko.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Sep
          03, 2018 at 09:58:01AM +0800, Lu.Jiang wrote:<br>
          <br>
          &gt; This patch simply move code from script/lib/wic into<br>
          &gt; meta/recipes-support/wic/files. I didn't touch code in
          this patch.<br>
          &gt; <br>
          &gt; Please see attachment for patch formatted with -M.<br>
          <br>
          Exactly, formatted with -M it's clear and a short patch.  A
          follow-up<br>
          question now, are there any comment paths, etc, that should be
          changed<br>
          as part of the move?<br>
          <br>
          -- <br>
          Tom<br>
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
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6BE1B5D8011C052F3DBE4492--
