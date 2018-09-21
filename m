Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5C73F74616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 07:49:16 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id i12-v6so12178241otl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sMRnCFtY37Z6gP0GRC5Ir4FV4xEI5xy57FTW1FBQwoc=;
	b=FMouolFstGetxF8jdFr2wnIRDUIkwLseP+Eae+Kr54LinY5Hbidu2tSBEdtY8eBJrm
	8pWT4VgtIokjXkiikKWTS49CwQAAdbaBuWh9VgkDgL2zl8UME0133jYjLmeyFIuFaYaP
	PY2rewEsQAlsvgUd7ReNYEYibxJ0qIUD39PchJMw3JR1LDktA6gUcJ0Fj6S+FvlTX/OO
	AetS/r1hV1iWN457ovJb3fBs1gxJDtMSwhs3unJ3Qc2vUrNyVQietBZYuIy0WQoCxQqC
	AxlOGZTdgP32Ul8MXCgrQmin+Ifr0QbDnFIiuMnkTKEvF2ra3gam1g7VV9T/pf8QVOGG
	w8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sMRnCFtY37Z6gP0GRC5Ir4FV4xEI5xy57FTW1FBQwoc=;
	b=ZC9MR5ktOw9NxSOpU0wPH5PIZzqMYXCDR2abT1i6iH0fpIlXBjQa/+x1aO7Q2T6xus
	ARfWSKvbGfscPpSNclebmL8Hxl+dz/5zCiiglPVZncSYrt+a5amh8vfgdii5Rbhzzzsm
	7cAS54hqBXhJEKMdKADcvA39cRWV5IUMTtPJX/BMknN0WUI/Kt5zDJyr1yNU1EPLrZw8
	mIdSatAU9F0b5RceiWqT3yUHbam7hEf5tSM0Z5nL8EaIrjAe9DN7iMtFvXBW6gHh8OvS
	f5tZ0+YkMgJ2CCu3bY+LG0ZpVU13kJjC5PBe3mVYUS9vdImF9vTZPHtqP9jrvFaN6NIJ
	9PBQ==
X-Gm-Message-State: APzg51B56BiTc/6fW6QpOCYnTYDVWGZHvpsOzmtSOHFO+ZIG2ImAp90f
	ARtM+fEwEfD4K3L5kQGmk6idFTPR6GWhUOvGHfFj5Q==
X-Google-Smtp-Source: ANB0VdbweCOdYFfLs2XH+CiVdF+3SysaSfyRcRFfotMkXC41DuhriMRjW0nkoLA0FzIIJly5cqgDa3YvjqPjsI/bIxU=
X-Received: by 2002:a9d:14d:: with SMTP id
	71-v6mr23636022otu.127.1537516157082; 
	Fri, 21 Sep 2018 00:49:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Fri, 21 Sep 2018 00:49:16
	-0700 (PDT)
In-Reply-To: <20180920231020.6321b23a@t460p>
References: <20180920183259.29310.24354@do.openembedded.org>
	<20180920190259.13842.60331@do.openembedded.org>
	<20180920190749.vzhy3vbpfel34vk3@swift.blarg.de>
	<CAJ86T=VyGD1BAUouZ2UTxS8Qa1AMn=QvVbBdbqQS4n8dXkg=Gg@mail.gmail.com>
	<20180920192920.z3kzcxbx3l4wg4pz@swift.blarg.de>
	<20180920231020.6321b23a@t460p>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Sep 2018 09:49:16 +0200
Message-ID: <CANNYZj9cvUHpn98mwXbip0gDKL4xwXkOE4+rKyek4Ad-GHTaXw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IG1ha2UgT3BlblNTTCBvcHRpb25hbCAocmV2Mik=?=
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
X-List-Received-Date: Fri, 21 Sep 2018 07:49:16 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-20 23:10 GMT+02:00 Andreas Oberritter <obi@opendreambox.org>:
>> That's what "git show" does, which I used to generate the patch file.
>> I'll resend without indent, thanks.
>
> Try "git format-patch" instead.

git send-email is even more direct :)

Alex

