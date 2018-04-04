Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id BABA9746B6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 12:43:21 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id c1-v6so5714706ybm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 05:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v0P0O+JwAruuprlxV2Sqe2mgs1NodO/aQFwcnHbRjrs=;
	b=qbBTE23ESe092kBPV9SpY/1MNw5qqslzsLh8UTmoZ/F9vV5cKU2MP7Ui/O1h5fesDN
	OJanwnZf26qCwgjzeBpJ5V5TDFLEc79Qe3hx3ViYrj+lCQqWA45lMjpbHfM+0eURpT4C
	HIOvntmFI0hzt3pm969SIlR06/u3Uaw9aPHIpCVcd/569+DJuOqtDitdyY2bHZijAdLF
	/BfctmLYbbwM2wMo5QFuR664QnaKlZEtzqzPjb5jguyVXSYHcSXGwwHL+mH7CSzEUZut
	tNXXb3asFLfY6QE049+soJa4tIMJK4XGNAJ5To3rhZfwAYi9D3MNc4+Zwo2I0j/j1c9r
	uJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v0P0O+JwAruuprlxV2Sqe2mgs1NodO/aQFwcnHbRjrs=;
	b=DRZ0C7C6qCNHAvzvkcITKRbxASnEHdvX0AAZTgTm9JdPOw5OZkajCAoGp+W7A8UOOW
	QX8izK+MqJCMP4z33pm2CcUKEHRFtvqvGyafJcoNRM9jLT73BMmRgdu2lfrmPLydovWI
	x7zrs0Kqp6dXqafcXh7Jnpzf/8co76Ayr/NGF3XTNKPwYGmEmwh2EC/2RG0O0Lo1w4hY
	LPzu2j25fyjeXvAjt0qULT4qEUKbe7WD+Jlah/GlwPNiaalJssy9VxkILBsoWxV+9tu5
	l0/tj8GJLgvJ4FxWHE1Gfq508nPGNs1JM6525A3bqny2hXnonZEHUImRPf87CbiKXUyL
	paBQ==
X-Gm-Message-State: ALQs6tBKCb7O+w0QrbS3WFNao74bIrxv3opTs7Ad79pk2ETlD26DbPDN
	C1LYoY/BL2nGEONAwtgp8JWycoffgvr20cxYNRA=
X-Google-Smtp-Source: AIpwx48WaSn25rOw0uVMzBcqASO4+6SJ0zFJ/zeMOq6dHfyGQkzaLhuy0INS92CJexLWQJ6xkcSAzkiv5knez4iGB88=
X-Received: by 2002:a25:d0c6:: with SMTP id
	h189-v6mr10271154ybg.185.1522845802250; 
	Wed, 04 Apr 2018 05:43:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 05:43:21 -0700 (PDT)
In-Reply-To: <CAP9ODKr9yxFHc0SEzCiN5ekGNKUL8Z3LA_AWsY6DYn3tTYkFtA@mail.gmail.com>
References: <20180403210146.6040-1-otavio@ossystems.com.br>
	<20180403213259.2391.8021@do.openembedded.org>
	<CAP9ODKr9yxFHc0SEzCiN5ekGNKUL8Z3LA_AWsY6DYn3tTYkFtA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 14:43:21 +0200
Message-ID: <CALbNGRQ=-xQsYDEjpxex6uscd=5rVgnETFkgVYRJPV_WZ5Reag@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2E6IFVwZ3JhZGUgMTcuMy43IC0+IDE3LjMuOA==?=
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
X-List-Received-Date: Wed, 04 Apr 2018 12:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 4, 2018 at 1:11 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Apr 3, 2018 at 6:32 PM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
>> == Series Details ==
>>
>> Series: mesa: Upgrade 17.3.7 -> 17.3.8
> ...
>> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>>   Suggested fix    Rebase your series on top of targeted branch
>>   Targeted branch  master (currently at 4cedddb836)
>
> I based the patch on top of sumo-next to avoid the need of rebasing it
> for Ross and Richard. If it is indeed need to redo this on top of
> current sumo/master please let me know and I can do it promptly.
>
Hi Otavio,

* It is likely that my two mesa patches (dri2/dri3 related) bug you
* just checked: master-(next) and sumo(-next) are all identical from
mesa perspective - so rebase against master should do

Hope that helps

Andreas

