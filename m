Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.331.1602710635132090758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 14:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ghqubaKC;
 spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id c13so738663oiy.6
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=doBXwI2BFPMsXYlGRZLi3CP7c81YD90GyA+C4p1gqSo=;
        b=ghqubaKC21Iqzl9w3ftPeI3EJXSlW81QElzbn8/B9qITUJK44KhhtvnEeE5JFZviwQ
         TcE5xJRr38l7rqAPfmb1FGR7JTEi7ALHixSkBmp3HGD/H9mVNtFujoFfSAWBs1cOBrrT
         MGY0JVfeq4EmvmH6VVeuyk81FR+huNTacv0cn6g+zih0Dcq8cJcoYr5A5Ml3VtW+0b0M
         Sm5PQMXgQtTusnhFunA5O2jftrgwRbRxsUCWdTN6fQNflUCowzI+lcTW69oBKCqVlK37
         zli4ZWScBI0/F1s4rlfhcAjrhjL3fC9uqoEJqAC09QrbFgJm4wVzzaZ0cRGR+3agZj4B
         uung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=doBXwI2BFPMsXYlGRZLi3CP7c81YD90GyA+C4p1gqSo=;
        b=W5FKJ8Fz9s2QgvwUHIfGvbxPaHkah76ruaKXKuIm+ejwjSn4EMTcG5q7ihMxAMQVsL
         +jiqlrcf+5xNtlrjJzJ9VB4f2MSN7q7WIk8uPZgO8wPfNz746F5GCAVAGnG0f0GSX6In
         B6iwqms/rCpChpw1EuGl3frLXCjtqRhxzGjRHxVOsfCn4hzeKr9/NKtKRFiFdTIIYUiw
         kuJnhFDf/SRngDbiGXWESOQqbm/NHzPOBFLRa8V/qSXge/LIFiufe36ZVfkN///bvGvQ
         0axH9zF0VkkLimEr4gU8aboIXrS8eSyG9R9/BBtCuLKZZFlW/sdaO7HWU/mLTyIZROGL
         Se7A==
X-Gm-Message-State: AOAM533PaQdQGkgPau/DMrTIVOc1JC1IHOmCPc3Tic46ZAhCh9cBfSN0
	6oat1vHj7FhELHCgrHnnmCn4iPNgTgs=
X-Google-Smtp-Source: ABdhPJwYSqsMH3lFKyoB40wruNxwT/4+I+AS6pDoRjb+o+pYVhqXXKsp5y3c+upnDPAHtBOsjXsfEg==
X-Received: by 2002:aca:4a16:: with SMTP id x22mr75424oia.61.1602710634143;
        Wed, 14 Oct 2020 14:23:54 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id v21sm220264oto.65.2020.10.14.14.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 14:23:53 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20201014112620.2244199-1-ross.burton@arm.com>
 <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
 <CAMKF1soMBC6dk0DvaG=HjUD+Y0h4uh5LMkiNOJptxRibt_e=jQ@mail.gmail.com>
Message-ID: <02ab658d-eef9-de6c-b826-a2a2a77c8b2d@gmail.com>
Date: Wed, 14 Oct 2020 16:23:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soMBC6dk0DvaG=HjUD+Y0h4uh5LMkiNOJptxRibt_e=jQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10/14/20 4:01 PM, Khem Raj wrote:
> On Wed, Oct 14, 2020 at 5:41 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>>
>>
>> On Wed, Oct 14, 2020, 6:26 AM Ross Burton <ross@burtonini.com> wrote:
>>> We don't assume Python 2 is on the host and don't expose an unversioned
>>> python in HOSTTOOLS, but waf uses the unversion python binary.
>>>
>>> Typically this is solved by patching waf (see the glmark2 recipe) but
>>> this can be solved centrally by invoking python3 directly.  All wscripts
>>> that needed Python 2 would have been fixed by now.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>> ---
>>>   meta/classes/waf.bbclass | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>>> index 309f625a40..df6d4d53e8 100644
>>> --- a/meta/classes/waf.bbclass
>>> +++ b/meta/classes/waf.bbclass
>>> @@ -42,7 +42,7 @@ python waf_preconfigure() {
>>>       subsrcdir = d.getVar('S')
>>>       wafbin = os.path.join(subsrcdir, 'waf')
>>>       try:
>>> -        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
>>> +        result = subprocess.check_output(['python3', wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
>>
>> This will break our internal usage... We still use waf 1 which runs under python 2 only :(, although we are working on transitioning
> this is for master and we have already said goodbye to python2 in
> oe-core. perhaps reverse patching waf in your app might be an option ?

a.k.a. upgrading to waf 2 :)

Can we deal with it by importing either `pythonnative` or 
`python3native` in the recipes along with waf.bbclass, e.g.

     inherit waf pythonnative # waf 1

or

     inherit waf python3native # waf 2

Then you get the interpreter than matches the waf in your repo.

I do appreciate that oe-core has dumped python 2 support (and we should 
have *ages* ago also)... but I also don't really want a fire drill when 
most of our applications no longer build on 3.2, especially we can just 
inherit python3native as shown.

>
>>>           version = result.decode('utf-8').split()[1]
>>>           if StrictVersion(version) >= StrictVersion("1.8.7"):
>>>               d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir} --libdir=${libdir}")
>>> @@ -55,16 +55,16 @@ python waf_preconfigure() {
>>>   do_configure[prefuncs] += "waf_preconfigure"
>>>
>>>   waf_do_configure() {
>>> -       (cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>>> +       (cd ${S} && python3 ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>>>   }
>>>
>>>   do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>>>   waf_do_compile()  {
>>> -       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
>>> +       (cd ${S} && python3 ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
>>>   }
>>>
>>>   waf_do_install() {
>>> -       (cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
>>> +       (cd ${S} && python3 ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
>>>   }
>>>
>>>   EXPORT_FUNCTIONS do_configure do_compile do_install
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>> 
>>
