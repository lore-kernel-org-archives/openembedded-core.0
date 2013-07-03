Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA0961038
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 09:48:42 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so4417442pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=oLmmnmp6GOEPI5eDojkIyjmLsGFcATOIW72t5UZBkAk=;
	b=vsrNbSqs5UQFsOIDMxTJfr4VnYG9irXo7vluXOuv/e/5X/HnPpIb+Z05TN8Bx6vKQ1
	4PX+o32h+hJ/Vy/d2LCk1V7pq+zG/4/heYg5zjeUrse3eu3wnuYCzgEzsagh4w3lkCoG
	ECRf7qwBO0hXshQdB26Zwgu1pzRfwLnLLPCJdATBe9g2WXOzdLg42b/lrKmyLokpZrfs
	dK9x7GKnXbV4iXyNW5eMyZ3p/2FI8MlECsyKlgda7U1qYF/kmSNqfAEY8H1s4hFijlzX
	Xhui739BNWi0Lr1baXTVMrsgPp+kvp0aSfJdG+8JZgrn8NQJVj0yxRf18kYsemIf+J2W
	Nzmg==
X-Received: by 10.68.253.227 with SMTP id ad3mr80304pbd.63.1372844923496;
	Wed, 03 Jul 2013 02:48:43 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id pl9sm31078951pbc.5.2013.07.03.02.48.40
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jul 2013 02:48:42 -0700 (PDT)
Message-ID: <51D3F252.3070702@gmail.com>
Date: Wed, 03 Jul 2013 19:43:46 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	Wills Wang <wills.wang.open@gmail.com>
References: <CAC6FaqyHsqMPbvZa=gO4S8E+_ZyckNAvqe+X_O5cdJH5uYxexg@mail.gmail.com>
	<1372508358-1839-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1372508358-1839-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] qt4e: override variables OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Wed, 03 Jul 2013 09:48:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 29/06/2013 10:19 PM, Martin Jansa wrote:
> From: Wills Wang <wills.wang.open@gmail.com>
>
> override variables OE_QMAKE_QT_CONFIG to compile Qt/Embedded apps
>
> Signed-off-by: Wills Wang <wills.wang.open@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/qt4e.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
> index d7f5df8..850bb6a 100644
> --- a/meta/classes/qt4e.bbclass
> +++ b/meta/classes/qt4e.bbclass
> @@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
>   # override variables set by qmake-base to compile Qt/Embedded apps
>   #
>   export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/qconfig.pri"
>   export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_NAME}"
>   export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>   export OE_QMAKE_LIBS_QT = "qt"
An earlier patch for this was already submitted and merged:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=85f0cf943d3165a603ccb058d838bc0b6a80ce43

Regards,
Jonathan

