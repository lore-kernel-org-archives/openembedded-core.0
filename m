Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.2200.1588087764139797822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 08:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sGz4ZohW;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id d17so10498175pgo.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:cc:message-id:date:user-agent
         :mime-version:content-language;
        bh=yEPQpFSjJQcvyMoyBT0zSlyHnhSRiHUZ6F1hwwAu5jI=;
        b=sGz4ZohWuCiHYMsltGx70StZ2uukkKOUpZftzHTi9Td6T6szYII+FWazy92OiVDsPk
         Jk3SoLT9nammC2o2EGDvv01724D/VsTDK//LY9sbAMzU0VJKNKXZsJL4c6kOXGZzZGQZ
         6jzPVriBymFkUOJJxmyfoH7nhl3PcE8FhIvn5cZg8W9ly522p2509bBwW69rDSfMHK/c
         FrAu87xhQrwDItPWWFgtE4t7aHPjwrUTwOkxhj0AozZY7YzCjnHWx4hR6AMFdHkEEbWM
         3Tw3bnMXZlu5E/ylOTmgmwKWl+eEWfSGUT/wzGFiaMldMKCY7AWIqci0EyUA8I0zM9rN
         82GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:cc:message-id:date
         :user-agent:mime-version:content-language;
        bh=yEPQpFSjJQcvyMoyBT0zSlyHnhSRiHUZ6F1hwwAu5jI=;
        b=swbBG1AveHvOCBp2L6U58LlFewX7f9DvV7Wxau+a5WDRFku3qp2MSQiEEj0NGN523m
         SpCHw8egeYrSWATW5aX0VJZWyINNZP7sDHd7IZH9HHMzPShsiYjuqgR4rtSFraRax7/K
         h1pKmYAzX2ElXR6nc2D80GvigGmrvGY54AH4mR0k9vO3D0F2sBH94OXSAHXoxdu5bW6s
         Q2z4GaexBLMgapZOjPs7Yr6c9hRGJi3fo/OQI4nZSffnDGMfzmexv+sLfxiae/BQDKN1
         I6P3Sc3t10+NSx6XSEJPKFE4HFNDUJXa1WujIm8ceEkdwNAarjh6k1MuVp3oZaEa7LZU
         HhDA==
X-Gm-Message-State: AGi0PuYvaNj9BnZMq6nIKVWQIcxb6Ekme1XJkYP/S2v2gek+8yPBL3Ig
	i1YIsy/YpPmkMPo2qSba56s=
X-Google-Smtp-Source: APiQypKc4PccTE84TeDd1A/eRf5CI5+I3yYep4oENN4r0CntAZLLfqIhHbDGz510by6RazZuFJIrZQ==
X-Received: by 2002:aa7:9d84:: with SMTP id f4mr25894964pfq.290.1588087763543;
        Tue, 28 Apr 2020 08:29:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3c5d:7c09:562a:defe? ([2601:202:4180:a5c0:3c5d:7c09:562a:defe])
        by smtp.gmail.com with ESMTPSA id q7sm5752469pgs.13.2020.04.28.08.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 08:29:23 -0700 (PDT)
To: bitbake-devel@openembedded.org,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "yocto@yoctoproject.org" <yocto@yoctoproject.org>
From: "akuster" <akuster808@gmail.com>
Subject: Next Zeus Dot release in May
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Cc: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <229c121e-c2ef-005d-a382-cc7430d72e66@gmail.com>
Date: Tue, 28 Apr 2020 08:29:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------CF432796923F31CF27498284"
Content-Language: en-US

--------------CF432796923F31CF27498284
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Our next bot release is coming up so this is a call for patches. Please
have them on the list by this Friday.


Planned upcoming dot releases:

  * YP 3.0.3 build date 2020/5/4
  * YP 3.0.3 release date 2020/5/15


--------------CF432796923F31CF27498284
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p class="MsoNormal"><span
        style="font-family:&quot;Arial&quot;,sans-serif;color:black">Our
        next bot release is coming up so this is a call for patches.
        Please have them on the list by this Friday.</span></p>
    <p class="MsoNormal"><span
        style="font-family:&quot;Arial&quot;,sans-serif;color:black"><br>
      </span></p>
    <p class="MsoNormal"><span
        style="font-family:&quot;Arial&quot;,sans-serif;color:black">Planned
        upcoming dot releases:</span></p>
    <ul style="margin-top:0in" type="disc">
      <li class="MsoNormal" style="color:black;mso-list:l5 level1
        lfo10;vertical-align:baseline"><span
          style="font-family:&quot;Arial&quot;,sans-serif">YP 3.0.3
          build date 2020/5/4</span></li>
      <li class="MsoNormal" style="color:black;mso-list:l5 level1
        lfo10;vertical-align:baseline"><span
          style="font-family:&quot;Arial&quot;,sans-serif">YP 3.0.3
          release date 2020/5/15</span></li>
    </ul>
  </body>
</html>

--------------CF432796923F31CF27498284--
