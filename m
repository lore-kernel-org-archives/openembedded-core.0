Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6716.1611234140214588079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ooYiy6rv;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id m187so1380389wme.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 05:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=x375UBIEr5fSE90aoUdO6NULqNFFjG9r0Ake+yY7q+g=;
        b=ooYiy6rvD9Ipbwo4txjHgapYzYNAeWctLwKxievuLSl9lmRs9yA+293lFjJ08lfWaX
         wX8RwKQbWVes90+tdHCcP/6ge6usEX3MEl5954ztSMdY8WCD4+yPeRMM6kLI0Ufvxyn0
         vMQaGGtIOBWGrljIWHCCD9lV8iNUQptIftTss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=x375UBIEr5fSE90aoUdO6NULqNFFjG9r0Ake+yY7q+g=;
        b=TLTjyW4zDLGVGi/A/1eXXq79RDpYhFWn7eI6faad7Fua6Qvt7dAJmlxj3aCCsH9V2L
         Nbyf+Dzn5tsIPBbHFMEPPuAgdzFujyDmDTcWQ/V2LBbHnaEZWRigyMrrO2TJ8+NlqbNs
         z8uJLXDTuP5DuQ3dvr90i7nTfJyvQ6rEO+9PfE0qvvKKUXYCzvQViVgGNGQlKsnSEYlS
         ay8bP+Bi/B7R8lxfCBQS8PbhzBlnlcQdGBksAJCwRommaOzkL3qKUIUGFZv5WOaFH1u+
         2QL9vBTG12FF8CxVunXAOxP8BWTOBt7/w0H2IMoxnI5ngGuEegYN9CdlJGzxyt2nEPGb
         rAvw==
X-Gm-Message-State: AOAM530+2MXeenOjdjG3jf/kS3UZmhkkvIT3vAeMLHygmxucoLkpfr4D
	J1zCoxkEFSLTFN0cstvriPIq5w==
X-Google-Smtp-Source: ABdhPJztTfFdbqbk1vJQAvyjOf5rTvbjbzJGTAMEmGd78LqCDSMbx5wKDiYNZQURnmEcd7Bi5E1oyw==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr8835709wmc.103.1611234138574;
        Thu, 21 Jan 2021 05:02:18 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id h13sm8236175wrm.28.2021.01.21.05.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 05:02:17 -0800 (PST)
Subject: Re: [oe] OpenEmbedded Virtual Stand at FOSDEM 2021
To: Paul Barker <pbarker@konsulko.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 openembedded-devel@lists.openembedded.org,
 Yocto-mailing-list <yocto@lists.yoctoproject.org>
References: <CAM9ZRVuEaZLvg4trA-LhNyz8=yMs=cYhRzSR-emzmEGo8BdMhw@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <e12afb9d-9074-05b1-d7f1-60bd36645ae8@konsulko.com>
Date: Thu, 21 Jan 2021 15:02:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVuEaZLvg4trA-LhNyz8=yMs=cYhRzSR-emzmEGo8BdMhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Paul,

On 13.01.21 г. 23:33 ч., Paul Barker wrote:
> * Any participants in the project who want to help host the Matrix
> chat room between 09:00 and 18:00 each day of the event. This will
> likely involve introducing the project to folks dropping in the chat
> who aren't familiar with OpenEmbedded, answering basic questions and
> chatting about example uses of the project. You don't need to be a
> long-standing expert in the project to help out here! If you can do a
> couple of hours or a half day please let us know.
I will be happy to help with this task as a volunteer for a couple of 
hours during FOSDEM 2021.

Best regards,
Leon

-- 
Leon Anavi
Software Engineer
konsulko.com

