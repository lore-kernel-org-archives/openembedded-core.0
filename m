Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9DA6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 17:48:13 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t7so14953238vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/m4+hSRdpGqcJCBTQ0gSR1edwLK9hgfsadMRGwYOTic=;
	b=f1Q/04f0zmU373icySMzn+qWprhLMtWDglh3z9iZpMyjUgb5cSmY07lM0O+6DinlH6
	Cwb7KJ3T6nL7X32RbyvJ0SShHYzhsPRccbjc/jcTNT56aKBgaKDGvMm8o5YyPkEpobEe
	2x2ngMlZObagn+p+iMMI+OBiATYskP66gkVFZRS98svi9xNdCEZ76/Fr3mZZKPUsB0Ml
	BLMckDEZzKVhnwnXkF08LR1bDUEqszbHkdvkfZoIIs5brPoFDfZLyJC9vJAyB9Mnh4zx
	7j7Ok5YtXBO+zfXeDu2QTOrv67vDzk+n5x/7dkpJXLvVqh0nQG/FE9IlRqppofSuKkcX
	pVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/m4+hSRdpGqcJCBTQ0gSR1edwLK9hgfsadMRGwYOTic=;
	b=SgdhyRIN/iPcSW+9kSDVlyGbRnedg/7Xe+WUlC54SubPuH72KFI4eoOKp2sCSpJtXA
	OeOde7pgEHE5Lpx0Dn92aRzmApKMStfGVfOZ0zC+Z9e+SY13+GboUso/X+s7e4HeRRYg
	JtF/PNpk23CRUFCUtey0BPbaMVmS6ff/u24xeuoRJjKUCYiyV8f+F7JPW5CiWBDUYh8R
	90dYgUBTntLRSaTKzUHvm/OVAIUoqfDlpmlmoQlil25AA3d4WusAq3WiZqaNdQHQ85Da
	mR7W3V+XsvWX8rYAKaAha6Qw5nbYFaP9BqYYk2DyByV2OiwpQH70qcjpqbArpofWBOC0
	1KWg==
X-Gm-Message-State: ALyK8tK25LWF+U0L+e4M35RAn8O7YmRqVYjAgv6wui9EBhI+hjHxPGXHBV3ieKU4Lvhi9Q==
X-Received: by 10.176.1.7 with SMTP id 7mr12218299uak.72.1466704093995;
	Thu, 23 Jun 2016 10:48:13 -0700 (PDT)
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com.
	[209.85.213.41])
	by smtp.gmail.com with ESMTPSA id x70sm453424vkd.10.2016.06.23.10.48.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 10:48:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f41.google.com with SMTP id d185so117042554vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:48:12 -0700 (PDT)
X-Received: by 10.31.56.69 with SMTP id f66mr2382337vka.135.1466704092436;
	Thu, 23 Jun 2016 10:48:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Thu, 23 Jun 2016 10:48:11 -0700 (PDT)
In-Reply-To: <20160623174448.5504-1-otavio@ossystems.com.br>
References: <20160623174448.5504-1-otavio@ossystems.com.br>
Date: Thu, 23 Jun 2016 14:48:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpCUX-EvQKNEsXCE+-v1XTSnKcQanj875qPv60_EQRrzg@mail.gmail.com>
Message-ID: <CAP9ODKpCUX-EvQKNEsXCE+-v1XTSnKcQanj875qPv60_EQRrzg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] initramfs-framework: base: Ensures /run/lock is available
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
X-List-Received-Date: Thu, 23 Jun 2016 17:48:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 23, 2016 at 2:44 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Depending on the module we use, the /run/lock may be required. This
> creates it as part of initial setup and thus makes it available for
> every sub module.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Please ignore those as I missed it ended being merged already.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

