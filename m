Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 6964375E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 12:17:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id F0E2B5188051
Message-ID: <1441109824.4029.4.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2015 13:17:04 +0100
In-Reply-To: <de1da1b1a976acc7a5412705149b832b9a17973d.1440111536.git.avery.brian@gmail.com>
References: <cover.1440111536.git.avery.brian@gmail.com>
	<de1da1b1a976acc7a5412705149b832b9a17973d.1440111536.git.avery.brian@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [FIDO PATCH 1/1] toasterconf: remove master as a branch option from fido release
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
X-List-Received-Date: Tue, 01 Sep 2015 12:17:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-08-20 at 16:04 -0700, brian avery wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> 
> Toaster isn't designed to be forward compatible. As such,
> a release cannot build releases newer then it.
> 
> Particularly, "fido" cannot build "master", so we remove
> "master" from the list of supported releases in "fido"
> 
> [YOCTO #8154]

Thanks Brian, this patch is queued in my fido-next branch[1].

Regards,

Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

> 
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> Signed-off-by: brian avery <avery.brian@gmail.com>
> ---
>  meta/conf/toasterconf.json | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
> index c8e42ef..ecd6a9f 100644
> --- a/meta/conf/toasterconf.json
> +++ b/meta/conf/toasterconf.json
> @@ -12,7 +12,7 @@
>              "name": "Local OpenEmbedded",
>              "sourcetype": "local",
>              "apiurl": "../../",
> -            "branches": ["HEAD", "master", "fido", "dizzy"],
> +            "branches": ["HEAD", "fido", "dizzy"],
>              "layers": [
>                  {
>                      "name": "openembedded-core",
> @@ -26,24 +26,18 @@
>              "name": "OpenEmbedded",
>              "sourcetype": "layerindex",
>              "apiurl": "
> http://layers.openembedded.org/layerindex/api/",
> -            "branches": ["master", "fido", "dizzy"]
> +            "branches": ["fido", "dizzy"]
>          },
>          {
>              "name": "Imported layers",
>              "sourcetype": "imported",
>              "apiurl": "",
> -            "branches": ["master", "fido", "dizzy", "HEAD"]
> +            "branches": ["fido", "dizzy", "HEAD"]
>  
>          }
>      ],
>      "bitbake" : [
>          {
> -            "name": "master",
> -            "giturl": "git://git.openembedded.org/bitbake",
> -            "branch": "master",
> -            "dirpath": ""
> -        },
> -        {
>              "name": "fido",
>              "giturl": "git://git.openembedded.org/bitbake",
>              "branch": "1.26",
> @@ -63,19 +57,10 @@
>          }
>      ],
>  
> -    "defaultrelease": "master",
> +    "defaultrelease": "fido",
>  
>      "releases": [
>          {
> -            "name": "master",
> -            "description": "OpenEmbedded master",
> -            "bitbake": "master",
> -            "branch": "master",
> -            "defaultlayers": [ "openembedded-core" ],
> -            "layersourcepriority": { "Imported layers": 99, "Local
> OpenEmbedded" : 10, "OpenEmbedded" :  0 },
> -            "helptext": "Toaster will run your builds using the tip
> of the <a href=\"
> http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded ma
> ster</a> branch, where active development takes place. This is not a
> stable branch, so your builds might not work as expected."
> -        },
> -        {
>              "name": "fido",
>              "description": "OpenEmbedded Fido",
>              "bitbake": "fido",
> -- 
> 1.9.1
> 

