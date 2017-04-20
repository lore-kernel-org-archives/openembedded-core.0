Return-Path: <koenraad.verheyden@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDAB60049
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 20:14:02 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id x184so66672136oia.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oQi8lL5MVGX5dyhVSe+xTUX6cihERpJUmw2maTD4oRg=;
	b=per1Wu9yXNVfr/gRiFNhaqBeruGgo1cIVFFdCbgy6ivU1RVuABAB8IqsHwZiy8FywE
	ti/UrlRSMu2o9RPRKEaz8SZ3kPEO1BtQm2AErPzPiLJDn561qqGuR1x/dwigZE/woD3F
	QR4THst3YH17xw+t+PDugODB+8uRNOU8mNb9wp+c/DyHCHh7W0YrSJ+XnYCM1Bc/GdLe
	13FZJ6qcEi7jpt/MIR507+RR3C/eSXN2yvcxCix8Kh+sQ3fMRqI2J7bfVKEOH88vz5gp
	sFF0CI6Wumw3rXnVsw3/eFAUD7x6yy0U6V9+KOy00/000GTNrV9GjAr5wsrOEokJRap7
	ZSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oQi8lL5MVGX5dyhVSe+xTUX6cihERpJUmw2maTD4oRg=;
	b=GdKzLMSxirqcQkl9CxjdjbnYB67E2MuZhLypOv+wQxIaKvb7SztCMZm/A+/PQxaAAX
	OmWh9fY6kLa/JtttyJNcli0ldiy6xgXkrcECYwd9OPk4y8/9vnq4NZTTFPAwFN7VIFZK
	1Wa0aKOsIeCVu0UbqdXouDmXQ1dEl/MciGI6Nt4l4SLhXYoFFf/hCjPyl0gTXieZGfcn
	U8WqCsgcSTgDuTOXdlINkplOWQHNa2HzzJ8oWJtQsXRioHAOsb6DvNdwCvJWtUyAct9z
	FITNoWnLldN+CjQm5g8efaT9XI2ITa34ucKUonFoCX3zNgpZCml4wMFe4+JooQGW9O/B
	XN/A==
X-Gm-Message-State: AN3rC/5r/8u4VbsGCUCQL9EzcnnmJhT9o0n83MZdyM8n9sA0Y02VVIY4
	viSkJtzZSaWiBPgHEWvB5nbvMi42gw==
X-Received: by 10.202.60.11 with SMTP id j11mr5081053oia.161.1492719244014;
	Thu, 20 Apr 2017 13:14:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.25.232 with HTTP; Thu, 20 Apr 2017 13:14:03 -0700 (PDT)
In-Reply-To: <1492694665.22019.2.camel@iki.fi>
References: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
	<1492694665.22019.2.camel@iki.fi>
From: Koenraad Verheyden <koenraad.verheyden@gmail.com>
Date: Thu, 20 Apr 2017 22:14:03 +0200
Message-ID: <CA+rFJSHDqvsg23XXSQfk0XUpj+0bmcULM_EjddD0NwS9ZZC37Q@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PulseAudio with WebRTC echo cancellation (aec): support for webrtc-audio-processing package
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
X-List-Received-Date: Thu, 20 Apr 2017 20:14:05 -0000
Content-Type: text/plain; charset=UTF-8

I am not familiar with the organization of the various recipes. I
mentioned oe-core since the original message was posted there.
Meta-oe seems more suitable indeed.

How much work would it be to make a recipe for this?
I need it for a short-term project and am not in a position to further
support it afterwards.

If this is unfeasible I'll look into alternative libraries.

All the best,
Koenraad

On 20 April 2017 at 15:24, Tanu Kaskinen <tanuk@iki.fi> wrote:
> On Thu, 2017-04-20 at 14:25 +0200, Koenraad Verheyden wrote:
>> Hey all,
>>
>> I want to use PulseAudio with WebRTC echo cancellation. Enabling this
>> depends on the webrtc-audio-processing library [1].
>> In an earlier message to this list [2] it was decided to add the
>> configuration option to the pulseaudio recipe, although the
>> webrtc-audio-processing package isn't implemented yet in OE-core
>>
>> Is there any progress on this?
>
> I don't think anyone has been working on it.
>
> You mentioned adding webrtc-audio-processing to oe-core, but to me
> meta-oe would seem like a more natural place for the recipe, because
> it's not a hard dependency of anything in oe-core.
>
> --
> Tanu
>
> https://www.patreon.com/tanuk

