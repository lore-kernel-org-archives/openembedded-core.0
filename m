Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 726DB7826C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 14:50:58 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id r23so17486414ote.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=51HDOjFbp4PTSp6R5hBTxez8HAjk821t6Am9OIx1VE8=;
	b=rdmp6H8JYw+7ttRWfs/Ears1PgaIGDZJTGctMqBRUg9wUSMJaGB18ufP3pXsyGM7tl
	3WiOFXsFkquKtvWw/P2Cm87QXbrjDsCPW3TQqtr9gKWcdFqiY8RQ6h9ZWU0aS66dWR3P
	+EOHsd4exO4fh2PEU1D4BesvAu9oprDdteCc6uSjPjxWym+CHckPAx0/LdB/nGl7FQLZ
	aS6ZP/ydSICQEfwPBKdxd9E6ojhsyZAAkc8+FSxGn1OsCjHh7i5eSewXy2r2csT/6W8+
	3mLiBbkVAyZgOKmUNC7rtfWAM5WyvybeyjMMAelKJiEYHwWUplg7SdtjrkdF5da6JWZ4
	0lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=51HDOjFbp4PTSp6R5hBTxez8HAjk821t6Am9OIx1VE8=;
	b=mPTGeu4MS4gwR8frnCGHNEd1DrbOp/2Hf8tqfTSQmrN6DnkIkytU5XWfzdghJtylSO
	MiIz8of7oJDDZk2+xgCYQSjJ3e5y2FaJ23jrmivBbisejmHTcEtFSye6E2V+SwwhMhJx
	H1TLxKIJk4Bs4pqdyG9k8aO+XCGczTbpQkD4I+9a4EHgtCo+xw2te+SA/ZC2q5+Gcxwb
	Cf4SPgdIFM7B2HR2BmT24IxQSUKQm6bCcP17/8TWRGRv1LJoZ0Jx3g3bMDKGlJuqZQH6
	yK28qXeg8kt4yWCB6ZwUoYOBwiTVjhxU1w8FCYl7jF4kC9b5AXjATiymDB2K2jjyiyHu
	HfWQ==
X-Gm-Message-State: APf1xPArhDUpCAvkvweLv5fLjfM3e5wtaxS10A8HB21jCUerUqwnOHyt
	9pN5X/1Pw8vQeJpwMWuayNmM2EwQ
X-Google-Smtp-Source: AH8x224yYGylmKQKd04JJSlhTGH3t8zWRmRLvVevWT6rLQu07Pnm2LNQ4qGEWKNauy2OzujDu+B0+A==
X-Received: by 10.157.26.44 with SMTP id a41mr1025064ote.108.1518533459504;
	Tue, 13 Feb 2018 06:50:59 -0800 (PST)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	d10sm6247771ote.28.2018.02.13.06.50.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Feb 2018 06:50:58 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id 24so14041647oij.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 06:50:57 -0800 (PST)
X-Received: by 10.202.65.194 with SMTP id o185mr918306oia.166.1518533457278;
	Tue, 13 Feb 2018 06:50:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.13.115 with HTTP; Tue, 13 Feb 2018 06:50:55 -0800 (PST)
In-Reply-To: <68bad37c-fb4f-bfe1-2e51-7f191edca215@linux.intel.com>
References: <CAGix03zhY3ZEhKLUyzU3HDmMD3t2MmOwkM2TffZVUdByk+cA+A@mail.gmail.com>
	<68bad37c-fb4f-bfe1-2e51-7f191edca215@linux.intel.com>
Date: Tue, 13 Feb 2018 12:50:55 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqo9yObWxoNs6bRPps-OsG2Zh9Y5BX2_E3_W1=pMgK2rg@mail.gmail.com>
Message-ID: <CAP9ODKqo9yObWxoNs6bRPps-OsG2Zh9Y5BX2_E3_W1=pMgK2rg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Regarding Patch ID: 132816
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
X-List-Received-Date: Tue, 13 Feb 2018 14:50:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 13, 2018 at 4:58 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 02/12/2018 11:06 PM, Chaitanya Cherukuri wrote:
>>
>> I'm new to this forum and didn't know to where to report an issue. I'm
>> contacting you regarding the patch ID 132816 ( cmake: improve
>> CMAKE_SYSTEM_PROCESSOR assignment in nativesdk).
>>
>> If SDKTARGETSYSROOT is "/sysroots/cortexa9hf-neon-poky-linux-gnueabi" this
>> patch sets the CMAKE_SYSTEM_PROCESSOR as  "cortexa9hf-neon-poky"  instead of
>> "cortexa9hf-neon".
>>
>> This patch works if SDKTARGETSYSROOT is "/sysroots/core2-32-poky-linux".
>
> I guess this one is for Otavio Salvador, the cmake recipe maintainer?

I had acked and test the patch. https://patchwork.openembedded.org/patch/132816/

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

