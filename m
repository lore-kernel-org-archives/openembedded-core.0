Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCAoy-0008Lf-35
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 16:22:56 +0200
Received: by lagw12 with SMTP id w12so3842677lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=jAQZ7HesMuUxaBpx+gNvLHF4on+znN87buRdHt/m9PY=;
	b=CbTrAX8njLaSNRC4LsSbAvfXnhc8RWphmZkYB9XzIu/PnvglMwaf4aaClRBCtUa7nl
	rWbQalIrI+MlWcIEG0TEH2Pqz1KnnX8TD4YkJXu/nBtRRR9P5Es+UkGFGIZ3o0QI4vMQ
	qhEjQLMq2nS416Zuvg6rMb9m7mPEAtEd4ThlqjVcB6OaBXPdyzTJfCWzM7M15fecaGaD
	7D75T06AXf9F99BC7gri6qAbUdQFQpYwJD/Jk9vALVdhlRULpUkz1fcmy8vNdtmDvuu7
	zhP9mXVHaX8lWwlt81mugHuvVjlhl2mS7aU+QBVkxMuwJXK0GSSXSDeDw9+IJtDRbtcp
	Koxw==
Received: by 10.112.83.105 with SMTP id p9mr8162581lby.43.1332771236332; Mon,
	26 Mar 2012 07:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Mon, 26 Mar 2012 07:13:25 -0700 (PDT)
In-Reply-To: <1332760875.28414.107.camel@ted>
References: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
	<1332759689.28414.104.camel@ted>
	<1332759991.14363.1027.camel@phil-desktop>
	<1332760875.28414.107.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Mar 2012 07:13:25 -0700
Message-ID: <CAMKF1srb0tARAVLZKKvPoUCNQ5PVsBC-AEa0dLiw-3e7GaAEzA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune/armv7: Add -mthumb to TUNE_CCARGS
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
X-List-Received-Date: Mon, 26 Mar 2012 14:22:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 4:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-03-26 at 12:06 +0100, Phil Blundell wrote:
>> On Mon, 2012-03-26 at 12:01 +0100, Richard Purdie wrote:
>> > Looking at this file, if the above is true and armv7 can't do anything
>> > other than thumb, shouldn't we just delete the non-thumb configuration=
s
>> > for "armv7"?
>>
>> It's not totally obvious to me that having a "lowest common denominator"
>> configuration for ARMv7 is really all that valuable. =C2=A0In fact I wou=
ld be
>> slightly surprised if anybody is targetting ARMv7-M with OE at all.
>> What's the use-case for that?
>
> I have no idea, it appears the file doesn't make a lot of sense...
>

on second thought I think we should delete this tune file since its
somewhat useless.

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


