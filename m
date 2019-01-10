Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 52402746B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 22:09:06 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a16so9443724lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4RxODLjS6Qk3WZ02ngWJNhqsFp1WBd5X18ltO2UCdZA=;
	b=AXLp+e8LtzDLT77s2mn2cHKQNymNDsMyfqc3wFn7XMg2ciou+8g77TtIwzWAEQJUQy
	uVlRryPedwf68Ahfc9HEcJd4ilytgetEY8RKi3AK6h3Z/2h2quMeVYEyrIZDQYEntdWg
	Vv2MfBqcQyCDh+iQalgWzxO1Km1ImpiZkfWQ74rAsMm15hl5BRppxw1ZCidJHZTRb/1o
	PwE+oul6Gi5PUq9Imq7AKC652/mLuWBV0eVfY4xTiRKbFP+IDy3Gv3uxTJHlbCwyGRcN
	vi7XWSYY+qhqzrbU9Kjozr0t2cYX8p12Kmoe88nHA4DwV2lhC6y34MLHuGqfOgW6hnZb
	QNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4RxODLjS6Qk3WZ02ngWJNhqsFp1WBd5X18ltO2UCdZA=;
	b=m49HNuFJahxzKdJK/Dpp0eTkniX3RsiFBFYuk6w9TxEpFEy7FokbbDwV6boCFjHSFR
	IamaRCSbaTXnYBmtb2tB80mwgAhJQt4WTEcgvDdUERkjs26pBBSZmSNNmM9iJYgll3p/
	kIIDFdc27wzd3zIvCYVi364NljV8pSgRS2TIWBKkthRabsARe0V82IrQf6Pj7daiWpec
	uqyRPx+rUJ2EQrO8l82JBB/esfPYKgOwn53aNuXoqcqXNLzxCpC75onFvb022xjmcF+Y
	DkYG0UOqSTHvapQh2GM51EZimIBONeUurxyBZOA04Uv6sRse/RJEKITcH5EDJkTcj+nA
	zuPw==
X-Gm-Message-State: AJcUukdyCYqOTaq6XDP1Y3OpAYFqIBxzLO6vrcOfvEFUkn9qGnrGzqUB
	fgaSEc0l+qa1M9wK02cDu/H4nMNQ3EpBwix0qjc=
X-Google-Smtp-Source: ALg8bN66qk8KFLvn0nVfKdW7YmHa+QcRmfxVVnCVgaxpkokp1qHhpgJ0fUHyyWDX8naOUWcq+1iJUzc8SlwRkS0FrKY=
X-Received: by 2002:ac2:53bc:: with SMTP id j28mr7177374lfh.86.1547158146770; 
	Thu, 10 Jan 2019 14:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20190110195121.13070-1-alistair.francis@wdc.com>
	<CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
In-Reply-To: <CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Jan 2019 14:08:39 -0800
Message-ID: <CAKmqyKPEvPOrn+Xds5FOqF9+xs_KdjOLMJL=9+fT9_4bW4CKCg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 10 Jan 2019 22:09:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 12:04 PM Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On Thu, 10 Jan 2019 at 19:51, Alistair Francis <Alistair.Francis@wdc.com>=
 wrote:
>>
>> Most users are going to be using libinput with some sort of display, so
>> enable gui in the PACKAGECONFIG by default.
>
>
> Whilst the assertion that people will be using libinput with a display is=
 true, this turns on a debug mode (and promptly pulled gtk+3 into the depen=
dency tree).  Is this something that is universally useful?  I'm leaning to=
wards thinking it should remain as-is.

I would argue that it is universally useful and that libinput is not
really useful without it.

Alistair

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

