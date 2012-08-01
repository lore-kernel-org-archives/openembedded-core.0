Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwaHU-0001En-7Q
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:52:13 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb [147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71EeXi7008932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:40:33 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.236]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0309.002;
	Wed, 1 Aug 2012 07:40:33 -0700
From: "Little, Morgan" <Morgan.Little@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] This is a series of patches to update recipes that
	display warnings about the
Thread-Index: AQHNb/J3NHgdFmhHSk+vaqbG5+QSB5dFBzMK
Date: Wed, 1 Aug 2012 14:40:32 +0000
Message-ID: <FCBA1E696337B442ADB5A7C30428F068502D16@ALA-MBA.corp.ad.wrs.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>,
	<20120801143141.GJ16306@jama.jama.net>
In-Reply-To: <20120801143141.GJ16306@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.140.224]
MIME-Version: 1.0
Subject: Re: This is a series of patches to update recipes that display warnings about the
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
X-List-Received-Date: Wed, 01 Aug 2012 14:52:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 12-08-01 10:31 AM, Martin Jansa wrote:=0A=
> On Wed, Aug 01, 2012 at 10:12:01AM -0400, Morgan Little wrote:=0A=
>> I compared the environment variables to make sure that they expanded out=
 to=0A=
>> the same variables so nothing should be changed during runtime. =0A=
>>=0A=
>> The following changes since commit 4029ce1a15e1dbd374444ee77ccf2a915e463=
b7b:=0A=
>>   Khem Raj (1):=0A=
>>         package_rpm.bbclass: Accomodate dash when using arrays=0A=
>=0A=
> Is this complimentary to Saul's?=0A=
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgw/update=
-alternatives=0A=
>=0A=
> Looks like there is some overlap..=0A=
>=0A=
> Cheers?=0A=
=0A=
I didn't notice his updates. His seems to have done everything I have and m=
ore. I think mine can be ignored if his is accepted.=0A=
=0A=
//Morgan=0A=
>>=0A=
>=0A=
>> are available in the git repository at:=0A=
>>=0A=
>>   git@github.com:morganlittle/oe-core.git updatealternativesfixes=0A=
>>=0A=
>> Morgan Little (19):=0A=
>>       tinylogin: use new update-alternatives=0A=
>>       patch: use new update-alternatives=0A=
>>       ubootchart_svn: use new update-alternatives=0A=
>>       gawk: use new update-alternatives=0A=
>>       less: use new update-alternatives=0A=
>>       mingetty: use new update-alternatives=0A=
>>       mktemp: use new update-alternatives=0A=
>>       msmtp: use new update-alternatives=0A=
>>       sed: use new update-alternatives=0A=
>>       time: use new update-alternatives=0A=
>>       wget: use new update-alternatives=0A=
>>       which: use new update-alternatives=0A=
>>       metacity: use new update-alternatives=0A=
>>       matchbox-session: use new update-alternatives=0A=
>>       matchbox-wm-2: use new update-alternatives=0A=
>>       mini-x-session: use new update-alternatives=0A=
>>       mutter: use new update-alternatives=0A=
>>       powertop: use new update-alternatives=0A=
>>       rxvt-unicode: use new update-alternatives=0A=
>>=0A=
>>  meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    8 ++++----=0A=
>>  meta/recipes-devtools/patch/patch.inc              |    4 ++--=0A=
>>  meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    8 ++++----=0A=
>>  meta/recipes-extended/gawk/gawk_3.1.5.bb           |    8 ++++----=0A=
>>  meta/recipes-extended/gawk/gawk_4.0.1.bb           |    8 ++++----=0A=
>>  meta/recipes-extended/less/less_444.bb             |    6 +++---=0A=
>>  meta/recipes-extended/mingetty/mingetty_1.08.bb    |    8 ++++----=0A=
>>  meta/recipes-extended/mktemp/mktemp_1.7.bb         |    8 ++++----=0A=
>>  meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    8 ++++----=0A=
>>  meta/recipes-extended/sed/sed_4.1.2.bb             |    8 ++++----=0A=
>>  meta/recipes-extended/sed/sed_4.2.1.bb             |    8 ++++----=0A=
>>  meta/recipes-extended/time/time.inc                |    6 +++---=0A=
>>  meta/recipes-extended/wget/wget.inc                |    8 ++++----=0A=
>>  meta/recipes-extended/which/which_2.18.bb          |    6 +++---=0A=
>>  meta/recipes-extended/which/which_2.20.bb          |    6 +++---=0A=
>>  meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    8 ++++----=0A=
>>  .../matchbox-session/matchbox-session_0.1.bb       |    8 ++++----=0A=
>>  .../matchbox-wm-2/matchbox-wm-2_git.bb             |    8 ++++----=0A=
>>  .../mini-x-session/mini-x-session_0.1.bb           |    8 ++++----=0A=
>>  meta/recipes-graphics/mutter/mutter.inc            |    6 +++---=0A=
>>  meta/recipes-kernel/powertop/powertop_1.13.bb      |    8 ++++----=0A=
>>  .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    7 ++++---=0A=
>>  22 files changed, 81 insertions(+), 80 deletions(-)=0A=
>>=0A=
>> _______________________________________________=0A=
>> Openembedded-core mailing list=0A=
>> Openembedded-core@lists.openembedded.org=0A=
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A=


