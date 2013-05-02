Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXuRb-0005cP-UY
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 16:25:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r42E7IN5003969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 May 2013 07:07:18 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 2 May 2013 07:07:17 -0700
Message-ID: <51827314.8080007@windriver.com>
Date: Thu, 2 May 2013 09:07:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1367502902.14512.256.camel@phil-desktop.brightsign>
In-Reply-To: <1367502902.14512.256.camel@phil-desktop.brightsign>
Subject: Re: [PATCH] fs-perms.txt: Don't tinker with file modes in /usr/src/debug
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 14:25:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/13 8:55 AM, Phil Blundell wrote:
> Since 6775feb9fe935ab01fd9cae2b2d3fce5824a9a72 our local "copy" of the
> debug sources has in fact been hardlinked to ${S} and potentially other
> places too.  This means that any modifications we make to these files
> might have wider consequences than intended.
>
> Avoid this potential pitfall by telling fixup_perms() to leave the file
> modes in this directory alone.  No great harm will result from shipping
> debug sources with a mode other than 0644: if the mode was permissive
> enough for us to compile the sources in the first place then it must
> also be permissive enough for subsequent debugging.

I'm fine with this as long as the uid/gid is set to root.  (it is below)

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   meta/files/fs-perms.txt |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index ef44e26..becb85c 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -41,7 +41,7 @@ ${includedir}		0755	root	root	true	0644	root	root
>   ${oldincludedir}	0755	root	root	true	0644	root	root
>
>   # Cleanup debug src
> -/usr/src/debug		0755	root	root	true	0644	root	root
> +/usr/src/debug		0755	root	root	true	-	root	root
>
>   # Items from base-files
>   # Links
>



