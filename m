Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2487837B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 12:44:31 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v11so9209069oif.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NpJ7BmXXpFwZqjq7CPxqE5fKxgedSdSLJJozEcgcgUw=;
	b=r2JNy2CfE0tY1FiE5rT+mJF2mE4YaEy4QegbN1GJY3Ujrpsz9UOkHfyqAWRd12pgCB
	qZa2ogQFRHJNEsrDMuCBpHV6uqvg/BxeDRu8wO4/Akzg+lV1AY6qSfKoIBJZFlZaMg/D
	DrNaiSxkjbEuGE/0+i1o/1KHdr/kneDnv/WZ+aGe6OFLLdWIwvZGOJC1JkYlSb3b1aNZ
	yWPPcq2kPyXZ8SkUEjervwZBIOJZipXnjX9NKpAUPcHiOimcMhgQt5cgXI+hhIblVIiC
	LmoUWPjy6XWFFKfBoCCzOt9LATGFLe/oVeidiO2gFwXbaw3lU/TO96PwPCShgpj41VRA
	Tlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NpJ7BmXXpFwZqjq7CPxqE5fKxgedSdSLJJozEcgcgUw=;
	b=RAqfm1CbZkwYGLpYM0Azx0tlzm4HDexjhCofw3dJgrNBST/bmnmHXLIvwOB51Ec5VO
	WNthFIPbjbMpjTIObE5h9Jb6E53tCE3HUEtxMSlJSQuNsWt/B54e2LNNrFCBhTD0jmyg
	E1tX5SwATQcv6CCeaOnxmkpOeinbwLHzuoO7ZHJrizu8D9+RloMsZVUUt+28PoFNp/CS
	6uoCvmRDRTAyjA/Lr1hKz0BYrC8slxngR7+aJ5IhUm/tIrF4QnRbAgUPnWRT7h5Fb/KJ
	oigjZYR7I3TwnNaZmLw7xdkP+x+Do+rCu/0TiqzxlC16ZvujPA6E9S98zpGhsRuJ07hu
	5seQ==
X-Gm-Message-State: AHYfb5iLiShd+RT2qI0zaCxgvUMfqpcVJbimDmfirF7Fdjx5P5yJgIgt
	5AOG0lyNxofp37yAI0o=
X-Received: by 10.202.225.5 with SMTP id y5mr10678438oig.32.1503060272865;
	Fri, 18 Aug 2017 05:44:32 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	t186sm6499036oie.29.2017.08.18.05.44.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Aug 2017 05:44:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id f11so95136582oic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 05:44:31 -0700 (PDT)
X-Received: by 10.202.184.8 with SMTP id i8mr11767753oif.266.1503060271331;
	Fri, 18 Aug 2017 05:44:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Fri, 18 Aug 2017 05:44:30 -0700 (PDT)
In-Reply-To: <20170816181539.5327-1-otavio@ossystems.com.br>
References: <20170816181539.5327-1-otavio@ossystems.com.br>
Date: Fri, 18 Aug 2017 09:44:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpOcrd7h5AcgW2zxPHPvkhrgAByZEvF-tzsb-iOGxh_PA@mail.gmail.com>
Message-ID: <CAP9ODKpOcrd7h5AcgW2zxPHPvkhrgAByZEvF-tzsb-iOGxh_PA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>,
	David Vincent <freesilicon@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Fri, 18 Aug 2017 12:44:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 3:15 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
>
> The commit has broken the alternatives concept as it is managed by
> links controlled by the alternatives system. That said the failing
> case identified (which some bootloaders fail to load the file) seems
> to be due a misuse of the alternative system.
>
> Cc: Christopher Larson <chris_larson@mentor.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I ended forgetting to add the commit author on Cc. Adding now :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

