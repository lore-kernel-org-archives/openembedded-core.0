Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDBC6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:26:44 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id 3so83356071uaz.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V6unozIVgfj0Phu/4l+7Aw9wPb7h32i+8db/DhL54K8=;
	b=Eya401QafezrAQUFrSI0KvhWIT/JIcX9v/MywauLhKojoNE3Nx84Ip8sk+swjrFLbx
	MHelBcsbImCDcBNLrRVsfWJf+SQK3nAbePornWEXbH4yc0p5HD7lgtvK1KKpJaCLY1H9
	xSBTcbhIa7NMDd0x1QdBw7EAwd5PkO0TgvXDi9Sczi/2pmX3DIWejq5qJIzsEr+WOC0m
	wcIinmhO7nDJ4SzXopZ+w1SF/L7nmtf7/yqZu6FoQpbvOtJipdR4kjt9XEr2LLWAEmFe
	DpMjqA8K2EZ+GXS730nhRx1sGlJpUuguwp05RgDbInFeP7Uf9fGXKw3+DxEhxfB7fubP
	4G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V6unozIVgfj0Phu/4l+7Aw9wPb7h32i+8db/DhL54K8=;
	b=hdeIca6YqfFmfOeCkUpZBVyMTxWR7e8I7k8aLCLJoFoZusBZBkovYzYXfHAHjmwCtg
	GtqZucHQKg1rX+RN/yt2CuTGJj7fUq+6HKcHGTdMvHRWHCZ9nHwDFtmdVfZ0zP1+puXU
	p+C4c5QwsNbXldIdTUjSdJS4VEnIdovK+wEm5jSu4lrZs2MgtRTnOAE9+PyR9Er3ynFD
	N9zJEJFFTkOa61MToTBk72oiM6H2Qp/5DC15dZeIl6QazVW1lnY9LjwpXJG/sZ5kNc/i
	9L1IGx6CKTE76MJao4WAsPV6lqsQ4OJJ8KNtTtZJ18vrK8yASCuZQXci44z4LcbNrAH4
	VO0Q==
X-Gm-Message-State: AIkVDXKZwPVnEQE5eyN401eDAf6tNJ3rmeG7jHHOZGdf933CCs9kJ0/4KEse7qRHVlD0gcHAXRRztJUd1SduWQ==
X-Received: by 10.159.35.19 with SMTP id 19mr4582431uae.47.1482146806003; Mon,
	19 Dec 2016 03:26:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Mon, 19 Dec 2016 03:26:45 -0800 (PST)
In-Reply-To: <CAJTo0LawS5UMdCeXmzg=Ff0N+8H7MKGB9wwwn0iQaXwnK0stWw@mail.gmail.com>
References: <CALbNGRThWRoOfZjN1BaQpT2hAGzuRCfHUnfG89gxQcDE=6cgUw@mail.gmail.com>
	<CAJTo0LZbgGV9kd0bw8jGgfg0kLbJn0ANgETon7_gJxG5fWML7g@mail.gmail.com>
	<CALbNGRQ+hDgM+AsRFq3YYidr4S-7yDXbx+abbfA5tpLqKTD9JQ@mail.gmail.com>
	<CAJTo0LawS5UMdCeXmzg=Ff0N+8H7MKGB9wwwn0iQaXwnK0stWw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Dec 2016 12:26:45 +0100
Message-ID: <CALbNGRRVNNBCKsCSf9m+HmeF6DBUSDtb2N8Gr7qzWFVU4=bb9A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: 'From OE-Core rev: <commit-id>' in recent master commits
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
X-List-Received-Date: Mon, 19 Dec 2016 11:26:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 12:25 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 19 December 2016 at 11:22, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> commit c87361fc886432a9db584712bf3e41ecd0541960
>> Author: Ross Burton <ross.burton@intel.com>
>> Date:   Thu Dec 15 17:19:46 2016 +0000
>>
>>     lib/oe/package_manager: bail if createrepo can't be found
>>
>>     If createrepo isn't found then the errors later are mysterious, so
>> explicitly
>>     check and error out early if it isn't there.
>>
>>     (From OE-Core rev: e09636bbb3ea8ec58984197fd9c691bb908efe00)
>>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
> Looks like there was a bit of mess with patches going from Richard's poky
> clone's master-next to my poky clone's mut branch back to oe-core master.=
  I
> believe Richard generally ensures these get stripped out but obviously th=
is
> didn't happen.  Human error, sorry!
>
Shit happens :)

Andreas

