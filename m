Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TOrYA-00040u-AT; Thu, 18 Oct 2012 16:58:18 +0200
Received: by mail-vb0-f47.google.com with SMTP id ez10so8894102vbb.6
	for <multiple recipients>; Thu, 18 Oct 2012 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=7MvLChdzWQ04GZxmoWTo2yHNbWNC61orrNTDfXElSsM=;
	b=yt0gdaQXyDFwiJ36+brgyeCxRI8BiyMu1FxKeLfpt8Y7prGJqiKl+N2nlQ9hu0oaLU
	isbnZFZNST2nQbox4XaxJkiBcwHJLgclCck1disF9oWgHjWPUKnPP+FmIlgKGRkbaq1W
	pUUM4y/6bGqe2zbE2IpNKvqSu4CPom+JVeyUO20TL3zO0z31CZyWHpZ0uHMu7QbySaE1
	6mBHxdrvmudaTnCGFx1Hvr0kdPSulzefihjcAMXWJQTfzLzKG64ESAIty8W/QdRKSYLK
	Yxog0A/eYXgkJQKVrcmYEgYNIm1FC0HIMW4DpfpfIDu9yfE4v+iD/lN8ayFbN1h68590
	uywg==
MIME-Version: 1.0
Received: by 10.220.142.79 with SMTP id p15mr5649000vcu.71.1350571498140; Thu,
	18 Oct 2012 07:44:58 -0700 (PDT)
Received: by 10.58.248.201 with HTTP; Thu, 18 Oct 2012 07:44:57 -0700 (PDT)
In-Reply-To: <1345239937.27428.23.camel@ted>
References: <20120817170922.097651032F@opal>
	<CALbNGRRGxF518Vo933R8tLFU8yTbw8XBfFZQox93kr0m2ACJ_A@mail.gmail.com>
	<CALbNGRTG3z_p0=wjqhvqy-xcm5F6qdgqa4xPzfVvDqzbPODFCw@mail.gmail.com>
	<1345239937.27428.23.camel@ted>
Date: Thu, 18 Oct 2012 16:44:57 +0200
Message-ID: <CA+chaQdeva39xbD3iY1sAct=Rd-1BBbxaVMqrECi3icDraCOsg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Mark Hatle : prelink: Update to latest upstream prelink
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
X-List-Received-Date: Thu, 18 Oct 2012 14:58:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 11:45 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-17 at 23:21 +0200, Andreas M=C3=BCller wrote:
>> On Fri, Aug 17, 2012 at 7:09 PM,  <git@git.openembedded.org> wrote:
>> > Module: openembedded-core.git
>> > Branch: master
>> > Commit: 7759c9a2c5dfdc1cae5540a5985632c78abbac89
>> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D7759c9a2c5dfdc1cae5540a5985632c78abbac89
>> >
>> > Author: Mark Hatle <mark.hatle@windriver.com>
>> > Date:   Mon Aug 13 14:49:57 2012 -0500
>> >
>> > prelink: Update to latest upstream prelink
>> >
>> > The latest fixes an obscure problem with prelinking on PowerPC, as wel=
l
>> > as general updated.
>> >
>> > Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> >
>> > ---
>> >
>> >  meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>> >  1 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recip=
es-devtools/prelink/prelink_git.bb
>> > index c94bdf5..610302e 100644
>> > --- a/meta/recipes-devtools/prelink/prelink_git.bb
>> > +++ b/meta/recipes-devtools/prelink/prelink_git.bb
>> > @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to=
 be resolved at \
>> >  runtime and thus programs come up faster."
>> >  LICENSE =3D "GPLv2"
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd89=
91e50b"
>> > -SRCREV =3D "7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
>> > +SRCREV =3D "a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d"
>> >  PV =3D "1.0+git${SRCPV}"
>> > -PR =3D "r9"
>> > +PR =3D "r10"
>> >
>> >  #
>> >  # The cron script attempts to re-prelink the system daily -- on
>> >
>> I think reloading is caused by this change. Since latest update I get
>>
>> WARNING: Failed to fetch URL
>> git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit, attempting
>> MIRRORS if available
>> ERROR: Fetcher failure: Fetch command export HOME=3D"/home/Superandy";
>> export SSH_AUTH_SOCK=3D"/tmp/keyring-IAYDEC/ssh"; export
>> GIT_CONFIG=3D"/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/e=
tc/gitconfig";
>> export PATH=3D"/home/Superandy/data/oe-core/sources/openembedded-core/sc=
ripts/native-intercept:/home/Superandy/data/oe-core/sources/openembedded-co=
re/scripts:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin=
/armv7a-vfp-neon-linux:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-l=
inux/usr/bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/s=
bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin:/home/=
Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/sbin:/home/Superandy/tmp=
/oe-core-eglibc/sysroots/x86_64-linux//bin:/home/Superandy/oe-core/sources/=
openembedded-core/scripts:/home/Superandy/oe-core/sources/bitbake/bin:/usr/=
lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/=
sbin:/usr/sbin:/sbin:./:/home/Superandy/bin:/sbin:/usr/sbin";
>> git remote add --mirror=3Dfetch origin
>> git://git.yoctoproject.org/prelink-cross.git failed with exit code
>> 129, output:
>> STDOUT:
>> STDERR: error: option `mirror' takes no value
>> usage: git remote add [<options>] <name> <url>
>>
>>     -f, --fetch           fetch the remote branches
>>     --tags                import all tags and associated objects when fe=
tching
>>                           or do not fetch any tag at all (--no-tags)
>>     -t, --track <branch>  branch(es) to track
>>     -m, --master <branch>
>>                           master branch
>>     --mirror              no separate remotes
>>

--mirror option was changed 2y ago here
https://github.com/git/git/commit/a9f5a3558dcf83440c60ae5a2e2b56c80d65bb0b

get newer git :)

someone reported the same to me today with Ubuntu 11.04 :/

>>
>> ERROR: Function failed: Fetcher failure for URL:
>> 'git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit'. Unable to
>> fetch URL from any source.
>> ERROR: Logfile of failure stored in:
>> /home/Superandy/tmp/oe-core-eglibc/work/x86_64-linux/prelink-native-1.0+=
git1+a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d-r10/temp/log.do_fetch.25940
>> ERROR: Task 103
>> (virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/m=
eta/recipes-devtools/prelink/prelink_git.bb,
>> do_fetch) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 307 tasks of which 262 didn't need to
>> be rerun and 1 failed.
>>
>> Any thoughts?
>
> You have an incompatible version of git and git-native is in
> ASSUME_PROVIDED. We should have detected this and built git-native in
> this case. What version of git do you have?
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


