Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A471371DD9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491420917; x=1522956917;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=n5tij5vGvk1tO57/cF/Pm2IiK8Z0uJx+xDGJ/A+dUdA=;
	b=TtI1yrT4vXS7/vYG6QyFPQhHR3wsTZ4gZEJNYwVqHMfmBhsuQ3E5AHaf
	hLUJwMHJqIfKVmKoOtPKfah4OsOPTw==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 12:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,280,1488873600"; 
	d="asc'?scan'208";a="74059156"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.121])
	([10.219.128.121])
	by orsmga004.jf.intel.com with ESMTP; 05 Apr 2017 12:35:16 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1491400856.5062.17.camel@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <350cafae-b2e1-d629-c2bb-d9951074bb9f@linux.intel.com>
Date: Wed, 5 Apr 2017 14:35:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491400856.5062.17.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] create-pull-request: add "-t in-reply-to" option
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
X-List-Received-Date: Wed, 05 Apr 2017 19:35:15 -0000
X-Groupsio-MsgNum: 95838
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XgIQP1MRD0L1WIUcimSCDKkWwQHBODpN1"

--XgIQP1MRD0L1WIUcimSCDKkWwQHBODpN1
Content-Type: multipart/mixed; boundary="AwC7OctgSAckEddxCkBH3WIqO1BoksFQf";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <350cafae-b2e1-d629-c2bb-d9951074bb9f@linux.intel.com>
Subject: Re: [OE-core] [PATCH] create-pull-request: add "-t in-reply-to"
 option
References: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1491400856.5062.17.camel@linux.intel.com>
In-Reply-To: <1491400856.5062.17.camel@linux.intel.com>

--AwC7OctgSAckEddxCkBH3WIqO1BoksFQf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 04/05/2017 09:00 AM, Leonardo Sandoval wrote:
> On Tue, 2017-04-04 at 16:45 -0500, Jose Lamego wrote:
>> The create-patch-request script creates patches as replies to a cover
>=20
> you mean create-pull-request, I believe
>=20
>> letter, in the form of an email thread. If further revisions are sent =
to
>> the mailing list without referencing to the first revision, these new
>> revisions are not identified at the mailing list as part of the origin=
al
>> thread, but as a new thread instead.
>>
>> This change adds the "[-t in_reply_to]" option, where "in_reply_to" is=

>> the original cover letter's Message-Id, so this reference is added
>> to the new cover letter to ensure the thread continuity.
>>
>=20
>=20
> BTW, is there an easy way to get the in-reply-to email besides using
> git-pw or looking at the message source?

That's a good question, I actually don't know of an easier way of
knowing the Message-Id. Will further investigate.

>=20
> Some comments in patch:
>=20
Thanks Leo!
>=20
>=20
>=20
>> [YOCTO #11294]
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>> ---
>>  scripts/create-pull-request | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/create-pull-request b/scripts/create-pull-request=

>> index e82858b..46d6538 100755
>> --- a/scripts/create-pull-request
>> +++ b/scripts/create-pull-request
>> @@ -34,7 +34,7 @@ RFC=3D0
>>  usage() {
>>  CMD=3D$(basename $0)
>>  cat <<EOM
>> -Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r =
relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
>> +Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r =
relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch] [-t i=
n_reply_to]
>>    -b branch           Branch name in the specified remote (default: c=
urrent branch)
>>    -l local branch     Local branch name (default: HEAD)
>>    -c                  Create an RFC (Request for Comment) patch serie=
s
>> @@ -49,6 +49,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] =
[-s subject] [-r relative_to
>>    -s subject          The subject to be inserted into the summary ema=
il
>>    -u remote           The git remote where the branch is located, or =
set CPR_CONTRIB_REMOTE in env
>>    -d relative_dir     Generate patches relative to directory
>> +  -t in_reply_to      Make mails appear as replies to the given Messa=
ge-Id, to continue patch/series threads
>> =20
>>   Examples:
>>     $CMD -u contrib -b nitin/basic
>> @@ -57,12 +58,13 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file=
] [-s subject] [-r relative_to
>>     $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
>>     $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
>>     $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
>> +   $CMD -u contrib -p "OE-core][PATCH v2" -t "<cover.11146.git.john.d=
oe@example.com>"
>>  EOM
>>  }
>> =20
>>  REMOTE=3D"$CPR_CONTRIB_REMOTE"
>>  # Parse and validate arguments
>> -while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
>> +while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
>>  	case $OPT in
>>  	b)
>>  		BRANCH=3D"$OPTARG"
>> @@ -108,6 +110,8 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
>>  	a)
>>  		CPR_CONTRIB_AUTO_PUSH=3D"1"
>>  		;;
>> +        t)
>> +                IN_REPLY_TO=3D"$OPTARG"
>=20
> it would be nice to include also the double semi-colon, so future cases=

> just start after it.
>=20
done in v2 patch.
>=20
>>  	esac
>>  done
>> =20
>> @@ -205,7 +209,11 @@ if [ -n "$RELDIR" ]; then
>>  fi
>> =20
>>  # Generate the patches and cover letter
>> -git format-patch $extraopts -M40 --subject-prefix=3D"$PREFIX" -n -o $=
ODIR --thread=3Dshallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/nu=
ll
>> +if [ -z "$IN_REPLY_TO" ]; then
>=20
> -n instead of -z?
>=20
also done in v2 patch

>> +    git format-patch $extraopts -M40 --subject-prefix=3D"$PREFIX" -n =
-o $ODIR --thread=3Dshallow --in-reply-to=3D"$IN_REPLY_TO" --cover-letter=
 $RELATIVE_TO..$COMMIT_ID > /dev/null
>> +else
>> +    git format-patch $extraopts -M40 --subject-prefix=3D"$PREFIX" -n =
-o $ODIR --thread=3Dshallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /de=
v/null
>> +fi
>> =20
>>  if [ -z "$(ls -A $ODIR 2> /dev/null)" ]; then
>>      echo "ERROR: $ODIR is empty, no cover letter and patches was gene=
rated!"
>> --=20
>> 2.7.4
>>
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--AwC7OctgSAckEddxCkBH3WIqO1BoksFQf--

--XgIQP1MRD0L1WIUcimSCDKkWwQHBODpN1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJY5Ub2AAoJEFJAtowlSEbnw4wH/0K+vUAikLgGLl0nH133V50P
AXvZ0dQxnDc8hM0bDnJU7nX7RCXSPZThc9un+YPpEbyjovdXv2fBHRpL3rxFyzSb
jh+TRrCYhAvuod/9RLoZ3aBIHCkan611e3ME2agR7pQr+pMxv7mtSEhQySteEvmX
BAEmvS8A/sCsucCrSIRO5T1t7UEmAD1ByV8Sq/Z9VlI18lY3LmzSs5a8/gUKSyLi
ivGA154FFFCbEhvaV4a7L5Bnbev9056ldJgxKa1DQI8C34Oz/J8CHvFfy5QqXm6l
nUxQI6mk5GChmsNpoRPelGMl2KLZ/Ic2NRAYDKwDGd80Y6qfvEyySJtdUFe4L7s=
=7su2
-----END PGP SIGNATURE-----

--XgIQP1MRD0L1WIUcimSCDKkWwQHBODpN1--
