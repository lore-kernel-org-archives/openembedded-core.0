Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE1C77EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:24:53 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id b136-v6so12312655iti.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O0Y64nfbjqtFz5sWEL1KNDtHOVw4GXIlXdPGOwzG9nI=;
	b=AFwUyCvn/tRhatEq1BoVo9ySlaJl/oTqoPFHpsy/k2+RTa4F+087d8g9Pc1wOFE51U
	rTX4ChLXwTF6SXQBYQQtNfFHJs0BCBsaPiYtCB328YyoG2NHkGREwUraOGsAyt8nWwXe
	nu/RYJ9So2FGJL/Dau9qK4bCHhgCayygIaOcVDqM9O5RtJFeJ7+BCwtdtklVWsWdtxaw
	E7DbDfTiRR72yJqrXtZOLJt3o8VbGlDJLzBbRhhT8Lk73Q0f+oqqwaXrPI1lZMiCm/i0
	j80+vJqZh/7BJvRK0ROfpHHYHYCZhk8rt5uh6Z9qEjT/IaQut+Xp8Bz/mFty+B6KsvEl
	b93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O0Y64nfbjqtFz5sWEL1KNDtHOVw4GXIlXdPGOwzG9nI=;
	b=AXLXPGy1fZSytoRJcesen13Q/W///QHabSJiE1nollT6w7KT38WK7nBi0dxwOQ3V62
	m8T6+oNAXIwmP6nZ/ZRw8bPy5KU3MSEIKpoCMTXmyRhGwauI2dKb1wdfJfFBxrxQ2v/q
	J8fiiJf6NrtVJOC9YNldg9AygUOYxXet2F5UxsNfNKm8oBlFJ9HsUa3r9QrcOl9laHeU
	4PTWXpZ4NgTbrOuSvM+cw4Oy04BPUS04fOv4nA/doC6o9P6LrMIn76bKqnMcD+z8G2zu
	cCQeF6AWEfVuVesSM+3dv6ZlR3ldyW8i4I2w72GT63d+wsVfd9J2kouM93IOVwGSpGUH
	kndg==
X-Gm-Message-State: AElRT7HA58h3v5SqJW/amUSX/VXoiYDivgnEpu4cbxK5GeueSw7RJgry
	w2U7K3WzYC5j7P2TupG3jFFiSFvjow63ljiriWgl9Q==
X-Google-Smtp-Source: AG47ELtaSncqhJZQpHby37ET9eLu7ulP3jqKmYj/mt4qIDk6kiWFapRpcRn3u6BZY4tcS3Qk+SDPb3dqM2eSJ/XlSDg=
X-Received: by 2002:a24:22c2:: with SMTP id
	o185-v6mr10172459ito.60.1521739495190; 
	Thu, 22 Mar 2018 10:24:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 22 Mar 2018 10:24:34 -0700 (PDT)
In-Reply-To: <CAJdd5GYG4TuL5cRdZv+y1hUK-Ex8ws=fQBtp-dqXV4Z0SdGoTg@mail.gmail.com>
References: <cover.1521587166.git.amanda.r.brindle@intel.com>
	<3d59c4dd2b19c529ede09d2bbd10d39f2d56190a.1521587166.git.amanda.r.brindle@intel.com>
	<CA+chaQchyELbN1znvJapZ4az8coY5Ursp2YmtwdsQfpb+fdyrw@mail.gmail.com>
	<CAJdd5GbDmBRej_emtnhHh8PmaRE3Tfs5qzgAva8jW9K-9xUXFg@mail.gmail.com>
	<CAJdd5GYG4TuL5cRdZv+y1hUK-Ex8ws=fQBtp-dqXV4Z0SdGoTg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Mar 2018 17:24:34 +0000
Message-ID: <CAJTo0LawKVaPwcCBebmg4B0SGtEr+J+kWTDibWGJnZvky70Uow@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Cetola,
	Stephano" <stephano.cetola@intel.com>,
	Amanda Brindle <amanda.r.brindle@intel.com>
Subject: Re: [PATCH 1/1] waf.bbclass: Warn if waf doesn't exist
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
X-List-Received-Date: Thu, 22 Mar 2018 17:24:54 -0000
Content-Type: text/plain; charset="UTF-8"

On 20 March 2018 at 23:49, Joshua Watt <jpewhacker@gmail.com> wrote:
> I didn't remember exactly why the previous one was rejected.... But looking
> back I think Ross was right that inheriting waf.bbclass without actually
> having waf should be an error (at some point). I was (perhaps incorrectly)
> presuming that even if you got the FileNotFoundError, do_configure would
> still fail. Is that correct? If not I think something strange is going on.

That's still my opinion: don't inherit waf if waf isn't being used.

Changing bb.warn to bb.fatal would make me happy...

Ross

