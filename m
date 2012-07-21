Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SsaSP-0000oo-RI
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 16:14:57 +0200
Received: by qcad10 with SMTP id d10so2483386qca.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2012 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+QOBTn4Nwx9rv3X9VjLRZRu/NqF57EDZlCHd9AFNTnI=;
	b=TiftGLg6x7If6TFfp1J5xgOqWpk/2UZ6MqHHuHhc0pYAqb0sL4lXXkMka6j0VBET+Y
	f75epPj6fp+Bjvclj1pAyaPpk9H+HqWAoMxBxS8DmLqB3ud4ifRuVF6Ro0va+E7GUCvb
	vCCTDgpZujxVwQFerlPsd4nD0wfrNuFL1z0baa27wpHSursQriq+fJWI66Wxdah4nMUr
	3JAtxEvWsq7mLTFcVE9KKC4ff/IAgOwaLdC1OaDXbp7b9AuNu9K8jHYiIUkosS076O6S
	ck5I5i2BkTzzU/M0ARiIvnrPKpnT6WmeVTRNGm3LaLetbXaKA8JNImN33y+h36JzZUUQ
	uaaA==
MIME-Version: 1.0
Received: by 10.224.111.144 with SMTP id s16mr15316122qap.75.1342879412933;
	Sat, 21 Jul 2012 07:03:32 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 21 Jul 2012 07:03:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207210937520.12672@oneiric>
References: <alpine.DEB.2.02.1207210937520.12672@oneiric>
Date: Sat, 21 Jul 2012 10:03:32 -0400
Message-ID: <CADkTA4OwDUL7juQdSyPZ=vH0geQ6Ses2_ePLPPzq2_FEnH94zg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what's the point of the "defconfig" arg to check_branch?
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
X-List-Received-Date: Sat, 21 Jul 2012 14:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 21, 2012 at 9:44 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   in the createme() kern-tools utility:
>
> # checks and creates the branch that was indicated when creatme was
> # called. This branch is what is expected to contain the kernel content
> # being built
> check_branch() {
>         branch=$1
>         defconfig=$2   <-- ??????
>
>         ktgt=$branch
>
>         old_pwd=`pwd`
>         git show-ref --quiet --verify -- "refs/heads/$ktgt"
>         if [ $? -eq 1 ]; then
>                 if [ "$repo" == "external" ]; then
>                         git checkout -b $ktgt
>                 fi
>                 mkdir -p $meta_dir/cfg/scratch/obj
>         else
>                 # branch exists. Are we an 'external repo' ?
>                 if [ "$repo" == "external" ]; then
>                         git checkout $ktgt
>                 fi
>         fi
>
>         cd $old_pwd
> }
>
>   it doesn't seem like that second argument is being used, and i don't
> see anything in the log that explains it, but perhaps i just missed
> it.

It used to be used to propagate a defconfig into the build, but not
anymore. Just
a leftover at this point. A patch to remove it would be accepted :)

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


