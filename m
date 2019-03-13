Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0456960290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 00:47:04 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id k136so161716lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 17:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1/RGcjcqf6So2MD0LUANi2mcgdiRN2xGtOc8cJs4nLc=;
	b=gSue6KII6IwWvdf+WORaaoTSxxT1yNZ3QCHe2REWypDzZjL3jcz35HFnDvs4SAB785
	hDfk8VSxVwpRoO9AE3+R5IvPItHX9mUweTX1+TiSQFGOJ/lwEtNoQaniIJT/Bcbp866r
	GaYeLceC/eWOEffKbfIwJzhREloUyrCoOZUOJVZ97lAEuun+9UD8DTufe5ihSk25dIgX
	y8ymnjD+qBlpeaYXZ2j/alzSzkEZB4ZN8JpRiOdiY0uVzHB+gjxDFFa/UOpnmIVzFJp9
	1RYafwN+DQv51xucRMRn6oxOmUe6bGuLhM7x6zzJm6GuJ2+AWxpgpPUZSSYDCZ1wXgGm
	vdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1/RGcjcqf6So2MD0LUANi2mcgdiRN2xGtOc8cJs4nLc=;
	b=n327CxmRMOYGkzC4XNg64kVrzTuluBZpQzgcmY2nNjnwUSHu325Ls0A5DQBVqWS96e
	isZnVVHTCLT22DTKIOBs3p6VLYPxpjulTjIrqM9iTLtwOZmz/S0GKF97gjQPIu0Ug/Gv
	ycawjLCoKoV2TJtD5/ALOhABfT7ydZ8y9vATxHFNZN373pjEU7NKbfJnCFvL2rkdHMqX
	ODmQ5R3qEDWHqaSW1uGZADubCpnV+5cVb9rMjZcX+MH6ilxYzfSvm6r0i3xfjyoGN0lu
	odGbbwTPIkWAKOgH2uAGR5YVHEGrVBd3lpI6AKhy3mtiKvKiV7qy5nuTDyAhEwh4vF7k
	qGQQ==
X-Gm-Message-State: APjAAAWWJhuBZ2KF/WjMqz9jw1xMw5K2G+mz8wWBGIoJ4/CTwSNPV4LH
	8JiLDwGy/1ExJAFm6Yxv6PpjsX1eUoOHRcymTN4=
X-Google-Smtp-Source: APXvYqy7xFPX749iG3yJU+wM3rms1olTJH19yNtx0n4N9PxMGyJ1SrcKpPcX0t16yHWOSJHiWQcfn8XuZ/Del/UN648=
X-Received: by 2002:a19:f51a:: with SMTP id j26mr1177119lfb.5.1552438025322;
	Tue, 12 Mar 2019 17:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190312165150.GB25992@joraj-alpa>
In-Reply-To: <20190312165150.GB25992@joraj-alpa>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Mar 2019 20:46:55 -0400
Message-ID: <CADkTA4OEvrYpyk4A4VHRh+mHrN+dFTZp4oKYw_U6PzPaWdSF-w@mail.gmail.com>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: OpenEmbedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] lttng: add 5.x fixup patches to 2.10.8 release
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
X-List-Received-Date: Wed, 13 Mar 2019 00:47:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 12, 2019 at 12:51 PM Jonathan Rajotte-Julien
<jonathan.rajotte-julien@efficios.com> wrote:
>
> Hi Bruce,
>
> We just release LTTng-modules 2.10.9 that should remove the need for most if not
> all of this patches. Could you try it out?

Thanks for letting me know. I'll take it for a spin and send an update
early next week.

Bruce

>
> Cheers
>
> --
> Jonathan Rajotte-Julien
> EfficiOS



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

