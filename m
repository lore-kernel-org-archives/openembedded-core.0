Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id B4FEC74051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:33:18 +0000 (UTC)
Received: (qmail 27443 invoked by uid 1003); 16 Jun 2015 11:33:20 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@71.171.14.12)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Jun 2015 11:33:19 -0000
Message-ID: <55800977.5070800@balister.org>
Date: Tue, 16 Jun 2015 07:33:11 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433189842-17654-1-git-send-email-philip@balister.org>
In-Reply-To: <1433189842-17654-1-git-send-email-philip@balister.org>
Subject: Re: [PATCH 1/2] packagegroup-core-sdk.bb: Drop distcc from the core-sdk.
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
X-List-Received-Date: Tue, 16 Jun 2015 11:33:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ping

On 06/01/2015 04:17 PM, Philip Balister wrote:
> distcc has been used in the past to speed up native compile across
> several machines. This is less an issue on modern embedded systems.
> 
> Also, improvements in sdk generation have reduced the need for on target
> compile of large projects.
> 
> Since the distcc packages start a daemon at boot, drop it from the
> packagegroup to avoid having some slight runtime impact on systems
> installing an sdk.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index a41eada..9b26387 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -23,7 +23,6 @@ RDEPENDS_packagegroup-core-sdk = "\
>      findutils \
>      quilt \
>      less \
> -    distcc \
>      ldd \
>      file \
>      tcl"
> 

