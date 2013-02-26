Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UAQrX-0008Sa-BA
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:10:57 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so6125505oag.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 11:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:x-mailer:mime-version
	:content-transfer-encoding:x-gm-message-state;
	bh=NHOqXv0vHKSQFTutpfYNqPpU09i5xBd7qBY/S0K1ekw=;
	b=jPj8/b4rXuD9pUnGQAF4Us79Ejqa38WnRxtIN0MfRP/o1zxO+oW5hC6U/P9HS32Vue
	je/kO2CXGQVmSE3fc3Dh4AyYcZscvftIM2VwZeTLIaVAsp9eEZa1BKaOAEWU8dOjUSbe
	rHWbwI2wvkjS/fX5UotLN6206MqogN40lGdwfwN/HdR16k1cR/oGjXIjD/G1DzYWJpJy
	cwMWsbbrbBUQfwjEqJf5UIPUhX0MPtPVRNDMdMqTtlQjSkkL1zaCFR0f2p6GyqmC+a2p
	7N7UwDhIOUXVKFbjBtYYULYqK2DqT+isZQQiq8fk/JQ8Z/G3W1p4zOVt81XkjEPcUY4d
	LOKA==
X-Received: by 10.60.25.35 with SMTP id z3mr2646355oef.98.1361908475204;
	Tue, 26 Feb 2013 11:54:35 -0800 (PST)
Received: from [10.0.1.95] (adsl-68-88-197-100.dsl.rcsntx.swbell.net.
	[68.88.197.100])
	by mx.google.com with ESMTPS id z5sm3210897oeh.1.2013.02.26.11.54.30
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 11:54:34 -0800 (PST)
Message-ID: <1361908466.1685.3.camel@rrMBP>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Ross Burton <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 20:54:26 +0100
In-Reply-To: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
References: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.3 (3.6.3-2.fc18) 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQnKvuGhKDsbsvVdMCfOGy2iEw57DBZ2HbW6O4W6dB9LrDo//+wDxGAmWwZR4XIg/Tn8JW7V
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 20:10:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-26 at 17:53 +0000, Ross Burton wrote:
> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> work on the target.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_197.bb |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
> index c765c18..001d111 100644
> --- a/meta/recipes-core/systemd/systemd_197.bb
> +++ b/meta/recipes-core/systemd/systemd_197.bb
> @@ -63,6 +63,7 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
>                   --disable-microhttpd \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
> +                 ac_cv_path_KILL=/bin/kill \

${base_bindir} ?



