Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 269CD6AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 06:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 11CCE600318
Message-ID: <55826C52.6050004@collabora.co.uk>
Date: Thu, 18 Jun 2015 07:59:30 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP9ODKos=R6O6XtwYtUL+_KZaJz+WxD0YxGRHU5+Qqs1VOP-9A@mail.gmail.com>
In-Reply-To: <CAP9ODKos=R6O6XtwYtUL+_KZaJz+WxD0YxGRHU5+Qqs1VOP-9A@mail.gmail.com>
Cc: Randy Krakora <randy.krakora@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [for-fido] Valgrind fixes backporting
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
X-List-Received-Date: Thu, 18 Jun 2015 06:59:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/15 17:52, Otavio Salvador wrote:
> Hello folks,
>
> There are two patches which should be backported for fido:
>
> OE-Core: 53afa26655d0b5f75ef2dd6bccef76281a14655c
> OE-Core: 2fb0edcb47a14e47780d545f60885b36e71fca71
>
> This fixes the build issues some customers has been experiencing in
> Valgrind build.

Thanks, I've included both in my fido-next branch[1] which I'll be 
submitting as soon as it has passed an autobuilder run.

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

Regards,

Joshua


