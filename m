Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 80529786B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 20:31:12 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id h6so16900558oia.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=MBT9itv6tWQPal2BuuUoQA6PTNocQMl4Jg+jXHIqEVI=;
	b=g057Z50QwLaHkom3PrFlxqNIp5FBLdOPwc3VBSRefTHtmC93p9AgO8jXbrZycklioH
	VUPTr3+oPNhKnPKA0rOIwpcqwkpA4CkWWU4nDkv0rA5yoNqNMGzqy0ONoOMEeU7MDjpV
	Mhb66mXoy1GiHsjyQseu1X791b1e995DF32QMdMu3/cVHbWn1469ujaxgG1FQdG+7gFE
	2wEJgCxmEH1IPN79qmcdJzOPIOG+kDwfVSCCBeEMw4Bqt6Owyd/XDwH1Qxs4e2sVvSdb
	6YyfW4EjTytWmoT6fFXDR7qj9nu20zMOQvHAREx3qqpxoI6T9VXO6MXvMdzk7RuGn7aP
	1Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=MBT9itv6tWQPal2BuuUoQA6PTNocQMl4Jg+jXHIqEVI=;
	b=PmPHLSoq54nqHMWxQMLgvyN2lOsMNpOb7c/j7kRrpmmUmnJKPiv2hM2fbklQBL8ct3
	FzGe+XYiKH6xj1NfaTuwnz8ZlgjFc6X4grd7zgA0qegdRVMw3WZMXSSnGIyyjuL7sHja
	Yi85JwMz938GQB94qM/hUaHOhR819fyhPln54qG9rypH1wd/ibh8mhshYbc7mU010To/
	c2zD6AqlV3Fo8dnZ8Ef/pWpBZuLBaCmRMIApkU0W+zk8Bevl286Wvq2ira9e/wBhz+i7
	8iuDjlpi4i3h2vnEoQ3Ry3ZDigewRXSpZCDIdDqGEDYQHCdg84XYAc5ZqNw/Psuig7WE
	rzQg==
X-Gm-Message-State: AJaThX6lF0v5LiZkNy/nEgvOQAtQf7XQHtUz+vm/bR0YjmMZvQEwH1zt
	I8L+03psHZr33+DioevvSXkkDOsB
X-Google-Smtp-Source: AGs4zMbI7wExJJgqTHl9kn2ioJ4bp3VKPQ6BEdI6gmY76IZfbQgxAT02WJEiJirZnUwuryEqrt1K/w==
X-Received: by 10.202.6.197 with SMTP id 188mr10409897oig.30.1510777873084;
	Wed, 15 Nov 2017 12:31:13 -0800 (PST)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47]) by smtp.gmail.com with ESMTPSA id
	q51sm4022770otb.71.2017.11.15.12.31.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 12:31:11 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id y206so15650010oiy.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:31:11 -0800 (PST)
X-Received: by 10.202.83.131 with SMTP id h125mr10562901oib.329.1510777870875; 
	Wed, 15 Nov 2017 12:31:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 15 Nov 2017 12:31:10 -0800 (PST)
In-Reply-To: <20171114212050.15881-2-california.l.sullivan@intel.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171114212050.15881-2-california.l.sullivan@intel.com>
Date: Wed, 15 Nov 2017 18:31:10 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoZkR3WBV1nG9pCT62zejb=3KKU-=haw4N2DYQXhwspCg@mail.gmail.com>
Message-ID: <CAP9ODKoZkR3WBV1nG9pCT62zejb=3KKU-=haw4N2DYQXhwspCg@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Saul Wold <saul.wold@intel.com>, "Bruce, Henry" <henry.bruce@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] initramfs-module-install-efi: point to original copy and delete new file
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
X-List-Received-Date: Wed, 15 Nov 2017 20:31:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 7:20 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> There is no need to maintain two of the exact same files.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Please also queue this for rocko backport. It seems a good fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

