Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2564477070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:46:29 +0000 (UTC)
Received: by qgem9 with SMTP id m9so3211779qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aDThiFgjs62b/uWWI14wjPhcxoceSDUhA0UIRN84PdE=;
	b=RxbFhbdtwkp/9WaJ/XMrKgBgF7H1jUjxPEAKstQDOF9QipzVa7E/RHu8gFiSE6/IPT
	7Bm0OVhYss7pz6MNaNd/GNfU6+Azk3EtB5MuuuVNid1k6xCRUzCMGmAPhxL+IkiJ9hBL
	q/gt/3vfNmoYdNGRb6ZfJ7YkvUwukgdc13uvx2NxHgtvSZdF50h3+Lq6YGyCxpqcW1fA
	oNNPoICBE7kMdz+Rr2GM8djE+k4KcSwXmVhB0poawmnvdzTJLORRkvq5OTpb0cvUyFq6
	WP4mNmSsLCdJgZPG1tLDFdwN0xh2yFQNZXtlNWA+REY/pQXP54oXlJzQBGEEaLg1SahO
	qsFA==
X-Gm-Message-State: ALoCoQkRSJPX9oaY7ynit9Okreh0MTX1dxfpVQfbCcsubqBUaotgComqkyAdrGV3DwWP4+d557X6
X-Received: by 10.140.234.66 with SMTP id f63mr33120845qhc.61.1445247989808;
	Mon, 19 Oct 2015 02:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Mon, 19 Oct 2015 02:46:10 -0700 (PDT)
In-Reply-To: <20151019092110.GE3869@lws-christ>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
	<CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
	<20151019090300.GC3869@lws-christ>
	<CAP71Wjzhq_UVTb0cZHWLs=FPp0YRseXb-Q0RyAQXjDAuKFFLuQ@mail.gmail.com>
	<20151019092110.GE3869@lws-christ>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2015 11:46:10 +0200
Message-ID: <CAP71WjyN5pvA_VjwDcGLh6ze5P+e7afM025tYp8dcx1f-cMgZg@mail.gmail.com>
To: Stefan Christ <s.christ@phytec.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Mon, 19 Oct 2015 09:46:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2015 at 11:21 AM, Stefan Christ <s.christ@phytec.de> wrote:
>
> What about my rework patches? I will resend them if they are ok.

i (very) quickly looked at them..
#3, #4, #5 look sane.
#6, #7, i am not sure if this is worth doing this change.. we'll see
what others think about them..

