Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0716C8EC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 09:23:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8M9NXJ6003661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Sep 2013 02:23:33 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 22 Sep 2013 02:23:31 -0700
Message-ID: <523EB711.3030904@windriver.com>
Date: Sun, 22 Sep 2013 17:23:29 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1379038097.git.Qi.Chen@windriver.com>
	<5623d6e9d394f968e15d165d65ce3748008be05d.1379038097.git.Qi.Chen@windriver.com>
	<523E6042.8080403@windriver.com> <1379839497.18603.203.camel@ted>
In-Reply-To: <1379839497.18603.203.camel@ted>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: do not automatically remove update-rc.d
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
X-List-Received-Date: Sun, 22 Sep 2013 09:23:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2013 04:44 PM, Richard Purdie wrote:
> On Sun, 2013-09-22 at 11:13 +0800, ChenQi wrote:
>> ping
> I replied to this:
>
> """
> This is not correct. The correct behaviour here is to uninstall these
> packages *if* they are installed. Just removing it from the list is not
> the real fix.
> """
>
> and I stand by that feedback.
>
> Cheers,
>
> Richard
>
>
>

Thanks.
I'll send out a new patch.

Best Regards,
Chen Qi

