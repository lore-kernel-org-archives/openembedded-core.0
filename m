Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TyNdz-0002iK-MO
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:19:09 +0100
Received: by mail-ob0-f182.google.com with SMTP id uo13so4752490obb.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 06:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=2N6KMgC+LJgjqqadvkDyRyNexjY/EyJ/liGdOIe94Nk=;
	b=i9beqNd87GCQ3IetMA1HXhGAIWCslirAflJ/qXKO3+EmEQAsAfym3XNhq3bIxsTFx8
	SmDyDAWMqOzpEUnmWcNAaII3Q4r/IeXkbG3RbAxA6OY6YOFmmo/mrr95OnBEYq0oligd
	Lazf3ywitc8yh+CRB8m+nMOC2IkWj6R1m1Y5XNM8KyOCagCx04/Erv9uX23Nf43vuCqG
	KjG2ft+p4jtQrVnEYB1Mb+PyJ44VKB+bgBm1MCECLXVX+vyY1lGBsdVQitdje9Sc6ND+
	QnNssLqSU4QMYmUI3P+xKF43YxG58pUX0ht1SUfKd/BzuCW8St3kzMsC8UN7Og+niFmw
	iMfA==
MIME-Version: 1.0
X-Received: by 10.60.31.8 with SMTP id w8mr1567763oeh.55.1359036214310; Thu,
	24 Jan 2013 06:03:34 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Thu, 24 Jan 2013 06:03:34 -0800 (PST)
In-Reply-To: <51013F96.80302@intel.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama> <51013F96.80302@intel.com>
Date: Thu, 24 Jan 2013 15:03:34 +0100
Message-ID: <CAGiJk9ca5XZXMamBFOr+syV08WK--2CYONS_0f=rCxrZkm+n-g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 14:19:09 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/24 Radu Moisan <radu.moisan@intel.com>:
>
> On 01/24/2013 03:48 PM, Martin Jansa wrote:
>>
>> On Thu, Jan 24, 2013 at 03:36:02PM +0200, Radu Moisan wrote:
>>>
>>> this fixes a service dependency issue;
>>> while graphical.target is the default mode, systemd
>>> will try to start display-manager.service which is not
>>> available.
>>
>> what about images with display-manager available?
>>
>>
>> meta-efl/recipes-efl/efl/entrance/entrance.service:Alias=display-manager.service
>>
>> meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in:Alias=display-manager.service
>>
>> meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service:Alias=display-manager.service
>>
>> ?
>>
>> Making this change in global PKG_ARCH recipe doesn't look correct (and
>> also missing Upstream-Status and SOB line).
>>
>> Cheers,
>>
> The problem goes both ways. If we leave it as it is, graphical.target as
> default, what about images that don't need a display manager, like
> core-image-minimal that is in particular the target, for the time being, for
> systemd integration.
>
> Radu

 ln -sf /lib/systemd/system/multi-user.target
/etc/systemd/system/default.target  ?




--
Regards
Samuel


