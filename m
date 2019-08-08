Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4AB77F2B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 14:37:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u25so2669697wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WldyrAcL0EfKndfZKnGwO/0NcErKkOW0k2DLn3UzFuE=;
	b=WkdepSoPox2VQSpmKbrc4jyD/RMazsBlz67bV9Ks+qORQjuPkw78Olmd3W7w/xkI9A
	hM4Cj9cGEUlVxmbf/+IkeRtRw/ayFkKr3DG7oYDjG4mYxn9xXMnrryK/eqWaAzeLsTth
	zHlUAXNH2HJ1GyasfdkVT/P8J7TmDcjAMXujFrIAP8HyEKhgPO7NqvtKScPrkE2dSXvQ
	1R4C7/lJj+fFM8+dcf5VzDTUmnqk0fy3RUd8u5ctX4apw0tM9LF+kblKadDXVT28KMUH
	PxJUmCrLl8IXvVI8iFMjyJp7Xl1ot519FsLi/xjC3ooQ9e4DCCx4/pnm6Q9OXvzaEM2/
	ebtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WldyrAcL0EfKndfZKnGwO/0NcErKkOW0k2DLn3UzFuE=;
	b=lYk4kVGRqc9SvuvP6672s2Gv62boyidK5SyVLK2UcrDUg45J7lX/3qzmojNYOkFZvk
	DoYtLm8AHT28m4ym01Ex7yay0cPUyomEKUoDDjbwNEOAg7dc3S2d+I4c7JCI9gVKfEPt
	mY9T6q0VGANvASQ4i1j2mG4DyuR++Biwwz0pqKgFE369qT/Y1VjhS6BO6NHbKXnBWcdK
	zDS8qxw7uP10BWEnaPUtle7miXFwKPIeAd6l/jOGfZUN768l6wOSrI+G23L0IGGu4MxX
	+ohcLpE8gGf1Kjyd7B/DPvdafqLNAGbQ/d+cwfKjaE/77V8u9MHBuumzJeG2KHrUHHda
	Ar6A==
X-Gm-Message-State: APjAAAUdyhET6i7jQHTxdQvjza67E6BzBqtKAac/vA5azo2awH7FFJRf
	Cfd+tXcuEf60cOpfpIm5Et4wQRC4
X-Google-Smtp-Source: APXvYqzhkkFiJtYgDJxrSx7Ph5fF9SJNCmJNVDnLqgbgmsGeWc7QxpNE1EH5SCrVkStBkWHXJvP0+g==
X-Received: by 2002:a05:600c:23cd:: with SMTP id
	p13mr4441250wmb.86.1565275026091; 
	Thu, 08 Aug 2019 07:37:06 -0700 (PDT)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	n9sm144804317wrp.54.2019.08.08.07.37.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 07:37:05 -0700 (PDT)
Message-ID: <9ff85acd1d43d6003ea5fd53e0701a08b3fedfd1.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Aug 2019 15:37:04 +0100
In-Reply-To: <81efba6d-0174-370f-778c-c4c6fa434afc@mikrodidakt.se>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
	<20190808135858.4609-1-luca.boccassi@gmail.com>
	<81efba6d-0174-370f-778c-c4c6fa434afc@mikrodidakt.se>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 14:37:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-08 at 14:03 +0000, Jacob Kroon wrote:
> Hi Luca,
> 
> On 8/8/19 3:58 PM, 
> luca.boccassi@gmail.com
>  wrote:
> > From: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > 
> > python3-setuptools is necessary to build pygobject but not to run
> > it, as
> > also documented by the upstream packaging guide:
> > 
> > https://gitlab.gnome.org/GNOME/pygobject/blob/master/docs/packagingguide.rst
> > 
> > 
> > Move it to DEPENDS to shrink the runtime dependency chain, as
> > setuptools
> > includes scripts to download other packages, which might not be
> > desired on
> > a minimal image.
> > 
> 
> This commmit message should be rephrased now.
> /Jacob

Hi,

Yes I realised 0.1 seconds after git send-email completed :-) Already
sent v4:

https://patchwork.openembedded.org/patch/163798/

-- 
Kind regards,
Luca Boccassi


