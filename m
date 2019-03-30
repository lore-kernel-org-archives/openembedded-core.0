Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC626C13D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 11:26:26 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id l203so3056793oia.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AihrX/KaOWzZ9NIvfkjdaEj95IO6s7shXr8LwYfLuaQ=;
	b=fNmWD9+CBjOsrArNmrFHQwkmZ36P/Ksjhtp21FV2jRnxijXNrID9HyaXJSgOyTNTJ3
	vh5TmQRHp+jGhgVj0VBT3+4Wmk4nnqArKEwFEf2DKjzuExXDZm4FxRd/hl3whn1Yj48a
	J0Fkr/iAbbgYrrYBiASOzVIsAkUhbbHu8XiaZ4/UWLC8+A/kNEvSeeWSTyxrrd0Sp+OZ
	p84pusYNFA0gZYRYSQZBs8tXSf6dj3Wu80z9iBjpLBKUpGomnLr7/VebpnbfqH4sJcG9
	5b3vClWcsXJX60zhmrUhEZ9QqPILdNWEvi9Vy5yLBGCGhkv5lqY3GYjocWvyuaFlB+yo
	ExUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AihrX/KaOWzZ9NIvfkjdaEj95IO6s7shXr8LwYfLuaQ=;
	b=j/a5+Zsb3K+gCoBR86LW/DEuUNUecamrTvuFYcYPQ/MRa0FFDgDiEKU3NLV58exarV
	wUeWOgFoBOolawGfeCXKC/DzT7+W0ea+F8zpGkzXoNMbsQjfYiANffKmiwjMODNv2u0U
	+WH7kVSvgdAd/gD18Mj1g4r8PhsvjrF3SgEICMCrUkFfEz6e/NiWxD/0ob8rNj5hp0fS
	Yga9RnLiwj7+IKU4ewQKDjCuF70GuszK3bHTrjpmHuB+Z8b0Ro6HHxP0LuzjDGZWI1d+
	88llvrjUq8g6l1rbWnWMU941pZ2uBi08UsaKshSQg0KtcqQ52Wf2VbLvvUIYrcnMsg67
	fkUw==
X-Gm-Message-State: APjAAAWw5wSMg7Mn81AHtHvIvGjrSTg2AH+hNCnaF61D8N9zfILrg1kK
	GmafO4PqS+FmOuEP2K42KIjfK1kbQYCrfUeoIhY=
X-Google-Smtp-Source: APXvYqxyutH0YbxQ8nGvBs7B82q5iLF+tbzvsZnxFvfzPzHlSsNMT6wPlhWCzZE2vJ6tc8R+DJZm5w6uWvVP9lAcack=
X-Received: by 2002:aca:ed88:: with SMTP id l130mr6469472oih.70.1553945186921; 
	Sat, 30 Mar 2019 04:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <1553904350-30074-1-git-send-email-denis@denix.org>
In-Reply-To: <1553904350-30074-1-git-send-email-denis@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 30 Mar 2019 12:26:15 +0100
Message-ID: <CANNYZj9QLvJzcyeuAa-p=-+WO8_zfXeMU8GsOrTPUnv0FzY3-g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade 5.0.0 -> 6.0.0
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
X-List-Received-Date: Sat, 30 Mar 2019 11:26:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Mar 2019 at 01:06, Denys Dmytriyenko <denis@denix.org> wrote:
> 6.0.0 is the last one to support autotools (needs explicit configure option),
> newer versions will only support meson.

Thanks, would you be able to prepare the meson conversion patch just
after Warrior is out?

Alex

