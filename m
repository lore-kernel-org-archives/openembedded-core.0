Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 55C2D601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 17:27:53 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id t59so2315418yho.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Aj4QjeDn/Dq4l9BhUI/SRCuasyfjwuV1ySp8abIN2J0=;
	b=jrTv2jDslIL0318zHFkhWYiYt3jVfYzPYAbsEa8XDoVDf86OeXHLG+lcb/WrdSpKrU
	+1v3D6ayubAAENNoEcryr0FTofvgobO2Lj4Qrk6qdtNDj8PdAvgtGh5MoqwQi0GtwxAi
	CilIOFQ1aFMOGy8szvO3OCS6soGHhnfb6LTGrUvoxmBGTeYa/Hs6dm2vwubULHMXQ4cg
	vQVdRTfWm0f42jdmbufAwaUXyRZi6FuWqICRRVpbtOfHI+xWXkB3u1fxM3HwfYAYUnS6
	JLcC3fyd3PdtHBAKSjnQ5VeBp9uBEDv1m2UeNAkyzbgQkq4LBpHYW0g6lLZ1Uk/Vc5av
	Q4rg==
MIME-Version: 1.0
X-Received: by 10.236.83.65 with SMTP id p41mr23981174yhe.78.1403803674262;
	Thu, 26 Jun 2014 10:27:54 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 26 Jun 2014 10:27:54 -0700 (PDT)
In-Reply-To: <1403218403-3303-1-git-send-email-denis@denix.org>
References: <1403218403-3303-1-git-send-email-denis@denix.org>
Date: Thu, 26 Jun 2014 14:27:54 -0300
X-Google-Sender-Auth: xX_gpwtOg2C6TcVXX66KCCZS__Q
Message-ID: <CAP9ODKr9phJYU2z5mZFHt7uN5S=kOZeVLopx3-xXpjx2zYHnMQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>, John Weber <rjohnweber@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Thu, 26 Jun 2014 17:28:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 19, 2014 at 7:53 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Make probing of "platform" bus conditional based on PROBE_PLATFORM_BUS
> variable from /etc/default/udev-cache on subsequent boots when udev
> cache is used. PROBE_PLATFORM_BUS has to be set to "yes" in order to
> force probing on every boot, otherwise it uses the old default behaviour
> of probing it just the first time.
>
> This is helpful on modern SoCs where most of the low level peripheral
> drivers are registered on the platform bus and need to be probed to load
> the necessary modules and enable the connected buses and subsystems.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

I second this as this fixes a issue in Wandboard in meta-fsl-arm as well.

John, this fix is equivalent to the one we had tested.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

