Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id C7FA477E8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:49:49 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id i196so1911301ywg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1l0y4imPpekc05lc691NqKIC8n4rdWNkO4+EtQ6pg3E=;
	b=gJATKqJWFL7Z+wvtfdTbm+kVVAYAGLDKys1e7neUL4n4grxPbm+/M5zKZMBhHb8iOo
	EzLQ8Nj/jZAo27yuFBt/tfZ1b25XImSyfmI2Y15kGQo3zJz89Y95BYmWzfMM1VXBoUpa
	JaLHlPAHL1vhisSnCuIpY1cmHB7qFtFhILlazyAJixLLhCKwbPyCUXm/AtW7tBtdPzaE
	dSqLpd9Y3JzweogITMuYr8+WVoPh/bmGyXRILqa/jMw+gk3lzfPrr68NEn8Diu5Hf8Vl
	4LMJRKmUh38rqbWA1lOk4a8yNxfG7VQP1wepS2dQ47qBM+0qukQn7d+NobDTxdJcb4SJ
	+OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1l0y4imPpekc05lc691NqKIC8n4rdWNkO4+EtQ6pg3E=;
	b=Ao6Pcovn3pRSFh0aHDbIpDetbRDM+VgZgJMnJjqM66arkhN2khgIo/9w+Vtv2l44tc
	HmNTymGZJz+l+ZLU7OhAyHbR6AeEUuQWZizLNYUMTMT27YgqU3jkITdmuPBkHnHnL0PW
	lDuQNweAgQU/oSfD0wXuNt1L5RdHGtAMk/YlK6ysgSLXYN+bOI9VrgjCXt1CjZ4uWbeB
	63I+n9JXMj+nO080XYvJMKusy1uF4S7im9zgjnr2rnYz/hoEYGxXNFLYjo61tqGhPAgr
	DNyRtrTUIpf/8P+8hpnFJHp/9xQVEBjZEosGA+nriV3LuOOXQFcZdrKdxrsx59qKOkR5
	P8ng==
X-Gm-Message-State: AHPjjUie7mhu2oUFaHlBC8kFMoFwyjaXVINc8ARf2xQkGKxlXe/EVMkf
	IiYbfO4vTqUas0u8Ezk=
X-Received: by 10.129.145.214 with SMTP id i205mr3229139ywg.73.1504622990025; 
	Tue, 05 Sep 2017 07:49:50 -0700 (PDT)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com.
	[209.85.218.43]) by smtp.gmail.com with ESMTPSA id
	d127sm259746ywe.13.2017.09.05.07.49.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 07:49:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f43.google.com with SMTP id h70so26151832oic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:49:48 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6qixSVFGnGhcTjIR5n5EyLnn6ypb5IXzmG6Z+EhAOPxIN9iVyguVz9q8ghDpkhBaMsu4lWZc9Gw/y13y3STVA=
X-Received: by 10.202.81.214 with SMTP id f205mr1448061oib.274.1504622988156; 
	Tue, 05 Sep 2017 07:49:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 5 Sep 2017 07:49:47 -0700 (PDT)
In-Reply-To: <CAGgRHJq8yBn+wxaXOMXmc9jrOSODUFOUL=9RFLCFLm7z_o6V7g@mail.gmail.com>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<20170904210608.23764-7-otavio@ossystems.com.br>
	<CAGgRHJq8yBn+wxaXOMXmc9jrOSODUFOUL=9RFLCFLm7z_o6V7g@mail.gmail.com>
Date: Tue, 5 Sep 2017 11:49:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKphOXXRrp=yE7CWSO2fpU2-Ekf7O7NmtD993UvzgcWT0Q@mail.gmail.com>
Message-ID: <CAP9ODKphOXXRrp=yE7CWSO2fpU2-Ekf7O7NmtD993UvzgcWT0Q@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] go.bbclass: Enable parallel build
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
X-List-Received-Date: Tue, 05 Sep 2017 14:49:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 5, 2017 at 7:50 AM, Matt Madison <matt@madison.systems> wrote:
> On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> The parallel build is based on PARALLEL_MAKE variable but can be
>> overriden setting the GO_PARALLEL_BUILD one.
>>
>> This change is based on the meta-golang[1] layer. Thanks to Matt
>> Madison <matt@madison.systems> for his work on this.
>>
>> 1. https://github.com/madisongh/meta-golang
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>>  meta/classes/go.bbclass | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>> index 45f2add810..f80134bf8e 100644
>> --- a/meta/classes/go.bbclass
>> +++ b/meta/classes/go.bbclass
>> @@ -1,11 +1,31 @@
>>  inherit goarch
>>
>> +def get_go_parallel_make(d):
>> +    pm = (d.getVar('PARALLEL_MAKE') or '').split()
>> +    # look for '-j' and throw other options (e.g. '-l') away
>> +    # because they might have a different meaning in golang
>> +    while pm:
>> +        opt = pm.pop(0)
>> +        if opt == '-j':
>> +            v = pm.pop(0)
>> +        elif opt.startswith('-j'):
>> +            v = opt[2:].strip()
>> +        else:
>> +            continue
>> +
>> +        return '-p %d' % int(v)
>> +
>> +    return ""
>> +
>> +GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
>
> This added variable should be appended to BB_HASHBASE_WHITELIST.

I think should not use new variables. We base it on PARALLEL_MAKE so
the user can control it in local.conf if needed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

