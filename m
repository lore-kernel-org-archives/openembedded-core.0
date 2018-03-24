Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFC078803;
	Sat, 24 Mar 2018 19:07:39 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id a16so5976839pfn.9;
	Sat, 24 Mar 2018 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=0k2tz53h6NzqU7+XcWRayWcJl6pkrhNwBD1ksy9oUWg=;
	b=qU6YLNPCQWNXCCaNGFCR3Ii6lKn3e0xJ5G4gb8jdiTOk8ZC452zMRWXX32qHihYCuo
	KBxy5vJSGnnrTgblcMIAWh64w7rVmvzQvHp8VLwe/BN+idT+T2lLEmnvhwiX3HxTHk3H
	Ag3nK0B+8n+Dd7qRaAoipHPkvlg1OMv+R00FAAHvcXrfSgz/xj8k3QcnrERTQt32WsaD
	ZMP+WdkVeZFHBQtQfMYs6q94hwQzPgaSgmQqVmgFi3JyUjS8wSA7duaqRqm+dC5X6ZFe
	fml/UucSND5910g9XmWPT8teB6GRiqmo7dJLxLYXf54gZOv46aRdsKaepfzcUNBloPg0
	dmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=0k2tz53h6NzqU7+XcWRayWcJl6pkrhNwBD1ksy9oUWg=;
	b=L1CfYIzZVfhod+ZzRBQXds8F+r4r2hJsUMFtUMHtlNX+zNTGBVZSx5Iif64zQ5DeHZ
	h8hjnh+/SK7nM2B3l8fnAq1XpQJpFXd+xaQ35Z4a8Jc+A6zNVlQvjurgybdVtIx90NDX
	hsui9+ZvfGz/aifNjeXI8943gwwK2ScXtjbroqmAH6ZNGkBJYsXnU4Ae1QfZudPgDWkJ
	dcjxGhS437W0seCE42fSP7EsYnz73BUmVcfjvoaCuiPNWMWf+G+hhdNjBQ2Xy9m48fiN
	AOxpv4gH5zAA4riVVkZbpDCVGuXJN1gJcwsIokLuIDoTVg5OLEgJaMolC2/VX1GTGDj7
	ivhA==
X-Gm-Message-State: AElRT7GsSmOqrgYTgSzdmvOayK1Eg88Yw49+25bswWI60PF4bFvCTANl
	u1dm7aRrOE7h5ZcAYn+gaIwaaA==
X-Google-Smtp-Source: AG47ELvdmn64eJEI1Z8a97jsC6RulP9PO8R+zPN5Z9Z0AyDbpIH1yPo1HZ0vLV5rVO/kTT9lDN3E4w==
X-Received: by 10.99.176.12 with SMTP id h12mr9118396pgf.448.1521918460445;
	Sat, 24 Mar 2018 12:07:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:310f:6de9:43b4:b287?
	([2601:202:4000:1184:310f:6de9:43b4:b287])
	by smtp.gmail.com with ESMTPSA id
	p23sm19799737pgv.11.2018.03.24.12.07.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Mar 2018 12:07:39 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9a608e4c-0752-eeb2-306c-f8804c584be2@gmail.com>
Date: Sat, 24 Mar 2018 12:07:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: X11 proto changes
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
X-List-Received-Date: Sat, 24 Mar 2018 19:07:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Hello,

It appears Xorg is deprecating most of it's proto header repos for a new
all-in-1 repo xorgproto. This will most likely affect down stream
layers. The question I have, is do we want this big churn to happen for
Sumo or wait for 2.6 ?


- armin


These are now included in xorgproto, the deprecated recipes will be delet=
ed.

applewmproto
bigreqsproto
compositeproto
damageproto
dmxproto
dri2proto
dri3proto
evieproto
fixesproto
fontcacheproto
fontsproto
glproto 1483
inputproto
lg3dproto
panoramixproto
pmproto
presentproto
printproto
randrproto
recordproto
renderproto
resourceproto
scrnsaverproto
trapproto
videoproto
windowswmproto
x11proto
xcmiscproto
xextproto
xf86bigfontproto
xf86dgaproto
xf86driproto
xf86miscproto
xf86rushproto
xf86vidmodeproto
xineramaproto



