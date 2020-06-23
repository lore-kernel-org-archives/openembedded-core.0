Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.9978.1592927028117736176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 08:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=P655ADOs;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.182, mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id e9so10016718pgo.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=Smnie6+6naxDQJsTRb5/mwGuBzkwxIFd8vHko8ECol0=;
        b=P655ADOsuOpFiIBqb7QnoxJ9NDDazXC++sr0E2RFS7fEoM22jvjBK4LLnfMN7cLCIA
         nrl9tSFnYTgyPYEXtpLD8UdAZJeOMSUX2U92Zy9yGKcNZofrdHyGwm6teOMJYYK6ovXw
         TS4+bGlM85LZ2ei0OnRXMh3qI9BU+KWJZgs00XUfFjPMdHAL4ko195rEc0ms/BNqL9HW
         7VszuIX1uEN7KRUSc1xLzVZw/uER+QdkJoDZzb4G5CdjGl+fqVOF2/6yr6ieE6e9Oz1P
         J85KAte2o9FvwtrSVANe0qKisLUYB7RmxR8amPLhI5jQljrYl2oae5qFBBwHrzHZUgPx
         +W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Smnie6+6naxDQJsTRb5/mwGuBzkwxIFd8vHko8ECol0=;
        b=eEfbuNMfXfGe10oAntjXdqvIVOKmD5F6avsAfqf/HtXN6VSuIOhRstZ4wuhuqpfTy+
         SWNCaPRbhP/we9YK8t0b4ggT4qywMZAx6sZLv5AeLKcKyYqIa4UvUsGx9SXgjR+xhQFU
         vK/RSoAhIt8b6qGK2Dka72srlFpFSuNfrhB2lVO/vTTz/ROmZ9T4twZrClRlllgwKHRZ
         vaIRihQRKKaoH6vDdpRXSt0iyqmzwCeQIQN1QgfqfHSvtzQSgDsqVH/AKySKaFv3A+3q
         FTDeaTPoj6J9QSqXKu4mADjV5hp7NRN+xiFaZRbD3y7Fnqz4aTDUGCm6yiawnBuyfOc9
         h+PQ==
X-Gm-Message-State: AOAM533qKL8cTU/dU2D/QwrZIEyCAPwOFWgOjcPesqsdl3Ej6SuFcJnb
	Vbw96zXngdUhyrATbbb71UhFtA==
X-Google-Smtp-Source: ABdhPJxx1w6WJC7ezfs5UaJU6M6dIZqE8P6GHXrfA8JxPiLl3ZkwX+/aIhUfegNhqQphX/lHOuJJKQ==
X-Received: by 2002:a63:405:: with SMTP id 5mr17211010pge.449.1592927027666;
        Tue, 23 Jun 2020 08:43:47 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from [192.168.1.128] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id a83sm17329010pfa.146.2020.06.23.08.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 08:43:46 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] xmlcatalog: add exit 0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Steve Sakoman <steve@sakoman.com>
References: <20200623000237.28031-1-jpuhlman@mvista.com>
 <CANNYZj-R75ceh7j2aPY7pvhobJTOuVHn3NuCk8ZoaHv+Zm_Cxw@mail.gmail.com>
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
Message-ID: <f6040e47-64dc-aeb3-ebe3-6c4be36bcdf4@mvista.com>
Date: Tue, 23 Jun 2020 08:43:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-R75ceh7j2aPY7pvhobJTOuVHn3NuCk8ZoaHv+Zm_Cxw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------6E8405D544442A4B7EFF186A"
Content-Language: en-US

--------------6E8405D544442A4B7EFF186A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/23/2020 12:16 AM, Alexander Kanavin wrote:
> There is already a patch for fixing this properly:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=fdee2d49fc9139ff7e0b5a8b1b6476224540ca57
>
> Does it work for you?

Yup. That works.

>
> Alex
>
> On Tue, 23 Jun 2020 at 02:02, Jeremy Puhlman <jpuhlman@mvista.com 
> <mailto:jpuhlman@mvista.com>> wrote:
>
>     In most sysroot creation steps, the sysroots components are
>     installed in
>     depenancy order. However, in the case of build-sysroots, since it is
>     not using standard dependacies, post installs that use xmlcatalog fail
>     because xmlcatalog is not installed. Since the last execution in the
>     script is xmlcatalog, the script returns 127.
>
>     Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com
>     <mailto:jpuhlman@mvista.com>>
>     ---
>      meta/classes/xmlcatalog.bbclass | 1 +
>      1 file changed, 1 insertion(+)
>
>     diff --git a/meta/classes/xmlcatalog.bbclass
>     b/meta/classes/xmlcatalog.bbclass
>     index ae4811fdeb..e8d73abcf5 100644
>     --- a/meta/classes/xmlcatalog.bbclass
>     +++ b/meta/classes/xmlcatalog.bbclass
>     @@ -15,6 +15,7 @@ xmlcatalog_complete() {
>             for CATALOG in ${XMLCATALOGS}; do
>                     xmlcatalog --noout --add nextCatalog unused
>     file://$CATALOG $ROOTCATALOG
>             done
>     +       exit 0
>      }
>
>      xmlcatalog_sstate_postinst() {
>     -- 
>     2.20.1
>
>     
>
>
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
> 	Virus-free. www.avg.com 
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
>
>
> <#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------6E8405D544442A4B7EFF186A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/23/2020 12:16 AM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj-R75ceh7j2aPY7pvhobJTOuVHn3NuCk8ZoaHv+Zm_Cxw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>There is already a patch for fixing this properly:</div>
        <div><a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=fdee2d49fc9139ff7e0b5a8b1b6476224540ca57"
            moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=fdee2d49fc9139ff7e0b5a8b1b6476224540ca57</a></div>
        <div><br>
        </div>
        <div>Does it work for you?</div>
      </div>
    </blockquote>
    <br>
    Yup. That works.<br>
    <br>
    <blockquote type="cite"
cite="mid:CANNYZj-R75ceh7j2aPY7pvhobJTOuVHn3NuCk8ZoaHv+Zm_Cxw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Tue, 23 Jun 2020 at 02:02,
          Jeremy Puhlman &lt;<a href="mailto:jpuhlman@mvista.com"
            moz-do-not-send="true">jpuhlman@mvista.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In
          most sysroot creation steps, the sysroots components are
          installed in<br>
          depenancy order. However, in the case of build-sysroots, since
          it is<br>
          not using standard dependacies, post installs that use
          xmlcatalog fail<br>
          because xmlcatalog is not installed. Since the last execution
          in the<br>
          script is xmlcatalog, the script returns 127.<br>
          <br>
          Signed-off-by: Jeremy A. Puhlman &lt;<a
            href="mailto:jpuhlman@mvista.com" target="_blank"
            moz-do-not-send="true">jpuhlman@mvista.com</a>&gt;<br>
          ---<br>
           meta/classes/xmlcatalog.bbclass | 1 +<br>
           1 file changed, 1 insertion(+)<br>
          <br>
          diff --git a/meta/classes/xmlcatalog.bbclass
          b/meta/classes/xmlcatalog.bbclass<br>
          index ae4811fdeb..e8d73abcf5 100644<br>
          --- a/meta/classes/xmlcatalog.bbclass<br>
          +++ b/meta/classes/xmlcatalog.bbclass<br>
          @@ -15,6 +15,7 @@ xmlcatalog_complete() {<br>
                  for CATALOG in ${XMLCATALOGS}; do<br>
                          xmlcatalog --noout --add nextCatalog unused
          <a class="moz-txt-link-freetext" href="file://$CATALOG">file://$CATALOG</a> $ROOTCATALOG<br>
                  done<br>
          +       exit 0<br>
           }<br>
          <br>
           xmlcatalog_sstate_postinst() {<br>
          -- <br>
          2.20.1<br>
          <br>
          <br>
        </blockquote>
      </div>
      <div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
        <table style="border-top: 1px solid #D3D4DE;">
          <tbody>
            <tr>
              <td style="width: 55px; padding-top: 13px;"><a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                  target="_blank" moz-do-not-send="true"><img
src="https://ipmcdn.avast.com/images/icons/icon-envelope-tick-green-avg-v1.png"
                    alt="" style="width: 46px; height: 29px;"
                    moz-do-not-send="true" width="46" height="29"></a></td>
              <td style="width: 470px; padding-top: 12px; color:
                #41424e; font-size: 13px; font-family: Arial, Helvetica,
                sans-serif; line-height: 18px;">Virus-free. <a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                  target="_blank" style="color: #4453ea;"
                  moz-do-not-send="true">www.avg.com</a> </td>
            </tr>
          </tbody>
        </table>
        <a href="#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1"
          height="1" moz-do-not-send="true"> </a></div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a></pre>
  </body>
</html>

--------------6E8405D544442A4B7EFF186A--
