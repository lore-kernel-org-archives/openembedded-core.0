Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJ9eT-00032g-Rt
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:00:42 +0200
Received: from mail-ww0-f42.google.com ([74.125.82.42])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 12:54:40 -0700
Received: by wwn22 with SMTP id 22so7085330wwn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 12:54:39 -0700 (PDT)
Received: by 10.216.205.159 with SMTP id j31mr8903163weo.80.1319658879584;
	Wed, 26 Oct 2011 12:54:39 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id ff6sm5080655wbb.10.2011.10.26.12.54.38
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 12:54:38 -0700 (PDT)
Message-ID: <4EA8657D.5080803@intel.com>
Date: Wed, 26 Oct 2011 21:54:37 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111021112625.GQ3522@jama.jama.net>
	<1319202681-3972-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1319202681-3972-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] subversion-1.6.15: add native support too
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
X-List-Received-Date: Wed, 26 Oct 2011 20:00:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 03:11 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../subversion/subversion_1.6.15.bb                |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> index 9a9484f..d3c7392 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> @@ -5,6 +5,8 @@ RDEPENDS_${PN} = "neon"
>   LICENSE = "Apache-2"
>   HOMEPAGE = "http://subversion.tigris.org"
>
> +BBCLASSEXTEND = "native"
> +
>   PR = "r1"
>
>   SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \

Pulled this one also into OE-Core

Thanks
	Sau!


