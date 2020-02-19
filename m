Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 099DC6078B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:55:10 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 12so1891917pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=/4lrmwYxRq8K1Pz76JjRrHwHrCSzqHTe70Sm3I3KWng=;
	b=C6RoX7XdGUA26c1akeQtRfTLhQKPGumg21xe5fykyeX+QI2UGjNssZWWMY6fA6sErG
	rIj/pYp8tR56rEehVjEmLFygrI7f7AYMD3NuFj47blo9AC9gx1u5KC08oD/N6eeKIMea
	OdRyDe2sWmwhFj48Y6auMBdsYlIMfzlOe9bmj0RcrZk6IN5+w0LLOy0sN26kOVftwpJi
	FCYkd+ItZZgdS/GLnTWlCZhzamXqbP9HLbBa35UXxGHU5IN1J/2rTi2eq8JwLcZgfVz0
	w0ZQEIRxqxCqGR4Za1CUJJ2m1cabqSoHGyKhM/03Nw5tEb03FNoMNtZfMDSu+dxHNrbi
	Y3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/4lrmwYxRq8K1Pz76JjRrHwHrCSzqHTe70Sm3I3KWng=;
	b=KecWOTGDyTb5YEaYb4UQUraKYorLWt8fqvb7GTLUaydUgNaS6XRN85gOTZf62vZ7gi
	BfBDmGAS8hmpdpfZNMNCFt5DrckJOIPgOznJ39J5OyUdvYxZhedC6I0Wti5oYyzZq9RM
	10h3ZruUB+gzP0SSGR+pezROA0a5Lwm7rQzmszUnKqK7eUSeB6yN1vDGfhQn4Q2ogY4j
	yLxH/jfB2BWFi5WZfFwKaTmw2Cux5BveZMdUgTpzCdWIWDIWYP9xWBboVDP8XMBErMLI
	A3Z0Mn3l/KgC4JMdy4n3gxIsry4j7BNq9QIsizKM2CnQufjo+cy/MODEwU3xpf6Kbh4f
	9eiQ==
X-Gm-Message-State: APjAAAXg/NkyWNnhpNHjnBk0cRMWoSXRHdMqwolQAQhHnTXszYkNg7R7
	3gLbR+dn3oYowPh6iDL4SjiMnelEoAg=
X-Google-Smtp-Source: APXvYqx1QfT8LDfyr4CBLsG1Csye8fEu2XOKWAudNw60v9g4iiNVrK3Ge+NCKQT8UX3ZCuZ56+W0Ug==
X-Received: by 2002:a17:902:d711:: with SMTP id
	w17mr24442986ply.303.1582080911464; 
	Tue, 18 Feb 2020 18:55:11 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:cca7:f312:1961:a4b9?
	([2601:646:9200:4e0:cca7:f312:1961:a4b9])
	by smtp.gmail.com with ESMTPSA id l1sm292906pjb.28.2020.02.18.18.55.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 18:55:11 -0800 (PST)
To: "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20200219023641.3308-1-anuj.mittal@intel.com>
	<CAMKF1srt7WNXNxqXEAWoFM=Xqx5H4WVKHtdWNXwP8PHNpmcKdg@mail.gmail.com>
	<bc67d00aa872e879748e6b05fe3a104304194c07.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c03634be-a243-4975-97fc-0211313ab32a@gmail.com>
Date: Tue, 18 Feb 2020 18:55:10 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bc67d00aa872e879748e6b05fe3a104304194c07.camel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Wed, 19 Feb 2020 02:55:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB


On 2/18/20 6:43 PM, Mittal, Anuj wrote:
> On Tue, 2020-02-18 at 18:39 -0800, Khem Raj wrote:
>> On Tue, Feb 18, 2020 at 6:37 PM Anuj Mittal <anuj.mittal@intel.com>
>> wrote:
>>> Use the correct variable so options actually get used and use the
>>> correct qt option name to prevent errors.
>>>
>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ---
>>>   .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb             | 4
>>> ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>> plugins-good_1.16.1.bb b/meta/recipes-
>>> multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
>>> index a6eb9986dd..07a0bf5085 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>>> good_1.16.1.bb
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>>> good_1.16.1.bb
>>> @@ -55,7 +55,7 @@ PACKAGECONFIG[x11]        =
>>> "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>>>   # This is better done in a separate qt5 layer (which then should
>>> add a "qt5" packageconfig
>>>   # in a gstreamer1.0-plugins-good bbappend).
>>>
>>> -EXTRA_OECONF += " \
>>> +EXTRA_OEMESON += " \
>>>       -Daalib=disabled \
>>>       -Ddirectsound=disabled \
>>>       -Ddv=disabled \
>>> @@ -64,7 +64,7 @@ EXTRA_OECONF += " \
>>>       -Doss4=disabled \
>>>       -Dosxaudio=disabled \
>>>       -Dosxvideo=disabled \
>>> -    -Dqt=disabled \
>>> +    -Dqt5=disabled \
>> this perhaps should be a packageconfig so people using meta-qt5 can
>> enable it
> Yes probably but in a separate change I think. This just ensures that
> the right options are used and nothing else is changed.

perhaps no, since it will regress meta-qt5 which already does something 
like this

https://github.com/meta-qt5/meta-qt5/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_%25.bbappend


this being wrong in OE-core was ok for meta-qt5.

>
> Thanks,
>
> Anuj
>
>>>       -Dshout2=disabled \
>>>       -Dtwolame=disabled \
>>>       -Dwaveform=disabled \
>>> --
>>> 2.24.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

