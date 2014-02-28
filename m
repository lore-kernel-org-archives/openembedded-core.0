Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D25016E74C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 12:47:11 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 28 Feb 2014 13:47:10 +0100
Message-ID: <53108546.1090508@enea.com>
Date: Fri, 28 Feb 2014 13:47:02 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>,
	<openembedded-core@lists.openembedded.org>
References: <1393503455-17642-1-git-send-email-alexandru.sardan@freescale.com>
In-Reply-To: <1393503455-17642-1-git-send-email-alexandru.sardan@freescale.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux target.
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
X-List-Received-Date: Fri, 28 Feb 2014 12:47:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-02-27 13:17, Alexandru-Cezar Sardan wrote:
> [ADT bug #5761] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=5761
>
> Also this patch adds symlinks to libgcc such that a GCC configured
> by passing the target parameter without LIBCEXTENSION and ABIEXTENSION
> specifiers to find the correct startup files from a libgcc configured
> with these variables.
>
> Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
>   ...AltiVec-generation-on-powepc-linux-target.patch |   42 ++++++++++++++++++++
>   meta/recipes-devtools/gcc/libgcc.inc               |   24 ++++++++++-
>   3 files changed, 66 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>

+1

I hope this patch will be considered for dora as well as long as we dont 
see any issues with it.

Br,
David


