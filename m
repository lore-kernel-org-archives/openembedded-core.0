Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tlfxd-00053Y-Fy
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:14:53 +0100
Received: from mail-qc0-f199.google.com ([209.85.216.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 05:00:07 -0800
Received: by mail-qc0-f199.google.com with SMTP id b40so4757672qcq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=6Xdg479ISD2zWW4CeOzJYwpvU49mtdxImezi43Ffja4=;
	b=ou8zOyiLsqlf5YQXub6TbcuCY8DCpTn0VH2PifviBYyNlFj8VePDTlJhUJbhY2WjY1
	tIqO1kdb9hZrnPk29tucE1nqZh/Hg9ob72X8oHBVMlwXL4iksJgGbsJ5iyz8AcqNhW7p
	b3hYH3PKQtcwtePYCptBdI25R3q2+TsKMnP5BwmlyXUcD3azbaG6uXES2iTp6LzpStti
	W7FCBsTsb7prJEqlMBtY2SbuE3M5/15WZwkrppTiJY+Ug0bP++NhG007nkH2JMeosh2U
	PpanNSxUvZshNGVhkJ/ljKrmdFO9+y6U0BtH00snHF3Qy6t0U7K997cTkea8cF/qyC6T
	VxOA==
X-Received: by 10.52.70.46 with SMTP id j14mr12122139vdu.99.1356008406125;
	Thu, 20 Dec 2012 05:00:06 -0800 (PST)
Received: by 10.52.70.46 with SMTP id j14mr12122136vdu.99.1356008406059; Thu,
	20 Dec 2012 05:00:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 04:59:46 -0800 (PST)
In-Reply-To: <CAP9ODKrrSKgd4oFc06Ea=qero4i8Lc1awT7NH_+WwbZru0+XEQ@mail.gmail.com>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
	<CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
	<CAP9ODKrrSKgd4oFc06Ea=qero4i8Lc1awT7NH_+WwbZru0+XEQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 12:59:46 +0000
Message-ID: <CAJTo0La6DRoi8vfbn+qDad5Zm1fpceKfTpRZ=1e07XL79eBswA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQmLvIdHnS1CXdnXM522n/aABhNVNGoGcFRoE6dCNP47cVEl884DgXDI+NlQocLdrJESomJVJBiIgPZghZDAYCnw4tCm3EgG4OggAWT0HljGpJo/owPn9ubOPfwmhD3O3a8S5zdkh07hyXIiKnA0S4IkfxPSOL1utO/AbNu9J82aDHUlc1Uyng1pKIfyodJs5Ocfz+J3
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 13:14:53 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 12:50, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Not really, I've been using sysvinit images and systemd images in OE
> with meta-oe and it works fine.
>
> There're some changes need, indeed, but it is possible to make it
> work. The biggest change I had to do is to get systemd-udevd using
> init scripts.

Sure it works, I never said it didn't work. It's just not optimal -
dbus isn't using the superior console ownership information available
to it through systemd for example, because that means linking to
libsystemd-login.  By making systemd an image-time choice we can't
ever have any code that requires systemd in the build.

Ross


