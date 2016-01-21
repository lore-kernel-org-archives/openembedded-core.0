Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D4F0365CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 15:18:33 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q21so57330930iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=q6A3Kx8Etoc5jpRd2Ykfu40+K2AaG9JKG/akGZtXV+M=;
	b=CBL/fBF9bt9FioR9OUQ1wnQWVhCCX0GcYSiJkqWPNAMNmjAZ0iHsbOH98jYCP9kTlF
	Ls9hs0TGX5FHrXEjhNk+CXw14ZGn0oZig4qY/47LD/arZBgM4SENB1EXSVd0/7DnWm9S
	+AJ3uWsQiH7RWMql80LCGN/rmcSGmNuaGgFy9+iSMUQ8W4qLTrmhT7Cy0k/r8QKZkl1h
	EtRGrVfSApRIkDeSxySU8IdNf5piWaD/CCT+UY4+4BitXrtrMfRvXD/uC6ChVrZDKcRy
	OhWwvf/TTpgXRsMbPZM+KoBHy0r+EhmJ22s88jSv8iagOAi1CSybAtsy6qGWC8cl6L6x
	5vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q6A3Kx8Etoc5jpRd2Ykfu40+K2AaG9JKG/akGZtXV+M=;
	b=Sg6m7Z//ZF8eawuAk5i+1fN17lND9MUFw6UbIP8tLSYyi+ftTc2EmMW51FZn06BHL7
	B1lclxpO+qI65Ow3w8fLlLqnrvSAqNXCkIdThrOJifedvtKof0/drv2xuAH69hTstJZt
	V77a1OYmIJ8PfJjdNbo1fsd8io5/G9loBQzebNUGAEakOsVLoeUbOISHD+V95i/aGxVr
	iCLxlblMtmXPZvrUdbW+m3WVyqqM9ZE9gUsW1CegI8KwVWfjRqI+3YsAq8AHQsaPCoEF
	S1WHtZT9EjUkefUKrSGO+bGA8Bz1Fjl2scCYECPOFP51X149VFmdaBKC2vMYjy4oaehZ
	8x3Q==
X-Gm-Message-State: ALoCoQmyK7leXYGJoJysTRdVnjfpKQ1J42ldLVfwTMVsmhQXCKBCmM2bATqBMJ+gdInXuu6nJC4AmX1GXxkrtC51Ben7sxI4OQ==
X-Received: by 10.107.165.14 with SMTP id o14mr35269165ioe.49.1453389514291;
	Thu, 21 Jan 2016 07:18:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Thu, 21 Jan 2016 07:18:04 -0800 (PST)
In-Reply-To: <56A0F02B.9000600@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
	<5f464411a18a53b395e749b2b3a1fbfaab4ffd74.1453217744.git.alexander.kanavin@linux.intel.com>
	<D70F5507-7ED6-4281-8FC9-4BFE9EAD0B72@gmail.com>
	<56A0F02B.9000600@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jan 2016 07:18:04 -0800
Message-ID: <CAMKF1sqSmreyx2oVcH=nSiX_a-C3NLbPW5wfMOadhtYdUPriBQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] nss: update to 3.21
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
X-List-Received-Date: Thu, 21 Jan 2016 15:18:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 21, 2016 at 6:50 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 01/19/2016 09:05 PM, Khem Raj wrote:
>>>
>>> +    export NSS_DISABLE_GTESTS=1
>>> +
>>
>>
>> this export is appearing twice
>> can it be optimized ?
>
>
> I'm only following the pattern in the nss recipe: it has custom do_compile()
> and do_install() sections which to a large extend duplicate each other.
> Eliminating this duplication was not a goal, I just wanted to update to
> latest upstream.

understood. Its normal practice to improve things when some one it at it.

>
> Alex
>

