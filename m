Subject: Re: [scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 01:31:05 -0800
References: <20260831061447.180612-1-hthakar@cisco.com> <7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev> <PH7PR11MB85988110C1425A7BD276918FAD982@PH7PR11MB8598.namprd11.prod.outlook.com> <92b3723f22c7eaef6c21cedbde230c4eb3f3ee38.camel@pbarker.dev>
In-Reply-To: <92b3723f22c7eaef6c21cedbde230c4eb3f3ee38.camel@pbarker.dev>
Message-ID: <1226682.1795512665754697582@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zRgPEnifbIzZxxQmGBY6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250983

--zRgPEnifbIzZxxQmGBY6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 04:39 PM, Paul Barker wrote:

>=20
> On Mon, 2026-10-19 at 09:52 +0000, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
>=20
>> Hi Paul, Yoann,
>>=20
>> Thanks for the review.
>>=20
>> The go.mod, go.sum, and vendor/modules.txt changes are not required for
>> this Go 1.22 backport, as the upstream Go 1.25 commit updates the entire
>> x/net dependency to revision a9171bc8 [1].
>>=20
>> For Go 1.22, the required security fix is applied directly to
>> src/net/http/h2_bundle.go [2]. The fix addresses the infinite CONTINUATI=
ON
>> frame loop described in the CVE.
>>=20
>> Updating only the dependency metadata without updating the complete
>> vendored x/net source would be inconsistent. Since this is a focused
>> security backport, the dependency update is not needed.
>>=20
>> The additional validation-related change in the upstream commit is not
>> applicable to Go 1.22, as the corresponding code is not present in this
>> version [2].
>>=20
>> References:
>> [1] https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359=
ed5307%5E%21/
>>=20
>> [2] https://github.com/golang/go/blob/go1.22.12/src/net/http/h2_bundle.g=
o
>=20
> Hi Hetvi,
>=20
> If you've checked this and you're confident that the go.mod/go.sum
> changes are not needed then this patch can go ahead.
>=20
> Best regards,
>=20
> --
> Paul Barker

Hi,

Just following up on this patch, as it appears to be still pending review.

Could you please let me know if any further changes are required or if it c=
an be considered for merging?

Regards,
Hetvi

--zRgPEnifbIzZxxQmGBY6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Oct 19, 2026 at 04:39 PM, Paul Barker wrote:</div>
<div>
<blockquote>On Mon, 2026-10-19 at 09:52 +0000, Hetvi Thakar -X (hthakar - E=
<br />INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br />
<blockquote>Hi Paul, Yoann,<br /><br />Thanks for the review.<br /><br />Th=
e go.mod, go.sum, and vendor/modules.txt changes are not required for this =
Go 1.22 backport, as the upstream Go 1.25 commit updates the entire x/net d=
ependency to revision a9171bc8 [1].<br /><br />For Go 1.22, the required se=
curity fix is applied directly to src/net/http/h2_bundle.go [2]. The fix ad=
dresses the infinite CONTINUATION frame loop described in the CVE.<br /><br=
 />Updating only the dependency metadata without updating the complete vend=
ored x/net source would be inconsistent. Since this is a focused security b=
ackport, the dependency update is not needed.<br /><br />The additional val=
idation-related change in the upstream commit is not applicable to Go 1.22,=
 as the corresponding code is not present in this version [2].<br /><br />R=
eferences:<br />[1] <a href=3D"https://go.googlesource.com/net/+/a9171bc8c6=
f19c50efad8880f96e361359ed5307%5E%21/" target=3D"_blank" rel=3D"noopener">h=
ttps://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359ed5307%5=
E%21/</a><br />[2] <a href=3D"https://github.com/golang/go/blob/go1.22.12/s=
rc/net/http/h2_bundle.go" target=3D"_blank" rel=3D"noopener">https://github=
.com/golang/go/blob/go1.22.12/src/net/http/h2_bundle.go</a></blockquote>
Hi Hetvi,<br /><br />If you've checked this and you're confident that the g=
o.mod/go.sum<br />changes are not needed then this patch can go ahead.<br /=
><br />Best regards,<br /><br />-- <br />Paul Barker</blockquote>
</div>
<div>
<p data-pm-slice=3D"1 1 []"><span>Hi,</span></p>
<p><span>Just following up on this patch, as it appears to be still pending=
 review.</span></p>
<p><span>Could you please let me know if any further changes are required o=
r if it can be considered for merging?</span></p>
<p><span>Regards,</span><br /><span>Hetvi</span></p>
</div>

--zRgPEnifbIzZxxQmGBY6--
