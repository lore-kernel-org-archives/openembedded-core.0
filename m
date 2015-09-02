Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA5C77046
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:09:15 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so29146254igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=yNhQ67FQNGCL6HVQhobbnq8ot8w0hNFJddKL1NGUMDU=;
	b=dsIf9VcDLRIeb/5Pgkkc2GOIj0PXJgOOILyrTHkPjetQi62Lowx2LOJAFYbslQLS+B
	br1W7boSrWzXK/iqmNo8Qkn8xD2G+PQeM2aBBdFY1w9sG0jbMQxlrvmiufBhQnSDZmR0
	WGAJaWdK0xxRrPCykDYuyTxXv7AmJjwTGDXW9PUnk8CbQ/l/cD9i12Vl4LV9O7pa/ecN
	3VsC7SecA2roPy1mLHDjoSLDdsGQ1aDsGpVdZ3ivH83Lu4v+pJ37yTjUzxnhyxRUuD6t
	A+YBMOvzL02YC1lSAeaoTvqtZU9OSdfdVzwPc4CrdAWFdfSObE0awPFmMpsddjpsmT2E
	c8dA==
X-Gm-Message-State: ALoCoQnTQoT7wEceDF6wmIU974ILO7XMJ4y7RGmZFEW4scj+h9O0cEVztT7lmPrl37NA4cEi9I3P
X-Received: by 10.50.138.137 with SMTP id qq9mr4135048igb.47.1441210155777;
	Wed, 02 Sep 2015 09:09:15 -0700 (PDT)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169]) by smtp.gmail.com with ESMTPSA id
	cr1sm2497203igb.15.2015.09.02.09.09.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:09:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so28620869igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:09:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.72.19 with SMTP id z19mr3721723igu.19.1441210154685; Wed,
	02 Sep 2015 09:09:14 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 09:09:14 -0700 (PDT)
In-Reply-To: <088162677a90e58e765514901920567a47c32a17.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<088162677a90e58e765514901920567a47c32a17.1441207840.git.patrick.ohly@intel.com>
Date: Wed, 2 Sep 2015 13:09:14 -0300
Message-ID: <CAP9ODKqPK6D0ODdvKCFpP9=hKDHXXKO8_i5vK8Er9Q4xkEr33w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] initramfs-framework: handle kernel parameters with . inside
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
X-List-Received-Date: Wed, 02 Sep 2015 16:09:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Kernel parameters like "uvesafb.mode_option=640x480-32" were turned
> into shell variables named "bootparam_uvesafb.mode_option", which
> triggered errors from the shell because the name is not valid. Now
> points get replaced with underscores, leading to
> bootparam_uvesafb_mode_option in this example.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

