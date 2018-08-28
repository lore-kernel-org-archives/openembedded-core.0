Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 15AE571AC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:04:08 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id p84-v6so1800434oic.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=girnaVtoCGaa2bg/kf0o53ZtRwnteUuO9066tOXxYLk=;
	b=Wb5nbTAPM5+htpmXdG0dn8h/Bo4qYr4UC5/B7z3D5Ssdtc+Bt4zXIB/KQTZEih4Ml8
	WPGt3SFMc7UYEaMcvgsLWUYSI9bzIbO61Q1BtU+0x52NinK20WZoYXmMmD8J9QDXFLSW
	+ZuH21WGmTZQVgXqNnraCArX0Fhaq10hy1ZakJ6ABR38KSYMQIb9MT/7x56UrbH5C2ky
	wCAv/a3yStqNXTC3ZwafhpPjwWItTg2lY0Ycli0Ixvo0O4VscTCSrUkNjHRrDUp+Lfr9
	qnlTqK7oUjhUzPiv7qg4O0LfxkCw5EZMAOSJ+Ls/Gi1IAHjGrn2vPstRnyvMM2cebsua
	AOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=girnaVtoCGaa2bg/kf0o53ZtRwnteUuO9066tOXxYLk=;
	b=pvXTa3h+iYuE61Gdcb56G5tl80NZJ66WwJNPTJ+kdq78I7ys+LeprCWEt1/tAr6Aum
	W+JL7DygeTvPR7l+ktSaJJOVmz3CqcCfXssSQ+PJFTuTZLFpyu1NVJiI/o9tRzLTZgyJ
	Xe7HTZakAiJF+maanAQLAnxwuTfQsrzYbbY+dynCrjlaHFxhl90bcF2ONjU5w3oiYf0r
	k92VYyM8qbKXPOWMO1OgC2ln9lzhXBhH+pfYe1xgneGquA3gBivNarZnqZUSXmnbhK0A
	+umeDxHmQukl15BIEt/fQ3/uFistYAgcNbjhTC73vwTe/9yot3gTy/ndLDGk89ycxDIu
	ltwQ==
X-Gm-Message-State: APzg51Bd4TEC6Mlx6OA6s5nzFMEQqY2lYa7JlwGmH4Cs8z3EjZkBQ94D
	QbD4HeJ5ugqzruUdPgpYaSfgxHl60ulN+qE7onU=
X-Google-Smtp-Source: ANB0VdazYoPWrPSeSYSAR8W9NPnz68BXKlVDmvw4eQxZ8mLvznyYl4ZFYaxUXAPSnuNufRYgc/1UPJjdMFkCS+Tx4I0=
X-Received: by 2002:aca:5cd4:: with SMTP id
	q203-v6mr639881oib.217.1535450650021; 
	Tue, 28 Aug 2018 03:04:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 03:04:09
	-0700 (PDT)
In-Reply-To: <20180828094319.19765-3-hongl.fnst@cn.fujitsu.com>
References: <20180828094319.19765-1-hongl.fnst@cn.fujitsu.com>
	<20180828094319.19765-3-hongl.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Aug 2018 12:04:09 +0200
Message-ID: <CANNYZj8b_ikBHRH-_ySpuqXFpr+ck3Dyary6C-H9OHp41dornA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH]ca-certificates:update to 20180409
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
X-List-Received-Date: Tue, 28 Aug 2018 10:04:09 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-28 11:43 GMT+02:00 Hong Liu <hongl.fnst@cn.fujitsu.com>:
> 1.Upgrade ca-certificates from 20170717 to 20180409.

The new version of ca-certificates requires openssl 1.1.

Alex

