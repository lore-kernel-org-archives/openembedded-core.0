Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RYe2M-0007AN-Cd
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 14:29:22 +0100
Received: by wgbdt12 with SMTP id dt12so1458272wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 05:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4ejxB9w4amAbkS/80t8x1rZS1L3mRg26+Wdg+v3T6tY=;
	b=eF7bMQXUxSlajHR2zHA+dIiba4SdSc7cqR6sTDedDr48IBrNawi1iFjkxbEzXu76I6
	ctegwHN6Nd2Wt1HwEIaZQxRgi8uO1Z1vcNBGyXvQ8Vw0sGmFm54JDIXmd31+VkR67psU
	bIL1LwPis5/Luipu7lN80YQZr3HJJVj6k0gf0=
MIME-Version: 1.0
Received: by 10.180.81.163 with SMTP id b3mr5393564wiy.20.1323350552349; Thu,
	08 Dec 2011 05:22:32 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Thu, 8 Dec 2011 05:22:31 -0800 (PST)
In-Reply-To: <03a910e12b1619fc40345c2cfa31afb428bd777f.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<03a910e12b1619fc40345c2cfa31afb428bd777f.1323327959.git.xiaofeng.yan@windriver.com>
Date: Thu, 8 Dec 2011 14:22:31 +0100
Message-ID: <CAGiJk9f3t11NUCXeekteMe_V2O0R36b3pdzhJOGX3Dvq1nm9YA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] core-image-gtk-directfb.bb: add an image for gtk over directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 13:29:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2011/12/8 Xiaofeng Yan <xiaofeng.yan@windriver.com>:
[snip]
> +IMAGE_INSTALL +=3D "\
> + =C2=A0 =C2=A0 =C2=A0 ${POKY_BASE_INSTALL} \

I'm just curious, is this a legitimate OE-Core variable?


--=20
Regards
Samuel


