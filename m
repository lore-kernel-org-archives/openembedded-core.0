Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id B98CB6AD01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 09:57:37 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id j7so5005212qaq.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 02:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=930tKT1V1uJ8eaFvwKkKWWDZZVGz72f3bg4SPlIvfGE=;
	b=gzTWFy4eSRV5L5knzxbL7Ue439NOZNKsLsDFGzGy9tjLubBtbecp8SP45UMs7BHF87
	l7t0vaupmtPi4ggQdtLpI9UeeXoHPyiCCpLEdJNJUWWkW1uJzek9JgFvourXkIpC3AGb
	OVa7B8LD9cFAhSaDN0B4+p3yk+VTG+N8EhVO7DK27/ACZDkpGDp1/baRQRaLxqfCTiFi
	7/w0aFRRrA+TIowWp8HAOKZ/R28m8Z3xICmNzo8vrrSsEyjOnTBUZ4YHbYFTvebogzgD
	qRoX4ci6w+lYzErLKGq0G6jOnWyacOn9Gp256wCkt705OjP3c4J6ZhwV+EbbYW1Wq4NW
	MBgg==
X-Gm-Message-State: ALoCoQkF0wgUrPSgYFqe5C+UTtnUmhn60mLx0xV1S8I52ubRCvoHm/v+JRnXPNtaOph5uDnq26er
X-Received: by 10.140.47.129 with SMTP id m1mr29697654qga.95.1405936658553;
	Mon, 21 Jul 2014 02:57:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 21 Jul 2014 02:57:18 -0700 (PDT)
In-Reply-To: <1405886443-34495-1-git-send-email-tudor.florea@enea.com>
References: <1405886443-34495-1-git-send-email-tudor.florea@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jul 2014 10:57:18 +0100
Message-ID: <CAJTo0LaAM+Xf+G5i2AtQsK4cr1ec2V9yogOZrsRvVSyJ78KaRA@mail.gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildtools-tarball: Add wget to buildtools-tarball
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
X-List-Received-Date: Mon, 21 Jul 2014 09:57:46 -0000
Content-Type: text/plain; charset=UTF-8

On 20 July 2014 21:00, Tudor Florea <tudor.florea@enea.com> wrote:
>  DEPENDS = "gnutls zlib libpcre"
> +DEPENDS_class-nativesdk = "nativesdk-gnutls nativesdk-zlib nativesdk-libpcre"

Why do you need to set DEPENDS_class-nativesdk?

Ross

