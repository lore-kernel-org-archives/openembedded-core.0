Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2E16DE01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 02:19:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBG2JTO4009301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 18:19:29 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 15 Dec 2013 18:19:29 -0800
Message-ID: <52AE636D.2060808@windriver.com>
Date: Mon, 16 Dec 2013 10:20:29 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1386903269.git.Qi.Chen@windriver.com>
	<ly38lw1xg3.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly38lw1xg3.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 0/2] Change the way of handling CONFFILES
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
X-List-Received-Date: Mon, 16 Dec 2013 02:19:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2013 01:18 AM, Enrico Scholz wrote:
> <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> As almost all files under /etc should be considerred as config files,
> A lot of projects (especially from the freedesktop edge) are (ab)using
> /etc to store non configuration files. E.g. all the dbus confguration or
> gconf schemes are not intended to be modified by users.
>

Thanks for your information.

To be frank, I'm not familiar with dbus.
But I think in such situations where some files under /etc are not 
configuration files, we can override the CONFFILES variable in those 
related recipes. And this work could be well handled by someone who's 
familiar with those recipes.

Note that this patch will not affect recipes that have already set the 
CONFFILES variable
Take dbus as an example. In dbus.inc, we have:
CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf 
${sysconfdir}/dbus-1/session.conf"

So the CONFFILES for dbus are not all files under /etc/, but only the 
two files listed above.

Best Regards,
Chen Qi

>
> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


