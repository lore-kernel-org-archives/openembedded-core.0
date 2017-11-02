Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4C45C782A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 11:41:02 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 15so1217751otj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=9KH2ljMBGtA5BvM235NlktEqjpsdNCl0FFgTNi367sg=;
	b=DN9M/byfyBAr299zDr3vwH0poZX/fHhDmja/WV4wBQ7uH5GHL6oyMSvAGIOpqQ8zWn
	ILkYMG9oSqihVOGi2u9buvMWqB+MX1ZhYE0zFTc9xLNmePuplfVtkwgbdhnpbwQslmjh
	MDVV+R+17Co9Tupb0m0fbFqbEXl5eQmarsxEx6mdUOpZ66k/d8iZGchJdtNVc6BcZPEm
	rMNi4qCKkIb1RCAMBm3XYWk8uF8LVhcfs6BMs6eySOiQoD4gdRvDGpYn5fuobFbQEOrE
	uc7+nb8Ae/L5sMcIoH+66R87pVgOS5Zo28YkphXYufnpTTli2Y8BRUKT8ekqdMVRBNMV
	gVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=9KH2ljMBGtA5BvM235NlktEqjpsdNCl0FFgTNi367sg=;
	b=QBP+oDY6X6fHKmnDMybPNJC3pJrHAsNNwjw+odlp0y/jwrDy11ZwYoHbAsIQ0Zq7n0
	Chg6Fjk6jiLrK76OpBk90HjCDX6Bl0iAcV0qODLGvwEoguMLLfJZwZbw3xut104Bqgp7
	FwW42hrcXsvybncoN4GfxQrhmddSThi0pY58Cs2vvrAV8cFR0/WuFyxCXWg1toXjM54h
	BBjM594F6K/QPkhK6L8/nEG2y7u9m24lsvlhisMT5dQb/oQ5Fg4B6pdKJRJjEgEfjXXu
	yyde5xbDfgy1e5Kw0lqAm/0lTCo0BrUDt/aorWHKkq4Ok+iKsnY1zgtm9CnF3+weCbTA
	EgAg==
X-Gm-Message-State: AJaThX7ndIAx0rRwR2OKwm8ImBqrorlEs8H+pDmYspig+XiYqocQNJ62
	bATVK6iCW80idkg2y1SW1s1OrX93
X-Google-Smtp-Source: ABhQp+QG0Y3C0ZE4f7ZuntQYV6JfTi/tjKvimOrGJ1cbTct8zaRHAAMG69twZhbVvq4k5VKtA9uiqg==
X-Received: by 10.157.40.240 with SMTP id s103mr1813454ota.399.1509622863980; 
	Thu, 02 Nov 2017 04:41:03 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	v21sm1382722ote.49.2017.11.02.04.41.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 04:41:02 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id c77so8220874oig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 04:41:02 -0700 (PDT)
X-Received: by 10.202.4.69 with SMTP id 66mr1661447oie.409.1509622861984; Thu,
	02 Nov 2017 04:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Thu, 2 Nov 2017 04:41:01 -0700 (PDT)
In-Reply-To: <354230d3-d359-6289-47d8-9b4f70d9c556@windriver.com>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
	<ba38a925299ad32664c35b90486f5c9e97ed64c5.1509516068.git.wenzong.fan@windriver.com>
	<CAP9ODKoLas2y3uyQRV-ewU4u3RQnHW_dMA-WaQb2SiHC6ZWySw@mail.gmail.com>
	<354230d3-d359-6289-47d8-9b4f70d9c556@windriver.com>
Date: Thu, 2 Nov 2017 09:41:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr+aJJiBeRK95ubRWRWFs0u4mK1XmzPiLD=-xZj7qQ0NQ@mail.gmail.com>
Message-ID: <CAP9ODKr+aJJiBeRK95ubRWRWFs0u4mK1XmzPiLD=-xZj7qQ0NQ@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] initscripts: disable mountall.sh for busybox init
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
X-List-Received-Date: Thu, 02 Nov 2017 11:41:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 2, 2017 at 12:02 AM, wenzong fan <wenzong.fan@windriver.com> wrote:
>
>
> On 11/01/2017 08:51 PM, Otavio Salvador wrote:
>>
>> Hello,
>>
>> On Wed, Nov 1, 2017 at 4:04 AM,  <wenzong.fan@windriver.com> wrote:
>>>
>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>
>>> Disable 'mountall.sh' to avoid system halt while the init manager is
>>> set as 'busybox'.
>>>
>>> In busybox init, the 'SIGUSR1' was handled as 'halt', calling to the
>>> 'mountall.sh' would trigger the signal with:
>>>    + kill -USR1 1
>>
>>
>> Wouldn't be better to add the signal handler for it?
>
>
> There's the handler in busybox-1.24.1/init/init.c:
>
>  788 /* The SIGPWR/SIGUSR[12]/SIGTERM handler */
>  789 static void halt_reboot_pwoff(int sig) NORETURN;
>  790 static void halt_reboot_pwoff(int sig)
>  791 {
>  ...
>  803         run_shutdown_and_kill_processes();
>  ...
>  817 }
>
> I think it was intended to halt the system.

Ok; but what mountall will offer to OE-Core then?

If we use systemd, it all another way to provide the same. So why not
dropping it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

