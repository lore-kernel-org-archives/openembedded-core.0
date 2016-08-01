Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 622456E667
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 17:32:45 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id j185so201779321oih.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 10:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dcANFafh9g1vvdzhaRDn9BkJkTyABn63/v8h9iz3Lv8=;
	b=bd0QWLaVfg2BDZJxOoXYHZ4FrdrziGyp9XAbuoCV30uHwz/AwTEdrVlhcPXFlVCSm3
	f80MKFtRMXWXii/IpPQ215gGXGlKxwrL29UO/r+DYCkglCOgK7krVPCenl8S3sZkPgLW
	sambHRdR9rkx6hDiUT2lS+SWyiObD6QtUUTa4KCxfBDNuSMr1Ytzh1qNMOOu6URRfCPC
	hGIumQ8R+ljUC47z4L4oJSHKZm7qBCv4pH5rJChCNcegfagbi+C5g83qvA5lxoh1kxlU
	Dll1bLDIXQA48EgVoPqSolPmNfUFR9wtq75JWhoKA7pAvDqJLrtFrEsooGhH5EYP43TY
	sXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dcANFafh9g1vvdzhaRDn9BkJkTyABn63/v8h9iz3Lv8=;
	b=VGjoDE7Rki/paGH//Zu0TiSx7wfsSMeEP38OmdDWMgFxspflSSEPOrl22gk9Nb83Ly
	QVycMGyw6Pbd1SD4nnMz8Zq8h+blT8yJ4NY4EYPZ1HwWaI9FXpdn0Y0b9AAkPUs5bdYD
	V/ajAjWPzNHzMfVVaBPuDDICfskv9zpmp8W25T/AvyWusZIlbVFR0J9JXlEnhc9g+5Jb
	fJ+vw0H7SfRUr5zn7H3Yn/s2RZbNEiLYqQve6tCJPsrkYe8+r+wGeBRhiQLqqo9lmZ3s
	2+Vuiq+Fcf/YfkXJ8htY903tTu9go1RseXR5Mcvs7l6fOtEeGX2fiVPBx96rDck1dlB8
	UdXg==
X-Gm-Message-State: AEkoout2CcCJBATex/gNFeBBgKrDbH6tHX7uOzE+pQiqDF+hrJXfbpYlCmW6OpzYUneo6uOEV0MNgaQ9fzmbdg==
X-Received: by 10.157.14.129 with SMTP id 1mr36382293otj.191.1470072765514;
	Mon, 01 Aug 2016 10:32:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Mon, 1 Aug 2016 10:32:44 -0700 (PDT)
In-Reply-To: <CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Mon, 1 Aug 2016 10:32:44 -0700
Message-ID: <CAOLEWZUJ-0Usyb5fwqbgSCZSnsec2AeY8mTaDC8nU5q35Z=ADQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 17:32:47 -0000
Content-Type: text/plain; charset=UTF-8

Trying to remember what my dad said about "Ask a silly question..."

Steve

On Mon, Aug 1, 2016 at 10:24 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 1 August 2016 at 18:22, Stephen Arnold <stephen.arnold42@gmail.com>
> wrote:
>>
>> That's actually not a bad idea, but I need to crank out another
>> abstract today (the deadline for special session snuck up on me).  We
>> kinda needed this for a project, but I think a tiny print server is
>> always useful.  What's your plan?
>
>
> Well my plan was:
>
> 1) say that someone should create meta-printing
> 2) watch someone create meta-printing
> 3) delete everything printing related in oe-core
>
> I can help a bit on (2) I guess...  Fan Xin, would you or anyone else at
> Fujitsu (as you clearly have interest here) be able to help?
>
> Ross

