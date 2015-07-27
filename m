Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 70D2373237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 18:28:48 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so56082813pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=qIsocthY2uFsx6mRi2esBxzEDA6iMBpLAFXpfgAWLzc=;
	b=E5h4f04lipFXKG+/nfwD8vj6fRyc2VsGNboWERrRMrC7JZSrSZBGpBISn4zoP6ueTi
	ipjGZkzt+2mLHemvzg8i1+Ywg+LNROBmijgdUe6yHYA6ig8a/zLKQR1SQR/QU7e7pIZo
	Lo3DTp+/bmCVH//vY+r0XoKtXYrdFH3WMyu5PPWsBIa008fsHK3g5Zr0yNeCopZV/CO5
	O9MuGLCd3Eh5avwudpAeA82L/M07fQ9Ng9JzWqkLflJJ5ubZg28QllO0wW8Crn445bJL
	LwtAGNKFywxQxnfOo4OJmRJFCbJ3nHun8MgGQs5RguDIJsEwkxlqZdluNJgjbwjdLF5c
	Xfmw==
X-Gm-Message-State: ALoCoQmqsG7s2zHsCXbViciosLsuLWGNmizSy2t9j1SUfsQjnvbqABCzRMvhIVfXN9ig/jsSFWbO
X-Received: by 10.70.96.194 with SMTP id du2mr72167845pdb.108.1438021728918;
	Mon, 27 Jul 2015 11:28:48 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	j4sm30738485pdo.62.2015.07.27.11.28.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 11:28:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabkd10 with SMTP id kd10so55492209pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:28:46 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.116.81 with SMTP id ju17mr71351402pab.35.1438021726138;
	Mon, 27 Jul 2015 11:28:46 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 11:28:46 -0700 (PDT)
In-Reply-To: <20150727181551.GD2195@saldanha.aker.com.br>
References: <1436418620-16592-1-git-send-email-wei.tee.ng@intel.com>
	<CAP9ODKp5X5bK_3-OuBi9RY=L6VSO7sXjdyes3UUG-pOv48FZOg@mail.gmail.com>
	<20150727181551.GD2195@saldanha.aker.com.br>
Date: Mon, 27 Jul 2015 15:28:46 -0300
Message-ID: <CAP9ODKpOjR2Lgx=7iQLW5yctfa2shZrM09J4piDxw9UxDVOm3Q@mail.gmail.com>
To: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
Cc: "wei.tee.ng@intel.com" <wei.tee.ng@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] [master][dizzy] Enable Marvel 8897 Wifi feature
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
X-List-Received-Date: Mon, 27 Jul 2015 18:28:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 3:15 PM, Hugo Vasconcelos Saldanha
<hugo.saldanha@aker.com.br> wrote:
> On Mon, Jul 27, 2015 at 01:41:45PM -0300, Otavio Salvador wrote:
>> On Thu, Jul 9, 2015 at 2:10 AM,  <wei.tee.ng@intel.com> wrote:
>> > I would like to add hostapd and iw configuration for enabling
>> > Marvell 8897 Wifi feature. Hostapd and iw configuration were
>> > created in the recipes-connectivity layer to enable Marvell 8897
>> > module function in AP mode and STA mode.
>>
>> It can be added for master, I think. For Dizzy it makes no sense to
>> backport this feature.
>
> FWIW, both recipes are available in meta-oe layer, including dizzy
> branch.

Sure but this is not a bugfix. I am opposed to backport features
without a very clear reason and this does not seem to qualify as a
massive need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

