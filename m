Return-Path: <denis@denix.org>
X-Greylist: delayed 3617 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Apr 2016 20:10:55 UTC
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by mail.openembedded.org (Postfix) with ESMTP id C769262136
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 20:10:55 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00KR7BXE0770@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2016 14:10:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=Q4-j1AaZAAAA:8
	a=jiHmyLG-MPVS2z5qf5EA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 17bc3572; Tue, 12 Apr 2016 19:10:26 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C0872161F9A; Tue,
	12 Apr 2016 15:10:25 -0400 (EDT)
Date: Tue, 12 Apr 2016 15:10:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Dan McGregor <danismostlikely@gmail.com>
Message-id: <20160412191025.GZ16135@denix.org>
References: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
	<1460485532-13735-3-git-send-email-danismostlikely@gmail.com>
MIME-version: 1.0
In-reply-to: <1460485532-13735-3-git-send-email-danismostlikely@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] git: update to 2.8.1
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
X-List-Received-Date: Tue, 12 Apr 2016 20:10:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Passing -M parameter to git format-patch in this case would make better 
result.


On Tue, Apr 12, 2016 at 12:25:32PM -0600, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/git/git_2.7.2.bb | 11 -----------
>  meta/recipes-devtools/git/git_2.8.1.bb | 11 +++++++++++
>  2 files changed, 11 insertions(+), 11 deletions(-)
>  delete mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
>  create mode 100644 meta/recipes-devtools/git/git_2.8.1.bb
> 
> diff --git a/meta/recipes-devtools/git/git_2.7.2.bb b/meta/recipes-devtools/git/git_2.7.2.bb
> deleted file mode 100644
> index 3fd7151..0000000
> --- a/meta/recipes-devtools/git/git_2.7.2.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require git.inc
> -
> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> -                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> -                 "
> -EXTRA_OEMAKE += "NO_GETTEXT=1"
> -
> -SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
> -SRC_URI[tarball.sha256sum] = "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
> -SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
> -SRC_URI[manpages.sha256sum] = "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
> diff --git a/meta/recipes-devtools/git/git_2.8.1.bb b/meta/recipes-devtools/git/git_2.8.1.bb
> new file mode 100644
> index 0000000..8978b72
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git_2.8.1.bb
> @@ -0,0 +1,11 @@
> +require git.inc
> +
> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> +                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> +                 "
> +EXTRA_OEMAKE += "NO_GETTEXT=1"
> +
> +SRC_URI[tarball.md5sum] = "1a12555182c1e9f781bc30a5c5f9515e"
> +SRC_URI[tarball.sha256sum] = "cfc66324179b9ed62ee02833f29d39935f4ab66874125a3ab9d5bb9055c0cb67"
> +SRC_URI[manpages.md5sum] = "60552f15a90b9fcdc1b92b222e2d2379"
> +SRC_URI[manpages.sha256sum] = "df46de0c172049f935cc3736361b263c5ff289b77077c73053e63ae83fcf43f4"
> -- 
> 2.8.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

