Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qqmzm-00089s-1l
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 16:09:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Aug 2011 07:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,343,1309762800"; 
   d="scan'208";a="5436545"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2011 07:04:54 -0700
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 9 Aug 2011 22:04:53 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Tue, 9 Aug 2011 22:04:52 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Tue, 9 Aug 2011
	22:04:52 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Aug 2011 22:04:47 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxWTdTe7iRgqJ4aRh6DtCqVFzUjaAASwEBQ
Message-ID: <1865303E0DED764181A9D882DEF65FB6B5FF85AF9D@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B5FF85AB28@shsmsx502.ccr.corp.intel.com>
	<4E40B92A.1000903@linux.intel.com>
In-Reply-To: <4E40B92A.1000903@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Tue, 09 Aug 2011 14:09:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2011-08-09:
> On 08/08/2011 07:13 PM, Cui, Dexuan wrote:
>> From 593e3506f4d4d9f6030100eac8c8e0af7f8ce3eb Mon Sep 17 00:00:00 2001
>> From: Dexuan Cui <dexuan.cui@intel.com> Date: Thu, 04 Aug 2011 06:53:20
>> +0000 Subject: scripts/oe-buildenv-internal: improve the error
>> detecting for $BDIR
>>=20
>> Thanks a lot to Darren Hart and Paul Eggleton's suggestions!
>>=20
>> A description of this improvement from Darren is:
>> "
>=20
> Drop the above two lines, we don't need these in the permanent git
> history :-) Simply adding a pair of CC lines below the Signed-off-by
> for Paul and myself is sufficient to indicate our involvement. If a
> significant portion of the patch had been authored by either Paul or
> myself, then getting our permission to include our Signed-off-by would be=
 appropriate.
> In this case, a simple CC will suffice.
Ok, got it.

>> >&2 "Error: / is not supported as a build directory."
>=20
> I understand wanting to use stderr, but I don't see the >&2 very often
> in our shell scripts. Is this common practice? If so, it's fine, I'm just=
 wondering.
I'm not sure this is common practice.
I'm just following the existing style in scripts/oe-buildenv-internal and
scripts/oe-setup-builddir. :-)

>> + # buggy readlink of Ubuntu 10.04 that doesn't ignore
>> + trailing slash
>=20
>              a buggy        s/of/in/
> slashes
Thanks for pointing my mistakes

>> +        # and hence "readlink -f new_dir_to_be_created/" returns empty.
>> +        # See YOCTO #671 for details.
>=20
>=20
> Please don't include references to bug numbers in the code. Imagine
> what it would look like if we included every bug in the source! :-)
> Reference the bug in the git commit comment header.
OK, got it.

>=20
>=20
>> +        BDIR=3D`echo $BDIR | sed -re 's|/+$||'`
>> +
>> +        BDIR=3D`readlink -f "$BDIR"`
>> +        if [ -z "$BDIR" ]; then
>> +            PARENTDIR=3D`dirname "$1"`
>> +            echo >&2 "Error: the directory $PARENTDIR does not exist?"
>>              return 1
>>          fi
>>      fi
>=20
> With the trivial changes mentioned above, this looks good to me.
Hi Darren, thanks a lot for all the suggestions! I appreciate your efforts =
to help to make the patch better.
Below is the updated patch (also pasted at the end of the mail):
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/bug=
-671&id=3D2ece3a84d646bb4bf83f3c8aa3067cb99989da47

Please review it.

Thanks,
-- Dexuan

commit 2ece3a84d646bb4bf83f3c8aa3067cb99989da47
Author: Dexuan Cui <dexuan.cui@intel.com>
Date:   Thu Aug 4 14:53:20 2011 +0800

    scripts/oe-buildenv-internal: improve the error detecting for $BDIR

    The previous fix for a bug in Ubuntu 10.04 readlink,
    be2a2764d8ceb398d81714661e6f199c8b11946c, notified the user when a trai=
ling
    slash was used. As there is no semantic difference, simply remove any
    trailing slashes and proceed without nagging the user.

    See [YOCTO #671] for more details.

    Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
    Cc: Darren Hart <dvhart@linux.intel.com>
    Cc: Paul Eggleton <paul.eggleton@linux.intel.com>

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 117b0c5..61ac18c 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -28,14 +28,21 @@ if [ "x$BDIR" =3D "x" ]; then
     if [ "x$1" =3D "x" ]; then
         BDIR=3D"build"
     else
-        BDIR=3D`readlink -f "$1"`
-        if [ -z "$BDIR"  ]; then
-            if expr "$1" : '.*/$' >/dev/null; then
-                echo >&2 "Error: please remove any trailing / in the argum=
ent."
-            else
-                PARENTDIR=3D`dirname "$1"`
-                echo >&2 "Error: the directory $PARENTDIR doesn't exist?"
-            fi
+        BDIR=3D"$1"
+        if [ "$BDIR" =3D "/" ]; then
+            echo >&2 "Error: / is not supported as a build directory."
+            return 1
+        fi
+
+        # Remove any possible trailing slashes. This is used to work aroun=
d
+        # buggy readlink in Ubuntu 10.04 that doesn't ignore trailing slas=
hes
+        # and hence "readlink -f new_dir_to_be_created/" returns empty.
+        BDIR=3D`echo $BDIR | sed -re 's|/+$||'`
+
+        BDIR=3D`readlink -f "$BDIR"`
+        if [ -z "$BDIR" ]; then
+            PARENTDIR=3D`dirname "$1"`
+            echo >&2 "Error: the directory $PARENTDIR does not exist?"
             return 1
         fi
     fi


