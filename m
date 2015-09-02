Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC327704C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:19:39 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so29353185igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=le1PiszZjvHZah4JU9y2UCbRIHvP0awrWzT0qMHRHg0=;
	b=ZWDxoO1VS1u4W6YxDbdbrpEToTWDpuXJGquYkSclL9JlVGId0RqapFNuYNSReh0mjs
	g9ytLFiee/0qwPawgk659QNE/IhJWu2+b0X18zVnCtKewMsxNqS6yaG5PNex8FauwOhV
	hihqr7av7AjJ+YbovvvN4oOUXEkg8SXU+2DCnsoRaez9ejuWbKxnvv8L2IVeU7RMbkJZ
	qx7B9FX+Tu0HW2gCV8O3qrcARQao15TcQkYj2yjQ9WmonyBs5MTZx7valC/2n43r/Z9d
	PU0XJiC+jARM8cfYE3FuGn43+L5jIj1Ta/zSG4RKwF+11Q6f1igADMdXUFWalkv8Mlxi
	rLww==
X-Gm-Message-State: ALoCoQnURIZ9XnjaO7UBV6nSk7NtklOQHmbiqCj5TXWtkex4QBfS+yIiqr8qLkGyNkWwL863Gd7A
X-Received: by 10.50.112.227 with SMTP id it3mr4152680igb.93.1441210780067;
	Wed, 02 Sep 2015 09:19:40 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177])
	by smtp.gmail.com with ESMTPSA id oo2sm2522356igb.6.2015.09.02.09.19.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:19:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so26266797iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:19:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.14.145 with SMTP id 139mr32809171ioo.37.1441210778818;
	Wed, 02 Sep 2015 09:19:38 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 09:19:38 -0700 (PDT)
In-Reply-To: <784e52fcd898a07a12236058026fd48d0e01c8b7.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<784e52fcd898a07a12236058026fd48d0e01c8b7.1441207840.git.patrick.ohly@intel.com>
Date: Wed, 2 Sep 2015 13:19:38 -0300
Message-ID: <CAP9ODKpmtON87ZkXHP=gecSznBK_GXFAa=gAkicU2p2WV8qavg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] initramfs-framework: support mounting rootfs in modules
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
X-List-Received-Date: Wed, 02 Sep 2015 16:19:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> The "finish" script always expected to mount the rootfs itself if the
> "root" parameter was set. Now it checks first whether the rootfs
> directory is still empty (using /dev as indicator, because that was
> already expected to be present in a supported rootfs) and skips that
> step if non-empty.
>
> This allows modules to implement their own rootfs handling.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

I think this should not be applied as is. Anything doing the rootfs
mapping should set the proper parameters so we don't have multiple
rootfs mounting code duplicated.

If there is any limitation please share the use case so we can
understand the need for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

