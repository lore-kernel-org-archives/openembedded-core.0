Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4C4o-0000MG-MN
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 16:38:34 +0200
Received: by daks35 with SMTP id s35so784342dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=SJuwH6/pAddphBpun0k6tIRVIaFH/3tMREEE67/1MGo=;
	b=MPxxGWzfdkCkSTsa37wkh1FAJwonsX9Yhs9PzyM8P8bdKw/jyJTIPICl3Trw8Sawlv
	YP8o2BQOPugEXGhbYtMSZabiQVPdWrtod0n9HNO26vXUaSvIKhrQT4j+ZpJQjCtTxZN3
	Q7ciGwB1xJ0qfZ7ZtnKqMZAVRGEz7ZGlqcnPYkCkGrc14eSeFSM4tAKkzqAryQq59uyk
	7LnuO00nse88yrINWDPA/s9pmmAJpcsH201Lm8l1z198ZqLMUAROUwQiLof7shoXEi4q
	2JP++Zw+ZrsYvZNST0lhCPDZon09oqkZbi9YXzC56XMAPmJ7Gf6//6H5XFrT7EIcDiSv
	vamA==
Received: by 10.68.217.69 with SMTP id ow5mr52863843pbc.35.1345645588965;
	Wed, 22 Aug 2012 07:26:28 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id hr9sm3815458pbc.36.2012.08.22.07.26.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 07:26:27 -0700 (PDT)
References: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
	<CABcZANn8tSTrfwbOCi6WoiURVRcG3w_dF5-nnwMC+7Pz=aK01w@mail.gmail.com>
	<5034EBB3.3010906@intel.com>
In-Reply-To: <5034EBB3.3010906@intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <2C58EEEE-174C-4E2B-8A9F-1148A009E26D@gmail.com>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 07:26:25 -0700
To: Radu Moisan <radu.moisan@intel.com>
Cc: Chris Larson <clarson@kergoth.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: Upgrade to upstream version 8.17
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
X-List-Received-Date: Wed, 22 Aug 2012 14:38:34 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Aug 22, 2012, at 7:24 AM, Radu Moisan <radu.moisan@intel.com> wrote:

>=20
> On 08/22/2012 05:08 PM, Chris Larson wrote:
>> On Wed, Aug 22, 2012 at 3:43 AM, Radu Moisan <radu.moisan@intel.com> wrot=
e:
>>> diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-y=
es.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.pat=
ch
>>> new file mode 100644
>>> index 0000000..e32f612
>>> --- /dev/null
>>> +++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patc=
h
>>> @@ -0,0 +1,21 @@
>>> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>> +Upstream status: pending
>>> +
>>> +The new version of coreutils, adds use of canonicalize_file_name() func=
tion defined in canonicalize.h
>>> +The problem: the function is redefined to rpl_canonicalize_file_name by=
 means of a macro,which gives
>>> +an undefined reference error at compile time. Macro definition depends i=
n the end on
>>> +gl_cv_func_realpath_works but assumed true only when set to "yes"
>>> +
>>> +Index: coreutils-8.17/m4/canonicalize.m4
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +--- coreutils-8.17.orig/m4/canonicalize.m4     2012-05-08 12:05:23.0000=
00000 +0300
>>> ++++ coreutils-8.17/m4/canonicalize.m4  2012-08-17 14:20:22.000000000 +0=
300
>>> +@@ -95,7 +95,7 @@
>>> +      [gl_cv_func_realpath_works=3Dno],
>>> +      [case "$host_os" in
>>> +                 # Guess yes on glibc systems.
>>> +-        *-gnu*) gl_cv_func_realpath_works=3D"guessing yes" ;;
>>> ++        *-gnu*) gl_cv_func_realpath_works=3D"yes" ;;
>>> +                 # If we don't know, assume the worst.
>>> +         *)      gl_cv_func_realpath_works=3D"guessing no" ;;
>>> +       esac
>> Wouldn't it be better to provide a cached test result in the site
>> files for this test, rather than relying on a host_os based guess?
> I really don't know the answer to your question. The patch was intended to=
 provide minimally invasive change to the original file. If you elaborate mo=
re on your proposal, I would gladly take into consideration a future patch t=
o address this issue.


Add CACHED_CONFIGUREVARS in the recipe search in metadata for existing examp=
les

>=20
> radu
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


