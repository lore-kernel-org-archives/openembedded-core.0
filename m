Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2089C65CF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 21:29:34 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id f47-v6so7676151oth.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 14:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v7D1CGKRiEDRm8rQG36XqjQC43lpgxPlBh5uK2ngwhI=;
	b=AJ8TKqVZ8xh1UMGjI6l7nO3UC5vCnICNMCqoSwAVQk49K/NcdcPX8n555i0xIk+Nsi
	TN+4OnxFQc2S9isDIvm3lQ9msp5kf4aHUDaJ4+PModwmtS/tqZDb82w1vTWnBtuY+4tG
	MyPowEWKRgIXBIp8x9P4xOB836v4SC8Cg+PrBi1pTzhKrHIWh3rTqZFHkCjOGuNC9MYu
	+gykPtUEwGtetJclraRFadLe01/0exzs1fAgt70jOBJ6VeSAiWz/y7axZPx8zxP+PkiJ
	AeCBCE+cjY6MMoodJvAkOOW74kvbZWre3vQr6+a+6/vlCgiZ8AdUhR0eINSLt1TC68NL
	YaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v7D1CGKRiEDRm8rQG36XqjQC43lpgxPlBh5uK2ngwhI=;
	b=D4bqE4vFTvQUeoBMwC5aXkmSla8p7t3mBkshocK8kUU2NAmmKlFK96fLsS/uQ13Pd/
	5pjydVawzeVl3TYVyo/QUBq6Zkk3AK29Lge5ggXoMpinD2L6LDooyaSRnn9XooTw8Hy2
	jbfEtA9OpCZc0Zp0qjkYRGeLr6TyGm7NGPVEDqI92CmaUqVKK86PUG+flnK4V1kdQjdb
	eiuKFeHfrYTmdKfcrZVG1Xd7WuyWCs6YIe4OZ3KgtHnoeZuVoxUEJ8bv4N5sx4SV0QYY
	6Ru9Q9P/1dNY/QfCkyDANFiR8y9uYuKBThhmzrXzvPbpiNtN9txRKDZZFxMcAthQuUSl
	EbDA==
X-Gm-Message-State: ALQs6tA6hF6UC4nWyhzCMMLYdTf8jz25gTarXRDCjGCpN79g7YxWBKHf
	OyrbP1M3BEEJUUTfS7+SyLgbU8zXZBSBOJmj8Ws=
X-Google-Smtp-Source: AIpwx4/RqHqC3bTtZq3Z9BCPvqNBAPyM8RXUtXbPCHWtkcI+rvoG+zEE18uBRRbkCngvf2fY8aDjUd3SFqBbDeiP5Dk=
X-Received: by 2002:a9d:4042:: with SMTP id o2-v6mr1772559oti.73.1523568575806;
	Thu, 12 Apr 2018 14:29:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 12 Apr 2018 14:29:34 -0700 (PDT)
In-Reply-To: <970d4c3f-ff49-6859-939d-1b4cc28f093c@intel.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<970d4c3f-ff49-6859-939d-1b4cc28f093c@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 12 Apr 2018 23:29:34 +0200
Message-ID: <CALbNGRT9Um3ngq_f1VHs8zZ8E86jfzDwOkdTGnqL5Mcwv9FUgg@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Thu, 12 Apr 2018 21:29:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 12, 2018 at 11:19 PM, Cal Sullivan
<california.l.sullivan@intel.com> wrote:
> Fixed by this hopefully?
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=sumo&id=d5075b648b06d3120fc7e4c47ccda3d620754590
>
> Thanks,
> Cal
I am sitting on sumo -21 commits so it is included in my builds - sigh..

Andreas

