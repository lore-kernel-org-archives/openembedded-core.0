Return-Path: <akuster808@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEEB77DAE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 13:43:58 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id y18so2052461itc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=4ZvgMHLIqLzS6bwL3WSx1wDLkyv+OGoVv5G4FkeR+j4=;
	b=ZeyyUxDJgy/reOu4L+30BLrWcgISWARToRheM5IpUOy30X/8NCkje7r5YBHtb2uUXu
	kqteCCH6ip9Wxx7qDHQA8qwFhOsfZKOGLzWAKCoXkPCx2eHTEN5HUPQ5LRFW+JSxo3ZB
	ytfvxCvbaAVJ0jKIquM8kH+6v+Gk6Q7/ADno0bfFg2bEWKv47d2NAQdDxYXpfz47wAI1
	qdti8IS3jZaZ5Ic/viLu5age3E3DZawEn7XjpGaQ81qYxO4f1StkQWscZ6mOFltDHvXk
	F6daiLN80sfNSCvlRqbzNynNJdTEzXARQPVYwElEA4RV4v4Vdj6mocgBOup3V173BRqu
	gdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4ZvgMHLIqLzS6bwL3WSx1wDLkyv+OGoVv5G4FkeR+j4=;
	b=RPM3mPahpWUzmz0HHEtARO6HyOPq4dqrWXHQ6BtOELTb2QEyvUAqMyALXup9uyGQIC
	y2VMDeA5Er2piBlEp79F3TJqHRYA3Tc837nKGEztjeUfPoB1EgiLLsq2T+CKH2N+ORTB
	bAMtiNd2XqEdbRfFmjg8W8PN5nHx7myD+siQrK/aLcyJjVDTySyg5QY8xSzS9qqktmrX
	ieu176jXsKstpyYrZhKCVouMM189DyWI52Y9MxLJIYa/64RqKWXvFaggafm0WqkGKUsg
	1r7su/FNZsS5ctWmS8wDB4g/FloantEfkD9v+yBW4kw0DWGgAvbAiGlicZ07rHGSxAKB
	imcA==
X-Gm-Message-State: AFeK/H089yHQcbuByGNdqj6wBDN03Ss/NZTsQTavFl/BcihBX9yS/MTefzgGqS7exnl4RA==
X-Received: by 10.36.90.144 with SMTP id v138mr3350876ita.24.1490967840369;
	Fri, 31 Mar 2017 06:44:00 -0700 (PDT)
Received: from [172.30.15.4] ([67.133.97.98])
	by smtp.gmail.com with ESMTPSA id m41sm1284843iti.0.2017.03.31.06.43.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 06:44:00 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170331093113.9167-1-alexander.kanavin@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0bba25a9-4944-18cc-ef39-52532a9cb3c7@gmail.com>
Date: Fri, 31 Mar 2017 06:43:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170331093113.9167-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] openssl: add a "openssl10" PROVIDES
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
X-List-Received-Date: Fri, 31 Mar 2017 13:43:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Alexander,


On 03/31/2017 02:31 AM, Alexander Kanavin wrote:
> In 2.4 development cycle openssl 1.1 will replace openssl 1.0 as the
> default openssl version. Openssl 1.0 will stay but will be renamed
> to openssl10, and eventually it will be removed (hopefully much
> sooner than the official end of support date of Dec 2019, as we do not
> want an unsupported openssl version in supported Yocto releases).
Sounds like a plan.
>
> There are several recipes that are not API compatible with 1.1; some
> of them will eventually be fixed, but others will never be (such as Qt4).
> To avoid breaking such recipes when openssl 1.1 is added to oe-core,
> let's provide "openssl10" already now and change the recipes to depend
> on that where necessary; Qt4 is a particularly pressing issue as it is
> causing failures on the autobuilder with my work in progress
> openssl 1.1 branch, and so I'm not able to see what else would fail
> later in the build process.
nice writeup.

- armin

>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 28421dab338..481a4445605 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -37,6 +37,8 @@ FILES_${PN} =+ " ${libdir}/ssl/*"
>   FILES_${PN}-misc = "${libdir}/ssl/misc"
>   RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
>   
> +PROVIDES += "openssl10"
> +
>   # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
>   # package RRECOMMENDS on this package.  This will enable the configuration
>   # file to be installed for both the base openssl package and the libcrypto


