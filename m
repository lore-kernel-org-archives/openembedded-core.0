Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1D34577003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:58:00 +0000 (UTC)
Received: by igxx6 with SMTP id x6so14459975igx.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=bjl3ZILcZq1B13zOVBbmBkmHGagGMcj/94Zqc2iKQ9g=;
	b=Wz43H9AHyjAHWlMi0OfR7qLuB4NZFcQ/ZSUt87qNb3pmfAvwc1B71lRYWGw37QDJKU
	t/YuXaPAkBDZioDZcbd1yDWofW9Ergh5eusAlQUO07U1C6p/tZ4gG0rBldBO7Sijjy98
	bFw5vuGBQX/DsNRPs486gQggkoFLlbfj90Nqq9bIPpFt7zV+aNnZUqT18TzHvxcm+h87
	t0nNPKkwAqGN4oP/vZ7tsop80dEZIASXVTTx43p9pLgLgnktAdenfq2gux0j51GHeOVJ
	LCsDfgXAnLYK3FsMvw5NvlKhofqKnS/iQg6EWL2efBxZsFUk6NgxRH4QfjkDV+ACulMx
	PE0w==
X-Gm-Message-State: ALoCoQnNqZ87rUI1ofRc9j1Skw0+NP86HvVY+z4+vdjoKMnGdnJkv49jxt/Cbhx99tkEkHZ9xiEq
X-Received: by 10.50.60.3 with SMTP id d3mr6630721igr.37.1442498280871;
	Thu, 17 Sep 2015 06:58:00 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id 8sm4227824igy.3.2015.09.17.06.57.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 06:58:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioiz6 with SMTP id z6so22475477ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:57:59 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr6322452ioi.192.1442498279554;
	Thu, 17 Sep 2015 06:57:59 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 17 Sep 2015 06:57:59 -0700 (PDT)
In-Reply-To: <CAMKF1sqNCr5FZOnhetkihHHqLAdkP5EX3YJgO7guM2REX+Oudw@mail.gmail.com>
References: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sqNCr5FZOnhetkihHHqLAdkP5EX3YJgO7guM2REX+Oudw@mail.gmail.com>
Date: Thu, 17 Sep 2015 10:57:59 -0300
Message-ID: <CAP9ODKo81RRQ7KKaPOU2CKKGuBhkgFw-6LA4u+d8m54N8khbRw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Rename 'BRANCH' variable to 'SRCBRANCH' for clearness
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
X-List-Received-Date: Thu, 17 Sep 2015 13:58:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 17, 2015 at 10:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>  meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 4 ++--
>>  meta/recipes-core/glibc/glibc_2.22.bb                  | 4 ++--
>>  meta/recipes-devtools/mmc/mmc-utils_git.bb             | 4 ++--
>
>
> Did you cover all the recipes

Yes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

