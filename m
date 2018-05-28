Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id CD89372002
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 13:50:58 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id t1-v6so13517858ott.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mpw2eEBCbtA8L3M1qAw71/7up/2Z2yAz5VkU8uqc9dg=;
	b=CVxGhUqMVrW3CjmgUFBkth79/gSzvBj+yBO1SFNhnnx52DSJqG5fWkr6iHg0F5Mcl5
	5vuc2+cgYsvnl+IXgvh2QjkyUomPOYgkV7nu6oNpUUfdCs5febiNgoVyCMZA3A1hH1om
	OscZPO2zlqE8lyfMHozH7Jmx6uJ1i09QaTzyWt7hHXHraMxqdiEPevu2IG/JxSN+hu6s
	H3pl1uTsV6NVFY0WXQ96ZLPmpxx2iR2/rsiJZgx4ToMv3WVrW5auy1dbu5VaSWvz81NA
	nTEsLm6Ty8BqHZVhSIV/cuWXGGzveZiG2q0/9lKun9kzZ9kP/BoJ3b9+o5AjAMOKSy1H
	mWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mpw2eEBCbtA8L3M1qAw71/7up/2Z2yAz5VkU8uqc9dg=;
	b=HVcU+sXwDmXCCGsZwScetF4nbUYoYwL7Z7nnZarDM+QoVF4nBNgUyMeOldWPZJaWf6
	ECpAtGPFvIYm9YB/zW5xyQkZr8q2vxVhGPmsuh8BCdMUURscE/srW9GywGC89NfzJ5AF
	KM5427t3L9irXxpFEZu1wo430C3FuHIFZ/MO49CHxh3N5DF2BE/QigcCZDWAe/ymEhVL
	znL1xUPDvCmnDXhqw8bxvwu691bHsJ+BpHtB8nfmafKCqHjP+xDR1Jfp1FhCD+JfROPQ
	C+1p2cuCUBVZ3UHdXw/WE1WqT8t0BS03R2Q1A/R7UsL8kGqA/io076JNsaY9F/zo2dKK
	caHA==
X-Gm-Message-State: ALKqPwdB5W4bTwnIRK2RYRPMpK/t0KsvQSCuinu//SoI2wILpQdwl3Ps
	0A9xoJWQDoirBeFoJYu3VvRMx9u1sE4IMwTiJxE=
X-Google-Smtp-Source: ADUXVKKBhUQDUg5nvMl0WfE4NRPmiXJHCAamaZrnEH1rCAF5oO+R7BYqJDIQjiYqMa4U0EPwTM/JIiaBiQ+neu6/GBE=
X-Received: by 2002:a9d:cd:: with SMTP id 13-v6mr7945817otk.155.1527515459451; 
	Mon, 28 May 2018 06:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Mon, 28 May 2018 06:50:59
	-0700 (PDT)
In-Reply-To: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 May 2018 16:50:59 +0300
Message-ID: <CANNYZj9-6cXUBtrrrVTUgj=qYsJTQ6JGTZdYydXJBRX+gUQQCg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipe_links.bbclass: introduction
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
X-List-Received-Date: Mon, 28 May 2018 13:50:59 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-28 16:38 GMT+03:00 Mark Asselstine <mark.asselstine@windriver.com>:
> This is a new class which can be used (for example via USER_CLASSES in
> local.conf) to make your build more development friendly. When
> included this class will create symlinks to the various bb and
> bbappend files in WORKDIR.

I do think this is a great idea, I only want to ask, how well this
integrates with devtool workflows?
Particularly, 'devtool add/modify/upgrade' do their own recipe copying
and manipulation, so we should make sure this does not increase the
confusion.

Alex

