Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9F99475D13
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 21:54:27 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so69176694pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 14:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Vt07byLR7wJoMPWACjINjbHW7FnhPH0+6/yKu3esuVM=;
	b=pO3MA5jtNDdnsv4AuWEXOkhOcYjt+IdTNlSsPofJKaxjzg+lNayjjxbNeA9qcOBX5n
	yu+Ao9AyAwjkSqA4j2YK83G1txlTtHIv3eIa0gUVd+oGjbYcrIqokwTPInfv83Sr11J9
	+9aUk9nEaGp2ar8plGVzjJ/Ia/A/9pdDG/PLiyEMhkTQmtvYbgmuaMSUcd8Sil6QHCDm
	6PSFINYl5EMtkVjDwOWk6ROqQnQcogzm/5gB3kWAIhQQHcSxlg9r+Xqyfl4udWr8Wfhm
	sbOCBKd7wJy0uXhDVREBfDJH08drpEpKSymY4NLItd7RdqFviVFZaXtq253asWdXYw2p
	fLIQ==
X-Received: by 10.70.32.66 with SMTP id g2mr81798182pdi.82.1435960468094;
	Fri, 03 Jul 2015 14:54:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d9a8:f0fd:4938:7d9?
	([2601:202:4000:1239:d9a8:f0fd:4938:7d9])
	by mx.google.com with ESMTPSA id
	bf5sm10126747pad.43.2015.07.03.14.54.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 14:54:26 -0700 (PDT)
Message-ID: <5597048E.40401@gmail.com>
Date: Fri, 03 Jul 2015 14:54:22 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1435497302.git.akuster808@gmail.com>	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>	<55956F2C.2040301@gmail.com>
	<20150703070716.GA21416@ad.chargestorm.se>
In-Reply-To: <20150703070716.GA21416@ad.chargestorm.se>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Fri, 03 Jul 2015 21:54:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/03/2015 12:07 AM, Anders Darander wrote:
> * akuster808 <akuster808@gmail.com> [150702 19:05]:
>
>> The current version of nettle 2.7 has one file that is GPL v3.
>> mini-gmp.*
>
>> so the license for 2.7 should be updated IMHO. So wont that put us in the
>> same boat as the upgrade?
>
> Ouch, that's no good!
>
> Ideally, we should look at that file and see for how long it's been part
> of nettle. If it's just for a short time, maybe we could go back to a
> point in time just prior to the inclusion (or license change) of that
> file.

this file has been in nettle for two years. It was introduced with th 
2.7 release.  Parts of that file are pulled from the gmp project.

>
> Has it been like this for far too long, well, then we either have to see
> what impact this has on non-GPLv3 builds...
>

Does "Lesser" GPLv3 count? Looked a the file again and 'Lesser' is near 
the beginning of the paragraph before 'version 3'.

Does this change things for nettle 2.7?

- armin

> One option, depending on the age etc, could be to check if it's possible
> to get that single file re-licensed. Short-term, we have to fix the
> license and backport that fix to all supported versions that are
> affected, even though that might introduce regressions in images around
> the world...
>
> Cheers,
> Anders
>

