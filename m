Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T2UYz-0001Qw-0m
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:58:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7HLkfHR023384
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 14:46:41 -0700 (PDT)
Received: from msp-dhcp4.wrs.com (172.25.34.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 14:46:40 -0700
Message-ID: <502EBBBE.30101@windriver.com>
Date: Fri, 17 Aug 2012 16:46:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120817170922.097651032F@opal>
	<CALbNGRRGxF518Vo933R8tLFU8yTbw8XBfFZQox93kr0m2ACJ_A@mail.gmail.com>
	<CALbNGRTG3z_p0=wjqhvqy-xcm5F6qdgqa4xPzfVvDqzbPODFCw@mail.gmail.com>
In-Reply-To: <CALbNGRTG3z_p0=wjqhvqy-xcm5F6qdgqa4xPzfVvDqzbPODFCw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q7HLkfHR023384
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
X-List-Received-Date: Fri, 17 Aug 2012 21:58:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 8/17/12 4:21 PM, Andreas M=FCller wrote:
> On Fri, Aug 17, 2012 at 7:09 PM,  <git@git.openembedded.org> wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 7759c9a2c5dfdc1cae5540a5985632c78abbac89
>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D7759c9a2c5dfdc1cae5540a5985632c78abbac89
>>
>> Author: Mark Hatle <mark.hatle@windriver.com>
>> Date:   Mon Aug 13 14:49:57 2012 -0500
>>
>> prelink: Update to latest upstream prelink
>>
>> The latest fixes an obscure problem with prelinking on PowerPC, as wel=
l
>> as general updated.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>   meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recip=
es-devtools/prelink/prelink_git.bb
>> index c94bdf5..610302e 100644
>> --- a/meta/recipes-devtools/prelink/prelink_git.bb
>> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
>> @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to=
 be resolved at \
>>   runtime and thus programs come up faster."
>>   LICENSE =3D "GPLv2"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8=
991e50b"
>> -SRCREV =3D "7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
>> +SRCREV =3D "a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d"
>>   PV =3D "1.0+git${SRCPV}"
>> -PR =3D "r9"
>> +PR =3D "r10"
>>
>>   #
>>   # The cron script attempts to re-prelink the system daily -- on
>>
> I think reloading is caused by this change. Since latest update I get
>
> WARNING: Failed to fetch URL
> git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit, attempting
> MIRRORS if available
> ERROR: Fetcher failure: Fetch command export HOME=3D"/home/Superandy";
> export SSH_AUTH_SOCK=3D"/tmp/keyring-IAYDEC/ssh"; export
> GIT_CONFIG=3D"/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/=
etc/gitconfig";
> export PATH=3D"/home/Superandy/data/oe-core/sources/openembedded-core/s=
cripts/native-intercept:/home/Superandy/data/oe-core/sources/openembedded=
-core/scripts:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/us=
r/bin/armv7a-vfp-neon-linux:/home/Superandy/tmp/oe-core-eglibc/sysroots/x=
86_64-linux/usr/bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-li=
nux/usr/sbin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr=
/bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/sbin:/home/=
Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux//bin:/home/Superandy/o=
e-core/sources/openembedded-core/scripts:/home/Superandy/oe-core/sources/=
bitbake/bin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/b=
in:/bin:/usr/local/sbin:/usr/sbin:/sbin:./:/home/Superandy/bin:/sbin:/usr=
/sbin";
> git remote add --mirror=3Dfetch origin
> git://git.yoctoproject.org/prelink-cross.git failed with exit code
> 129, output:
> STDOUT:
> STDERR: error: option `mirror' takes no value
> usage: git remote add [<options>] <name> <url>
>
>      -f, --fetch           fetch the remote branches
>      --tags                import all tags and associated objects when =
fetching
>                            or do not fetch any tag at all (--no-tags)
>      -t, --track <branch>  branch(es) to track
>      -m, --master <branch>
>                            master branch
>      --mirror              no separate remotes
>
>
> ERROR: Function failed: Fetcher failure for URL:
> 'git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit'. Unable t=
o
> fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/Superandy/tmp/oe-core-eglibc/work/x86_64-linux/prelink-native-1.0=
+git1+a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d-r10/temp/log.do_fetch.2594=
0
> ERROR: Task 103
> (virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/=
meta/recipes-devtools/prelink/prelink_git.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 307 tasks of which 262 didn't need to
> be rerun and 1 failed.
>
> Any thoughts?

I verified that the upstream repository does have that commit, and that i=
s the=20
correct commit.

 From looking at it, it almost sounds like you were unable to connect to=20
git.yoctoproject.org in order to retrieve the sources.

I know I was having some problems yesterday with that, but they went away=
 --=20
maybe a stale DNS server?

--Mark

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



