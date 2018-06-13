Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id A2D787894F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 14:51:05 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 31-v6so1686482plc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wwoe+RIODtt15lSkEJZsietiM1yzlW8LVKaTclZkM0c=;
	b=RNRQIN6huWrduSSR5sX4Xf1OiVsegbc2gW9GzQPkQPe9fN6DvlKHll0Ng4LgFAvoSZ
	7StAokHf9OqljHjoZtdNsf4oWIqXye7bnmD1VHFefgH3pRGDSNzMpuPCSj3vmk3j4yCO
	N2jUXFfhIlgWKnLjoNhlsgcblLal6FQrxIL6cimNct6zKLflqhqFJl/y6l00NIqNRDbm
	nllPdqPBddoepQgRjpK8tg0lOFjfnPoHFkSyOpCQxYAF4KNpyd12/wSbVEjzUBtcIP3n
	ICpSTHnlCxqqOetK7mSVJfRZa6wrEHOPe14kzMY4bGF9g0cgWGuDxVKO9G/RAkObR+4k
	MWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=wwoe+RIODtt15lSkEJZsietiM1yzlW8LVKaTclZkM0c=;
	b=PUF1A0Iex20qFc0BL+ecuI6bwdmMMVRHZV1UAzniM81qMb2LjkqZdsAqp4y+4xuu+M
	PyPuDIxAhKz8ETAbpsLY1u9Vhqe3uJsRj2DXCXWbak+fkCGZbNH4HQerdN+fhCZLSI+N
	+jQyqPXrYK3NiSIIWfX1CnKs5XSes3bZ8GTXUzZGZeyMoUI0g9V5197cRuIAb9YdAuOy
	EUc0JwvkwZXEb8PGsrcB91FMY5L9FdUHe+wGu7UJHBV3SRrhce7jgjLWuB0b2An+z+WT
	I2DwCklwFCS8k72kdMZgYaWMCUi+q51DAvxKurz914dy2Bhqao5K+6JJhIs7LN2HHYu7
	/Kvg==
X-Gm-Message-State: APt69E1ltP0T+AL+vmxwiO0nUyAbc7FeYQqd12efpvr+VrA4+98+MJli
	9V7jF/we6bwQ+dY+S4gu/PgwzQ==
X-Google-Smtp-Source: ADUXVKJCo8bcCvP87yn3ixky3WiyvrMmlA6J3ppGmjmuJzRlxFY8TtXuYuE+8j8N8kS7aGWCyhTODQ==
X-Received: by 2002:a17:902:ac1:: with SMTP id
	59-v6mr5412418plp.36.1528901466460; 
	Wed, 13 Jun 2018 07:51:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d10c:bb08:f0ab:ea67?
	([2601:202:4000:1184:d10c:bb08:f0ab:ea67])
	by smtp.gmail.com with ESMTPSA id
	x72-v6sm6579797pff.176.2018.06.13.07.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 07:51:06 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-6-git-send-email-akuster@mvista.com>
	<CAJTo0LbV4mAKK1drQ-LcgsrL8JC_MmYrqhYmM1QPGhJRSx+cPw@mail.gmail.com>
	<62741663-6b5c-c4d3-6376-2e5ffe8e197c@gmail.com>
	<108ea3e8-8aef-7bec-ca9c-cda47772a1fe@gmail.com>
	<CAJTo0LaPJpw3ggxcS+Ev18bTVg7ZGxHKJxNE2PLT-vxgPLeOsQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7cea654b-021a-00c8-4231-ccbc39350d0e@gmail.com>
Date: Wed, 13 Jun 2018 07:51:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaPJpw3ggxcS+Ev18bTVg7ZGxHKJxNE2PLT-vxgPLeOsQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] xserver-xorg: upgrade 1.19.6 -> 1.20.0
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
X-List-Received-Date: Wed, 13 Jun 2018 14:51:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 06/13/2018 03:17 AM, Burton, Ross wrote:
> On 1 June 2018 at 16:15, akuster808 <akuster808@gmail.com> wrote:
>>>> - xf86-video-intel (was DRI1 removed or disabled in 1.20?)
>> DRI 1 is still there.
>>
>>>> - xf86-input-mouse
>> sent fixed for xf86-inout-mount
>>
>>>> - xf86-video-omapfb
>>> hmm, will double check
> Tried it again last night:
>
> omapfb: http://errors.yoctoproject.org/Errors/Details/179606/
> intel: http://errors.yoctoproject.org/Errors/Details/179607/

thanks.

please pull the update. fixing those two very old packages may take a whi=
le.

- armin
>
> Ross



