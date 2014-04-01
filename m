Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id AAA5462252
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:29:50 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so9407551vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XsfS4FSik/k84ab/3EPoerXVMtcx2rXQKTVXAfkkkLo=;
	b=tTmTPvyWN+L+L5r9DmBz51NFnkbq4t6Ll1hWpkCPQl2OLdUt+eSNCSGlCV4g2oeWya
	F2CQgWdSUo9wT5i6OrrWna7nGJiQ2Fa0+SAQrnF5mulm9JcWZ+wYKjdYQ679MZW6ebnE
	TRpX9r/3onKyYE+P0HI6SKH2O+Wrkd8ecknyyIeujWjO03Az6AhL/9VPuWmXEEena1gm
	HQXBjxAxx2acUF4LIvdXoeBOkpYthw5ZRe6IIowzq/Cuz8MSltfZDcE9uI0+veVSB3vo
	eJv9CcFXrOGduyrKgt4eAJw8B/hKbVbuHj8p3NOAW+fZb4dxdBLTCqj57oUdFcHx5y8/
	QgMA==
X-Received: by 10.221.29.137 with SMTP id ry9mr28693181vcb.6.1396355391545;
	Tue, 01 Apr 2014 05:29:51 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 1 Apr 2014 05:29:11 -0700 (PDT)
In-Reply-To: <1396313895-21200-1-git-send-email-denis@denix.org>
References: <1396313895-21200-1-git-send-email-denis@denix.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 1 Apr 2014 13:29:11 +0100
X-Google-Sender-Auth: pEKAhvnW4e6scyci2yEj7hmjEwY
Message-ID: <CANyK_8cu-czs-qmB1PJHosLt-TYnmu=u8F9J9ip1MmVZuE7zVA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Tue, 01 Apr 2014 12:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 April 2014 01:58, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> The latest commit in opkg-utils allows packages created by opkg-build to be read
> by dpkg-deb again.
>
> (Based on OE-Core master rev: 219944af2700ce9dbc425fac384cd32b0a802123,
> but all of the update-alternative fixes from master are skipped)
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 279cb74..fef0d13 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>  RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
>  RDEPENDS_${PN}_class-native = ""
> -SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
> +SRCREV = "c33b217016ee911718b10c9d57f9912935baf5a9"
>  PV = "0.1.8+git${SRCPV}"
>
>  SRC_URI = "git://git.yoctoproject.org/opkg-utils \
> --
> 1.9.1
>

Personally I would prefer rebasing the existing patch and fixing the
merge conflict, maintaining the patch author and existing sign offs
and adding your sign off to the end. I don't know if there's a policy
on this for Yocto Project.

I've Cc'd Robert Yang as he's the stable branch maintainer for Dora as
per https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

