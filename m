Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 337 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Mar 2016 01:08:53 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6216E601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 01:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4DDAF352029D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 02:03:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id y70SpkbGIy2f
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 02:03:12 +0100 (CET)
Received: from [172.22.22.61] (55d44aa7.access.ecotel.net [85.212.74.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id F3D3635205E7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 02:03:11 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <1457473760-8486-1-git-send-email-nathangutzmann@gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56DF764F.204@opendreambox.org>
Date: Wed, 9 Mar 2016 02:03:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457473760-8486-1-git-send-email-nathangutzmann@gmail.com>
Subject: Re: [meta-oe][PATCH] nettle: The variable named p in the patch file was incorrectly named.
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
X-List-Received-Date: Wed, 09 Mar 2016 01:08:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Nathan,

On 08.03.2016 22:49, ngutzmann wrote:
> The variable in question should have been called ecc->p. The patch has been updated
> so that the compilation of the nettle recipe would complete successfully.
> 
> Signed-off-by: ngutzmann <nathangutzmann@gmail.com>
> ---
>  meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> index 1c4b9a9..a956f42 100644
> --- a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> +++ b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
> @@ -40,7 +40,7 @@ Index: nettle-2.7.1/ecc-256.c
>         u1 -= cy;
>  -      u1 += cnd_add_n (t, rp + n - 4, ecc->p, 3);
>  +
> -+      cy = cnd_add_n (t, rp + n - 4, p->m, 2);
> ++      cy = cnd_add_n (t, rp + n - 4, ecc->p, 2);
>  +      u0 += cy;
>  +      u1 += (u0 < cy);
>         u1 -= (-t) & 0xffffffff;
> 

looks good to me. However, I needed to lookup the commit where the
backport originated from, because the reason for exchanging m and p
isn't obvious at all without knowing the original commit. Maybe you
could include it in your commit message.

https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e3872e4550137209e3ce4d

Regards,
Andreas

