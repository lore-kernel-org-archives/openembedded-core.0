Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 136FE6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:30:04 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id n71so5381173ota.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=0UMFZ5XWP7unJl9yUIs7nWavMQ0U1Aq7k5ioYX3VKeE=;
	b=UGFR/wRqW+J1im0VY2MTaMuQblaGkRA3Ii92MP9YX+RjySp+2XWvZ0jueCFLfWGKKO
	JWOAhWLSpuIN/fSf38BIcI2nl+/e1hvLSzvtanR+X9+Ut7Tp29cCDCb1/QDPkZtG3UYX
	r+izJZGPrS0S7l88lif0QkGVz/Sz8uNzPRUkQTG3ymD+lwhpVQzkmi0IVkZ0vtAh7TqI
	tajRQOZksZueb129Oeh9OyW9jUooCMdNxQjl+pY1kCICu3GjFWoWt5kdRaLDUiJHAsvi
	tue/uJJTG6BiaIVtkhNKEdkXIW5OqND9uTNXrTBjhOv8Jp1ge5hrDoloqAQ0G+L8E1Q0
	Tw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=0UMFZ5XWP7unJl9yUIs7nWavMQ0U1Aq7k5ioYX3VKeE=;
	b=NfEP4Xiy//uyCg2b++btaezVw4fmGKFsFBMjClijKPOpNZ1SfuggcejPRKxxOt9f66
	u7IhaWzOLtSjiLPToP9gM0lWrD2Sx5sngeTYAb3VGPZ4p1UIZzF6WbP+PCUAzlhuwzQ3
	EVGTKwlW72L23FZg6OyYRdp0RXtG6qhrqrf+MpeUTFJxSU9MBtLq/WtoX4cUVmsMFPOH
	l4X4Ihs/ltGxS31y8JUbCF0Ed7/xCkxxfo1ktAZv/R0Ty3JqZPiUcYvZUdG2Y1s3y9A8
	z08+axI8z8vzyi1Ml2njW+LG561ee6XvKiw+k8UP1c4ZqpcpcShQ7PilnkzyB45ExI/Q
	/Scw==
X-Gm-Message-State: AHQUAuZX063n16hsgOUgTml5hmyv6dJ33alTxf4iWJpYPVSXyxiDh/yi
	4zgsk6fOYLWhc/jDJLQAQiCIchbXy59oEQ==
X-Google-Smtp-Source: AHgI3IbnNyRNQhG3/3czF9+QA/UaDDMZBYmrkeHiiZpw/Bhf4KjeKO4jndoVCJsPBBr8it41OK7Slw==
X-Received: by 2002:a9d:403:: with SMTP id 3mr134267otc.110.1549989005370;
	Tue, 12 Feb 2019 08:30:05 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
	[209.85.210.42]) by smtp.gmail.com with ESMTPSA id
	t201sm5846949oie.37.2019.02.12.08.30.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 08:30:04 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f42.google.com with SMTP id n71so5380941ota.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 08:30:04 -0800 (PST)
X-Received: by 2002:a9d:4799:: with SMTP id b25mr4774048otf.294.1549989003972; 
	Tue, 12 Feb 2019 08:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20190212161949.20399-1-pascal.bach@siemens.com>
In-Reply-To: <20190212161949.20399-1-pascal.bach@siemens.com>
Date: Tue, 12 Feb 2019 14:29:52 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpW5B3J++XQa8wda3A8c14XEjh+9Qfd1+m+viShFVLGQQ@mail.gmail.com>
Message-ID: <CAP9ODKpW5B3J++XQa8wda3A8c14XEjh+9Qfd1+m+viShFVLGQQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: update to 3.13.4
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
X-List-Received-Date: Tue, 12 Feb 2019 16:30:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

On Tue, Feb 12, 2019 at 2:20 PM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> All patches have been rebased on top of the 3.13.4 release.
>
> I successfully built all CMake recipes in oe-core and meta-oe.
>
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

