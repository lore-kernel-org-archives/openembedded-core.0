Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90B9B75055
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 01:51:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4A1pptY001880
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2018 18:51:52 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 9 May 2018 18:51:51 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1524043165.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2bce535c-47d3-2851-9035-407f9ab4367b@windriver.com>
Date: Thu, 10 May 2018 09:53:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1524043165.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 0/1] cross-canadian: fix do_configure failure when switching machine and multilib
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
X-List-Received-Date: Thu, 10 May 2018 01:51:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

I've used this patch locally for a few weeks. It works well and does not 
cause any new problem.

Best Regards,
Chen Qi

On 04/20/2018 10:05 AM, Chen Qi wrote:
> The following changes since commit d012a9acdc3dce014705224a1261145628e75931:
>
>    scripts/test-dependencies.sh: remove (2018-04-13 16:58:07 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/cross-canadian-mlprefix
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cross-canadian-mlprefix
>
> Chen Qi (1):
>    cross-canadian: fix do_configure failure when switching machine and
>      multilib
>
>   meta/classes/cross-canadian.bbclass | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>


