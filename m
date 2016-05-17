Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id C58656FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 14:00:42 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 77so7284438pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=6974CdCX4p8Ppym14D+8UYE70o4JaiMsXrSALRe08kY=;
	b=CS0lkRpS2S4EI4SCoUZH1cUxeuYyJyCvic85Dq4mHw2SUFHSlLKs+4cNLOOQ2MEK/E
	VP2663eUL00PU+MZXSe5ALw+sq+eNmXVs+hjf97NiEEmmvwiTjU+jg7/g2XemcdFiiEa
	clqtPVavPOEVoD08f4enhWRp+L7I3eHBGE4sY6Cq3EuKpobeIMterUWrwqbbLAHfvpwe
	qS4nOyrzBOIIvqvPtPYipnXivv7IPGx6vGb/K9yPmfo47Y+58cEIx67wkpCLcUvyN2mM
	R1BCmI2m6xBXcLCIQ661R51stjhdVh3rtOQohisdeC6uEksDUBle1fkn3V9KgcVFZuYd
	kJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=6974CdCX4p8Ppym14D+8UYE70o4JaiMsXrSALRe08kY=;
	b=Kppt1BN0eVFwDqjQ3xfOdR58W6w+k8Jd9rWh5HXZbrRPI+c/xJjVB7QJXjtOCWGt3z
	J4EAQy7XZZMRUKdQiYFL/i++cXhld53wlVqd8NEikINjbWTi0oaxGxC/5Lv6OY1YOEfE
	5yOuIlgpYnKMD30kuhPBdQZNiibSJlbnByk9C80CuSBu2wgDiHcl3IctebHWJsl3/hYW
	VhlObRtKeyUH8ra25BhaR/Xk5b0Vt9SQwpOZ6UNoGsOrnjkwpdHyeIg+9jPVWSDayKpK
	TAw4/ZUCnfN0QR2FIpiRlse7Hwv9BS/EwustAl3ZubD2qle/p4I4NpbVdqa7Io8Lkavt
	uTpQ==
X-Gm-Message-State: AOPr4FWBytPVH5l2B7KFqH3DC7toAIwdYB5/Ycz8M916Fta+cRQH7OjE5emVWNAqV6Zhng==
X-Received: by 10.98.30.132 with SMTP id e126mr2266281pfe.109.1463493643074;
	Tue, 17 May 2016 07:00:43 -0700 (PDT)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48])
	by smtp.gmail.com with ESMTPSA id u2sm5172734pan.45.2016.05.17.07.00.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 07:00:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id bt5so6975055pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 07:00:41 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.14.7 with SMTP id fc7mr2247923pad.1.1463493641325; Tue,
	17 May 2016 07:00:41 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Tue, 17 May 2016 07:00:41 -0700 (PDT)
In-Reply-To: <CAJTo0LbN+7V1iZ5u77EZbJxtF4ou2p40+ka-aJaQx=Fk4znSzg@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
	<CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
	<CAJTo0LbN+7V1iZ5u77EZbJxtF4ou2p40+ka-aJaQx=Fk4znSzg@mail.gmail.com>
Date: Tue, 17 May 2016 11:00:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqSG31qa3Au7g04DMjQmn+B4Xzz2Rtm2Ym0xYs55Mc-PA@mail.gmail.com>
Message-ID: <CAP9ODKqSG31qa3Au7g04DMjQmn+B4Xzz2Rtm2Ym0xYs55Mc-PA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Tue, 17 May 2016 14:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 5:38 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 May 2016 at 08:31, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> There's not much to work on as far as I can tell: 1.11 should be a
>> simple upgrade with trivial patch changes.
>> As I said, I'm totally fine with waiting a couple of weeks until 1.11.
>> On the other hand I haven't seen any reasons to start packaging a
>> pre-release -- why this one if we normally don't do it?
>
>
> Agreed, if we want an upgrade now then 1.10 is good, otherwise wait for
> 1.11.  There's no urgent need for a prerelease is there?

So please do 1.10 now, as the XWayland rework was done basing on that
... we can handle 1.11 upgrade once it happens.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

