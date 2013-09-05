Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 37606615E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 01:16:22 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id er7so1272501obc.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 18:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=t40PFgBxuH2JVz43DCcqwwh6WF3OJn+s8VLKwpwAJcg=;
	b=oHnDmWV672D7hUpSigRL6KqowJo+WsUk5+vJ1Odd5W0Cer1V/UF2jfve/5f3BwFdpi
	D1YixatwyigbkGkvN46vI5ZZnCPVXYM6fh4i6k5nrXHrWi0TdF6LH98ZYzmm+4e7whUO
	Sb89hBT3ZCEN9fshg9n+wxfzNf0VeYtZe1/Fo67exNd1JInZw0Cz4oQogIBjlg1hEaGg
	XjPi0DDUOa3nSLpaqMpgiK2P1qhEY0+OPHinQQeUWunHZsI6Bc0aNKznaxX7zsNCd3Ru
	gz7O8hXyV+eash8rA52xW3mRF6AueSYmFeugWqj4kbymyvHqnOX1vjIF2uhQVuaBN2Oe
	H55A==
MIME-Version: 1.0
X-Received: by 10.60.70.134 with SMTP id m6mr4437185oeu.14.1378343783391; Wed,
	04 Sep 2013 18:16:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 18:16:23 -0700 (PDT)
In-Reply-To: <cover.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
Date: Wed, 4 Sep 2013 22:16:23 -0300
X-Google-Sender-Auth: Q5M_zCy71zh5WbLf12zJtm00gGI
Message-ID: <CAP9ODKou8KFNUVjjMq7wcY8wJ5m-rh4YGpuFTA_JugiSis7dEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, yunguo.wei@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Updates in support of genericx86*
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
X-List-Received-Date: Thu, 05 Sep 2013 01:16:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> As this series bridges both oe-core and poky and is best viewed as one series, I
> opted to send the series to both lists.
>
> These patches address bugs/feature requests for additional support of
> linux-firmware and xorg-video-* drivers for the new meta-yocto-bsp genericx86
> and genericx86-64 machines.
>
> Some of the oe-core changes could be contained in the meta-yocto-bsp layer, but
> as these changes come from meta-intel, they are needed by multiple layers, and I
> felt it might make more sense in oe-core. If people object to the mga or intel
> xserver video drivers, I can respin those for meta-yocto-bsp.

QEMU does not need them so they should be in meta-yocto-bsp.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

