Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 004547CFDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 11:32:46 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id m137so5431971ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5kXl5E7J3EgC6esrDmfOkc2ydwEVf68vV7KmEhqENzo=;
	b=I3xgywW5r415DPz6YjXjN6B8/ig6YXd3Z9OGpYVRfN/oUI3pE7hshqn9uE+GiRlRX7
	CXec/uJcykI90n6NCTKOb3GkGO/U/qexYdnbMwlVIowyRRfO7mQ2/13z2w4N2vmJABv2
	rbs3oowweYdr7PwD35Lp7NKkO0AQpYNS0JBZaICHoaJKBJhXSioWgZAgwZYu91e0GEzx
	WUJoRAFB3Wy5WcbAxluw/LrIdMWFaXEc4BliA4uxHUn/CZkuYiBauq06avHT8mxgABU3
	t5yAJsPBQggrrBnw/lE76pwqjC2SDXm7uZbGVXzv9Wkp2SD5EC1wBkbIabH3WcwtNleS
	UI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5kXl5E7J3EgC6esrDmfOkc2ydwEVf68vV7KmEhqENzo=;
	b=KEgcaBMAF0Wm2OpgdX+h1AF6rxO41CaPOlMh5CafMX2xsNpSrh3JevmJQ7tYJW3hIi
	zyLqot25ZqdhcLmykBUZbDhZo1jU5TBCwaGwS/RdO95H+WO4hca5BuGQ3zPTM9fyuyFS
	BvamqONIJNYJnt4i/Vsn/AUlVip6AK1erAVKpNRe1IH39EALM1MXvCA/YChSsibjiKOW
	asYJ2bhAPsfFxBcspHTgJcuRxs+5pjsIp+dtPecr0yLSYgQwZxa3x44IRxCsXWsRY84J
	xOPV8jRmtPqW+CyrbYc40+EFmqM9POp6fTtw1zcJdl5pp5Wj00DrWMVbqwV0PTSPEF6q
	LiVw==
X-Gm-Message-State: APjAAAXuR1cktBsA6hBsF6tyczbtRdh08EIxBwIbnXiLSNorceEeSz6k
	DRowXC5scTBu6NmpTwVyjbxtFo3hmyxQSQP8UBQ=
X-Google-Smtp-Source: APXvYqw3rH90HJ0XZtbe1KSycwcK6l16Ny/RqVsTK0E1UOzSah2nxLWR+2R4/sFkhtZ/o4YUU95uoqxR0RBpfhVot8I=
X-Received: by 2002:a24:78c8:: with SMTP id p191mr4211091itc.58.1553772768073; 
	Thu, 28 Mar 2019 04:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190328110719.30513-1-arturo.buzarra@digi.com>
In-Reply-To: <20190328110719.30513-1-arturo.buzarra@digi.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 28 Mar 2019 12:32:37 +0100
Message-ID: <CALbNGRQgSFaBM_ZpJxT1RRp14NJrauQhzZtbSmL=W7B+48_9xA@mail.gmail.com>
To: Arturo Buzarra <arturo.buzarra@digi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] networkmanager: upgrade 1.14.4 -> 1.14.6
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
X-List-Received-Date: Thu, 28 Mar 2019 11:32:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2019 at 12:14 PM Arturo Buzarra <arturo.buzarra@digi.com> wrote:
>
>     * License checksum changed
>     * Patch was aligned but have no resources to test them
>
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
* This should go to meta-oe mailing list
* meta-oe updated to 1.16.0 already

Andreas

