Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD9260800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 19:53:16 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so16046884oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rjlIf0lpp48MfNxxUkQGhBRVATT9r49+6Z2xsg/bUmU=;
	b=iL+iV2xnHXiu/B2KSLqabUcaFOrq3+3kOnINxSTklKnzi+4EMqmPOln0OHkwpUHqJt
	rSIX6uXuPSFfQDfhSFEIxuMUPzmDSmJmzdfJQSliwsCCK+oDvbzXvkgAZmRcUJpmbTsI
	giFyidHQOLDKRqXRlV9UBWI0NtPhy7epnZ/gkvqkK0eDL+k9aUOEafbMn5XkTY3iNRzY
	egKzoK2kSWizpav/BUhGGvP/T3cY5egtNoJS0ae9yTfcKzNwIGIWOVmM4GlavXGMPG2q
	e0BpPxKfDTDlT8lXk2x2oCz1HV+b+tCfwIZdx0AOsuFbmSyG68ozh0koSYhyQLO+Y2By
	ULZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rjlIf0lpp48MfNxxUkQGhBRVATT9r49+6Z2xsg/bUmU=;
	b=gi16tQvl/aYtBnvPyF9XFk/pbyNJjJPhv/oX3IbLovzZqRiQiGY4vrwjULiNZOmbR7
	e4XbUoFtujapUtUS+VIOMjTNHoqDM96mINntMvrxnqqMRSXU7wpLL7i3VPdv/dOIURJQ
	uLa/8ecq47UmbfXS+bH8mCLSVZ7hHeqL3YXanNJsBDaOtCwXIyx9qpHpdvADg4JtHOqG
	GHnYMkYsOIBpdT8La/BwGrHgYpTZkefYGg2kHPaa8Nf8S6Dcf3CMRRMOV/cpCnanNVeK
	f+yNRthIZ2fOjI75mQjfRWg8mgxIPAJo2P8Rq3JMxv94WLXDBbJXVxkecrvqQ1AYqT1i
	iE2g==
X-Gm-Message-State: AOUpUlHOVSt+JgiNxp8CJqIHpZMq/B9QNRlM8mPqlKkxGV8CAok6iK7Y
	ou9eNAxV02rCS4a6VS+Or+1Qry22o18g3vDhJnzWlFrS
X-Google-Smtp-Source: AAOMgpf75prUGej9HeNARWaOyu9f11PDS+UGoZNouvGdw4KElXiUP7UeyocytffIn55FdP158FIN9eiBvtivYbvlkrs=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr5207576oia.18.1532548397387; 
	Wed, 25 Jul 2018 12:53:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 12:52:56
	-0700 (PDT)
In-Reply-To: <e79f3725-aee4-e458-4856-7d438870838f@windriver.com>
References: <1532505359-3185-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0La7u5xz_m4J1bbtW2F-14-jBzCd5W7fMZ4FrWrOEQo33Q@mail.gmail.com>
	<e79f3725-aee4-e458-4856-7d438870838f@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 20:52:56 +0100
Message-ID: <CAJTo0LYdkR+2p4FGDgQJFsOGTFMqsS1Syr015sz2d1_nS3KPFg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: fix compile failure on beaglebone
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
X-List-Received-Date: Wed, 25 Jul 2018 19:53:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

U-S should be Submitted with a link to that bug then.

Ross

On 25 July 2018 at 14:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 2018=E5=B9=B407=E6=9C=8825=E6=97=A5 17:53, Burton, Ross wrote:
>>
>> On 25 July 2018 at 08:55, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>
>>> +Upstream-Status: Pending
>>
>> You'll be submitting this upstream right?
>
>
> Of course, I submitted upstream after oe-core
> There patch review system is based on bugzilla
>
> https://bugs.webkit.org/show_bug.cgi?id=3D187991
>
> Patch status seems ` commit-queue-'
>
> //Hongxu
>>
>> Ross
>
>
>

