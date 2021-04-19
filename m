Subject: Re: [PATCH] perl: fix startperl configuration option for perl-native
To: openembedded-core@lists.openembedded.org
From: "Paulo Cesar Zaneti" <paulo.zaneti@gmail.com>
X-Originating-Location: Curitiba, Parana, BR (179.253.228.38)
X-Originating-Platform: Linux Firefox 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 Apr 2021 07:13:22 -0700
References: <4145ce915f734aae9f53ab2575521f2d@intel.com>
In-Reply-To: <4145ce915f734aae9f53ab2575521f2d@intel.com>
Message-ID: <25102.1618841602267269069@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KgUXo5cVaZb1R3KmrDyf"

--KgUXo5cVaZb1R3KmrDyf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I just re-send the patch with additional fix for the build failure.

I think the basic problem was an inconsistency in the way perl recipe and =
cpan.bbclass convert the absolute perl path to env path.
Version 2 of the patch tries to use same cpan.bbclass approach on the perl=
 recipe.

Before submitting I just ran "bitbake -k world". I hope it doesn't break t=
he build again.

--KgUXo5cVaZb1R3KmrDyf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I just re-send the patch with additional fix for the build failure.<br /><b=
r />I think the basic problem was an inconsistency in the way perl recipe a=
nd cpan.bbclass convert the absolute perl path to env path.<br />Version 2 =
of the patch tries to use same cpan.bbclass approach on the perl recipe.<br=
 /><br />Before submitting I just ran "bitbake -k world". I hope it doesn't=
 break the build again.

--KgUXo5cVaZb1R3KmrDyf--
