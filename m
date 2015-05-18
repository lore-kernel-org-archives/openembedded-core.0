Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B0A2A6AB99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 08:00:22 +0000 (UTC)
Received: by pdea3 with SMTP id a3so137834301pde.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fgLmurrAEGByxU6ZxAgRMaZ9FYVpATyP8tmQKERhQ88=;
	b=tmrLHNbwqPBcA+4j/1EDzKByAqADspeavqPBEK2ZmXFYXvbZYtvvmykjd24Nxvj/E8
	n0HOGOFRmE9fry85fZ5/LdJUy0uLQiiZ9LWS1sASE7PbG6YHeeKBWU9bekD7JtSy36tD
	PvE/LJARl3n8pwzJle5ag7HfFLg1HNFgpBlhe1vN0N7hFiTCp90LsOUL+8uO4q54yF/C
	PnTJIeHYeXVcMab7w9fuFN1FO/jTyewIXt5Z7t8oidqqeKBbKPx/gU10BeL7WBOcltkr
	9TCOA/1KiMMkKnea4VZyE3YRH8vFrSjEmqWDX2hpmw7STilZ1sNnysKUiMKrSmY0diLN
	jxhA==
MIME-Version: 1.0
X-Received: by 10.68.205.67 with SMTP id le3mr42475315pbc.94.1431936024430;
	Mon, 18 May 2015 01:00:24 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Mon, 18 May 2015 01:00:24 -0700 (PDT)
In-Reply-To: <08f401d08df0$aba9be00$02fd3a00$@lge.com>
References: <20150312143521.GD2338@jama> <5501D4CA.2090209@r-finger.com>
	<08f401d08df0$aba9be00$02fd3a00$@lge.com>
Date: Mon, 18 May 2015 10:00:24 +0200
Message-ID: <CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Mon, 18 May 2015 08:00:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 14, 2015 at 4:50 AM, Changhyeok Bae <changhyeok.bae@lge.com> wrote:
> Hi Tomas,
>
> I'm Changhyeok and working with Martin Jansa.
> Actually I'm using meta-gir layer. So can I take over meta-gir layer?
>
> Thanks
> Changhyeok
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Tomas
> Frydrych
> Sent: Friday, March 13, 2015 3:03 AM
> To: OE-core
> Subject: Re: [OE-core] meta-gir issues and maintenance
>
> Martin,
>
> On 12/03/15 14:35, Martin Jansa wrote:
>> I was trying to use meta-gir in Dizzy release and found out that last
>> commit in this layer is 16 months ago and many .bbappends no longer
>> match with their recipes.
>>
>> Was this layer superseded by something else or you just didn't have
>> time to update it for newer Yocto releases?
>
> Unfortunately, life has been getting in the way of working on this layer (as
> well as meta-guacamayo), and it is not going to change in the foreseeable
> future. :-( It's a pity, as the gir stuff is useful/necessary for things
> like python bindings to gobject and related.
> If someone wanted to take over, it would make sense to move the repo
> somewhere more central (yocto, oe) as well.
>
> Tomas
>
I would appreciate to have the gintrospection more central - this
would give us a chance to get the gtk stuff out of stone age..

Andreas

