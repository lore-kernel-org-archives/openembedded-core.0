Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 87F5F74A9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:13:56 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id r66-v6so12413129qkr.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 12:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=noqm6RtT1X8l0rCv0BlLqQng3smW3jbb98SDlTTxAGI=;
	b=pTDLzJV/Rmj0/8frbJ228fV1uZMuYI390Y7UhyhuaSERe3e669L9VkOLDMTIhQp+vz
	Bc4nWlcz+7U2RVsRmhd8UHl0fUka5Iz+Gy+yKpCNRbvVlidVOntZch9NS3nQ0XTozR6+
	/byS0iIAkHLjkW6/GbI44JF0LIv+dbKJTKvzdqMCY+DIAxWGflIYERtjJzIru+rLQ2qJ
	SeZv9v5ex1AIsVeFpNnhGEYsnao7JSOrcwqrf0kju2RdhfxoKkbdprYaziThUjTy84GZ
	3BeW8gMAZH8xblD4arQREa2gL1r4Sj3XRB62KO4O+lKSkHJO7uFrr+pEde68PhHOazlS
	qk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=noqm6RtT1X8l0rCv0BlLqQng3smW3jbb98SDlTTxAGI=;
	b=qagXs6SbwddVeLZ9bwnspNeEegNCYx+NrPvd3CYsBrG9jHdfbGH/M2R7tFhTnwW/xO
	OrCewykhYl4jEvBbKbptvRtPZvl9iCSJITIYTSX1gDtrEPMnjmqfTK0aSoajlWInxLW7
	9uboGbGPLVBIMXuHhNZyL5RCpr5y/g4c6kL1feHyxSAp1cQLzw+B+tz9pl/K4b33tW68
	H3D3xxYiqux40OKQBxTNwwJZ7wA5kpxLdvwbEMaxqfT1Rb9kRPwvhXFm0HcmDVS3E8Zb
	IXbWpc75rkZWhNxc61BLnZ3QbtezO+mESBX5hjFt/DeYoP+gb9LWcCa/S9bIbJWPOc+T
	XEGA==
X-Gm-Message-State: ALKqPweGFgb0T0Cp7Bi50lAJCzHg5IxUULDrRWYdahgI8R9XNDJa1ffD
	5T4zbM5lEeZzacOQSF/rddop8LbSdZ5YjqI88Kk=
X-Google-Smtp-Source: ADUXVKKjZbsXM44sMhjIktimZAURFJ41W9BciszCpxMD9IU/iDBx76I3WRbdTRCHawSX1RgQ+R7SzjneQwPV7T+OkoQ=
X-Received: by 2002:a37:fe9:: with SMTP id
	102-v6mr15450874qkp.406.1527621236719; 
	Tue, 29 May 2018 12:13:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 12:13:26
	-0700 (PDT)
In-Reply-To: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
References: <CAJ86T=VefDA6DSEEj06x5SbBvwDKW2mBfxfivPtFcM0kWPn0dA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 12:13:26 -0700
Message-ID: <CAMKF1sqSR7chwbVcTVVSqO9Fhg_N=fCqtFK20v=LM1cRe2mO2g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
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
X-List-Received-Date: Tue, 29 May 2018 19:13:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 11:41 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> This change looks wrong (or at least incomplete and lacking a decent
> explanation):

why do you think it is wrong ? I would be happy to make the
explanation more decent
if you have ideas please share.

>
>   http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=fbec01f01fdad23d95271db063ee0a4d0ab44568
>
> It was never posted to the list but seems to have made it as far as master-next.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

