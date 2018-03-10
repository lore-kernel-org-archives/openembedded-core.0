Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 186F860190
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 03:30:22 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id k9so10738357wre.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 19:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mHaVBv++lel8jmlzyaxoHGC/LSo4F9Gg3IpjCiNeo84=;
	b=N0bXmotzn+c57rw0Q+sZ4NX4iYTcfseplHr+521v0G4WIR+Iz1ZXlCgKN86qWMeUjW
	d9b+EyZqVNjNNSbIdZAofz328VtVsiQrbLZX5MalEwpl8r2EBtt7ic0j/xRY8/hOCfAa
	S3Tr1mqJqYWyxUmm5jMgUKQblfnOSjfLCkkoUip8IPNEaP7gPoDp9NjCXq8oLFvwX58T
	qfx3ThwTsBeJO4ComUTSqHUbR1yruOzNJV3MWp3otJsJhFQWVaLJcqIdxUKTthmTlgHS
	g+kb6Zqpgx+DgtoU8rH11TxzOw7ePaNM0hNJYz7zHtpRwOerSOiygXO2tbKBC1dPVoXn
	K0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mHaVBv++lel8jmlzyaxoHGC/LSo4F9Gg3IpjCiNeo84=;
	b=VmyglbcLgIH10YS9lD/yERbAo/2WoBrl8hNcBj26qzgo+CWdj6Dm2bKgtlS1ZXp+L2
	2HmKMGJtDqsChaBSk0cEEAYiSs9QRWKwIb9Ve8KvrGu+5F5pTaYhRV5G7u0Cd3dTD1W+
	iZOSJPnM6CeF+OrpyRPcA7Wt4LOuMkutyfBs0ulCBLSRvsZmyf9eteC23bEQzWSAfilU
	J9JrY1AhnopETB0UVGeMcMmbisSTxrWKgW4lRbsRcCeo7wk7c2F0jVSEYFB6ELO4Qkyi
	OVslpAZ+VDtEM1s5vwApJJtwJoeF8vPQPGRE3XaXj8AfsMzxnZu0Re6ub4H5dzMyymjo
	+YvA==
X-Gm-Message-State: AElRT7FLJdBjjEtSyO/Q6glChuNo0qWcRqFZrqdMJGYcyM++tF9KK/Dt
	UMcZ4+gP7DeMINgE4kRkunEG6Ak+H3GPJsUqWOc2ag==
X-Google-Smtp-Source: AG47ELsFX+7Eo0zGfDlp68zg34FU9+JwwryXbs8F7Xk8S4AFsXKwsAFyZm1earadJkZEInoH5OJYlGsFu2DdlM+Nd0g=
X-Received: by 10.223.161.10 with SMTP id o10mr539165wro.60.1520652623641;
	Fri, 09 Mar 2018 19:30:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.65 with HTTP; Fri, 9 Mar 2018 19:30:23 -0800 (PST)
In-Reply-To: <20180310000058.15536.85416@do.openembedded.org>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<20180310000058.15536.85416@do.openembedded.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 9 Mar 2018 19:30:23 -0800
Message-ID: <CAJ86T=Xwc3XPMp9G2y5c-noa6OiHuUkszLJMzefF2y20pLHQMw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdjYzY6IFVwZ3JhZGUgdG8gNi40LjAgKGxhdGVzdCBzdGFibGUgc2VyaWVzIHJlbGVhc2UpIChyZXYzKQ==?=
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
X-List-Received-Date: Sat, 10 Mar 2018 03:30:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 4:00 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: gcc6: Upgrade to 6.4.0 (latest stable series release) (rev3)
> Revision: 3
> URL   : https://patchwork.openembedded.org/series/11226/
> State : failure
>
> == Summary ==
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
> * Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format]
>   Suggested fix    Fix Upstream-Status format in 0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
>   Current          UpStream-Status: Backport
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]

The v2 patch was sent to the list here:

  http://lists.openembedded.org/pipermail/openembedded-core/2017-November/144159.html

but it seems my morty branch still has the v1 patch with the typo...

