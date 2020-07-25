Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.11073.1595688741907548775
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 07:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qPr5CJnj;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id t6so6010156plo.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 07:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=BFFblUAdtr/k5fcontequ+yzuBFkZScrlXXmZuf4VHQ=;
        b=qPr5CJnj09xtzDNZAIEzP3/qRF/6uFd457tqBtNwI5pgnEvS786FOi+lDpvwC9Q26s
         HAyrOGE2pNls6l3eSn4/8ItJUSlmbe2JJARBD1QgX+k69OmWlQH4NNczkAG2yx8lwBWm
         J5JiFWX/6ObpHXv3nZrEERQTCgLrR+sreUm5WCekXzb4xjTZCgY1slmZGk0eeTHUg9iR
         0qdJPG41DcD0gifs6qx1eYj0bCnrnFSGoXQ0kwpqmZ1JCr9321LjpXGnTD4jqpApArVs
         9UlHiry6DT0/hyFdU5SVjzWajpVvy+MWv0X0HeL7jEy2RvrDzQmEK7LgQd3E83k6scwy
         pM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=BFFblUAdtr/k5fcontequ+yzuBFkZScrlXXmZuf4VHQ=;
        b=kezHOjfp3uwiH03loIBdsUFxq2wPRGeBOcsfYMcy0GI1X91I6DVow49G1iMHG7ww7r
         iygwvy5SJx2IPh/qynY8QZ8sc+0Gx2iSahMIkuLFAh7zj+9NGHiZcAxhhql7fdvRAXrf
         w7FV7PMB1fBbX86chai/3aA/wMOITGJ4B2UKelSk/b6c4FT1xF8xFHcvoHTYj6zOUJcE
         Ke0aBt7goiZPk8rVP4f7AfmKglVF5bSeHdXad34sxa2W7DXM1f+cv7TGp69nitnQmvaK
         1ZP+/pAARyQx3lFQah6QKs76zp5OUA0SiVwuCoGwh03j/BIwIFtIG0aOvYb2uUgV/6/Z
         VbVg==
X-Gm-Message-State: AOAM5328ushxK0FYCiTJTPJwCK4HkKzaWbcru+cwcGKB5AZzArUmSnct
	iYqUcFiCaPiPFk9fFsFyVla6IrnvHLA=
X-Google-Smtp-Source: ABdhPJxKzuVCnXOgd36zsRQEiYuUC5TE7g8dWNKu0ve6vKrnEWXagvuimHd0S8etR/HYVyG01AjYqg==
X-Received: by 2002:a17:90b:300d:: with SMTP id hg13mr10868661pjb.212.1595688741311;
        Sat, 25 Jul 2020 07:52:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:40e5:a0a0:80e8:2308? ([2601:202:4180:a5c0:40e5:a0a0:80e8:2308])
        by smtp.gmail.com with ESMTPSA id t187sm9235416pgb.76.2020.07.25.07.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:52:20 -0700 (PDT)
Subject: Re: [OE-core] cve-check breaks on zeus
To: Konrad Weihmann <kweihmann@outlook.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB6881998FE5ADEC576D81902CA8740@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f1b775ff-0fbb-2444-ec91-5efea2f75868@gmail.com>
Date: Sat, 25 Jul 2020 07:52:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM7PR05MB6881998FE5ADEC576D81902CA8740@AM7PR05MB6881.eurprd05.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------960E24387E281394C17DD371"
Content-Language: en-US

--------------960E24387E281394C17DD371
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/25/20 4:13 AM, Konrad Weihmann wrote:
> Hi all,
>
> I'm just too lazy to check if that has been fixed in master already,
> but since yesterday cve-check breaks on zeus for me with the following

I think I just saw this on master. We need to check if NVD changed their
format again.

-armin

>
> File:
> '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb',
> lineno: 91, function: do_populate_cve_db
>      0087:            # Update db with current year json file
>      0088:            try:
>      0089:                response = urllib.request.urlopen(json_url)
>      0090:                if response:
>  *** 0091:                    update_db(c,
> gzip.decompress(response.read()).decode('utf-8'))
>      0092:                c.execute("insert or replace into META
> values (?, ?)", [year, last_modified])
>      0093:            except urllib.error.URLError as e:
>      0094:                cve_f.write('Warning: CVE db update error,
> CVE data is outdated.\n\n')
>      0095:                bb.warn("Cannot parse CVE data (%s), update
> failed" % e.reason)
> File:
> '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb',
> lineno: 173, function: update_db
>      0169:
>      0170:        cveId = elt['cve']['CVE_data_meta']['ID']
>      0171:        cveDesc =
> elt['cve']['description']['description_data'][0]['value']
>      0172:        date = elt['lastModifiedDate']
>  *** 0173:        accessVector =
> elt['impact']['baseMetricV2']['cvssV2']['accessVector']
>      0174:        cvssv2 =
> elt['impact']['baseMetricV2']['cvssV2']['baseScore']
>      0175:
>      0176:        try:
>      0177:            cvssv3 =
> elt['impact']['baseMetricV3']['cvssV3']['baseScore']
> Exception: KeyError: 'baseMetricV2'
>
> Cheers
> Konrad
>
> 


--------------960E24387E281394C17DD371
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/25/20 4:13 AM, Konrad Weihmann
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AM7PR05MB6881998FE5ADEC576D81902CA8740@AM7PR05MB6881.eurprd05.prod.outlook.com">Hi
      all,
      <br>
      <br>
      I'm just too lazy to check if that has been fixed in master
      already, but since yesterday cve-check breaks on zeus for me with
      the following
      <br>
    </blockquote>
    <br>
    I think I just saw this on master. We need to check if NVD changed
    their format again.<br>
    <br>
    -armin<br>
    <br>
    <blockquote type="cite"
cite="mid:AM7PR05MB6881998FE5ADEC576D81902CA8740@AM7PR05MB6881.eurprd05.prod.outlook.com"><br>
      File:
      '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb',
      lineno: 91, function: do_populate_cve_db
      <br>
           0087:            # Update db with current year json file
      <br>
           0088:            try:
      <br>
           0089:                response =
      urllib.request.urlopen(json_url)
      <br>
           0090:                if response:
      <br>
       *** 0091:                    update_db(c,
      gzip.decompress(response.read()).decode('utf-8'))
      <br>
           0092:                c.execute("insert or replace into META
      values (?, ?)", [year, last_modified])
      <br>
           0093:            except urllib.error.URLError as e:
      <br>
           0094:                cve_f.write('Warning: CVE db update
      error, CVE data is outdated.\n\n')
      <br>
           0095:                bb.warn("Cannot parse CVE data (%s),
      update failed" % e.reason)
      <br>
      File:
      '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb',
      lineno: 173, function: update_db
      <br>
           0169:
      <br>
           0170:        cveId = elt['cve']['CVE_data_meta']['ID']
      <br>
           0171:        cveDesc =
      elt['cve']['description']['description_data'][0]['value']
      <br>
           0172:        date = elt['lastModifiedDate']
      <br>
       *** 0173:        accessVector =
      elt['impact']['baseMetricV2']['cvssV2']['accessVector']
      <br>
           0174:        cvssv2 =
      elt['impact']['baseMetricV2']['cvssV2']['baseScore']
      <br>
           0175:
      <br>
           0176:        try:
      <br>
           0177:            cvssv3 =
      elt['impact']['baseMetricV3']['cvssV3']['baseScore']
      <br>
      Exception: KeyError: 'baseMetricV2'
      <br>
      <br>
      Cheers
      <br>
      Konrad
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------960E24387E281394C17DD371--
