Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QF9kI-0006K8-Fd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 20:45:55 +0200
Received: by eye27 with SMTP id 27so621456eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ehBDI1u4KxhClkVf4PAps7yqsZHMbCT5QZQFXy0r86A=;
	b=pHXkfPRFp5qXcFS+zWRcpGk+cVpJXvKM9mzYAPE0JS+HxgwKTVLiTiKOsl3BlM0Kfx
	oBHTTmzJ1HSF0GXDyH/lrmGRZoxfra4T0E4oGZiNo0r9przQwHFYDTFbQDw4UH//AizG
	AO/GsXXBu5ouBHSekd+qJ/KReltUholQM8iUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AKQhVEzgjOyor0EAje5Is4bdRtp8Ea83xaFIdeIbQesnA9p/P+wPiWFXWfPEzIEVc9
	kt8lmHlfzGaCJjvHfY2BcZ7LnfNEYet6lwwPGJIT8Yn6crgHIZIz7qYUH+LFd6rrQrTu
	X5073nKDbL4hZMPsis5ZIKfX/N/cdHmcrFjWQ=
Received: by 10.14.125.4 with SMTP id y4mr1123810eeh.109.1303929802861; Wed,
	27 Apr 2011 11:43:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 27 Apr 2011 11:42:52 -0700 (PDT)
In-Reply-To: <4DB85F2D.3010505@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<451b67c736a7b67baf6b0bda5fee38b44b4a24cd.1303889119.git.sgw@linux.intel.com>
	<20110427101712.bd2c2d0f.ospite@studenti.unina.it>
	<4DB85F2D.3010505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2011 11:42:52 -0700
Message-ID: <BANLkTinsityEJyx2-CH9d=gtkydW8OGXYg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: Re: [PATCH 03/52] gcc: Add recipes for 4.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 18:45:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2011 at 11:23 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/27/2011 01:17 AM, Antonio Ospite wrote:
>>
>> On Wed, 27 Apr 2011 =C2=A00:29:21 -0700
>> Saul Wold<sgw@linux.intel.com> =C2=A0wrote:
>>
>>> From: Khem Raj<raj.khem@gmail.com>
>>>
>>> Hi
>>>
>>> This is initial set of patches for testing them out
>>> The patches need documentation is pending
>>> Some patches especially uclibc related are not
>>> needed they must be dropped.
>>>
>>> This is not the final version yet. But I would like
>>> folks to help trying them out and report issues
>>>
>>
>> If these changes turned to be the final ones then the commit message
>> should be updated, shouldn't it?
>>
> Not final yet, I am pushing it now so people can set their local GCCVERSI=
ON
> and SDKGCCVERSION to test if they would like.
>

There are some patches which seem redundant. So there will be updates
but for major testing this should do.

> Sau!
>
>>> I have tried to boot uclibc/arm on it but qemu
>>> died on me. so please boot the images you build
>>> and I would be interested to know the results.
>>>
>>> -Khem
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>
>> [...]
>>
>


