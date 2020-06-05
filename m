Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1290.1591318322022579461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 17:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AnhFUNC0;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id v24so2932576plo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 17:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uxqpILaNzxNefByNNJB/JuLaGT2qFvgGKoAHUkC9fOs=;
        b=AnhFUNC0dgeWvTVwNm7x7xN+nDaGixeK9ejvXAD4cMF1hs7SCMvfVZytmuQijelnnG
         WqgU8Tg5hlhcveWUKRAW+sQr7bAO+opADWcmj5OFNeWlNXgxO/t+/o54ouk5kK58lAbi
         QWjRpOD/Bp6DP4JMaV4oHRaVmfb54wfgRC3pXcL5iH2mYiD0LMpcpbX8oiq/Myheqrbb
         4D7ANbpF1GAfr+167tb5zwGpeDON57YBP14PCjpM9C7qXcjXmBIQgK+6zyDVUbmxThK0
         Ki1hxG4jQnBX8nhHgZxtVe6G6o1s3ySK1zOHIdgxCOjYDpR0lUlKbxRSQBJXgyBwnGId
         zFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uxqpILaNzxNefByNNJB/JuLaGT2qFvgGKoAHUkC9fOs=;
        b=nVTBgew8EZYJuCz0Lh7Y1KMlgywexWSdsy+BQ1/Z4QEJ25XZ/3njOypstoKpAqK1KR
         H0BUignhabYE6PcAySZSzM1NcS8b0rygzwvgpdA3SDxbAO+chrWbRwtamBBLTmsGkZnW
         QvpalfsnU4/GZoy/Ns2Ul98hffCmXn4Oe0M6ooGaq03TVcmZR1Jhban1F73KR2m0wRbp
         sPJdF0tRd0ll46aP9Mk5tui9jVfwgJC2CfpEzWlZEm1AFBAvaltjyOryLT+8Xb0hxygO
         yjv6vhMl1RVW6s6GEuLjLN4x0nuRDCeV7MqrUu+8CMqauRMMb2UfggWtzqZ5Zm+6UkG4
         0U1w==
X-Gm-Message-State: AOAM530bfYZl5WGaQVpUIHh1KL/24cH77o2zmZHZWYOYxXtiRHMJQGMA
	Z69XH9lp/c1VJm28oase7MXuyuMGPOs=
X-Google-Smtp-Source: ABdhPJxqrcDfOnlTmPNjmVC7Cd++iSQSJ3HGiQeHIqrAL9TzlCydcNTvJdTw/HcXPkTzQGUZEpN+BQ==
X-Received: by 2002:a17:902:bd09:: with SMTP id p9mr7536424pls.214.1591318321104;
        Thu, 04 Jun 2020 17:52:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:392e:a386:560f:8a74? ([2601:646:9200:4e0:392e:a386:560f:8a74])
        by smtp.gmail.com with ESMTPSA id k14sm5017440pgn.94.2020.06.04.17.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 17:52:00 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-65-alex.kanavin@gmail.com>
 <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
 <CANNYZj9fr4o5C3X7DOCs6Oza9RA4QKh1CnGnV=8hdTaBvf7rvA@mail.gmail.com>
 <77be6de7fa4b447eab96bfb9cc2253d5@XBOX03.axis.com>
 <CANNYZj_YOFgBQw44DEkvqT3n0Z=zcqw_izgvPThWfAe39y3skQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <95492586-506e-3a71-6082-fd5d3135336f@gmail.com>
Date: Thu, 4 Jun 2020 17:51:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_YOFgBQw44DEkvqT3n0Z=zcqw_izgvPThWfAe39y3skQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Good catch Peter.

Checksum mismatch for copyright year may sound benign but we really need 
to know the changes even if its just copyright year change these
are recorded and part of license text, so its important in general to
keep this check strict like it is without this patch. So dropping this 
patch is right thing to do.

On 6/2/20 1:27 AM, Alexander Kanavin wrote:
> Right, in that case this commit should indeed be dropped or reverted.
> 
> Alex
> 
> On Tue, 2 Jun 2020 at 09:39, Peter Kjellerstedt 
> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>> wrote:
> 
>     If you have COPY_LIC_DIRSenabled, the license files (the ones listed
>     in LICENSEand the (parts) listed in LIC_FILES_CHKSUM) will be
>     included in the generated image by license_image.bbclass. Extraction
>     of the license information is handled by license.bbclass, which also
>     is responsible for creating ${PN}-lic packages if
>     LICENSE_CREATE_PACKAGEis set.____
> 
>     __ __
> 
>     //Peter____
> 
>     __ __
> 
>     *From:*Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     *Sent:* den 2 juni 2020 09:30
>     *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com
>     <mailto:peter.kjellerstedt@axis.com>>
>     *Cc:* openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     *Subject:* Re: [OE-core] [PATCH 65/70] libyaml: adjust license
>     checksum to omit copyright year lines.____
> 
>     __ __
> 
>     On Tue, 2 Jun 2020 at 00:12, Peter Kjellerstedt
>     <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>>
>     wrote:____
> 
>          > -----Original Message-----
>          > From: openembedded-core@lists.openembedded.org
>         <mailto:openembedded-core@lists.openembedded.org> <openembedded-
>          > core@lists.openembedded.org
>         <mailto:core@lists.openembedded.org>> On Behalf Of Alexander Kanavin
>          > Sent: den 31 maj 2020 17:53
>          > To: openembedded-core@lists.openembedded.org
>         <mailto:openembedded-core@lists.openembedded.org>
>          > Cc: Alexander Kanavin <alex.kanavin@gmail.com
>         <mailto:alex.kanavin@gmail.com>>
>          > Subject: [OE-core] [PATCH 65/70] libyaml: adjust license
>         checksum to omit
>          > copyright year lines.
> 
>         Eh, what? That's definitely not the right thing to do. For a
>         license
>         that says "The above copyright notice and this permission notice
>         shall
>         be included in all copies or substantial portions of the
>         Software.",
>         removing the copyright information makes the file useless as
>         part of,
>         e.g., ${PN}-lic.____
> 
>     __ __
> 
>     As far as I understand, the extracts from LIC_FILES_CHKSUM are not
>     used in copies or substantial portions of the software,____
> 
>     they are used in tmp/deploy/licenses (which is neither). Is it
>     beneficial to have the copyright years and owners____
> 
>     there? The idea behind dropping them is that we can avoid continuous
>     adjusting of the checksum on version updates.____
> 
>     __ __
> 
>     If you archive the source code, or install binaries to the target,
>     this mechanism is not involved.____
> 
>     __ __
> 
>     I am not aware of ${PN}-lic, can you please point where that is
>     defined?____
> 
>     __ __
> 
>     Alex____
> 
> 
> 
> 
