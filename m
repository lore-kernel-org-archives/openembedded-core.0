Subject: Re: [wrynose][PATCH v2 5/5] curl: fix CVE-2026-80231
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 28 Nov 2026 01:09:33 -0800
References: <20261023093331.1886272-1-dkelaiya@cisco.com> <20261023093331.1886272-6-dkelaiya@cisco.com> <DMXF11PX59DC.DCF26R7DEGAM@smile.fr>
In-Reply-To: <DMXF11PX59DC.DCF26R7DEGAM@smile.fr>
Message-ID: <1358740.1795856973415129422@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XA3p2xJUapl4Nvyh7yZo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 09:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251485

--XA3p2xJUapl4Nvyh7yZo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I've sent the refreshed CVE-2026-80231 v3 as requested:
https://lists.openembedded.org/g/openembedded-core/message/251484

Thanks,
Darsh

On Tue, Nov 17, 2026 at 04:01 PM, Yoann Congal wrote:

>=20
> On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> Apply the native CA connection-reuse fix [1] after CVE-2026-11564.
>> Store the effective native CA setting in the primary SSL configuration
>> and include it in connection matching and cloning. Update each affected
>> TLS backend to read the connection setting using the curl 8.19.0
>> layout. The upstream advisory is referenced in [2].
>>=20
>> [1] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7=
dcdeff42
>>=20
>> [2] https://curl.se/docs/CVE-2026-80231.html
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> Changes in v2:
>> - Explain the older struct/function locations and GnuTLS helpers.
>> - Document that the omitted hunk only updates a flag access in a
>> later SecTrust session-reuse exception absent from curl 8.19.0.
>> - Clarify that the existing cached-session verification check remains.
>> ---
>> .../curl/curl/CVE-2026-80231.patch | 225 ++++++++++++++++++
>> meta/recipes-support/curl/curl_8.19.0.bb | 1 +
>> 2 files changed, 226 insertions(+)
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80231.patch
>=20
> Hello,
>=20
> While I will take 4/5 into my review cycle, this one (5/5) does not apply
> anymore with 1-3/5 held.
> Please refresh it for the next iteration.
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--XA3p2xJUapl4Nvyh7yZo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />I've sent the refreshed CVE-2026-80231 v3 as requ=
ested:<br /><a href=3D"https://lists.openembedded.org/g/openembedded-core/m=
essage/251484" target=3D"_blank" rel=3D"noopener">https://lists.openembedde=
d.org/g/openembedded-core/message/251484</a>&nbsp;<br /><br />Thanks,<br />=
Darsh</div>
<div>&nbsp;</div>
<div>On Tue, Nov 17, 2026 at 04:01 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiy=
a - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Apply=
 the native CA connection-reuse fix [1] after CVE-2026-11564.<br />Store th=
e effective native CA setting in the primary SSL configuration<br />and inc=
lude it in connection matching and cloning. Update each affected<br />TLS b=
ackend to read the connection setting using the curl 8.19.0<br />layout. Th=
e upstream advisory is referenced in [2].<br /><br />[1] <a href=3D"https:/=
/github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7dcdeff42" targ=
et=3D"_blank" rel=3D"noopener">https://github.com/curl/curl/commit/7be1e70c=
b6bcd83e130ecfe8cb91b6a7dcdeff42</a><br />[2] <a href=3D"https://curl.se/do=
cs/CVE-2026-80231.html" target=3D"_blank" rel=3D"noopener">https://curl.se/=
docs/CVE-2026-80231.html</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dk=
elaiya@cisco.com&gt;<br />---<br />Changes in v2:<br />- Explain the older =
struct/function locations and GnuTLS helpers.<br />- Document that the omit=
ted hunk only updates a flag access in a<br />later SecTrust session-reuse =
exception absent from curl 8.19.0.<br />- Clarify that the existing cached-=
session verification check remains.<br />---<br />.../curl/curl/CVE-2026-80=
231.patch | 225 ++++++++++++++++++<br />meta/recipes-support/curl/curl_8.19=
.0.bb | 1 +<br />2 files changed, 226 insertions(+)<br />create mode 100644=
 meta/recipes-support/curl/curl/CVE-2026-80231.patch</blockquote>
Hello,<br /><br />While I will take 4/5 into my review cycle, this one (5/5=
) does not apply<br />anymore with 1-3/5 held. <br />Please refresh it for =
the next iteration.<br /><br />Thanks!<br />-- <br />Yoann Congal<br />Smil=
e ECS</blockquote>
</div>

--XA3p2xJUapl4Nvyh7yZo--
