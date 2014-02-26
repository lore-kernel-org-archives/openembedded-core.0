Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0212.outbound.protection.outlook.com [207.46.163.212])
	by mail.openembedded.org (Postfix) with ESMTP id C1EDB6B89F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 18:30:11 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	BL2PR03MB162.namprd03.prod.outlook.com (10.255.230.145) with Microsoft
	SMTP Server (TLS) id 15.0.888.9; Wed, 26 Feb 2014 18:29:57 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0883.010; Wed, 26 Feb 2014 18:29:57 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0IAACoyAgAMsSfCAAcCFgIAHP+YAgAOMSPCAAAT4gIAAAF3wgBDDSgCAGB5SgA==
Date: Wed, 26 Feb 2014 18:29:56 +0000
Message-ID: <2704c8b5c1dd41bba04055ba98c436be@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted>	<52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted>	<52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
	<1390596961.24755.21.camel@e130.pbcl.net>	<1390995512.24655.62.camel@ted>
	<da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>
	<1391191631.28575.7.camel@ted>
	<fca6c32db2694c3c9c8a3f0130a3c039@DM2PR03MB368.namprd03.prod.outlook.com>
	<52F9F668.9020002@enea.com>
In-Reply-To: <52F9F668.9020002@enea.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(377424004)(377454003)(51704005)(164054003)(71364002)(189002)(199002)(24454002)(13464003)(33646001)(74316001)(74876001)(74366001)(15975445006)(81342001)(81542001)(95666003)(59766001)(50986001)(81816001)(4396001)(69226001)(15202345003)(94316002)(86362001)(54356001)(93516002)(49866001)(94946001)(85852003)(53806001)(76576001)(47976001)(76796001)(47446002)(93136001)(56816005)(74502001)(90146001)(56776001)(54316002)(87266001)(19580395003)(19580405001)(83322001)(76482001)(95416001)(83072002)(92566001)(80976001)(79102001)(63696002)(2656002)(47736001)(76786001)(87936001)(74662001)(81686001)(46102001)(31966008)(85306002)(51856001)(80022001)(66066001)(65816001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB162;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:76F5C8A6.ACC9AD1A.22F575C8.44EC62BD.201E8; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Wed, 26 Feb 2014 18:30:15 -0000
X-Groupsio-MsgNum: 50624
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_2704c8b5c1dd41bba04055ba98c436beDM2PR03MB368namprd03pro_"

--_002_2704c8b5c1dd41bba04055ba98c436beDM2PR03MB368namprd03pro_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi David,

Sorry for the late reply.
I'm not familiar with the procedure for submitting a patch to Poky.=20
Could you walk me through the process?

Meanwhile I've attached the patch to this e-mail. It's been tested
on e500v2, e5500 and e6500.

Kind regards,
Alex


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> David Nystr=F6m
> Sent: Tuesday, February 11, 2014 12:08 PM
> To: Sardan Alexandru Cezar-B41700; Richard Purdie
> Cc: Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc
> linux verses linux-gnuspe"
>=20
> On 2014-01-31 19:17, alexandru.sardan@freescale.com wrote:
> > Hi,
> >
> > Sure, I'll do this and also some more extensive testing
> > on the boards.
> >
> > Thanks,
> > Alex
> >
>=20
> Hi Alex,
>=20
> Whats the status on this ?
>=20
> Br,
> David
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--_002_2704c8b5c1dd41bba04055ba98c436beDM2PR03MB368namprd03pro_
Content-Type: application/octet-stream;
	name="0001-Enable-SPE-and-AltiVec-generation-on-powepc-linux-target.patch"
Content-Description: 0001-Enable-SPE-and-AltiVec-generation-on-powepc-linux-target.patch
Content-Disposition: attachment; filename=
	"0001-Enable-SPE-and-AltiVec-generation-on-powepc-linux-target.patch";
	size=5266; creation-date="Wed, 26 Feb 2014 18:12:57 GMT";
	modification-date="Wed, 26 Feb 2014 14:58:54 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3YzdlZWU1NmFlNjlkYzI4YzljNDg5N2VlMTNjM2VlOWQ3YTdmNGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUtQ2V6YXIgU2FyZGFuIDxhbGV4YW5kcnUuc2Fy
ZGFuQGZyZWVzY2FsZS5jb20+CkRhdGU6IFRodSwgMjAgRmViIDIwMTQgMTU6NTk6MDMgKzAyMDAK
U3ViamVjdDogW1BBVENIXSBFbmFibGUgU1BFICYgQWx0aVZlYyBnZW5lcmF0aW9uIG9uIHBvd2Vw
YypsaW51eCB0YXJnZXQuCgpBbHNvIHRoaXMgcGF0Y2ggYWRkcyBzeW1saW5rcyB0byBsaWJnY2Mg
c3VjaCB0aGF0IGEgR0NDIGNvbmZpZ3VyZWQKYnkgcGFzc2luZyB0aGUgdGFyZ2V0IHBhcmFtZXRl
ciB3aXRob3V0IExJQkNFWFRFTlNJT04gYW5kIEFCSUVYVEVOU0lPTgpzcGVjaWZpZXJzIHRvIGZp
bmQgdGhlIGNvcnJlY3Qgc3RhcnR1cCBmaWxlcyBmcm9tIGEgbGliZ2NjIGNvbmZpZ3VyZWQKd2l0
aCB0aGVzZSB2YXJpYWJsZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUtQ2V6YXIgU2FyZGFu
IDxhbGV4YW5kcnUuc2FyZGFuQGZyZWVzY2FsZS5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2djYy9nY2MtNC44LmluYyAgICAgICAgICAgICAgfCAgICAxICsKIC4uLkFsdGlWZWMtZ2Vu
ZXJhdGlvbi1vbi1wb3dlcGMtbGludXgtdGFyZ2V0LnBhdGNoIHwgICA0MCArKysrKysrKysrKysr
KysrKysrKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9saWJnY2MuaW5jICAgICAgICAgICAg
ICAgfCAgIDI1ICsrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtNC44LzAwNDktRW5hYmxlLVNQRS1BbHRpVmVjLWdlbmVyYXRpb24tb24tcG93ZXBj
LWxpbnV4LXRhcmdldC5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTQuOC5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy00LjguaW5jCmlu
ZGV4IGZkZDBjMTIuLmY1ZTU4M2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLTQuOC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtNC44Lmlu
YwpAQCAtNjksNiArNjksNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2NjL2djYy0ke1BW
fS9nY2MtJHtQVn0udGFyLmJ6MiBcCiAJICAgZmlsZTovLzAwNDYtbGliYXRvbWljLWRlcHRyYWNr
aW5nLnBhdGNoIFwKIAkgICBmaWxlOi8vMDA0Ny1yZXBvbWVtYnVnLnBhdGNoIFwKIAkgICBmaWxl
Oi8vMDA0OC1QUjU4ODU0X2ZpeF9hcm1fYXBjc19lcGlsb2d1ZS5wYXRjaCBcCisJICAgZmlsZTov
LzAwNDktRW5hYmxlLVNQRS1BbHRpVmVjLWdlbmVyYXRpb24tb24tcG93ZXBjLWxpbnV4LXRhcmdl
dC5wYXRjaCBcIAogCSAgIgogU1JDX1VSSVttZDVzdW1dID0gImEzZDdkNjNiOWNiNmI2ZWEwNDk0
NjlhMGM0YTQzYzlkIgogU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA5ZGMyMjc2YzczNDI0YmJiZmRh
MWRiZGRjNjJiYmJmOTAwYzlmMTg1YWNmN2YzZTFkNzczY2UyZDdlM2NkYzgiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy00LjgvMDA0OS1FbmFibGUtU1BFLUFsdGlW
ZWMtZ2VuZXJhdGlvbi1vbi1wb3dlcGMtbGludXgtdGFyZ2V0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtNC44LzAwNDktRW5hYmxlLVNQRS1BbHRpVmVjLWdlbmVyYXRpb24t
b24tcG93ZXBjLWxpbnV4LXRhcmdldC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwLi43NmZiYjdhCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtNC44LzAwNDktRW5hYmxlLVNQRS1BbHRpVmVjLWdlbmVyYXRpb24tb24tcG93ZXBj
LWxpbnV4LXRhcmdldC5wYXRjaApAQCAtMCwwICsxLDQwIEBACitGcm9tIDllMGUxOWVhYzI1NjJm
NzM4NTg2MDJmZTI2ZTIwNDRlYjhiMjBjNDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBBbGV4YW5kcnUtQ2V6YXIgU2FyZGFuIDxhbGV4YW5kcnUuc2FyZGFuQGZyZWVzY2FsZS5jb20+
CitEYXRlOiBXZWQsIDUgRmViIDIwMTQgMTY6NTI6MzEgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0g
RW5hYmxlIFNQRSAmIEFsdGlWZWMgZ2VuZXJhdGlvbiBvbiBwb3dlcGMqbGludXggdGFyZ2V0CisK
K1doZW4gaXMgY29uZmlndXJlZCB3aXRoIC0tdGFyZ2V0PXBvd2VycGMtbGludXgsIHRoZSByZXN1
bHRpbmcgR0NDIHdpbGwgCitub3QgYmUgYWJsZSB0byBnZW5lcmF0ZSBjb2RlIGZvciBTUEUgdGFy
Z2V0cyAoZTUwMHYxL3YyKS4KK0dDQyBjb25maWd1cmVkIHdpdGggLS10YXJnZXQ9cG93ZXJwYy1s
aW51eHNwZSB3aWxsIG5vdCBiZSBhYmxlIHRvCitnZW5lcmF0ZSBBbHRpVmVjIGluc3RydWN0aW9u
cyAoZm9yIGU2NTAwKS4KK1RoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlIGNvbmZpZ3VyZWQgZmlsZSBz
dWNoIHRoYXQgU1BFIG9yIEFsdGlWZWMgY29kZQorY2FuIGJlIGdlbmVyYXRlZCB3aGVuIGdjYyBp
cyBjb25maWd1cmVkIHdpdGggLS10YXJnZXQ9cG93ZXJwYy1saW51eC4KK1RoZSBBQkkgYW5kIHNw
ZWNpZmZpYyBpbnN0cnVjdGlvbnMgY2FuIGJlIHNlbGVjdGVkIHRocm91Z2ggdGhlCisiLW1hYmk9
c3BlIG9yIC1tYWJpPWFsdGl2ZWMiIGFuZCB0aGUgIi1tc3BlIG9yIC1tYWx0aXZlYyIgcGFyYW1l
dGVycy4KKworU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1LUNlemFyIFNhcmRhbiA8YWxleGFuZHJ1
LnNhcmRhbkBmcmVlc2NhbGUuY29tPgorLS0tCisgZ2NjL2NvbmZpZy5nY2MgfCAgICA3ICsrKysr
Ky0KKyAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2Rp
ZmYgLS1naXQgYS9nY2MvY29uZmlnLmdjYyBiL2djYy9jb25maWcuZ2NjCitpbmRleCBjYjdhOTRl
Li5kMzkyYzJiIDEwMDY0NAorLS0tIGEvZ2NjL2NvbmZpZy5nY2MKKysrKyBiL2djYy9jb25maWcu
Z2NjCitAQCAtMjA2OCw3ICsyMDY4LDEyIEBAIHBvd2VycGMtKi1ydGVtcyopCisgCXRtYWtlX2Zp
bGU9InJzNjAwMC90LWZwcnVsZXMgcnM2MDAwL3QtcnRlbXMgdC1ydGVtcyByczYwMDAvdC1wcGNj
b21tIgorIAk7OworIHBvd2VycGMqLSotbGludXgqKQorLQl0bV9maWxlPSIke3RtX2ZpbGV9IGRi
eGVsZi5oIGVsZm9zLmggZnJlZWJzZC1zcGVjLmggcnM2MDAwL3N5c3Y0LmgiCisrCWNhc2UgJHt0
YXJnZXR9IGluCisrCSAgICBwb3dlcnBjKi0qLWxpbnV4KnNwZSogfCBwb3dlcnBjKi0qLWxpbnV4
KmFsdGl2ZWMqKQorKwkJdG1fZmlsZT0iJHt0bV9maWxlfSBkYnhlbGYuaCBlbGZvcy5oIGZyZWVi
c2Qtc3BlYy5oIHJzNjAwMC9zeXN2NC5oIiA7OworKwkgICAgKikKKysJCXRtX2ZpbGU9IiR7dG1f
ZmlsZX0gZGJ4ZWxmLmggZWxmb3MuaCBmcmVlYnNkLXNwZWMuaCByczYwMDAvc3lzdjQuaCByczYw
MDAvbGludXhhbHRpdmVjLmggcnM2MDAwL2xpbnV4c3BlLmggcnM2MDAwL2U1MDAuaCIgOzsKKysJ
ZXNhYworIAlleHRyYV9vcHRpb25zPSIke2V4dHJhX29wdGlvbnN9IHJzNjAwMC9zeXN2NC5vcHQi
CisgCXRtYWtlX2ZpbGU9InJzNjAwMC90LWZwcnVsZXMgcnM2MDAwL3QtcHBjb3MgJHt0bWFrZV9m
aWxlfSByczYwMDAvdC1wcGNjb21tIgorIAljYXNlICR7dGFyZ2V0fSBpbgorLS0gCisxLjcuOS41
CisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLmluYwppbmRleCBmZTk4MjM4Li44ZjQwMGIx
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2xpYmdjYy5pbmMKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9saWJnY2MuaW5jCkBAIC0xNyw3ICsxNyw4IEBAIEZJ
TEVTXyR7UE59LWRldiA9ICIgXAogICAke2xpYmRpcn0vJHtUQVJHRVRfU1lTfS8ke0JJTlZ9LzMy
IFwKICAgJHtsaWJkaXJ9LyR7VEFSR0VUX1NZU30vJHtCSU5WfS94MzIgXAogICAke2xpYmRpcn0v
JHtUQVJHRVRfU1lTfS8ke0JJTlZ9L24zMiBcCi0gICR7bGliZGlyfS8ke1RBUkdFVF9TWVN9LyR7
QklOVn0vbGliZ2NjKiIKKyAgJHtsaWJkaXJ9LyR7VEFSR0VUX1NZU30vJHtCSU5WfS9saWJnY2Mq
IFwKKyAgJHtAYmFzZV9jb25kaXRpb25hbCgnVEFSR0VUX1NZU19OT19FWFRFTlNJT04nLCAnJHtU
QVJHRVRfU1lTfScsICcnLCAnJHtsaWJkaXJ9LyR7VEFSR0VUX1NZU19OT19FWFRFTlNJT059Jywg
ZCl9IgogRklMRVNfbGliZ2Nvdi1kZXYgPSAiIFwKICAgJHtsaWJkaXJ9LyR7VEFSR0VUX1NZU30v
JHtCSU5WfS9saWJnY292LmEgXAogICAiCkBAIC0xNDEsMyArMTQyLDI0IEBAIHB5dGhvbiBkb19t
dWx0aWxpYl9pbnN0YWxsKCkgewogICAgICAgICAgICAgb3MudW5saW5rKGRlc3QpCiAgICAgICAg
IG9zLnN5bWxpbmsoc3JjLCBkZXN0KQogfQorCithZGR0YXNrIGV4dHJhX3N5bWxpbmtzIGFmdGVy
IGRvX211bHRpbGliX2luc3RhbGwgYmVmb3JlIGRvX3BhY2thZ2UgZG9fcG9wdWxhdGVfc3lzcm9v
dAorcHl0aG9uIGRvX2V4dHJhX3N5bWxpbmtzKCkgeworICAgIHRhcmdldHN5c25vZXh0ID0gZC5n
ZXRWYXIoJ1RBUkdFVF9TWVNfTk9fRVhURU5TSU9OJywgVHJ1ZSkKKworICAgIGlmIHRhcmdldHN5
c25vZXh0ICE9IGQuZ2V0VmFyKCdUQVJHRVRfU1lTJywgVHJ1ZSk6CisgICAgICAgIGRlc3QgPSBk
LmdldFZhcignRCcsIFRydWUpICsgZC5nZXRWYXIoJ2xpYmRpcicsIFRydWUpICsgJy8nICsgdGFy
Z2V0c3lzbm9leHQKKyAgICAgICAgc3JjID0gZC5nZXRWYXIoJ1RBUkdFVF9TWVMnLCBUcnVlKQor
ICAgICAgICBpZiBub3Qgb3MucGF0aC5sZXhpc3RzKGRlc3QpOgorICAgICAgICAgICAgb3Muc3lt
bGluayhzcmMsIGRlc3QpCit9CisKK3B5dGhvbiAoKSB7CisgICAgdGFyZ2V0c3lzbm9leHQgPSBk
LmdldFZhcignVEFSR0VUX1NZUycsIFRydWUpCisKKyAgICBmb3Igc3VmZml4IGluIFtkLmdldFZh
cignQUJJRVhURU5TSU9OJywgVHJ1ZSksIGQuZ2V0VmFyKCdMSUJDRVhURU5TSU9OJywgVHJ1ZSld
OgorICAgICAgICBpZiBzdWZmaXggYW5kIHRhcmdldHN5c25vZXh0LmVuZHN3aXRoKHN1ZmZpeCk6
CisgICAgICAgICAgICB0YXJnZXRzeXNub2V4dCA9IHRhcmdldHN5c25vZXh0WzotbGVuKHN1ZmZp
eCldCisKKyAgICBkLnNldFZhcignVEFSR0VUX1NZU19OT19FWFRFTlNJT04nLCB0YXJnZXRzeXNu
b2V4dCkKK30KLS0gCjEuNy45LjUKCg==

--_002_2704c8b5c1dd41bba04055ba98c436beDM2PR03MB368namprd03pro_--
