Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id F34DC6FF24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:58:50 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Mon, 7 Jul 2014
	12:58:45 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id CF551288F30;
	Mon,  7 Jul 2014 12:58:45 +0200 (CEST)
Date: Mon, 7 Jul 2014 12:58:45 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140707105845.GA43212@sestofb10.enea.se>
References: <1404470990.4852.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1404470990.4852.1.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Update minimum git version to 1.7.8
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
X-List-Received-Date: Mon, 07 Jul 2014 10:58:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Fri, Jul 04, 2014 at 11:49:50AM +0100, Richard Purdie wrote:
> To quote "Maxin B. John" <maxin.john@enea.com>:
> 
> git version 1.7.8 added the --list option to git-branch. Since we depend on this
> option in git.py, the minimum requiremnt for git should be updated to Git
> 1.7.8+
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 4b42b17..ed65814 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -386,15 +386,15 @@ def check_tar_version(sanity_data):
>          return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
>      return None
>  
> -# We use git parameters and functionality only found in 1.7.5 or later
> +# We use git parameters and functionality only found in 1.7.8 or later
>  def check_git_version(sanity_data):
>      from distutils.version import LooseVersion
>      status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
>      if status != 0:
>          return "Unable to execute git --version, exit code %s\n" % status
>      version = result.split()[2]
> -    if LooseVersion(version) < LooseVersion("1.7.5"):
> -        return "Your version of git is older than 1.7.5 and has bugs which will break builds. Please install a newer version of git.\n"
> +    if LooseVersion(version) < LooseVersion("1.7.8"):
> +        return "Your version of git is older than 1.7.8 and has bugs which will break builds. Please install a newer version of git.\n"
>      return None
>  
>  # Check the required perl modules which may not be installed by default

Ah, I missed this part. Thanks for updating it!

Reviewed-by: Maxin B. John <maxin.john@enea.com>

Best Regards,
Maxin

