Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 14C0272F87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:28:45 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 12:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,346,1491289200"; 
	d="asc'?scan'208";a="87683707"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.138])
	([10.219.128.138])
	by orsmga004.jf.intel.com with ESMTP; 15 May 2017 12:28:46 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1491421119-12540-1-git-send-email-jose.a.lamego@linux.intel.com>
	<CABcZANmGy3joQ2wUfwKB-xZ2D5TPW7Wj6c6MJepDPS-auNd+eQ@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <1ed24aa4-904f-8916-ec27-a354e1424c6b@linux.intel.com>
Date: Mon, 15 May 2017 14:28:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CABcZANmGy3joQ2wUfwKB-xZ2D5TPW7Wj6c6MJepDPS-auNd+eQ@mail.gmail.com>
Subject: Re: [PATCH v2] create-pull-request: add "-t in-reply-to" option
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
X-List-Received-Date: Mon, 15 May 2017 19:28:46 -0000
X-Groupsio-MsgNum: 97303
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7CKfAnUN5W8lCHfNfPAkUvJuLGakwBlLK"

--7CKfAnUN5W8lCHfNfPAkUvJuLGakwBlLK
Content-Type: multipart/mixed; boundary="K58hcBVKRnxUQ2kq5pcIHhJaiaCbGNEsR";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <kergoth@gmail.com>
Message-ID: <1ed24aa4-904f-8916-ec27-a354e1424c6b@linux.intel.com>
Subject: Re: [OE-core] [PATCH v2] create-pull-request: add "-t in-reply-to"
 option
References: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
 <1491421119-12540-1-git-send-email-jose.a.lamego@linux.intel.com>
 <CABcZANmGy3joQ2wUfwKB-xZ2D5TPW7Wj6c6MJepDPS-auNd+eQ@mail.gmail.com>
In-Reply-To: <CABcZANmGy3joQ2wUfwKB-xZ2D5TPW7Wj6c6MJepDPS-auNd+eQ@mail.gmail.com>

--K58hcBVKRnxUQ2kq5pcIHhJaiaCbGNEsR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 05/12/2017 04:18 PM, Christopher Larson wrote:
> Looks like the earlier version of this with the wrong -z vs -n got
> merged, please submit a follow-up patch to fix it.
>=20
Markus Lehtonen already sent a fix for the -n validation in

http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136648=
=2Ehtml

however, I've sent an additional patch that fixes the alternatives case
construct syntax in

http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136699=
=2Ehtml

Thanks for the heads up.

> On Wed, Apr 5, 2017 at 12:38 PM, Jose Lamego
> <jose.a.lamego@linux.intel.com <mailto:jose.a.lamego@linux.intel.com>>
> wrote:
>=20
>     The create-pull-request script creates patches as replies to a cove=
r
>     letter, in the form of an email thread. If further revisions are se=
nt to
>     the mailing list without referencing to the first revision, these n=
ew
>     revisions are not identified at the mailing list as part of the ori=
ginal
>     thread, but as a new thread instead.
>=20
>     This change adds the "[-t in_reply_to]" option, where "in_reply_to"=
 is
>     the original cover letter's Message-Id, so this reference is added
>     to the new cover letter to ensure the thread continuity.
>=20
>     [YOCTO #11294]
>=20
>     Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com
>     <mailto:jose.a.lamego@linux.intel.com>>
>     ---
>      scripts/create-pull-request | 17 +++++++++++++----
>      1 file changed, 13 insertions(+), 4 deletions(-)
>=20
>     diff --git a/scripts/create-pull-request b/scripts/create-pull-requ=
est
>     index e82858b..8f0be99 100755
>     --- a/scripts/create-pull-request
>     +++ b/scripts/create-pull-request
>     @@ -34,7 +34,7 @@ RFC=3D0
>      usage() {
>      CMD=3D$(basename $0)
>      cat <<EOM
>     -Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject]
>     [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b bra=
nch]
>     +Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject]
>     [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b
>     branch] [-t in_reply_to]
>        -b branch           Branch name in the specified remote (default=
:
>     current branch)
>        -l local branch     Local branch name (default: HEAD)
>        -c                  Create an RFC (Request for Comment) patch se=
ries
>     @@ -49,6 +49,7 @@ Usage: $CMD [-h] [-o output_dir] [-m
>     msg_body_file] [-s subject] [-r relative_to
>        -s subject          The subject to be inserted into the summary =
email
>        -u remote           The git remote where the branch is located,
>     or set CPR_CONTRIB_REMOTE in env
>        -d relative_dir     Generate patches relative to directory
>     +  -t in_reply_to      Make mails appear as replies to the given
>     Message-Id, to continue patch/series threads
>=20
>       Examples:
>         $CMD -u contrib -b nitin/basic
>     @@ -57,12 +58,13 @@ Usage: $CMD [-h] [-o output_dir] [-m
>     msg_body_file] [-s subject] [-r relative_to
>         $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
>         $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
>         $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
>     +   $CMD -u contrib -p "OE-core][PATCH v2" -t
>     "<cover.11146.git.john.doe@example.com
>     <mailto:cover.11146.git.john.doe@example.com>>"
>      EOM
>      }
>=20
>      REMOTE=3D"$CPR_CONTRIB_REMOTE"
>      # Parse and validate arguments
>     -while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
>     +while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
>             case $OPT in
>             b)
>                     BRANCH=3D"$OPTARG"
>     @@ -108,7 +110,10 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; d=
o
>             a)
>                     CPR_CONTRIB_AUTO_PUSH=3D"1"
>                     ;;
>     -       esac
>     +        t)
>     +                IN_REPLY_TO=3D"$OPTARG"
>     +                ;;
>     +        esac
>      done
>=20
>      if [ -z "$REMOTE" ]; then
>     @@ -205,7 +210,11 @@ if [ -n "$RELDIR" ]; then
>      fi
>=20
>      # Generate the patches and cover letter
>     -git format-patch $extraopts -M40 --subject-prefix=3D"$PREFIX" -n -=
o
>     $ODIR --thread=3Dshallow --cover-letter $RELATIVE_TO..$COMMIT_ID >
>     /dev/null
>     +if [ -n "$IN_REPLY_TO" ]; then
>     +    git format-patch $extraopts -M40 --subject-prefix=3D"$PREFIX" =
-n
>     -o $ODIR --thread=3Dshallow --in-reply-to=3D"$IN_REPLY_TO"
>     --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
>     +else
>     +    git format-patch $extraopts -M40 --subject-prefix=3D"$PREFIX" =
-n
>     -o $ODIR --thread=3Dshallow --cover-letter $RELATIVE_TO..$COMMIT_ID=
 >
>     /dev/null
>     +fi
>=20
>      if [ -z "$(ls -A $ODIR 2> /dev/null)" ]; then
>          echo "ERROR: $ODIR is empty, no cover letter and patches was
>     generated!"
>     --
>     2.7.4
>=20
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
>=20
>=20
> --=20
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--K58hcBVKRnxUQ2kq5pcIHhJaiaCbGNEsR--

--7CKfAnUN5W8lCHfNfPAkUvJuLGakwBlLK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZGgF0AAoJEFJAtowlSEbneCEH/1BSqaSM8on/uMkC3Q9uXQK5
RtZQpkd2ET1E09ePdQTtU+l3MotDeTNRoULokn8+ejSZrSbx2u6s9e+H3XUTJm4X
mJ3TAbQIyRhNuDvX1Q+pGwzRNlDNsDMpoFtA9HlHQUCVmdxlFEmFnbxjYZ3IKTNS
KPMcFJbgwwsVHN5q4ofirrBOduoQ+Fkf11MSCsOsTPK8jAs9nLSAkLLssfb5IYlL
LS5/+GpbV1eP/XBEgf2MqHDS3sangCqhLQcRKl5DBs3gPhgcQ37LdX3edRGREsgr
RpkXCwSpzKur1VOVpaZFhaLwFzNdFP7IcWyqrroTAOtL6xL7ygOGI4DEllt8WFI=
=4+nY
-----END PGP SIGNATURE-----

--7CKfAnUN5W8lCHfNfPAkUvJuLGakwBlLK--
