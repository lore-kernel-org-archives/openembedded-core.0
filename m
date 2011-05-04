Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QHd2S-0006eR-JX
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 16:26:52 +0200
Received: by gyf1 with SMTP id 1so437498gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=cHfDsd/D7KqZux5bXEBr1vFfbyTZ2AjjwUZftOvmp9I=;
	b=txGhMIBAI15Z3Lt9SShYRSpm+COUSHTkoZEYpR3jB2AwFnm6qQvt+i1mBmW1wiwwdT
	/DqL2FFHujxnu7DZX/Dsue5PLCqmowcHsYXJUMY9yE5Ai0LKmiwtDGa0mdcW4xIlaVuo
	7r0vQYL8vkMRJ6LgJ0xlNn/5WuTMSpmZH1z2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eeZH1JZI0wHVXvVCLb30IAwqAqFdOmVmyY3+ypyTSNVhpCc1VKxDoCBlE3ORyJtJZ0
	8cPg9fllOoYMqKqSarfqUqHWKbw9u1xtcrPBIJLINtAosdyk+ZZ4jAd8G9rIuJk6kHUI
	Czk0DyGDInSaSLueutzH57ArCJ2Weod2o4m+I=
MIME-Version: 1.0
Received: by 10.91.136.15 with SMTP id o15mr1117969agn.155.1304519052623; Wed,
	04 May 2011 07:24:12 -0700 (PDT)
Received: by 10.90.32.18 with HTTP; Wed, 4 May 2011 07:24:12 -0700 (PDT)
In-Reply-To: <1304518043.21461.154.camel@rex>
References: <cover.1304515719.git.ke.yu@intel.com>
	<1304518043.21461.154.camel@rex>
Date: Wed, 4 May 2011 16:24:12 +0200
Message-ID: <BANLkTinduv4VofN2=adDN2-HZozYTO45ew@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Wed, 04 May 2011 14:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/4 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Wed, 2011-05-04 at 22:05 +0800, Yu Ke wrote:
> > From: Yu Ke <ke.yu@intel.com>
> >
> > move the SRCREV from poky-default-revisions.inc to its corresponding
> recipe,
> > in this case, those non poky distro can also use its SRCREV.
> >
> > Pull URL: git://git.pokylinux.org/poky-contrib.git
> >   Branch: kyu3/srcrev-recipe
> >   Browse:
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/srcrev-recipe
> >
> > Thanks,
> >     Yu Ke <ke.yu@intel.com>
> > ---
> >
> >
> > Yu Ke (1):
> >   poky-default-revisions: move the SRCREV to recipe file
>
> Merged to master, thanks for resolving this issue! :)
>
> Cheers,
>
> Richard
>
> I would have preferred a more standardised placement of SRCREV.
Most of the time the SRCREV is before the PV, but not always (and sometimes
separated with an empty line and sometimes not).

Also there is at least one error introduced:

diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bbb/meta/recipes-devtools/yaffs2/
yaffs2-utils_cvs.bb
index 6171fe5..c729c7c 100644
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb<http://git.pokylinux.org/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb?h=kyu3/srcrev-recipe&id=d2e078aa046ae6c4f169695f546cf229db5be1f7>
+++ b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb<http://git.pokylinux.org/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb?h=kyu3/srcrev-recipe&id=c75b49ff5cfd10f5187af2b66a0a8d5513460374>
@@ -1,3 +1,4 @@
require yaffs2-utils.inc
PR = "r1"
+SRCDAT = "20071107"

That should be SRCDATE. There might be more of these, my eye just fell on
this one.

Frans

PS: speaking of yaffs2 utils: it could be considered to move to a somewhat
newer version (not that I care as I do not use yaffs2)

