Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBJ5G-0008T0-Mh
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:32:26 +0200
Received: by iaky10 with SMTP id y10so105186iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dXi8e/eLRn2hbypiOb7dAC0p/6vE7+dAD2ozcH/TdVU=;
	b=B0q4jOhR9D0KAwzWw6d08Wvhw2e2Rh0JS/WGueKF7vPIiEjTBF6zrVDxwUGmfhcaXH
	k5zPjatVqnb/4OHzUYLCIOW7KKWskp2mluxgnyPi6StJ7thCgR5RTFOljFKCA8sSn+Vo
	WX/vAislP6nuxPWVNEU0iFiXDC/AS6gXCgjdN4DCIraw9g4sTdKC6waCXxba3DtwZoxg
	PVfEQaddW9s9xZE718ssgd5gGPHIGhZ8EJBSyvbZ1lSm8Fej8dUuPgtkpcbrmnEvRlRF
	LxRLYZ9wSNDSjlxlg6htetSXgyehQBO2tAJmZUxLwBNHx6V86/3VNdS8XWK12ZjTzBd5
	6J7Q==
Received: by 10.50.183.135 with SMTP id em7mr10052448igc.31.1347340795842;
	Mon, 10 Sep 2012 22:19:55 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id aa4sm704814igc.15.2012.09.10.22.19.53
	(version=SSLv3 cipher=OTHER); Mon, 10 Sep 2012 22:19:54 -0700 (PDT)
Date: Mon, 10 Sep 2012 22:19:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Message-ID: <20120911051948.GB3035@sakrah.homelinux.org>
Mail-Followup-To: Kang Kai <kai.kang@windriver.com>, sgw@linux.intel.com,
	Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
References: <cover.1347329133.git.kai.kang@windriver.com>
	<824dcd67b7a31144bd46e58837cbd0f311bb7fa9.1347329133.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <824dcd67b7a31144bd46e58837cbd0f311bb7fa9.1347329133.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] packagegroups-core-lsb: add perl-dev/doc
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
X-List-Received-Date: Tue, 11 Sep 2012 05:32:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/09/12 13:00), Kang Kai wrote:
> File CORE/config.h which is provided by perl-dev and file
> unicore/version which is provided by perl-doc are required by LSB perl
> test cases.
> 
> Add perl-dev and perl-doc to packagegroups-core-lsb.

hmm adding -dev and -doc to core packaggroups seems like we are wanting
developement packagegroups which does not seem correct.

why dont we move CORE/config.h into perl proper itself since the header
is really in /usr/lib its not a typical dev header and unicore/version
should belong to perl or perl-modules as well

> 
> [Yocto #3052 #3053 #3054 #3055]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../packagegroups/packagegroup-core-lsb.bb         |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index 32dc58e..cee97bc 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -168,6 +168,8 @@ DESCRIPTION_packagegroup-core-lsb-perl = "Packages required to support libraries
>      specified in the LSB Runtime languages specification (Perl parts)"
>  RDEPENDS_packagegroup-core-lsb-perl = "\
>      perl \
> +    perl-dev \
> +    perl-doc \
>      perl-modules \
>      perl-misc \
>      perl-pod \
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


