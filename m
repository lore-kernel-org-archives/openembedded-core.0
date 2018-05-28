Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0C360807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 13:52:15 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id l12-v6so13549474oth.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x7Q1KE+tU91ekDfMxilwxa+dBoUVjsIgfzYARb9tk9o=;
	b=SSYP1V0Tfp8gDOAYQN5EJ+zpIfc3iiOn1bJCbLRWys5DRjfwtwayxa40ZeHnUtvYei
	ZF9aex4XZp7GhapeJ4dKyWR5Zew1hlVLZeS9P/qpJCkWjxeY8iCpR4siDjdDJXXqo8o4
	EY+vD3giJIeUQCoPbuO8OTTVhkn9Gb4dYQ5uj/OWkVeu0e2UEvzZja2Z8n5E/758g2po
	HoIbvcDBz1hHen4H/tTERNi0Zzmoqb0SPMmDcPO9bYq0e5rssta7COEZCbPRPwLsTWoO
	/3JqRkm1twu9WzaIFaANZWcmQ0zpDCQAtjMQE1lhuQYB7QNIBF7kQDAtp5Y69UhFHtje
	S1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x7Q1KE+tU91ekDfMxilwxa+dBoUVjsIgfzYARb9tk9o=;
	b=PzKXmpxuCYX9K+0KkeBZR4dgyEhhiWL0YbFbkj3Qu4fWGtxyjo6dpdHuPxcHY48zXY
	j02ay6wEwcznJVLEp1qgI/SpTkiyD9+ymbHZZxR+/7icyYweqNDN/E6jfX4F9fvfXYiI
	c/YvjGhkqmoLTvB2ufOmSzzvZssvfSQbEK/OWiUkSJkvYBb7mgam3Wyn2IqxW5QLeHjQ
	KRLEJN3hTqLYtAI4qXBvbPj4yWCDTu3tv7QnXulkfMAttkuJvcddDWSLR4oRaOs8QbrG
	R4Vi5JuzcME8revQYMbpiBqGUDVXZ9tQ7NvAsMSLCLxZInoGyVtl0NmEmUW9plX4Sl+a
	ujBg==
X-Gm-Message-State: ALKqPwfzWEm0pSRelKujyMRb6C4QTLJkgfdjyonCrAJ1+Maewb9aEZ5L
	QLJSN0jDRizVB4RH4bizVNikIbyYOhtLCFW4+fjCIw==
X-Google-Smtp-Source: ADUXVKIdiqlH74oCMXAegyJfXuiCbQGhRhPYzFuP2+w/rU8QF/Wu/bPYhAgJpkudXMSoD6cOoe1Q1ecxceGnSuXj4w0=
X-Received: by 2002:a9d:598c:: with SMTP id
	u12-v6mr8182168oth.102.1527515537004; 
	Mon, 28 May 2018 06:52:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Mon, 28 May 2018 06:52:16
	-0700 (PDT)
In-Reply-To: <CANNYZj9-6cXUBtrrrVTUgj=qYsJTQ6JGTZdYydXJBRX+gUQQCg@mail.gmail.com>
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
	<CANNYZj9-6cXUBtrrrVTUgj=qYsJTQ6JGTZdYydXJBRX+gUQQCg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 May 2018 16:52:16 +0300
Message-ID: <CANNYZj-6rir5zZ336Oz80jXL_w-7veu1o3LwDU78_-7EpqgSwg@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 May 2018 13:52:16 -0000
Content-Type: text/plain; charset="UTF-8"

(don't forget devtool also has 'edit/find/update-recipe' commands).

Alex

2018-05-28 16:50 GMT+03:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> 2018-05-28 16:38 GMT+03:00 Mark Asselstine <mark.asselstine@windriver.com>:
>> This is a new class which can be used (for example via USER_CLASSES in
>> local.conf) to make your build more development friendly. When
>> included this class will create symlinks to the various bb and
>> bbappend files in WORKDIR.
>
> I do think this is a great idea, I only want to ask, how well this
> integrates with devtool workflows?
> Particularly, 'devtool add/modify/upgrade' do their own recipe copying
> and manipulation, so we should make sure this does not increase the
> confusion.
>
> Alex

