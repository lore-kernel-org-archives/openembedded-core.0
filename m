Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 42FC861996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 18:33:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 10:33:43 -0800
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; 
	d="scan'208,217";a="232330330"
Received: from unknown (HELO [10.241.226.14]) ([10.241.226.14])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 10:33:41 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <DE21E37C-68F1-48EA-8FC3-2A7A2E54CC78@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Date: Fri, 28 Feb 2020 10:33:41 -0800
In-Reply-To: <a9437810-c735-8a89-44b0-6b7837e88818@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
	<20200227000603.14252-4-timothy.t.orling@linux.intel.com>
	<2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
	<7956231e-1523-6213-b757-633b75eb2eb2@gmail.com>
	<CANx9H-CiC8xMqVKDYXzAupOrShPvGvpeu0j8r0CFjZ0OTSdsJA@mail.gmail.com>
	<CANx9H-BuKY5DONf26jnVJLseUmv9C6FqRZU_Aw2aGpBr5nswZw@mail.gmail.com>
	<CANNYZj-LiYrmK6-ihTxgtMBSCqb2Yg_HmooG7QJOQ=_MtdP9+Q@mail.gmail.com>
	<a9437810-c735-8a89-44b0-6b7837e88818@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Fri, 28 Feb 2020 18:33:45 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_879A8633-605E-4373-AAC8-303AB44BA160"

--Apple-Mail=_879A8633-605E-4373-AAC8-303AB44BA160
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 28, 2020, at 10:00 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>=20
> On 2/28/20 1:30 AM, Alexander Kanavin wrote:
>> I actually have a number of patches I have to hold because they don't =
build or don't work on centos 7.
>> Latest atk and friends included:
>> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/p=
ackage-version-updates-later =
<http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/=
package-version-updates-later>
>> Something ought to be done about centos 7, I'm all for dropping it =
asap, if the newer compiler installation turns out unfeasible.
>=20
> centos7 is just showing the problem that other distros are not.
> This problem seems to be due to missing header includes
> Can we try to add
>=20
> #include <time.h>
>=20
> in tests/atk_test_util.h and perhaps this should fix it.
>=20

Thank you Khem!

https://gitlab.gnome.org/GNOME/at-spi2-atk/issues/14 =
<https://gitlab.gnome.org/GNOME/at-spi2-atk/issues/14>

I=E2=80=99ll prepare a v2 with patch.

>=20
>> Alex
>> On Fri, 28 Feb 2020 at 05:35, Tim Orling <ticotimo@gmail.com =
<mailto:ticotimo@gmail.com> <mailto:ticotimo@gmail.com =
<mailto:ticotimo@gmail.com>>> wrote:
>>    All those build failures are on CentOS-7.
>>    Grumble grumble.
>>    On Thu, Feb 27, 2020 at 8:32 PM Tim Orling <ticotimo@gmail.com =
<mailto:ticotimo@gmail.com>
>>    <mailto:ticotimo@gmail.com <mailto:ticotimo@gmail.com>>> wrote:
>>        Strange. I built it in new environment, tip of master, on
>>        Debian-10 and no problems. I=E2=80=99ll look into it tomorrow.
>>        Thank you for the information.
>>        On Thu, Feb 27, 2020 at 8:28 PM Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>
>>        <mailto:raj.khem@gmail.com <mailto:raj.khem@gmail.com>>> =
wrote:
>>            On 2/27/20 7:54 PM, Anuj Mittal wrote:
>>             > Hi Tim,
>>             >
>>             > On 27-Feb-20 08:06 AM, Tim Orling wrote:
>>             >> Release notes:
>>             >>
>>            =
https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424f=
4d087ac90d1172d/NEWS =
<https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424=
f4d087ac90d1172d/NEWS>
>>             >>
>>             >>
>>             >> License-Update: Changed to LGPL-2.1+
>>             >>
>>             >> Signed-off-by: Tim Orling
>>            <timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>
>>            <mailto:timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>>>
>>             >> ---
>>             >>   .../atk/{at-spi2-atk_2.32.0.bb
>>            <http://at-spi2-atk_2.32.0.bb =
<http://at-spi2-atk_2.32.0.bb/>> =3D> at-spi2-atk_2.34.1.bb
>>            <http://at-spi2-atk_2.34.1.bb =
<http://at-spi2-atk_2.34.1.bb/>>}  | 8 ++++----
>>             >>   1 file changed, 4 insertions(+), 4 deletions(-)
>>             >>   rename =
meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb
>>            <http://at-spi2-atk_2.32.0.bb =
<http://at-spi2-atk_2.32.0.bb/>> =3D>
>>             >> at-spi2-atk_2.34.1.bb <http://at-spi2-atk_2.34.1.bb =
<http://at-spi2-atk_2.34.1.bb/>>} (66%)
>>             >
>>             > This is failing on musl-qemu86:
>>             >
>>             >
>>            =
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1623
>>             >
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: =
error:
>>            unknown field
>>             > =E2=80=98tv_sec=E2=80=99 specified in initializer
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>>            warning: excess
>>             > elements in struct initializer [enabled by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>>            warning: (near
>>             > initialization for =E2=80=98timeout=E2=80=99) [enabled =
by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: =
error:
>>            unknown field
>>             > =E2=80=98tv_nsec=E2=80=99 specified in initializer
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>>            warning: excess
>>             > elements in struct initializer [enabled by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>>            warning: (near
>>             > initialization for =E2=80=98timeout=E2=80=99) [enabled =
by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: =
error:
>>            storage size
>>             > of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known
>>             >     struct timespec timeout =3D { .tv_sec =3D 0, =
.tv_nsec =3D
>>            10 * 1000000 };
>>             >                     ^
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5:
>>            warning: implicit
>>             > declaration of function =E2=80=98nanosleep=E2=80=99
>>            [-Wimplicit-function-declaration]
>>             >       nanosleep(&timeout, NULL);
>>             >       ^
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In =
function
>>            =E2=80=98terminate_app=E2=80=99:
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            error: variable
>>             > =E2=80=98timeout=E2=80=99 has initializer but =
incomplete type
>>             >     struct timespec timeout =3D { .tv_sec =3D 0, =
.tv_nsec =3D
>>            10 * 1000000 };
>>             >            ^
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            error: unknown field
>>             > =E2=80=98tv_sec=E2=80=99 specified in initializer
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            warning: excess
>>             > elements in struct initializer [enabled by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            warning: (near
>>             > initialization for =E2=80=98timeout=E2=80=99) [enabled =
by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            error: unknown field
>>             > =E2=80=98tv_nsec=E2=80=99 specified in initializer
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            warning: excess
>>             > elements in struct initializer [enabled by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>>            warning: (near
>>             > initialization for =E2=80=98timeout=E2=80=99) [enabled =
by default]
>>             > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19:
>>            error: storage size
>>             > of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known
>>             >     struct timespec timeout =3D { .tv_sec =3D 0, =
.tv_nsec =3D
>>            10 * 1000000 };
>>             >
>>            yeah this is exposing a bug in use if time_t struct in =
this
>>            component.
>>            there are several patches done to address that, we will
>>            perhaps need one
>>            of these patches here.
>>            --             =
_______________________________________________
>>            Openembedded-core mailing list
>>            Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>>            <mailto:Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>>
>>            =
http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>    --     _______________________________________________
>>    Openembedded-core mailing list
>>    Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>>    <mailto:Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>>
>>    http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_879A8633-605E-4373-AAC8-303AB44BA160
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 28, 2020, at 10:00 AM, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.khem@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 2/28/20 1:30 AM, Alexander =
Kanavin wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">I actually have a number of patches I =
have to hold because they don't build or don't work on centos 7.<br =
class=3D"">Latest atk and friends included:<br class=3D""><a =
href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dak=
anavin/package-version-updates-later" =
class=3D"">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3D=
akanavin/package-version-updates-later</a><br class=3D"">Something ought =
to be done about centos 7, I'm all for dropping it asap, if the newer =
compiler installation turns out unfeasible.<br class=3D""></blockquote><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">centos7 is just showing the =
problem that other distros are not.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">This problem seems to be due to missing header =
includes</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Can we try to =
add</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">#include =
&lt;time.h&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">in tests/atk_test_util.h and perhaps this should fix =
it.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Thank you =
Khem!</div><div><br class=3D""></div><div><a =
href=3D"https://gitlab.gnome.org/GNOME/at-spi2-atk/issues/14" =
class=3D"">https://gitlab.gnome.org/GNOME/at-spi2-atk/issues/14</a></div><=
div><br class=3D""></div><div>I=E2=80=99ll prepare a v2 with =
patch.</div><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Alex<br=
 class=3D"">On Fri, 28 Feb 2020 at 05:35, Tim Orling &lt;<a =
href=3D"mailto:ticotimo@gmail.com" class=3D"">ticotimo@gmail.com</a><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;<a =
href=3D"mailto:ticotimo@gmail.com" =
class=3D"">mailto:ticotimo@gmail.com</a>&gt;&gt; wrote:<br =
class=3D"">&nbsp;&nbsp;&nbsp;All those build failures are on =
CentOS-7.<br class=3D"">&nbsp;&nbsp;&nbsp;Grumble grumble.<br =
class=3D"">&nbsp;&nbsp;&nbsp;On Thu, Feb 27, 2020 at 8:32 PM Tim Orling =
&lt;<a href=3D"mailto:ticotimo@gmail.com" =
class=3D"">ticotimo@gmail.com</a><br class=3D"">&nbsp;&nbsp;&nbsp;&lt;<a =
href=3D"mailto:ticotimo@gmail.com" =
class=3D"">mailto:ticotimo@gmail.com</a>&gt;&gt; wrote:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Strange. I built it =
in new environment, tip of master, on<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Debian-10 and no =
problems. I=E2=80=99ll look into it tomorrow.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thank you for the =
information.<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;On =
Thu, Feb 27, 2020 at 8:28 PM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.khem@gmail.com</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">mailto:raj.khem@gmail.com</a>&gt;&gt; wrote:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;On 2/27/20 7:54 PM, Anuj Mittal wrote:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; Hi Tim,<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; On 27-Feb-20 08:06 AM, Tim Orling wrote:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; Release notes:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;<a =
href=3D"https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a054=
8835424f4d087ac90d1172d/NEWS" =
class=3D"">https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a=
0548835424f4d087ac90d1172d/NEWS</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; License-Update: Changed to LGPL-2.1+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; Signed-off-by: Tim Orling<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" =
class=3D"">timothy.t.orling@linux.intel.com</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" =
class=3D"">mailto:timothy.t.orling@linux.intel.com</a>&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; ---<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; &nbsp; .../atk/{at-spi2-atk_2.32.0.bb<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&lt;<a href=3D"http://at-spi2-atk_2.32.0.bb/" =
class=3D"">http://at-spi2-atk_2.32.0.bb</a>&gt; =3D&gt; =
at-spi2-atk_2.34.1.bb<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&lt;<a href=3D"http://at-spi2-atk_2.34.1.bb/" =
class=3D"">http://at-spi2-atk_2.34.1.bb</a>&gt;}&nbsp; | 8 ++++----<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; &nbsp; 1 file changed, 4 insertions(+), 4 =
deletions(-)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; &nbsp; rename =
meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&lt;<a href=3D"http://at-spi2-atk_2.32.0.bb/" =
class=3D"">http://at-spi2-atk_2.32.0.bb</a>&gt; =3D&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&gt; at-spi2-atk_2.34.1.bb &lt;<a =
href=3D"http://at-spi2-atk_2.34.1.bb/" =
class=3D"">http://at-spi2-atk_2.34.1.bb</a>&gt;} (66%)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; This is failing on musl-qemu86:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;<a =
href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/=
1623" =
class=3D"">https://autobuilder.yoctoproject.org/typhoon/#/builders/64/buil=
ds/1623</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: =
error:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;unknown field<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; =E2=80=98tv_sec=E2=80=99 specified in initializer<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: excess<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; elements in struct initializer [enabled by default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: (near<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by =
default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: =
error:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;unknown field<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; =E2=80=98tv_nsec=E2=80=99 specified in initializer<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: excess<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; elements in struct initializer [enabled by default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: (near<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by =
default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: =
error:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;storage size<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; &nbsp;&nbsp; struct timespec timeout =3D { .tv_sec =3D=
 0, .tv_nsec =3D<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;10 * 1000000 };<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: implicit<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; declaration of function =E2=80=98nanosleep=E2=80=99<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;[-Wimplicit-function-declaration]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; nanosleep(&amp;timeout, =
NULL);<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ^<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In =
function<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=E2=80=98terminate_app=E2=80=99:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;error: variable<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; =E2=80=98timeout=E2=80=99 has initializer but incomplete =
type<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; &nbsp;&nbsp; struct timespec timeout =3D { .tv_sec =3D=
 0, .tv_nsec =3D<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;10 * 1000000 };<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;error: unknown field<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; =E2=80=98tv_sec=E2=80=99 specified in initializer<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: excess<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; elements in struct initializer [enabled by default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: (near<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by =
default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;error: unknown field<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; =E2=80=98tv_nsec=E2=80=99 specified in initializer<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: excess<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; elements in struct initializer [enabled by default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;warning: (near<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by =
default]<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;error: storage size<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt; of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;&nbsp; &nbsp;&nbsp; struct timespec timeout =3D { .tv_sec =3D=
 0, .tv_nsec =3D<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;10 * 1000000 };<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;yeah this is exposing a bug in use if time_t struct in this<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;component.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;there are several patches done to address that, we will<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;perhaps need one<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;of these patches here.<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;-- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__=
_____________________________________________<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;Openembedded-core mailing list<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&lt;<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">mailto:Openembedded-core@lists.openembedded.org</a>&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br class=3D"">&nbsp;&nbsp;&nbsp;-- =
&nbsp;&nbsp;&nbsp;&nbsp;_______________________________________________<br=
 class=3D"">&nbsp;&nbsp;&nbsp;Openembedded-core mailing list<br =
class=3D"">&nbsp;&nbsp;&nbsp;<a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">&nbsp;&nbsp;&nbsp;&lt;<a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">mailto:Openembedded-core@lists.openembedded.org</a>&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Openembedded-core mailing =
list</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_879A8633-605E-4373-AAC8-303AB44BA160--
