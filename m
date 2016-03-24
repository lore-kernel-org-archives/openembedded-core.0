Return-Path: <danismostlikely@gmail.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id D43E160132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 22:11:48 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id h129so78068730ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=n7K9DNocHWAl6VWrrRVP0bh/ZVyU/S1eH4X73Scj0KI=;
	b=HF80uHVs9BDsVacXvhFm2gicIFHp9TW5cpOMXtlS9CzD5Ic/gl9eC3JXheuGecSAJz
	Q2uIsZv1YjzuraLMMoVdWqe/kp5wJLoD2KBLQjr1z/OuOUeUJoaDr+goAChLOrei2IUP
	MLayCArZ5Uq+dId5ro8f+EyBACOc0gWm42/HK3y6uiZPqkWEC5rK77+cvr3UJV/7r4Dx
	RFYMyoYnFfqT2FTi7vuE0VI9NE8GjCZ2HKqnDfiAGLiEOxGp41bTZAIc/fxJu57ncjLB
	KK+vhG121vLfTzvDGpQ4X8HUIgH77B3MrpT4o/w5ic9JmmxSRA4YQipVvSkHxoU7Sl7f
	v3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=n7K9DNocHWAl6VWrrRVP0bh/ZVyU/S1eH4X73Scj0KI=;
	b=TsNzmXbuBTdMUY1LCtcPWMebNmEGnAblFIwjcb2CfkHZ5NoQDAyLkFZQtkdVa5tYAZ
	YgwFJRhwVp0/gih2EiGWadCod27UBP1SPMHx+L/K8CPgYjBujHOdT0FdvqKj7OfFMp1V
	TcsVUYnvVIrdhQMCWtnx9nCmA3inuQWNn9ae5dHNWe/sEauP8ljOkQK2ftwrUfimxImZ
	cIo7b5H4khludAD81lL0fCQlTZC0GdiCge7TrHPkmOAp+ek8sjEWstMjau7/MfoaD2WL
	oBsg5DLfNvpVmjfPPeLqEQA7obMevah733Y+qrhmCZcJS3/jJ/8O9lP7lqYBYw2Jlo8o
	PApg==
X-Gm-Message-State: AD7BkJJnj2m0EdiSH7NRlIE8IdOtZ2s5kr7CYJZrtJVeXwNHvuOaTzS/00/CIOJ+hIku+psuZad3zQrhbTS4Sg==
MIME-Version: 1.0
X-Received: by 10.176.2.169 with SMTP id 38mr6106449uah.98.1458857509572; Thu,
	24 Mar 2016 15:11:49 -0700 (PDT)
Received: by 10.103.94.196 with HTTP; Thu, 24 Mar 2016 15:11:49 -0700 (PDT)
In-Reply-To: <CAJTo0LYboOzaym+2+dBNg5s96cqybgMXxNoCJX4uvy+YZA2epg@mail.gmail.com>
References: <1455701436-11645-1-git-send-email-u.oelmann@pengutronix.de>
	<CAJTo0LYboOzaym+2+dBNg5s96cqybgMXxNoCJX4uvy+YZA2epg@mail.gmail.com>
Date: Thu, 24 Mar 2016 16:11:49 -0600
Message-ID: <CACS+7ZSRUrq10fyDqGg6F_oVBSj=Pg1x8_zofFsyPANXYvLTVg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Thu, 24 Mar 2016 22:11:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 March 2016 at 15:48, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 February 2016 at 09:30, Ulrich =C3=96lmann <u.oelmann@pengutronix.d=
e>
> wrote:
>>
>> Upstream nfs-utils use 'rpc-statd.service' and Yocto introduced
>> 'nfs-statd.service' instead but forgot to update the mount.nfs helper
>> 'start-statd' accordingly.
>
>
> Having less patches seems sensible, so would it be simple if we move to t=
he
> upstream names instead of away from upstream?
>

I think that's sensible. The upstream services are there in the
distfile, we'd just need to install them.


> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

