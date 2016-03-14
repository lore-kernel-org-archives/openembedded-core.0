Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF0486FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:04:29 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id u190so114369394pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=z31qVThyJKJIYR/PdAF5a7m50vfeYF1n3et/G7DGePU=;
	b=LuGer0w1zyxAPuNuCIslLbkKZTRuruS6z7lfOKQWCyrgIsSDFvGUSpAVUfS+bjlSw+
	gGeRl9RL06zTpSxN1PzKuVL6PQuBi7HtlqzhYuq8QsYucxxyedEecjiTkLOIUQz6hc7e
	gT3qj1l4NIk44Fg2XqOIf9W6klIxJjZtHNPsEY/cBe+ugQyo9WFGlHrm09vp6ZozupMh
	Ny5TQpkUQNYKaHqlq68Z4WF8WLq/ZBIEufKnwci0mfGeBQBgbSxR0XOru1Nj86qGIfjX
	i056IfvU71HTY9oKzwSygGTewlPVnZlDd5QgV2b2Be35Nb66qxK2i3AYwMftArD0NFcT
	TbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=z31qVThyJKJIYR/PdAF5a7m50vfeYF1n3et/G7DGePU=;
	b=QYTrlMgXL3A7gC3KejduczK3VeMSCxiJswotdicYzk8OWb5qvwRIBs4qRQFoDvuT9l
	6w7hCsGAqaIASWRSYYRjCTGkKAVN2yiKMUE2CaXb35RT79jiHX8KBFA2IcMq96I+FSfC
	GodVZ2g9L2sOOhqp5QevQzJ68/sObfkAwDHOu1FQafE5M0ShdgrJe6FsLUWTJX+KFvBj
	T6G8bSXNMhdAzF4RLotRx6ekqPiJNnPO/bgfqJgdUjokH6InrarPAW7OB0KGXIdgTi8n
	BcQvUeABOqt3+acGNOWT7G4ZO6x/LcckujGxuYqvvInSDEn0nJoQeL/NqqeUk3NyGFke
	dWfg==
X-Gm-Message-State: AD7BkJKp6dhv9iKB7FQXhBESHFijACNOGfSFc5SXw78jUf1BilfTmXwuiWezXIRmRvwSug==
X-Received: by 10.98.10.147 with SMTP id 19mr33107285pfk.87.1457989470553;
	Mon, 14 Mar 2016 14:04:30 -0700 (PDT)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	xn8sm34335214pab.15.2016.03.14.14.04.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 14:04:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f180.google.com with SMTP id u190so114368944pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:04:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.74.200 with SMTP id c69mr32900046pfj.129.1457989468887;
	Mon, 14 Mar 2016 14:04:28 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 14:04:28 -0700 (PDT)
In-Reply-To: <CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
	<CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
Date: Mon, 14 Mar 2016 18:04:28 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
Message-ID: <CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 21:04:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 6:02 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 March 2016 at 20:55, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> I know it however up to now we could know that native and nativesdk
>> might respect DISTRO_FEATURES and be in sync. Now this is not truth
>> anymore.
>
> It's been like this in master since December and the world hasn't exploded
> just yet :)

Just because nobody complained, up to now, does not make it right.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

