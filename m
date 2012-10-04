Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJovN-0007Ue-Qq
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 19:09:26 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so558959eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yWfvuYcDFhoLjUe8SREpzh83C6872CWBKdZm/uuuFeU=;
	b=Sx+qVUtBYje8EvLsDMRv6NGIxUPxhU34by1sKw1oUaUZrPK9/m9tUH0HBrtaF+nlkB
	ADqlW+Nz5MxqGbjNxdQmEjE4Lez10RxBiX8RkM7XzQnV+YS3CYht4PJc8uJ8rN11thJI
	b2w0ebOLHaTrOEgHMXEfcVrHZgQEsfeKdqby03yBPaabpghNHvN3XRwT1eGhlFbhOpZJ
	WJRfqKmJaaQ2YeyTZ6+H7KIqSNcGV63v529arKnnAJoquQGI0hPH+4O5Llf6h/M0c8rs
	1PJ7XZ7j0FoEgMKQEoY1mZfthFn6THDapHLl9YIryMpHJRd7VwwTG0rsbwfSo667afGD
	SkWQ==
Received: by 10.14.204.72 with SMTP id g48mr9164017eeo.45.1349369784975; Thu,
	04 Oct 2012 09:56:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 4 Oct 2012 09:55:54 -0700 (PDT)
In-Reply-To: <53f928714022bd495807ea6f138063fde85a11ac.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
	<53f928714022bd495807ea6f138063fde85a11ac.1349356755.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2012 09:55:54 -0700
Message-ID: <CAMKF1srsfevR=aCR=nU4YNyL1miWmA+Y1RwYH_51yeCrrRiM8Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] tune-cortexr4: fix march value
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 17:09:26 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 4, 2012 at 6:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-m", "", d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-r", "", d)}"

yeah this is ok


