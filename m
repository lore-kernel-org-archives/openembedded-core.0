Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCDB6B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:03:33 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id p13so1691436vbe.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7moReTRbsnOSBdtImF3tSO2L2CwXx1fQ3rV35IUjifg=;
	b=N1qSs1Sl1+EgAxzCpelCPxjLbVVBIhAoDVQpJz00+v2PJqdbzwyFcjeDZNn1mjhFu2
	ujvNQqQWNIOfGt6vxg48cSTfc+O0913mwhwIGfwOUTzIUiLBu98dIkW1HpvsFgrG/3g/
	lP1v1Y1ovnDGx85T8eD7eVIwbwmjWsFQMYqfV/j59yeJV21XYtG0wAIMHedU61L9OSFX
	h9BfYe09pqVVMud6ynIvQhPZlUk1w2BVNvgrG6YTgduR4d+SFHN6wIzgKUdpNY5fHgyo
	NNMkJI0+PA5uEN/syE9xTBMcN0WWTYr0vz9wYVsFh0q+zZLJByKWzoBNIQ5LR+5k1wo6
	bTvg==
X-Received: by 10.58.24.41 with SMTP id r9mr407712vef.44.1373645013867; Fri,
	12 Jul 2013 09:03:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 09:03:13 -0700 (PDT)
In-Reply-To: <1373637989-24991-5-git-send-email-cristian.iorga@intel.com>
References: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
	<1373637989-24991-5-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 17:03:13 +0100
Message-ID: <CAJTo0Lb8w6T7Ygip=6hDEE3o8zRv-5SjcaKbv=b6sVAMOXQ_dA@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQnvvXa3/O08cO1sTyYvpWQHc86rTVYSsIlDUqaJ/7WxsNX8uoZK+JA0QRZjRJn990Mkrfs7
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] bluez5: add readline dependency
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
X-List-Received-Date: Fri, 12 Jul 2013 16:03:34 -0000
Content-Type: text/plain; charset=UTF-8

On 12 July 2013 15:06, Cristian Iorga <cristian.iorga@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
>     bluez5 uses readline to be build, but the dependency is not listed
>     This is listed in the configuration log.
>     So we add it.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

Squash this too.

Ross

