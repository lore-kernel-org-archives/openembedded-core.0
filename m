Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SPI5y-0003Yn-QQ
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:46:43 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 May 2012 11:35:53 -0700
Received: by yhpp61 with SMTP id p61so2176595yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 11:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=T2kyrvug+1Byr0BOvBC/qDN8cj19JHDkaWRyj6ZqQI0=;
	b=ge/Cok0JzXT9nszCa/sOVmW1jB+SJi7pFHRg+Tkqp68e711DkmP63U/m7zyqx6X/4U
	9ZAqbM7hBdWFORCAexCyKEtQjmKwKJKT/Mn6ulSUV+hs7tMlvh3LDSN+sT8tLy2zG99f
	aWg5Axydr4vdpHZRWADh3pMlACpmBu0aSMqH5XZtqNZRwpvZ7f2qiOsiIhTbV8GQcsTS
	S2CdkwiIH8ORtQpE4SuMXRAHyzqRNZ5rA8BopR/TDocwI3DwT2FOB0M3JhgEJUaBGTKO
	uDi9ZmZlPA188rj5Od1WxWs+AydPpZwZqClTWiVyQ3D2Q6gzzZVOuUVeRbI6SG0LbtIn
	atzg==
Received: by 10.68.231.10 with SMTP id tc10mr2069845pbc.126.1335897351962;
	Tue, 01 May 2012 11:35:51 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id nv2sm10139192pbb.6.2012.05.01.11.35.49
	(version=SSLv3 cipher=OTHER); Tue, 01 May 2012 11:35:50 -0700 (PDT)
Message-ID: <4FA02D04.1020501@intel.com>
Date: Tue, 01 May 2012 11:35:48 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335519550.git.kai.kang@windriver.com>
In-Reply-To: <cover.1335519550.git.kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQm6ublQfLKLQvxshTDblDGxhl6u/lPwmxP3tSJuY/cULvZWiBlUvvBPxKjXsvMOG7+UjGWT
Subject: Re: [PATCH 0/1] Update alsa-tools to 1.0.25
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
X-List-Received-Date: Tue, 01 May 2012 18:46:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2012 02:41 AM, Kang Kai wrote:
> Hi Saul,
>
> This update alsa-tools to 1.0.25.
>
> Regards,
>
> The following changes since commit 492a58cabdc053b2312712681dbcffa8270d4ea4:
>
>    self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:21:11 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/update-alsa-tools
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-alsa-tools
>
> Kang Kai (1):
>    alsa-tools: update to 1.0.25
>
>   .../autotools.patch                                |    0
>   ...alsa-tools_1.0.24.1.bb =>  alsa-tools_1.0.25.bb} |   10 ++++++----
>   2 files changed, 6 insertions(+), 4 deletions(-)
>   rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 =>  alsa-tools-1.0.25}/autotools.patch (100%)
>   rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb =>  alsa-tools_1.0.25.bb} (73%)
>

Merged into OE-Core

Thanks
	Sau!


