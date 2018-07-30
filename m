Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE424788F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 23:05:59 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id i12-v6so24481180oik.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 16:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7pIgpLactwNpEGlC7YFRv4c/iSoNnDZIQ42AgysAKik=;
	b=LxXLICHx3R2yIP7Py/x+9e8uZ0f5FEQvtuk1vglOIMN5jk2KBqvPBKfGpOg5+Aa6YX
	G/EvRDElTmGzhEcTNCNOW80ojDhG2H7hxVIPyqt7f67Rknv0rtHlckjUctfJb9dhg1DW
	6g8n5AepdX/cx0jcN9g1ywIGk5ijwMXqpSBWzR1ldspteZTf6Z2mbC+qf52FnzX7Pda3
	wnMasJdWZ9sbdYptuOPLMMQJfdDh687tiKP7+WjCVVMcmJsszRpsaYZHlw4AdcQqFYbw
	1libxnOUMXBwyrV/Sz69V9Dyq+gfEfG0/CVyyUQ46IyPv32bHtIxXHfbvysGYOrriPb6
	Qe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7pIgpLactwNpEGlC7YFRv4c/iSoNnDZIQ42AgysAKik=;
	b=CmXILGsep27MPDL9du/h7QROtknFbySfOR9aAv4gdAYWzfiQbIARAjRIBjzzJ7zTZW
	m+CP6jANAKrOfIy/RDbiuuJjnl19Ypt0uhvwkScOSDnstM7MAGlhOTyXD0Romt+Ntrxt
	TVu/KXvj0QIAohhBhDDyUGvsPg+irPEdE9Qds0Bfo2y9bayy1oDdwZJKQq+4J2l7Geff
	N1keSVwOdc4fz/ZITdN57iTN+23wJjrUbotJbpntMPIy3owMQD5xvW8tkbecLxCHHR+D
	sk8j/Hgi6DrNh7Mn+E6nh/VQKv5VmXvll7s5CJusL/JVUtzdBiRPXtX9BP30YJSb3mSo
	ahzw==
X-Gm-Message-State: AOUpUlENJ8qu4ewR30QRd9ScpP4LEmxYfdrWwsIal9H/HWxTHoNDQCpo
	hPllfW4LrG2QBHxLbOUVh/dUmTrOuX87aIgPDfhgJRsXOXk=
X-Google-Smtp-Source: AAOMgpevrbfzyIchJHqIKedMxE579MyhR+cPk8EvhreG2Adh6zcnK7+CegHgn31mJz+UXuR5Dj30Vs+j37UuMAbjdEE=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr21742462oih.70.1532991960725; 
	Mon, 30 Jul 2018 16:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 16:05:40
	-0700 (PDT)
In-Reply-To: <8caafb085ff549a7979806bd748f51d290546a49.camel@linuxfoundation.org>
References: <1532917949-207205-1-git-send-email-changqing.li@windriver.com>
	<8caafb085ff549a7979806bd748f51d290546a49.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jul 2018 00:05:40 +0100
Message-ID: <CAJTo0LazYUU0zBRM1KtA3do3xMXWYDHwBd5axbd-gOSroQygPw@mail.gmail.com>
To: openembedded-core-bounces@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] curl: support multilib installation
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
X-List-Received-Date: Mon, 30 Jul 2018 23:05:59 -0000
Content-Type: text/plain; charset="UTF-8"

On 30 July 2018 at 23:29,
<openembedded-core-bounces@lists.openembedded.org> wrote:
> That said, is it not possible to just patch curl-config to use pkg-
> config instead and remove the differences between the two multilib
> cases, thereby solving this problem in a better way?

Prior art of this in Fedora:
https://src.fedoraproject.org/rpms/curl/blob/master/f/0101-curl-7.32.0-multilib.patch

Ross

