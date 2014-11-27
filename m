Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 62CA2723B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 21:29:57 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id hn15so4819495igb.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 13:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=rLAe8+Pan8i8LGWA8BZ98Js/40JDF111WqK4UiC5TaM=;
	b=H/lx6JtuXbGAm/qoIeFkOf9nqiCuJchVvgCkkaz2HUeHB05kl8EdKEEnEpM/BljVFY
	ziSwG28FNrh/70z9usbq7DzOKr08gXn9pAQ1ZtGKxG1Qin90pV/OfOw6DZA7amFdgg2s
	oKibgo9L1UFWjzF7T1cHMDqhWmSmce69eOF9KIiZtfKfbqjGvUCN8cU2kRNciCAFNVP5
	aPFY/VUKCCeYdgjewNpkF62Oa5x/IsovGdWdQbS+sSnOqIRp9ox0yKqaP1gDGwV94ExN
	GUTQ2oThePdavfgdXuiSfXCq8mNaLr1Pd2BiPQa/jD74ap1kKMgekjVIJYfVKtMi9EZm
	tkOQ==
X-Received: by 10.50.171.193 with SMTP id aw1mr30191515igc.2.1417123797491;
	Thu, 27 Nov 2014 13:29:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.7.143 with HTTP; Thu, 27 Nov 2014 13:29:27 -0800 (PST)
In-Reply-To: <CALbNGRTJxpctu143L8myaN1yzDdMVUVJhFoH3iznyr8webpgRA@mail.gmail.com>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
	<20141004023040.GO25706@jama> <20141024090416.GB2430@jama>
	<CAJTo0LauN8+Qc14WNkuOmQmhrF=2nXzfrM_O560E0gfqMgfLtQ@mail.gmail.com>
	<CALbNGRTJxpctu143L8myaN1yzDdMVUVJhFoH3iznyr8webpgRA@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 27 Nov 2014 13:29:27 -0800
Message-ID: <CAK8F28knQaCCX0uctfEKDg=9eGgw20nZ0j27C-BBkfhdZH=iAw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Thu, 27 Nov 2014 21:30:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I cherry-picked this patch onto dizzy and it unbroke my build.  Is it
possible/reasonable for it to be included in dizzy?
--Ash

On Fri, Oct 31, 2014 at 1:21 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Oct 24, 2014 at 12:29 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>
>> On 24 October 2014 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> Should I resend without WIP tag now when ChenQi confirmed that moving
>>> libgudev isn't needed?
>>
>>
>> No need, I've merged it into my staging branch already.
>>
> This should go into dizzy - right?
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

