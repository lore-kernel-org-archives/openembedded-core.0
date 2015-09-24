Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5A176734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 17:19:20 +0000 (UTC)
Received: by iofb144 with SMTP id b144so84449220iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 10:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=DFpJ3nzRtBGWhjwG6Iga9wQU5BhLgbFmGOxhOpJXGpc=;
	b=OCftYDXHZxJmaI61R+spoTDQ7vxpdvY+TqhJDuZlsvLedtCiD0Fvf8L+ZKRKLH3gVf
	kGqUNYGW+9fhz2ZT+/kMaPS0WsKY2Yrr4QFaQESU4DLZ01CCc1tkGN5sCJlAenTIdGp8
	XYhlTGEQ4T6YaO872xAhazPBiKpymP3l10923eOd5Sy+fUDajKVoV8QwTubMSj9Exa3G
	QJ4vJXcVXuHoSgxS/MLQXtKaqki/bJK3sIgbfNnjcu9reUC1ycgWQ5W2IckH0jcSMQ0c
	UX9vnz4cxJ8p+BrP/j4Gg++ADx2ZFWgFXUKqlsa7GeRQKSQkt0ByXMyiq6VicE43EkXU
	ugZg==
X-Gm-Message-State: ALoCoQmHqBsR5+FDBcqtWL+6de+m6CtYkzr0lirK89Opx7tzED9xdVcJvOCKMPHYgz69uoA7rOFl
X-Received: by 10.107.170.36 with SMTP id t36mr2008313ioe.143.1443115160645;
	Thu, 24 Sep 2015 10:19:20 -0700 (PDT)
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com.
	[209.85.213.173])
	by smtp.gmail.com with ESMTPSA id t7sm4293998igz.10.2015.09.24.10.19.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2015 10:19:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so20211337igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 10:19:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.77.15 with SMTP id o15mr32509218igw.5.1443115159262; Thu,
	24 Sep 2015 10:19:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 24 Sep 2015 10:19:19 -0700 (PDT)
In-Reply-To: <1441828569-518-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1441828569-518-1-git-send-email-alejandro.franco@linux.intel.com>
Date: Thu, 24 Sep 2015 14:19:19 -0300
Message-ID: <CAP9ODKqBoFpTEmF+pRW6WujUTw5KwfgQYEg89XULkejj+niAqw@mail.gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsb: add lsbinitscripts and util-linux rdepends
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
X-List-Received-Date: Thu, 24 Sep 2015 17:19:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 4:56 PM, Alex Franco
<alejandro.franco@linux.intel.com> wrote:
> Building a base image such as core-image-minimal with lsb and then
> attempting to source /lib/lsb/init-functions, then using the start
> _daemon function (to start a daemon, such as syslogd) fails, since
> /lib/lsb/init-functions use functions (incl. "daemon()") from file
> /etc/init.d/functions.lsbinitscripts, which is provided by package
> lsbinitscripts. Running daemon() then calls /usr/bin/mountpoint, a
> binary provided by util-linux. So, both of these dependencies have
> been added to: recipes-extended/lsb/lsb_4.1.bb
>
> [YOCTO #7732]
>
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>

Mountpoint should be split so you don't bring all util-linux just for this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

