Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D97160939
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 14:39:21 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 127so62815465pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=1ZUfszwjgc9Ve6e9/kd8fVaUZ2RlZFKypAzz0en6NTU=;
	b=mw4a5P9YK0+X85Cj30VWa2KnD2euiDGUldaGTU5e/eJUL+Ku4E0MqZk/64mcU6s7RR
	NEcpFaMvwzeyY3CxngD4EuYqbF/7fmYnsM/L4nQyYEIP0mngGs1v9h4HXdzxYPPo8/8t
	F+Jp9RbpcqWx0wFhWnsg8vmJaRzhv1IwcCI3mDQRMGApalwTsyVJ4mnYlQvcDLDxV2xZ
	vahLyNuaicjt9dlia979aAgun66vzt9qnoeVr9gVq3sVo0h5YlRmHKK0ztE2NMiFnsoF
	zGTGC9Be3GrnTB5UhRvzWZeHQF2g68zalJnG55CWbvFyibB/RBxZL+trMvUxUmvPdoJe
	an3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=1ZUfszwjgc9Ve6e9/kd8fVaUZ2RlZFKypAzz0en6NTU=;
	b=pgynxgxD8VvEDtebiEDUuvRtRUPWfYS5319xSs+I1sXGgaM4kainjbXi/bc64lGSkn
	OPtNosaFjqYi3V2uTKyRRiI19HRSeaP2dyrmW2glSAd8xUWKk/8y8Y06PHvNf96XSZtr
	YgQFcntywJLz43pu1cEuh55hYURSoD5N+eYQi/XMZXjjOnqrq0eFA3B8Gea1g4VGj563
	a6iWaDAvjBojFxDhxroUUflDjd49kWTYaVFzE4FXFTJDAZ6Wiv08uHHCsa/0x1FjoY+s
	OOHFigW2JkF7DJ+JRxOmUov6PhbiYz4odmR+ClkOTf0y4jQf1swyV7KN7GjvelF9sNF9
	b92w==
X-Gm-Message-State: AIkVDXJuoaD/71uXa5Nxby2dnWTlcSVSmSC+Q4ALZxCOR8ZJFV/DngdVlgxhvFaSHPWEQQ==
X-Received: by 10.84.214.150 with SMTP id j22mr13526041pli.81.1484145561596;
	Wed, 11 Jan 2017 06:39:21 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	x8sm14564890pge.15.2017.01.11.06.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 06:39:21 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>,
	Jonathan Rajotte Julien <Jonathan.rajotte-julien@efficios.com>
References: <2b581c5f-7199-7a0b-5288-cae9e8309a73@efficios.com>
	<2bc5740d-4245-a666-d21a-e89940ebe2fc@efficios.com>
	<CAMKF1sqFvv7ndY19PYHrRAxc8fJ9tvuYLJZKtHD2DPXWDK5+UA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3552068a-43bf-639a-3643-523e7fb5b326@gmail.com>
Date: Wed, 11 Jan 2017 06:39:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqFvv7ndY19PYHrRAxc8fJ9tvuYLJZKtHD2DPXWDK5+UA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Babeltrace - Backport fix to fido (as-needed.inc: add babeltrace exception)
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
X-List-Received-Date: Wed, 11 Jan 2017 14:39:21 -0000
Content-Type: multipart/alternative;
	boundary="------------648DFAF90E546253E7754692"

--------------648DFAF90E546253E7754692
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2017 10:39 AM, Khem Raj wrote:
> add the release maintainers to the request too. Armin in this case.
Not in this case,  I covered Dizzy.  Fido is Joshua

https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

> On Fri, Jan 6, 2017 at 1:41 PM, Jonathan Rajotte Julien
> <Jonathan.rajotte-julien@efficios.com> wrote:
>> Hi,
>>
>> Reposting to mailing list since I was not allowed without a subscription.
>>
>> Both Alexander Kanavin (Babeltrace recipe maintainer) and Richard Purdie
>> were CC on the initial message.
>>
>> Original Message
>> --
>>
>> Hi,
>>
>> The following commit [1] is present since Jethro but the issue is also
>> present in Fido.
>>
>> Since the commit apply cleanly, could it be possible to backport it to Fido?
>>
>> Cheers
>>
>> [1]
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3006cb260004a7bd88cfd4ea3e2cbcac600347bc
>>
>> --
>> Jonathan R. Julien
>> Efficios
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------648DFAF90E546253E7754692
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/09/2017 10:39 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1sqFvv7ndY19PYHrRAxc8fJ9tvuYLJZKtHD2DPXWDK5+UA@mail.gmail.com"
      type="cite">
      <pre wrap="">add the release maintainers to the request too. Armin in this case.</pre>
    </blockquote>
    Not in this case,  I covered Dizzy.  Fido is Joshua<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance">https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance</a><br>
    <table class="wikitable" height="29" width="16">
      <tbody>
      </tbody>
    </table>
    <blockquote
cite="mid:CAMKF1sqFvv7ndY19PYHrRAxc8fJ9tvuYLJZKtHD2DPXWDK5+UA@mail.gmail.com"
      type="cite">
      <pre wrap="">On Fri, Jan 6, 2017 at 1:41 PM, Jonathan Rajotte Julien
<a class="moz-txt-link-rfc2396E" href="mailto:Jonathan.rajotte-julien@efficios.com">&lt;Jonathan.rajotte-julien@efficios.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi,

Reposting to mailing list since I was not allowed without a subscription.

Both Alexander Kanavin (Babeltrace recipe maintainer) and Richard Purdie
were CC on the initial message.

Original Message
--

Hi,

The following commit [1] is present since Jethro but the issue is also
present in Fido.

Since the commit apply cleanly, could it be possible to backport it to Fido?

Cheers

[1]
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3006cb260004a7bd88cfd4ea3e2cbcac600347bc">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3006cb260004a7bd88cfd4ea3e2cbcac600347bc</a>

--
Jonathan R. Julien
Efficios

--
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------648DFAF90E546253E7754692--
