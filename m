Return-Path: <andrea.adami@gmail.com>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB5665D7D;
	Tue,  8 Apr 2014 13:37:00 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id my13so250729bkb.22
	for <multiple recipients>; Tue, 08 Apr 2014 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gB426z99xBYsHaWHLA8xInJ3LqFVpQWz4qCUYKdjQRE=;
	b=tb/0LAX7PF+qTHZq8SdK6XNOfbsMTOzLZsHiSocfaT0/piUkAK/8zh82wyIGU/4bca
	q4GhGmpjila3kWaGQwz4K5knfapWzEJ4n/P17hSwPFdbWFoEcQSOHbXJ51MpI9YnI7ik
	ntuzdVKu6fleWkObSUEZ4F0JM58PUUue+sEeS9ddDEcxUE0Zl476npSQroAM6Oydm5zm
	Sqlmvzac1VhPa2ddBaE44xjRXnBYhYzSYM10d3I4ojPjAHsz0fvilNqpC9gV+ncKPQ5S
	Pqf7X3m89B7iLK7EeiFlzUcZINCa7x87xMmJio3s7BEkYSc/IHESxn7be4UjEqipxhAq
	crMg==
MIME-Version: 1.0
X-Received: by 10.112.56.148 with SMTP id a20mr1048468lbq.44.1396950136911;
	Tue, 08 Apr 2014 02:42:16 -0700 (PDT)
Received: by 10.112.35.234 with HTTP; Tue, 8 Apr 2014 02:42:16 -0700 (PDT)
Date: Tue, 8 Apr 2014 11:42:16 +0200
Message-ID: <CAAQYJAstr1sACgL+sTFuBaPb2vtnGrEJYcAE_nPAYsaknsErzw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: RFC: Removal of meta-initramfs layer
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
X-List-Received-Date: Tue, 08 Apr 2014 13:37:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

as maintainer of the meta-openembedded/meta-initramfs layer since its
creation I'm now thinking to merge it back in meta-handheld and remove
it from meta-openembedded.

The layer is atm a sort of middleware, providing klibc, kexecboot and
specific initramfs tools for the creation of small images: recently
dracut was added as well.

The intention was to allow other BSP layers to extend it and customize
the specific recipes but apparently only the meta-handheld layer is
using it so I'd be inclined to simplify the setup and remove the
intermediate layer.

Dracut should have a wider audience so it could be possibly moved to oe-core.

Please send your objections, if any: removal is planned after YP 1.6 release.

Thanks to all contributors.

Regards

Andrea

