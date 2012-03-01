Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S332I-0002Tu-IN
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 11:14:59 +0100
Received: by dald2 with SMTP id d2so656433dal.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 02:06:28 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.227.137 as permitted sender) client-ip=10.68.227.137; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.227.137 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.227.137])
	by 10.68.227.137 with SMTP id sa9mr581300pbc.29.1330596388353 (num_hops
	= 1); Thu, 01 Mar 2012 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZIx9dOXYI+PjGjvFgARiEMhbyuUK1rl0J113YW1QWFg=;
	b=MtWJcu81nxaDSIZWKF8VIAUK4W40+Rc9vGkpdnbmGniLszgUwcblguooK3hCFXOXfg
	iN/1I3q5fzXPNJBHU3N39zxbo70tCcIloy7Fcj/UmfhN1Gr5KKO44HXGQnWqJCqndm46
	c7B4dAa9taZu60Vl8TJkWueX7MHYhjpNnHxXM=
Received: by 10.68.227.137 with SMTP id sa9mr489758pbc.29.1330596388154;
	Thu, 01 Mar 2012 02:06:28 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id b4sm1717839pbc.7.2012.03.01.02.06.26
	(version=SSLv3 cipher=OTHER); Thu, 01 Mar 2012 02:06:27 -0800 (PST)
Message-ID: <4F4F4A20.9060406@gmail.com>
Date: Thu, 01 Mar 2012 02:06:24 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
In-Reply-To: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
Subject: Re: [PATCH] gdk-pixbuf: Pick up ${NM} from the environment.
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
X-List-Received-Date: Thu, 01 Mar 2012 10:14:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/27/2012 11:36 PM, James Limbouris wrote:
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  .../gdk-pixbuf-2.24.0/configure_nm.patch           |   19 +++++++++++++++++++
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 ++-
>  2 files changed, 21 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
> 
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
> new file mode 100644
> index 0000000..1697967
> --- /dev/null
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch
> @@ -0,0 +1,19 @@
> +At this stage of configure, ${NM} has already been correctly set.
> +This AC_PATH_PROG overwrites the correct path with a host path.
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> +
> +Index: gdk-pixbuf-2.24.0/configure.ac
> +===================================================================
> +diff -uNr gdk-pixbuf-2.24.0/configure.ac gdk-pixbuf-2.24.0.mod/configure.ac
> +--- gdk-pixbuf-2.24.0/configure.ac	2011-08-27 11:27:52.000000000 +0800
> ++++ gdk-pixbuf-2.24.0.mod/configure.ac	2012-02-28 14:48:36.481126410 +0800
> +@@ -147,7 +147,6 @@
> + AC_SYS_LARGEFILE
> + 
> + AM_PROG_AS
> +-AC_PATH_PROG(NM, nm, nm)

you could use AC_CHECK_TOOLS(NM, [$NM nm], nm)
here instead of deleting it


