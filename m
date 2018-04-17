Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5E572F42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 02:02:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3H22FAK007826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 19:02:15 -0700
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 16 Apr 2018 19:02:14 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CALbNGRQ6Av0QFfDdiAk7Hc+9Tqoa7Zz0CTu-uigtfa=MLk93CA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b3c4df1f-602c-af55-5d64-5b0498ca3d53@windriver.com>
Date: Tue, 17 Apr 2018 10:03:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ6Av0QFfDdiAk7Hc+9Tqoa7Zz0CTu-uigtfa=MLk93CA@mail.gmail.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: musl patches
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
X-List-Received-Date: Tue, 17 Apr 2018 02:02:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/16/2018 07:05 PM, Andreas Müller wrote:
> Hi,
>
> I am not happy plastering patches around for musl. This gets even
> worse when I see patches like this [1]: Just wipe away security checks
> unconditionally - the developers did introduce this check not just for
> fun I guess...
>
> I have seen this already elsewhere so: musl maintainers please take
> care not to modify code for glibc!
>
> [1] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>
> Andreas

Hi Anreas,

I can see I rebased this patch. So I think I need to reply.

I agree with you that musl related patches should not affect glibc.
How about we using something like SRC_URI_append_libc-musl to organize 
the musl related patches?
Or do you have some other suggestion?

Best Regards,
Chen Qi

