Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E686D65C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 15:17:07 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x7so7216359vka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=WapYFjNH/a525DfeKFiHd2bSxzeYj+NiT2RyI0eQa9c=;
	b=Uzsr34PZYU2KHKtUbyHxsfith3iTs9RVEWeVnKV0cW1zJSqoDlXCyDBwdgaGFl8g6O
	GV0cpZDAkweD7pVTBDHTKl0/MRvQGr1fHnaOjTZGZo/OgVzds0Vpp24DzGpkT+VQcUcB
	bUHgTAHtbCP8XMU0MXhE2OVN0G6qikHNrA+7H/gHAmC4tR708v8tASGazwINaEH+/rWP
	pVUr6/Hs1G36Mdcmk8vZMyvozevvlSF4YmHMS5pAK0YvHqVC2m6D3+IO1yYuHJ7XYryB
	zyG6YAxdAKSlKaH7vCfY+nvi8TCYmNcy9+Ipu83bxUpoi+3faO39n3Z8CQkwB9y/GGjl
	4K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=WapYFjNH/a525DfeKFiHd2bSxzeYj+NiT2RyI0eQa9c=;
	b=eL53VRUHdUP/hPK7Q/9hvNrRJXrWpVU6lLDU5q19KH4HsGmC6P/XjpLH+ro4p6xAsR
	0xu3YV6Ur41OPlbVoIQQbIIZsFgq+TKh+y3KKdRMbo7Tj6IUt000IktST35+HRVeDIbd
	/sGhRl9RNuwe2SvL9+bLIb9x57oie+P1ZY/b28lbngGkCgmpGrXRz9Cyi8HEpNo8Zk/0
	KM19iieWijMrizc9YmIagzHADPaDHq9xUfrFXoPY3rt9mSK4tjrOXHtYp8ohgira79Cy
	WjvDZAg5FN1vnyTyIyqUgec1yTVsNyxm01SWXht6KKgG4s1HqUGqdrOHcN3snSzs2f3d
	y05w==
X-Gm-Message-State: ALyK8tISUyuHVp2TpsUCWTtHvSagYkcIeGkCNST7I1wbUpemKrv8gxJ4LvDvruvzTgC5uA==
X-Received: by 10.31.64.76 with SMTP id n73mr16217437vka.42.1466695027348;
	Thu, 23 Jun 2016 08:17:07 -0700 (PDT)
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com.
	[209.85.213.48])
	by smtp.gmail.com with ESMTPSA id 73sm236041uau.2.2016.06.23.08.17.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 08:17:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f48.google.com with SMTP id d185so110759380vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:17:06 -0700 (PDT)
X-Received: by 10.159.53.102 with SMTP id o93mr15897302uao.131.1466695025712; 
	Thu, 23 Jun 2016 08:17:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Thu, 23 Jun 2016 08:17:04 -0700 (PDT)
In-Reply-To: <888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
	<888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
Date: Thu, 23 Jun 2016 12:17:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqwCeVEqnKvBy+YNTjJV8fK80cxe4G1ZgUPhWQEAvvWzg@mail.gmail.com>
Message-ID: <CAP9ODKqwCeVEqnKvBy+YNTjJV8fK80cxe4G1ZgUPhWQEAvvWzg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] systemd: upgrade to 230
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
X-List-Received-Date: Thu, 23 Jun 2016 15:17:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 23, 2016 at 5:16 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Patches are rebased or removed for the latest version.
>
> 'python' is added to RDEPENDS of systemd-ptest.
>
> systemd-bootchart is now seprated from systemd, thus removing the
> related configuration items.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

The bootchart addition should, ideally, be done in this very same
commit so we know when this happened and why


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

