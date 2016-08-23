Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8312A6E660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:33:31 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id 74so265452960uau.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zrA9M8jI4jhv5nLbey8Z9Fo1On+kXMVpFIHiMg39TXU=;
	b=juh1sEyPFQ68BqfDH64+GVoHS5L5CxWfyNwOfeMXE5GIP6EYrj6Aey/oUYGmEFiROD
	A5+ibfKjvjfcS6GzEXEe5hQZgL4mcg8pcrA/7K6beMMtCNObwtGM39CDrozKYFktXZ9d
	qCzmQv3oHNSt1J0aH16PeFGR8UEQkROaMVfZGGLRFq7f+SE6tbh4eWc3VdyNm5E/myc0
	agNPphi2wh9RvvzFtgiYDBzAldJjmBE2Qvh9nhkJfC/COCu5t33k4PUQB42NgQ7MWVP8
	wYgoJTTvcOcGF4wCgzmYPeZCsTsY9L3Vgyx4rfToSBqw3ZplblMhnY1d/1arULv2QcJg
	mAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zrA9M8jI4jhv5nLbey8Z9Fo1On+kXMVpFIHiMg39TXU=;
	b=Oh2k9UTTM0S4GRK8wHosM6tIZuUdERRrLpL3bwf/N96hWRhU4Tqu+bEzaOUp8lX87E
	JFDseL6BzpuwDiXdDaimNOonqlDpssrstHaVG/9eoj95S8yFDzXAjpmLAvACoIQWhkTR
	sK6eAnhPI5LnwPPc6RF1ADAXBj2NbVjm4KwhHUWxbarUige5/Hl6rudweMc+9yQ18NnC
	cztmjaR/rjZ+AJb58tDyb3+3iGK1Nk9uxfh3qFxHT4w9R53tUvghnH5C0CJBnZBwC1va
	K6J7gJwUizZIrjhY5teLzDqUOP8u+Okkkab1kZ+8/OXxzU4rwUgjHKCfsvE9Gdtc0IRX
	H2WA==
X-Gm-Message-State: AEkooutlUL/4q5uy5Do/RWrkxq+uvInc2JR5E8Lee/ENlNd9LfrWkJ7R+IXE5MzATnonMQPbtsfgLdxLUhsIpg==
X-Received: by 10.31.155.141 with SMTP id d135mr12670841vke.98.1471984411751; 
	Tue, 23 Aug 2016 13:33:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.82.197 with HTTP; Tue, 23 Aug 2016 13:33:31 -0700 (PDT)
In-Reply-To: <CAJTo0LYHdKXnViZqojAFJV2TLXemvui3WovbVONJ38ZEVmDbcw@mail.gmail.com>
References: <CAFkk2KRmMbNhL=V82H-vuYmvRBDMxKOE7c-J=u2=YGHBPmYYSg@mail.gmail.com>
	<CAJTo0LYHdKXnViZqojAFJV2TLXemvui3WovbVONJ38ZEVmDbcw@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 23 Aug 2016 22:33:31 +0200
Message-ID: <CAFkk2KQ3NPQjCW0JnLoPiqQ5BMpqxiD2hAup-C2tMp1MPKp4nA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 20:33:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 23, 2016 at 10:19 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 9 August 2016 at 02:48, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>>
>> The current style might be a leftover from when _class-target did not
>> exist.
>
>
> Can you rebase and resend this please?  It's a great patch but for some
> reason git isn't happy and refuses to apply it.
>
> Ross

Looks like Gmail's web interface wraps long lines even in plain text mode. So
much for getting lazy. Sorry about that.

Sent a new version with git send-email.

Cheers,
Ulf

