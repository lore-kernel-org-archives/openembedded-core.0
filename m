Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F84C713F7;
	Thu,  4 Sep 2014 20:03:45 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id z10so989953pdj.34
	for <multiple recipients>; Thu, 04 Sep 2014 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Vj2kMbqQxeF+c2qU+2qdPtlhrLMtBoINDPOdU7iYZUI=;
	b=SU8MBWSuPgGjAq0nUyiGhrjjUgqsFDV0zKrIC3y5ULUdxeIKFLe07VX/WzQxBVi3xS
	yNO9dB/aDnOLSs60h+u+M9yz4MJNsBAURqXQBME0RW5U+Usgh2q/QDtwcxWv3CCLlLLa
	rSzPF6unI3+LaMjCIqbP7VBsiq5NJXDYYdXfUZfyTVF4Vj1hxgEqu14qnjm5du4mziZX
	+lEVBM1dgLDJ0dUEW3OhTKVjMWVudzKPTIYu8AY3KkkrPx8i192X7H8FDMBEXGne9oF9
	/uGpycELMm6TGSN8zS/TJA5XrRFIrtuDEUyeuq2/Os4qZ4U7a29HNHXROeMl1xJES7lD
	lJBw==
X-Received: by 10.70.41.201 with SMTP id h9mr12538770pdl.55.1409861026729;
	Thu, 04 Sep 2014 13:03:46 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:f556:467b:b3ab:8236?
	([2601:c:9380:601:f556:467b:b3ab:8236])
	by mx.google.com with ESMTPSA id v1sm2370868pdp.76.2014.09.04.13.03.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Sep 2014 13:03:45 -0700 (PDT)
Message-ID: <5408C59D.7070706@gmail.com>
Date: Thu, 04 Sep 2014 13:03:41 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>	<54087F3F.2040103@windriver.com>
	<5408882C.6020506@gmail.com>
	<CAJTo0LZYDn2vZt49Sj40W3GJ7RLiTZjVs8OjbrEU-2NBoTdyOQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZYDn2vZt49Sj40W3GJ7RLiTZjVs8OjbrEU-2NBoTdyOQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 20:03:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2014 09:26 AM, Burton, Ross wrote:
> On 4 September 2014 16:41, akuster808 <akuster808@gmail.com> wrote:
>> This is the same reason why I have split a bb into two parts when I submit
>> upgrades. I feel it makes reviewing easier the next time a package gets
>> upgraded. Trying to find the actual changes between a file being deleted and
>> the new one being added might lead to missing something.
>>
>> If there are unintentional consequence by doing this, that is a problem.
>
> This is what git format-patch -M is for: it detects the rename and
> shows a "proper" diff.
>
Ah, that is what -M does. That negates my concern.

thanks for the info.

- Armin
> Ross
>

