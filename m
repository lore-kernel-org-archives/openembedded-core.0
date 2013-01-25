Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tym7E-00060g-7h
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:27:01 +0100
Received: from mail-qa0-f71.google.com ([209.85.216.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 08:11:20 -0800
Received: by mail-qa0-f71.google.com with SMTP id z4so703497qan.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Gt4iIcN56j2vSrcCjJqBSuf5AXuPMd0SIXQz65WmwU0=;
	b=Gf/0TYPuCFjiGtyb+bNsm8IicMMc6avlJ0XvcgGFA9+WxtFNExkfDVSndsddGxxxUt
	lsHc/5K6T/FENr56Lt63pu7q1aliGBuXesPAiETFTezFFOBBmixqFF00Q1of8bhjyfPv
	as5RN/Gz61LGFwm87pN1I5zokyBLghKealxlH0eU4j2CHYZbEXBDNHGy972KkGVD2rko
	vkW95R2y7wicoPMBTq8gR+5sXi/ey7ypsl5C/cmMVAobgzHiTIh7C88DRbfRt88chpUh
	/SQ9NV1NbVPtszM6uF7rnd9dp2SlxR36g9QWizafF+nO9NZ60JgbI4BF9uSvqltGnqDU
	RMuw==
X-Received: by 10.52.68.4 with SMTP id r4mr5696578vdt.15.1359130279926;
	Fri, 25 Jan 2013 08:11:19 -0800 (PST)
X-Received: by 10.52.68.4 with SMTP id r4mr5696571vdt.15.1359130279867; Fri,
	25 Jan 2013 08:11:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 08:10:59 -0800 (PST)
In-Reply-To: <20130125160859.GK3200@jama>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<e684d68286657cc9cfce53b0e5b597f79fae1248.1359061155.git.raj.khem@gmail.com>
	<CAJTo0LaDWt3TArVPU9AVEUbrhK6A9FMN+cNU5muSapL4D5wA0g@mail.gmail.com>
	<20130125160859.GK3200@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 16:10:59 +0000
Message-ID: <CAJTo0LZo9rGPQZ4=Voe9HyQcfsz4jKoZtsRUg3pxDvqDeQ-P2A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQm/sD8fapYiW6solyeh2HuY7zeijZyFFuhAj3QWhsw4MtBfSaNv1lee86XNXMfmHtKOBmImDbPL1X0RMZ966k2sAWgGdNyQPZWJPKiLeC1fYTQjruBegbeg5f5K1r3vPHqsQUP4o5afmsjbi1xjDggRPHOKRnasOwpli6lp7OYGkuP5DdeyKbOjNKqWMBkhP5Yp1vXi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] systemd: Upgrade to 197
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 16:27:05 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 16:08, Martin Jansa <martin.jansa@gmail.com> wrote:
>> It also renames my laptop's eth0 to enp0s25.  systemd and a static
>> interfaces file will be fun!
>
> Yes, lot of fun:
> http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames

Yes, I'd read that before so was expecting renames.  I'm curious how
the ethernet board ended up on slot *25* though.  Silly HP.

Ross


