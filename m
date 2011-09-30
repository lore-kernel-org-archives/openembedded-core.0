Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9b93-0005d2-Nq for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:20:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBLeSt013220 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:21:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QFVYchFM9BaE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:21:40 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBLZYi013205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:21:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:15:09 +0100
In-Reply-To: <f7457ea8882ead3006149cc3943c0d68079d233b.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<f7457ea8882ead3006149cc3943c0d68079d233b.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317381315.12332.157.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 12/13] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Fri, 30 Sep 2011 11:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/glx-use-tls.bbclass |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/glx-use-tls.bbclass
> 
> diff --git a/meta/classes/glx-use-tls.bbclass b/meta/classes/glx-use-tls.bbclass
> new file mode 100644
> index 0000000..7530872
> --- /dev/null
> +++ b/meta/classes/glx-use-tls.bbclass
> @@ -0,0 +1,7 @@
> +def get_tls_setting(bb, d):
> +    # until we have no prober TLS support in uclibc disable it
> +    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
> +        return ""
> +    return "--enable-glx-tls"
> +
> +EXTRA_OECONF += "${@get_tls_setting(bb, d)}"

How many recipes actually use this? Shouldn't it really be a mesa
include file?

Cheers,

Richard



