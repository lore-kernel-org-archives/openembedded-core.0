Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 055AF60079
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Nov 2017 05:04:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 21:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,450,1505804400"; 
   d="scan'208";a="9412732"
Received: from rowlandm-mobl.amr.corp.intel.com ([10.254.126.215])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2017 21:04:33 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <7079b2e6-b0e8-7882-9b7a-e8bafd94f78c@linux.intel.com>
Date: Fri, 24 Nov 2017 22:04:32 -0700
Message-Id: <0A2583BA-1CFF-4687-A22A-AAAB8FF39E11@linux.intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<0bddac7569ccd37263ce4d59d0ec3c4e2787246f.1508360667.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LbTSY6w1+K8tCoyh0MpSG2H+_AA0B+P-DHgZHxz7m1s9A@mail.gmail.com>
	<7079b2e6-b0e8-7882-9b7a-e8bafd94f78c@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python: Restructure python packaging and replace it with autopackaging
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
X-List-Received-Date: Sat, 25 Nov 2017 05:04:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Why does python3-manifest.json contain:
+            "${libdir}/python2.7/sitecustomize.py=E2=80=9D,
?

> On Nov 24, 2017, at 4:51 PM, Alejandro Hernandez =
<alejandro.hernandez@linux.intel.com> wrote:
>=20
> Hey Ross,
>=20
>=20
> Yeah sorry, at first I didnt realize why we needed the manifest for =
python native, I will fix the commit message.
>=20
>=20
> Thanks!
>=20
>=20
> Alejandro
>=20
> On 11/24/2017 11:06 AM, Burton, Ross wrote:
>> On 18 October 2017 at 22:07, Alejandro Hernandez =
<alejandro.hernandez@linux.intel.com> wrote:
>>  - Removes the manifest from the python-native recipe (Why was it =
there
>>    in the first place?, native recipes do not get split).
>>=20
>> Was this commit written before you added manifest support to =
python-native?  :)  python-native needs the manifest to set RPROVIDES so =
that dependencies work.  Can you update the message? (just deleting this =
line will do)
>>=20
>> Ross=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


