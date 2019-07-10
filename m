Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id B909B7EE2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 08:47:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s15so1345491wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=VR9D7q/kEPO9XjuJoBkmuiB6qMfh0FEY/R9s4F/OFJ4=;
	b=QeJkmpLgDnx6Ol+/4uu/oKRjzq/sXzb9/H5UNoS8k1ljeIWmhlAmDJ85VrahCLqymK
	tYM6dt4CWn9ZEemzInVRqbUmoeXqfzdy/adLg9abG7D/lOHLK8B8iUyN/+02ueg49gDN
	vS9/8ItIB4W/GS0OKkpKwO/6fUM8OKNYb02hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=VR9D7q/kEPO9XjuJoBkmuiB6qMfh0FEY/R9s4F/OFJ4=;
	b=gTNAqF3siexXieOpnUy/DwLMy/WiwuhfGomRAMp/wl2NgHzRVTrhlulrWmNAmOLAlu
	sGM2GieQ3x82MluhZEQ6fkGQa4QIhMXHM2VNXkMEEE3m0l9nN77f6EpB33RG/kiVAmH6
	G8w9HV2nuUrHlGCx7fE15ZQFn45OhI9+Jx4nIkwEeVVFp9QiZPi+PHt+nIz9oajrmWPu
	Vr4iV4WklfEBD2MSF2yVP09L+Ta7PGxsSJ8mI459zo4yZeKbjRQjHidrJLXpnhIk20ln
	MbrH41M5LcgaJzuhaTeJQLf3LTzzeHsC1UexX/XEZ61cfUUaotZOUpB3BOgXmpggRd9I
	XAXg==
X-Gm-Message-State: APjAAAUm6IBl8aXHhwTHotfgTdGIaEgt6+2KyOx7W3GFA/ZNrSGrOFeR
	JLV1RqAoyEvAt9+nW3aObQPxzGgFflM=
X-Google-Smtp-Source: APXvYqxFfeuFohmAbZ/yoIp+89nEmF5gx/xLwpulXztKx10tthEjUhCTiWA69vTmUju2YQNwVQt+Xg==
X-Received: by 2002:a1c:a6c8:: with SMTP id p191mr3869362wme.99.1562748452224; 
	Wed, 10 Jul 2019 01:47:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r11sm1847531wre.14.2019.07.10.01.47.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 01:47:31 -0700 (PDT)
Message-ID: <e5194d279637f6cb6aaa5e5fd1d2f6657aba522d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jul 2019 09:47:30 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: config warning from linux-yocto 4.19
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
X-List-Received-Date: Wed, 10 Jul 2019 08:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

I think/hope this is just a kernel config srcrev update but could you fix:

"""
WARNING: linux-yocto-4.19.44+gitAUTOINC+ad235db461_c12bc1a098-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:

---------- CONFIG_SCSI_DEBUG -----------------
Config: CONFIG_SCSI_DEBUG
From: /home/pokybuild/yocto-worker/qemuarm-lsb/build/build/tmp/work-shared/qemuarm/kernel-source/.kernel-meta/configs/v4.19/standard/qemuarma15/features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=m
Actual value:     

No reference to SCSI_DEBUG found
"""

please? :) We're fairly warning free on the autobuilder now so this one sticks out badly!

https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/804

(its qemuarm with poky-lsb)

Cheers,

Richard







