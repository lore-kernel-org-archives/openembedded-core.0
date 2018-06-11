Return-Path: <alex.kanavin@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 354117546F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 18:15:38 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id g7-v6so24957227ioh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 11:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e5eMTu68M6mFBkMlFNox6zCDNTY5G2635sSwe03D34s=;
	b=b21xPYbRHPrEZ5VaYlB5kQ5gCasXDRIqhRTlBvd2syg7vYn4OPJCAEgqUnXZTbjHxJ
	GtuarHTSs9f+T6f1PXQlAARmDCyS1/+Z80N8CncuO30W/VGDuncQu78XdEVAyovLTD3j
	1Jc/lDLk2TzHkhqzU8QS00WSG6wsDhbSILRr1xXpufM0pdvWByBDfp9k0szJnW2Y2tuA
	nQmgGjiyQ09lDya71ty+MFhpSKK4x0OfEg88LFa3B/XkRv44TmcuyF0K/op5iaRco87D
	GZCKYcb6rRUrvzy912P1K3PE2+hkNz8eSw5yXdqOpHls5TLiKJdBqIGyV6J4ffLeEg/A
	Pnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e5eMTu68M6mFBkMlFNox6zCDNTY5G2635sSwe03D34s=;
	b=CVcw7Gmz6zDUF33ymBL+mE344ca8WGah3V/HW2bCM2blmC3Hk6F2UCYLdkdDJZyiDQ
	HxTRQZK/jvZvfXfb/vDFwShcNqD636PoeHpJOQuocg1ZacJMiomoH89Hyuey/M4Vu5nv
	VUZs/5UAh7KNWmU6thJJTujeoXCwwLTCKSM1dJvKDpeP+vtF5955nPS2G/YyBbQDue5Y
	UR7UaAcUNbVCj5jcG0z25R+MafVcyZEHMSvM9hAcX4i0UChg80xVwHEiFi2pIK/h3h4K
	+bRXjo0NFHym8OPNCfB6LVKt8RuYNO+Wd13rlat+pyNqLIBzyK3kmbt0F1Dr7bFF57kU
	OaJQ==
X-Gm-Message-State: APt69E1oMePLZNL///7tC/Z1MEuAPbHgZdXZ5cAj4HOKtnWOXqi+Iw7T
	0y5omVebmE+HdEp8aEQFu2Wh0Py58XdPb3ZPMMQ=
X-Google-Smtp-Source: ADUXVKLLFjSyUpUm4+XIZ96GXhkAKeaWetF1fzCl61DBjtHIqSUSx338tdyVtHRNAiXfVXzOMC0pkjhDnVvxBDLO43A=
X-Received: by 2002:a6b:7006:: with SMTP id l6-v6mr216547ioc.269.1528740939967;
	Mon, 11 Jun 2018 11:15:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:a781:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 11:15:39
	-0700 (PDT)
In-Reply-To: <99402ec2af244deca7b1dd9b6b9f799d@XBOX02.axis.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
	<20180608140403.27855-1-andrej.valek@siemens.com>
	<CANNYZj9ecWrsg61KiAirO5YnkATOtEihRgym0iD5o1c0po5KNA@mail.gmail.com>
	<78456fb6-d8a1-c681-792a-36e78d7fb790@siemens.com>
	<58fa6d36-737b-da77-d1ec-f72d50c75e5d@linux.intel.com>
	<99402ec2af244deca7b1dd9b6b9f799d@XBOX02.axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Jun 2018 21:15:39 +0300
Message-ID: <CANNYZj9TXAUiNmxTacmhg5BO5aKcQZhXg2xGOBr6Eb75rZuq+g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] openssl-1.1: rework packaging
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
X-List-Received-Date: Mon, 11 Jun 2018 18:15:39 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-11 20:54 GMT+03:00 Peter Kjellerstedt <peter.kjellerstedt@axis.com>:

> Any reason the openssl-c_rehash.sh reimplementation of c_rehash
> as a shell script is not used for target with openssl-1.1? It is
> currently used for both native and target for openssl-1.0, and
> native for openssl-1.1. Using it would avoid the dependency on
> perl for target, which at least for us is not an option to have
> (and we do need c_rehash for target).

Basically I do not want to maintain a custom script for the target to
keep it equivalent with an actively developed upstream implementation.
If you raise the perl issue to upstream and convince them to use the
shell version, that'd be best.

Alex

