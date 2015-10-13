Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 46EE465C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 5F679608E37
To: openembedded-core@lists.openembedded.org
References: <1443410880-19730-1-git-send-email-net147@gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <561D7EAB.5040001@collabora.co.uk>
Date: Tue, 13 Oct 2015 22:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1443410880-19730-1-git-send-email-net147@gmail.com>
Subject: Re: [fido][PATCH] systemd: add PACKAGECONFIG for qrencode
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
X-List-Received-Date: Tue, 13 Oct 2015 21:59:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/15 04:28, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Thanks Jonathan,

I've queued this change in my joshuagl/fido-next branch[1].

Regards,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next
> ---
>   meta/recipes-core/systemd/systemd_219.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index b972dd4..142bdb8 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -90,6 +90,7 @@ PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
>   PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>   PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
> +PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
>
>   CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
>   CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
>


