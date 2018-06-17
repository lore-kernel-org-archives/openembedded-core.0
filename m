Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4604874886
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 21:28:06 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id z1-v6so6578825pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 14:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WgtvcJDiuM2kwMq+wbnBNXGr2mZzWOKvjNzeaTBpXYk=;
	b=SGMlgTB2aibn74X8zedn4vGzLG916hOUR1ftznuFXo2AXqNVJ7mGSsbJNvbeB3VPE9
	Yo58ZrbkKdCTL+TF+4+ztR1nAOxbSRVxrfRC9Fps5b0giV/fKi/IQ4UHEf4/mmuFZYnN
	3HXJaNMnBARgluwGM6EaOd3tUopeUwRXrR63EIF4+kNdFGVa1XM7x+zkPKaeBkQDHefy
	8tQEzpJxS8zRdMmM0MATYpwEj4VJ7xLJ0EP1w5XTaixX55tm+RBImlhdlGw+RAG6beJr
	195VmM2KcUvkAraAduCVbiGGYL8ZPwpDp/OKsb+dJT/mxLR7TJf6/2DRrboVuqucIRuQ
	9a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=WgtvcJDiuM2kwMq+wbnBNXGr2mZzWOKvjNzeaTBpXYk=;
	b=FSmhzavh1tuMjJzk/sl6qczVvqL7Vei/TwLK0SpJNmaMwh/0ZLgqkt3k4pBKcECQCq
	3Lvmq+9JCdpVbUeqWfRKIGMHZjsz6KpTiye3yWDQPcxD2nUlJq1OYKeSiuSlwhPv1MKv
	W3WODbBfpoJj9RDZt0tDHVUudYw706siCCM0Tm0Fg6owgVFLt+KG+Q8vFGvGZhJl496B
	D/elnDAn5g2dVgmqYK8c81NpVBXjNAC0CGRgNZwR0t9vOJEXZtRDTbq5P4A+pOsQ+m/K
	Dbqk66gG70QMbae17A+X1pexmWVoeR5gsoUXIHG9sdXveyiJCgI+PjPcxYxaD+vTJIbw
	2nYQ==
X-Gm-Message-State: APt69E1Ympjm9AkFwL6WUMEiqTNjnvH3Z3/+bpPH+rELEXkp2dOpS/3H
	HKb+MuUHv5IQb7VH4qWYrY7AwQ==
X-Google-Smtp-Source: ADUXVKKMZuuJR+crQ10ogZeEpgZgHlYU4cPMt9zV2WXaHA+5ysrDnnBps/as9VLTlt0voG0j0XULQA==
X-Received: by 2002:a62:8b0a:: with SMTP id
	j10-v6mr10814509pfe.28.1529270886979; 
	Sun, 17 Jun 2018 14:28:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:140:af4a:d02e:a5f7?
	([2601:202:4000:1184:140:af4a:d02e:a5f7])
	by smtp.gmail.com with ESMTPSA id
	k69-v6sm18754126pgc.39.2018.06.17.14.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Jun 2018 14:28:06 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1527516680-22733-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Lb9tukB0NEpCG5SOU0g6coh06wLjorHVktJd3tCs99edg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <74bb7fdc-8e9d-dd2d-c150-6d6b6ab79770@gmail.com>
Date: Sun, 17 Jun 2018 14:28:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb9tukB0NEpCG5SOU0g6coh06wLjorHVktJd3tCs99edg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v3][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Sun, 17 Jun 2018 21:28:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 06/15/2018 09:53 AM, Burton, Ross wrote:
> On 28 May 2018 at 15:11, Armin Kuster <akuster808@gmail.com> wrote:
>> [v3]
>> Made formating and spelling changes per Martin
>>
>> [v2]
>> Remove python3 in default PACKACKECONFIG
>> include https://patchwork.openembedded.org/patch/148257/
>> Because of the newly added dependency on meta-python, the python(3)
>> packageconfig is no longer "default-on".
> All of this should be under the scissors so it doesnt go in the commit.=


k.

>
>> Requires python-ply package in core
> Comment says use meta-python.  If the python code here is useful, we
> can add it to core.

its in master now... I think..

>
>> removed:
>> dont-test-on-host.patch, no longer impliemented
> "implemented"
>
k

>>                   --disable-devpoll --enable-epoll --with-gost=3Dno \
>> -                 --with-gssapi=3Dno --with-ecdsa=3Dyes \
>> +                 --with-gssapi=3Dno --with-ecdsa=3Dyes --with-eddsa=3D=
no \
> Should we be adding PACKAGECONFIGs for these?
not "eddsa", it needs support from changes in openssl that don't exit in
any current release ( at the time i was doing this update) so I am
forcing it now.

I will deal with that at some other time.
>
>> +#
>> +# If python3 is enabled you will need to inlcude the meta-python
>> +# layer to include the dependency package python-ply
>> +#
> Conflicts with the commit message.  Pick one.
>
>> +PACKAGECONFIG[python3] =3D "--with-python=3D${PYTHON}, --without-pyth=
on, python3-native python3-ply-native, python3-core"
> Just python3-core sounds unlikely as that's a subset of the standard li=
brary.
I just noticed python3-ply does not exist in the patch I sent you so I
have done a v2 for that python-ply package.


>
> I tried to enable python3 and nothing was built.  Configure found the
> python modules it was looking for, but nothing happened when it went
> into python/.
hmm, trying to sort his out now.

thanks.

- armin
>
> Ross



