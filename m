Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 308886B7C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:21:29 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l20so1024345oag.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=M/Ihr71zRQ5AzhvYNNwIZWQhk7tSekplvB0t/VeALnY=;
	b=CIc7/tRB3aM6GR4YLFWIO/OfhjHhHe/X6CxNvOgQnsveDrV+F3OyILbfcUON/ENyDQ
	QFoRU1HmU6Xn6N2tg07pyVSvHQRMxVfYtkjhTVRP6A3YrVcST/duF5MwKI1lnU5r10s+
	EB/k9rp6Qlh3VrUkZjoXkpBT77QRqKspcJ2lfaI2No9FKNsdzSc2wZso+ix+WA6y+GZz
	moHK94UFgRkmzwmpGSaB4xHPrkEt5mTkOCWh7wgbezQXXmhK7SBvA6+vqEWNQF/A3f49
	9BBCElL3WyVMV934l0gLZlq/vBjYWZwTCeIkMh9rgw+GdaDwNlhR6LY2Y24uuTj2XStX
	/akA==
MIME-Version: 1.0
X-Received: by 10.182.199.74 with SMTP id ji10mr2180495obc.69.1377012089444;
	Tue, 20 Aug 2013 08:21:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 08:21:29 -0700 (PDT)
In-Reply-To: <1376992956-20972-1-git-send-email-mike.looijmans@topic.nl>
References: <1376992956-20972-1-git-send-email-mike.looijmans@topic.nl>
Date: Tue, 20 Aug 2013 12:21:29 -0300
X-Google-Sender-Auth: vQpXy4tbc2C-rTiiitbcWEmuujE
Message-ID: <CAP9ODKoDgTQDYPdgj4cZTj+BFkKsw=i-GDYXFZ+tM-K-1DG-cw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: Fix compilation failure in install and deploy phases
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
X-List-Received-Date: Tue, 20 Aug 2013 15:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 7:02 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Baking a kernel failed on the devicetree creation. This was caused
> by the install and deploy scripts referring to the wrong directory
> for the dtb files.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

Nack! The right fix for this has been merged already.

Your patch fixes kernel > 3.8 but breaks < 3.8 kernels. The patch
applied today has support for both cases.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

