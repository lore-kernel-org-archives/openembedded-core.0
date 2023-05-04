Return-Path: <rudolf.streif@ibeeto.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E523C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 16:23:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.54404.1683217395128473769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 09:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@ibeeto-com.20221208.gappssmtp.com header.s=20221208 header.b=gmLlylgl;
 spf=neutral (domain: ibeeto.com, ip: 209.85.214.174, mailfrom: rudolf.streif@ibeeto.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1aae5c2423dso6399855ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ibeeto-com.20221208.gappssmtp.com; s=20221208; t=1683217394; x=1685809394;
        h=in-reply-to:subject:from:references:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm3nywPECtzsWyxIMJiosBkqHT53nwr1ZSe/G/bfOq0=;
        b=gmLlylgl841zC/6EnQVWPQuNnOuIjr3Xj3ZCK6n3pEAl6BOHKdzy74mcfdgwdqVUf0
         C5XHEepWcd7uSFwzGzlo1Ljb1xV/PP2c1l4wJ4iO+nYKtNanLEC/ljafj8zo0I1Y2TcB
         akSFkvSG0TH7gLGoAMqhZJBqsGoAMwdnmb7WKaiBIRPUuwCDJpjDlmw25sDaPEUYe+tO
         78u6YZTp1J3AblStCRG/xkG4hz/WE6FnxURLv0Nfbg+Nh5WX8jgMLesjX/OJEOy5aahg
         XKtn3+5+kGVRRtWn8Nf4gcnTuk/VmZ0Hhh0NCxignu7nINT/bKmB6fU9bYr4TFPi7nzU
         ijgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683217394; x=1685809394;
        h=in-reply-to:subject:from:references:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hm3nywPECtzsWyxIMJiosBkqHT53nwr1ZSe/G/bfOq0=;
        b=Xo1QpIbFOd9n7nXW8uo0SOoeO/oAaDpnqZGNYKRFoNyOL1R4U7WpDP0AB4+2ASZuSf
         vrAhXJuryL+TYIzA4He7lmoo4fQT+l910ZB7blJ5B73sDZ/xXEDWhPf6B0fBEg0hL4TA
         tpAErKnZliCN/vP3FKVy3Qe1q/n4nJ+7fi4JrOaRF1wK6aK0ISrFwLRSnK2pUhV/olMn
         vrm3SVeENsTwXvJaC2Qy4vDECknTSshmYi7S92MN9SZI9XBlvEmpRuIf8HcagG8/sp2D
         9SrjWWh/FEN4Lq+XNDaA8KdLDG9wMH8Teizsbpa52niGysgBPTJeTZqJJvD1cWGSM2mm
         o89Q==
X-Gm-Message-State: AC+VfDw/46j/MTnQ7NU9nk5jUFElB0tkV6yD0cy9IEsUP+OonmHqUqv8
	Eo4vkDUUCCzmTMjgrfZdNzTzHw==
X-Google-Smtp-Source: ACHHUZ4Vw6T5eFkCK6Kjg/KgLHrYG8FCcDu2MI1kh16OkNyu/PUcxJsM3WYTYR32BB5zWKPv1JUpCg==
X-Received: by 2002:a17:902:650f:b0:1a9:95fa:1fa8 with SMTP id b15-20020a170902650f00b001a995fa1fa8mr3772163plk.41.1683217394016;
        Thu, 04 May 2023 09:23:14 -0700 (PDT)
Received: from ?IPV6:2600:8801:8d00:2b14:7b2a:31ea:d7be:5c89? ([2600:8801:8d00:2b14:7b2a:31ea:d7be:5c89])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902b08e00b001aae909cfbbsm5200697plr.119.2023.05.04.09.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 09:23:13 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------C27t2OCNjkUiJfu4CdbnPFsb"
Message-ID: <edddd660-eb32-8ce8-adbf-fb02e6e2ecb4@ibeeto.com>
Date: Thu, 4 May 2023 09:23:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Josef Holzmayr <jester@theyoctojester.info>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <ndec13@gmail.com>, yocto@lists.yoctoproject.org,
 yocto-advocacy@lists.yoctoproject.org,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
 <de0cbb7c94bb9af021f090b684eee4c6b5bb187e.camel@linuxfoundation.org>
 <CAEt6NwpsS8omNHvWeQrLzuOAAaki7rt8oYrbgmyNCuG-k0qZyw@mail.gmail.com>
From: Rudolf J Streif <rudolf.streif@ibeeto.com>
Subject: Re: [Yocto-Advocacy] Yocto Project Community Manager updates
In-Reply-To: <CAEt6NwpsS8omNHvWeQrLzuOAAaki7rt8oYrbgmyNCuG-k0qZyw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 16:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180882

This is a multi-part message in MIME format.
--------------C27t2OCNjkUiJfu4CdbnPFsb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Let me chime in.

Nico, thank you so much for your leadership as the Yocto community 
manager and beyond. You certainly made sure that the community remained 
welcoming and supportive to new and current members. I very much 
appreciate all the effort you dedicated to the project and its community.

Welcome Josef, as the new community manager.

Cheers,
Rudi

On 5/4/23 08:13, Josef Holzmayr wrote:
> Thank you Nico for the five years in which we had the pleasure of 
> working together for the growth and future of the Yocto Project and 
> OpenEmbedded. Your contributions and insight will be missed - but 
> hopefully not you as a person. We will meet again, over a drink, and 
> talk of the olde times...
>
> And on the same note, thank you Andy, Richard, and all of the 
> leadership working group for the trust placed in me. Let us make this 
> a change that keeps the good and adds more of it.
>
> Greetz,
> Josef
>
> On Thu, May 4, 2023 at 5:07 PM Richard Purdie 
> <richard.purdie@linuxfoundation.org> wrote:
>
>     On Thu, 2023-05-04 at 16:40 +0200, Nicolas Dechesne wrote:
>     > After five years, I have decided to resign from my position as the
>     > Yocto Project Community Manager. I joined the OpenEmbedded community
>     > around 2008. I have fond memories of my early days, and still
>     > remember some of my first interactions on IRC and mailing lists!
>     This
>     > is a very welcoming community, always helping new people with
>     > patience and kindness. Serving the project during the last five
>     years
>     > is something I am very proud of, and I will be forever grateful to
>     > all of you for accepting me!
>
>     I know we've talked but I did want to publicly say thanks for
>     everything you've done in the role!
>
>     We've had some good times and overcome some challenges in the last few
>     years, the project has definitely benefited from your involvement and
>     you'll be sorely missed.
>
>     Welcome to the role Josef, no pressure! :)
>
>     Cheers,
>
>     Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1800):https://lists.yoctoproject.org/g/yocto-advocacy/message/1800
> Mute This Topic:https://lists.yoctoproject.org/mt/98685139/3617932
> Group Owner:yocto-advocacy+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/yocto-advocacy/unsub  [rudolf.streif@ibeeto.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Rudolf J Streif
CEO/CTO
1.855.442.3386

--------------C27t2OCNjkUiJfu4CdbnPFsb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Let me chime in.</p>
    <p>Nico, thank you so much for your leadership as the Yocto
      community manager and beyond. You certainly made sure that the
      community remained welcoming and supportive to new and current
      members. I very much appreciate all the effort you dedicated to
      the project and its community.</p>
    <p>Welcome Josef, as the new community manager. <br>
    </p>
    <p>Cheers,<br>
      Rudi<br>
    </p>
    <div class="moz-cite-prefix">On 5/4/23 08:13, Josef Holzmayr wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEt6NwpsS8omNHvWeQrLzuOAAaki7rt8oYrbgmyNCuG-k0qZyw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Thank you Nico for the five years in which we had
        the pleasure of working together for the growth and future of
        the Yocto Project and OpenEmbedded. Your contributions and
        insight will be missed - but hopefully not you as a person. We
        will meet again, over a drink, and talk of the olde times...
        <div><br>
        </div>
        <div>And on the same note, thank you Andy, Richard, and all of
          the leadership working group for the trust placed in me. Let
          us make this a change that keeps the good and adds more of it.</div>
        <div><br>
        </div>
        <div>Greetz,</div>
        <div>Josef</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, May 4, 2023 at 5:07 PM
          Richard Purdie &lt;<a
            href="mailto:richard.purdie@linuxfoundation.org"
            moz-do-not-send="true" class="moz-txt-link-freetext">richard.purdie@linuxfoundation.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Thu, 2023-05-04 at 16:40 +0200, Nicolas Dechesne wrote:<br>
          &gt; After five years, I have decided to resign from my
          position as the<br>
          &gt; Yocto Project Community Manager. I joined the
          OpenEmbedded community<br>
          &gt; around 2008. I have fond memories of my early days, and
          still<br>
          &gt; remember some of my first interactions on IRC and mailing
          lists! This<br>
          &gt; is a very welcoming community, always helping new people
          with<br>
          &gt; patience and kindness. Serving the project during the
          last five years<br>
          &gt; is something I am very proud of, and I will be forever
          grateful to<br>
          &gt; all of you for accepting me!<br>
          <br>
          I know we've talked but I did want to publicly say thanks for<br>
          everything you've done in the role! <br>
          <br>
          We've had some good times and overcome some challenges in the
          last few<br>
          years, the project has definitely benefited from your
          involvement and<br>
          you'll be sorely missed.<br>
          <br>
          Welcome to the role Josef, no pressure! :)<br>
          <br>
          Cheers,<br>
          <br>
          Richard<br>
        </blockquote>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#1800): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/yocto-advocacy/message/1800">https://lists.yoctoproject.org/g/yocto-advocacy/message/1800</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/98685139/3617932">https://lists.yoctoproject.org/mt/98685139/3617932</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:yocto-advocacy+owner@lists.yoctoproject.org">yocto-advocacy+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/yocto-advocacy/unsub">https://lists.yoctoproject.org/g/yocto-advocacy/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:rudolf.streif@ibeeto.com">rudolf.streif@ibeeto.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Rudolf J Streif
CEO/CTO
1.855.442.3386</pre>
  </body>
</html>

--------------C27t2OCNjkUiJfu4CdbnPFsb--

