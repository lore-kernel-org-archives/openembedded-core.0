Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.1013.1591205638471848523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 10:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AiuypDW7;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id y18so1052137plr.4
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=X5l0tM+aSnEy2Y5cz0pn480/6Qj4duP6jGE43zk/5t8=;
        b=AiuypDW76gjPtsbJKwg/siAjGKU4u8SyBXAEy5Tmz+Cz97QAiD8AmXrcUcVauTp+Cf
         6P7uHrKokMbwAADU6SOrxTJMsGnfLK8WxS0FP4yKWsy3+T0r/uftSwr7uKgFPe6bktUr
         9xECAF8qsqO3M5YJnahrj1hjSenPxCAJnC9/xdP77QEHV3GeMETphnS9YFPKpCSV+/vI
         TNL1KTkt8TTQrulPdyjme/xxYvrOZmlXNe4z7S2jH48Vx+jFVI9/n+tnc9QG7tjzkd0T
         xA6vk3rVvQVX6MAaL3WZKBisMVkGnc9hXB3HWTBifimBziEbCfRrl9J38Zlk85deJFMm
         iwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=X5l0tM+aSnEy2Y5cz0pn480/6Qj4duP6jGE43zk/5t8=;
        b=lDEJpfXjV+a7ZqUcfugel81xmPeujnDNIRqxBGVBQy1z49Eqvj/qjPF4J13tlswGpV
         bwdclTFNPCbp75zkRuyTDVYYl7zeP+KpOPRkNlODk/Cb+sawq6pYl2ZQFYUSHmsmfiqK
         tY0L/1EM8atF0QKoiIpYIqohk8zUy9FYg2FkwA36GmcrgbjnK1kLzfAKxNT1z7BoWaVf
         iv9ZJvQhoMvtFFdOk2QscnMptUi2VZivYKmiP+FRYR/O/dC/iVcbYQbXCTcG7JwwdoD3
         ABuqhEvDVodUXquYhppk15mPfL8d4d3CsoBwibVZrrQY7p8t6XB6lvdopC0xrGScJmwi
         mOvw==
X-Gm-Message-State: AOAM532wfhsUm/Sd1+BXdOqcQnzsBZvEqscPTxQ/k+ylVaG5EuVS+RNP
	D3jOk+3kyGYLJvJmExiqtGaZ/SsG
X-Google-Smtp-Source: ABdhPJx/U302RQREa4SP400i0GoC4pUFfhzbPzFq/2PN3rf/PoURCcX1FLOsY0xYu4ezZGjeL362fw==
X-Received: by 2002:a17:902:a505:: with SMTP id s5mr922637plq.20.1591205637486;
        Wed, 03 Jun 2020 10:33:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7c6f:fec8:5548:f4b0? ([2601:202:4180:a5c0:7c6f:fec8:5548:f4b0])
        by smtp.gmail.com with ESMTPSA id w4sm2356106pfq.57.2020.06.03.10.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 10:33:56 -0700 (PDT)
Subject: Re: [OE-core][dunfell 0/5] Patch review
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1591197295.git.steve@sakoman.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <fa08dc08-22f5-f82f-58dc-02b976acdf2b@gmail.com>
Date: Wed, 3 Jun 2020 10:33:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1591197295.git.steve@sakoman.com>
Content-Type: multipart/alternative;
 boundary="------------FBF168CA9AEBF9A839D7C639"
Content-Language: en-US

--------------FBF168CA9AEBF9A839D7C639
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Does someone have the complementary set of patches for meta-openbedded
to remove these?

- armin

On 6/3/20 8:33 AM, Steve Sakoman wrote:
> Pending final approval for an exception to LTS policy in this case please
> review this patch series and have comments back by end of day Thursday.
>
> For details on the motivation for this change see:
>
> https://lists.openembedded.org/g/openembedded-architecture/message/1085
>
> The following changes since commit ef5af31f406076107402694f5d6afb27b240eba6:
>
>   linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>
> Joshua Watt (5):
>   pycryptodome: Import from meta-python
>   pyelftools: Import from meta-python
>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
>   python3-pyelftools: Upgrade 0.25 -> 0.26
>   layer.conf: Bump OE-Core layer version
>
>  meta/conf/distro/include/maintainers.inc      |  5 +++-
>  meta/conf/layer.conf                          |  2 +-
>  .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
>  6 files changed, 59 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb
>
>
> 


--------------FBF168CA9AEBF9A839D7C639
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Does someone have the complementary set of patches for
    meta-openbedded to remove these?<br>
    <br>
    - armin<br>
    <br>
    <div class="moz-cite-prefix">On 6/3/20 8:33 AM, Steve Sakoman wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cover.1591197295.git.steve@sakoman.com">
      <pre class="moz-quote-pre" wrap="">Pending final approval for an exception to LTS policy in this case please
review this patch series and have comments back by end of day Thursday.

For details on the motivation for this change see:

<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-architecture/message/1085">https://lists.openembedded.org/g/openembedded-architecture/message/1085</a>

The following changes since commit ef5af31f406076107402694f5d6afb27b240eba6:

  linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  <a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut">http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut</a>

Joshua Watt (5):
  pycryptodome: Import from meta-python
  pyelftools: Import from meta-python
  python3-pycryptodome(x): Upgrade 3.9.4 -&gt; 3.9.7
  python3-pyelftools: Upgrade 0.25 -&gt; 0.26
  layer.conf: Bump OE-Core layer version

 meta/conf/distro/include/maintainers.inc      |  5 +++-
 meta/conf/layer.conf                          |  2 +-
 .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
 .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
 .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
 .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
 6 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FBF168CA9AEBF9A839D7C639--
