Return-Path: <eu@felipetonello.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id CF9816D1BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 18:40:36 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id t60so7170898wes.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 11:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=PG89m6LXBb946GQiBzVie0We920HfDhqHWXexk4P18Q=;
	b=m1TpV9Y19pMgMWhkJo9eN1HsSc0tCGACwsV0on/QQXHCWQHPyfUGfY6X11XjirmgoV
	gDiHpYP5E2RQHareqxuLMLxQj1vYKMZ8cDh95z2ZSIE94qbSWAmTMbS8heJAgy2ZCcuK
	o+2KUYrN+VmUq5vlO7P1kBg4UjodEiz4ytGgkj/9kviBXMWa4iagEG6TEgde6j3+N7cN
	q7yEZqm5YVscKqsoiwzDMctfCAg18AZ1Ab4Ba+/a2MucZ8zvJn0f5IfTFFp6WGfKyrbq
	nd/1fbBQLPqwl4nVskaNk/O4eY5FE6FtZJj16wKxAjLSqg+Eo4afp8Bcj56dgcjw6Bzo
	j18g==
X-Gm-Message-State: ALoCoQk/IwxuXY8M8Zys43J9B/9q3wjVW9gX5W5eOMYZDsXvPrdUa1eRMJ5vcwE38F6syj+0W3Hu
MIME-Version: 1.0
X-Received: by 10.180.79.227 with SMTP id m3mr10472663wix.2.1382985637599;
	Mon, 28 Oct 2013 11:40:37 -0700 (PDT)
Received: by 10.194.240.201 with HTTP; Mon, 28 Oct 2013 11:40:37 -0700 (PDT)
In-Reply-To: <CAP9ODKq0_L_1bqOuDE70vNXCbQ=8Bcs9bvAtC2BafGStyz4Mnw@mail.gmail.com>
References: <1382984521-22179-1-git-send-email-eu@felipetonello.com>
	<CAP9ODKq0_L_1bqOuDE70vNXCbQ=8Bcs9bvAtC2BafGStyz4Mnw@mail.gmail.com>
Date: Mon, 28 Oct 2013 11:40:37 -0700
Message-ID: <CAGrhNMy1DAOCsocJ12F_qpUtbbMPt=u6_dJeRG7R__PpoaQFTA@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] psplash: Show psplash before X in reboot/shutdown process
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
X-List-Received-Date: Mon, 28 Oct 2013 18:40:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ok. But wouldn't be necessary in this case?

Also, this patch is inappropriate without a patch for X. So I would
suggest to ignore this patch for now.

Felipe

On Mon, Oct 28, 2013 at 11:31 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Oct 28, 2013 at 4:22 PM,  <eu@felipetonello.com> wrote:
>> From: "Felipe F. Tonello" <eu@felipetonello.com>
>>
>> This is interesting because if you shutdown/reboot a device the screen will
>> flicker because X will be killed and then psplash will take a while to run.
>>
>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ...
>>  SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
>>  PV = "0.1+git${SRCPV}"
>> -PR = "r15"
>> +PR = "r16"
> ...
>
> Please  don't do PR bumps.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

