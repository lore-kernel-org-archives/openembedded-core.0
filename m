Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 22A507FEA3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 14:47:34 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id p191so2015769vkf.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 06:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+HUljrtgAYjEnrUFEudHFC26crlPg48FGU2O4I7ogQI=;
	b=tnEZ9XPXYOzahdp9cpuxLP+BGAFeixwKRxPUAipBn+UDaGAsQqRAOmfnhBYVYMLeNM
	9tLmT3jLQRGn96TjD3kJjYv8Zi+sLmiVkORAS4OIqbgn6lXamrM9fbrorAV8ATnns3xv
	D1RkCtoI/Q4Jqn4iLhtNilLvvjEvibZV7ex7slP+Gf7WZmtY5epteskgBBmi+6UfQ8H6
	H+7oJYEVmkCTMH3FbH7U+EfjY+V+xuDlPTnn41S9AaIJbUhI7bWO6uRJzsn8H5Uvzo0U
	ThUjtlXxYZykO1Y/rVYRUdTpKFAVI2ypp6LvZY1ErahwXgTozY9suwUWQLRja+Ii2PUq
	KiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+HUljrtgAYjEnrUFEudHFC26crlPg48FGU2O4I7ogQI=;
	b=CRsILWK4WDz2LakL+6Z++73G3Mn5XXHDQyDAAX+4VpsEITR3NkEzvjbP5EHy7Bl0z3
	0S1IuehtdIczTQjC/0kTSdLX0NPP1o5cfPP+Uh32unzvRrzjXijx2ibG9+g911gGyQk2
	GmwVAxbXaEh+N9EsqNox16WNogyK2t9vP3wCBTtfbinY48XqQQmZ/mG431k//HG7upBw
	zu0dIpfAs3YBWIQC+0eeDkXNyxH2p1FKL/eFeiSqaikyTpjrd4H9rPaSoq+F7HFQti4m
	S4CjMWiXX2yCfQMKsV/KwBgIM2juXkv6VIP12lAxnez97KPW/iuRqvyEokaQ8WYjqwBD
	UGzQ==
X-Gm-Message-State: APjAAAUHvUGgJaC+eeMLshf8nkvhoOeL1CgX9wJ8DVdxQyfKscOftC9u
	k1mxM+ODNS4829h3oOERfm8njRG2qqi4IuoRgVg=
X-Google-Smtp-Source: APXvYqwAcHqkUl3mo1M4nuXOaB0kwG+Xzg+Olpu+TMuPbeB48yrUo6z/qzWHPyDeA5mQyKKTu46gE/oxKj8Z/h7LvYQ=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr6916437vkq.49.1578581255077; 
	Thu, 09 Jan 2020 06:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
In-Reply-To: <20200109144454.GB31026@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 15:47:24 +0100
Message-ID: <CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 14:47:34 -0000
Content-Type: multipart/alternative; boundary="000000000000f5432c059bb61623"

--000000000000f5432c059bb61623
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 15:44, Tom Rini <trini@konsulko.com> wrote:

> The problem here would have been caught with systemd-free and
> busybox-free being a check in lib/oeqa/selftest/cases/imagefeatures.py
> yes?
>

Yes, and you'd also need to do -c testimage on the image to make sure it
boots and has the network up and working.

Alex

--000000000000f5432c059bb61623
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 15:44, Tom Rini &lt=
;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The problem here would have been caught with systemd-free and<br=
>
busybox-free being a check in lib/oeqa/selftest/cases/imagefeatures.py<br>
yes?<br></blockquote><div><br></div><div>Yes, and you&#39;d also need to do=
 -c testimage on the image to make sure it boots and has the network up and=
 working.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000f5432c059bb61623--
