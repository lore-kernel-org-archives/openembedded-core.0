Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 327446AC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 16:30:00 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so44398711pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=VydB7Y7q1kccBf+y6WFoWV48Krfr+D5Ug2js1tCk2eg=;
	b=qPZiLdCoXoCyTx8ouYoCdfE7b8CiGh6H2jOZ58S+FmAuZUy8MVLaFj8WwxK860KZlT
	IxzZYm6GTQiUuw30qWtd0AZQsKhZjpqpvdjT95jlQYPs3fhhFWiU0Xd9rxb4NsJbNaJM
	IS86Annv+4ksBBOq3jQKEzDNswQ0iMTPikYGmKwSSiCVucFS/Zi+Mw0v+wQBbCHmrMbO
	GJvqhXv3/AFPjDWZAH70TQgTy/rFvGfjzyy+Yqe4vT9pHeovmuDplKvYJhr3LlgJxm2o
	5CNRSByXf2kXrBPxGc1SH17x3SdDhPfXOY7n22CwiYVCdh70es0mKKPxOM+yxPy+tLnl
	cFjg==
MIME-Version: 1.0
X-Received: by 10.70.38.225 with SMTP id j1mr7662200pdk.14.1431016202052; Thu,
	07 May 2015 09:30:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Thu, 7 May 2015 09:30:01 -0700 (PDT)
In-Reply-To: <CAJTo0LbMVTFqMxXC=6Dukia50oAkko5Rc16zA9T7pGTgzYVhww@mail.gmail.com>
References: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
	<CAJTo0LbMVTFqMxXC=6Dukia50oAkko5Rc16zA9T7pGTgzYVhww@mail.gmail.com>
Date: Thu, 7 May 2015 13:30:01 -0300
X-Google-Sender-Auth: W4SaWET1fFJbbGOJRi1dpAzoi3g
Message-ID: <CAP9ODKoPPykye0Jip83AKdQ8hvn+p8Pupb7g0pY2ZaRHeSqBnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add ctags and cscope
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
X-List-Received-Date: Thu, 07 May 2015 16:30:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 7, 2015 at 12:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 May 2015 at 22:38, Igor Santos <igor.santos@aker.com.br> wrote:
>>
>> Hi, these series add ctags and cscope to the devtools.
>> It's interesting to add these tools to the stable branches.
>
>
> Why should these be in oe-core instead of another layer such as meta-oe?

meta-oe seems to be the right place for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

