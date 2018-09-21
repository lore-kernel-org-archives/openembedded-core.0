Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF3874D73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 13:31:53 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1g3LXF-0002lL-Nm from Awais_Belal@mentor.com ;
	Fri, 21 Sep 2018 06:31:53 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 21 Sep 2018 14:31:49 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Fri, 21 Sep 2018 14:31:49 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] glibc-package.inc: correct intention for
	deleting /usr/lib as needed
Thread-Index: AQHUTzrReK7EozvamEuUEKOJij+4eaT49cQAgABA2pj///uEAIABjh1l
Date: Fri, 21 Sep 2018 13:31:49 +0000
Message-ID: <1537536706360.96813@mentor.com>
References: <1537266969204.31967@mentor.com>
	<CAJTo0LbCJwoD8Rc4uLffTx5P0enQxppY4-5YmGYPDbhahU8j8A@mail.gmail.com>
	<9a58ea4be84c4f0eb2c34680a9345186@SVR-IES-MBX-03.mgc.mentorg.com>,
	<CAJTo0LYtN8Rn=Kw1opw9=-a9j2zFFaUqikvwU4LXqoqHiEot5Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYtN8Rn=Kw1opw9=-a9j2zFFaUqikvwU4LXqoqHiEot5Q@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.94.31.225]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Fri, 21 Sep 2018 13:31:53 -0000
X-Groupsio-MsgNum: 116589
Content-Language: en-US
Content-Type: multipart/mixed; boundary="_002_153753670636096813mentorcom_"

--_002_153753670636096813mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>> That's better than HTML!=0A=
Attached.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Burton, Ross <ross.burton@intel.com>=0A=
Sent: Thursday, September 20, 2018 7:46 PM=0A=
To: Belal, Awais=0A=
Cc: OE-core=0A=
Subject: Re: [OE-core] [PATCH] glibc-package.inc: correct intention for del=
eting /usr/lib as needed=0A=
=0A=
That's better than HTML!=0A=
On Thu, 20 Sep 2018 at 15:04, Belal, Awais <Awais_Belal@mentor.com> wrote:=
=0A=
>=0A=
> Hi Ross,=0A=
>=0A=
> >> Can you resend using git-send-email, as this patch is encoded in HTML.=
=0A=
> My SMTP server is acting up these days, should I simply resend the patch =
here as an attachment?=0A=
>=0A=
> BR,=0A=
> Awais=0A=
>=0A=
> ________________________________________=0A=
> From: Burton, Ross [ross.burton@intel.com]=0A=
> Sent: Thursday, September 20, 2018 4:10 PM=0A=
> To: Belal, Awais=0A=
> Cc: OE-core=0A=
> Subject: Re: [OE-core] [PATCH] glibc-package.inc: correct intention for d=
eleting /usr/lib as needed=0A=
>=0A=
> Can you resend using git-send-email, as this patch is encoded in HTML.=0A=
>=0A=
> Ross=0A=
> On Tue, 18 Sep 2018 at 11:53, Belal, Awais <Awais_Belal@mentor.com> wrote=
:=0A=
> >=0A=
> > In case the baselib is lib64 we would want to delete /usr/lib=0A=
> > after removing the /usr/lib/locale dir and the implementation=0A=
> > wanted to do that earlier as well but the fault was checking=0A=
> > an already removed dir (/usr/lib/locale) before trying to=0A=
> > remove /usr/lib as that check would always fail.=0A=
> > Now we simply try to delete /usr/lib after deleting=0A=
> > /usr/lib/locale to make sure it deletes cleanly and is empty=0A=
> > at the time of deletion.=0A=
> >=0A=
> > Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> > ---=0A=
> >  meta/recipes-core/glibc/glibc-package.inc | 9 ++++-----=0A=
> >  1 file changed, 4 insertions(+), 5 deletions(-)=0A=
> >=0A=
> > diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-c=
ore/glibc/glibc-package.inc=0A=
> > index 9ea41b7..22a59d2 100644=0A=
> > --- a/meta/recipes-core/glibc/glibc-package.inc=0A=
> > +++ b/meta/recipes-core/glibc/glibc-package.inc=0A=
> > @@ -207,11 +207,10 @@ do_poststash_install_cleanup () {=0A=
> >      rm -rf ${D}/${localedir}=0A=
> >      rm -rf ${D}${datadir}/locale=0A=
> >      if [ "${libdir}" !=3D "${exec_prefix}/lib" ]; then=0A=
> > -        if [ -d ${D}${exec_prefix}/lib/locale ] ; then=0A=
> > -            rm -rf ${D}${exec_prefix}/lib/locale=0A=
> > -            # error out if directory isn't empty=0A=
> > -            rm -f ${D}${exec_prefix}/lib=0A=
> > -        fi=0A=
> > +        # error out if directory isn't empty=0A=
> > +        # this dir should only contain locale dir=0A=
> > +        # which has been deleted in the previous step=0A=
> > +        rmdir ${D}${exec_prefix}/lib=0A=
> >      fi=0A=
> >  }=0A=
> >  addtask do_poststash_install_cleanup after do_stash_locale do_install =
before do_populate_sysroot do_package=0A=
> > --=0A=
> > 2.7.4=0A=
> >=0A=
> >=0A=
> > --=0A=
> > _______________________________________________=0A=
> > Openembedded-core mailing list=0A=
> > Openembedded-core@lists.openembedded.org=0A=
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

--_002_153753670636096813mentorcom_
Content-Type: text/x-patch;
	name="0001-glibc-package.inc-correct-intention-for-deleting-usr.patch"
Content-Description: 0001-glibc-package.inc-correct-intention-for-deleting-usr.patch
Content-Disposition: attachment;
	filename="0001-glibc-package.inc-correct-intention-for-deleting-usr.patch";
	size=1689; creation-date="Fri, 21 Sep 2018 13:31:38 GMT";
	modification-date="Fri, 21 Sep 2018 13:31:38 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1YmM0ZjdmMDc5MDNiYWY4YjliZDE1MGNjZDY2MTA3OTQxNzQ3MzEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBd2FpcyBCZWxhbCA8YXdhaXNfYmVsYWxAbWVudG9yLmNvbT4K
RGF0ZTogVHVlLCAxOCBTZXAgMjAxOCAxMzo1MDo1OSArMDUwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWJjLXBhY2thZ2UuaW5jOiBjb3JyZWN0IGludGVudGlvbiBmb3IgZGVsZXRpbmcgL3Vzci9saWIg
YXMKIG5lZWRlZAoKSW4gY2FzZSB0aGUgYmFzZWxpYiBpcyBsaWI2NCB3ZSB3b3VsZCB3YW50IHRv
IGRlbGV0ZSAvdXNyL2xpYgphZnRlciByZW1vdmluZyB0aGUgL3Vzci9saWIvbG9jYWxlIGRpciBh
bmQgdGhlIGltcGxlbWVudGF0aW9uCndhbnRlZCB0byBkbyB0aGF0IGVhcmxpZXIgYXMgd2VsbCBi
dXQgdGhlIGZhdWx0IHdhcyBjaGVja2luZwphbiBhbHJlYWR5IHJlbW92ZWQgZGlyICgvdXNyL2xp
Yi9sb2NhbGUpIGJlZm9yZSB0cnlpbmcgdG8KcmVtb3ZlIC91c3IvbGliIGFzIHRoYXQgY2hlY2sg
d291bGQgYWx3YXlzIGZhaWwuCk5vdyB3ZSBzaW1wbHkgdHJ5IHRvIGRlbGV0ZSAvdXNyL2xpYiBh
ZnRlciBkZWxldGluZwovdXNyL2xpYi9sb2NhbGUgdG8gbWFrZSBzdXJlIGl0IGRlbGV0ZXMgY2xl
YW5seSBhbmQgaXMgZW1wdHkKYXQgdGhlIHRpbWUgb2YgZGVsZXRpb24uCgpTaWduZWQtb2ZmLWJ5
OiBBd2FpcyBCZWxhbCA8YXdhaXNfYmVsYWxAbWVudG9yLmNvbT4KLS0tCiBtZXRhL3JlY2lwZXMt
Y29yZS9nbGliYy9nbGliYy1wYWNrYWdlLmluYyB8IDkgKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWJjL2dsaWJjLXBhY2thZ2UuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
YmMvZ2xpYmMtcGFja2FnZS5pbmMKaW5kZXggOWVhNDFiNy4uMjJhNTlkMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtcGFja2FnZS5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYmMvZ2xpYmMtcGFja2FnZS5pbmMKQEAgLTIwNywxMSArMjA3LDEwIEBAIGRv
X3Bvc3RzdGFzaF9pbnN0YWxsX2NsZWFudXAgKCkgewogCXJtIC1yZiAke0R9LyR7bG9jYWxlZGly
fQogCXJtIC1yZiAke0R9JHtkYXRhZGlyfS9sb2NhbGUKIAlpZiBbICIke2xpYmRpcn0iICE9ICIk
e2V4ZWNfcHJlZml4fS9saWIiIF07IHRoZW4KLQkJaWYgWyAtZCAke0R9JHtleGVjX3ByZWZpeH0v
bGliL2xvY2FsZSBdIDsgdGhlbgotCQkJcm0gLXJmICR7RH0ke2V4ZWNfcHJlZml4fS9saWIvbG9j
YWxlCi0JCQkjIGVycm9yIG91dCBpZiBkaXJlY3RvcnkgaXNuJ3QgZW1wdHkKLQkJCXJtIC1mICR7
RH0ke2V4ZWNfcHJlZml4fS9saWIKLQkJZmkKKwkJIyBlcnJvciBvdXQgaWYgZGlyZWN0b3J5IGlz
bid0IGVtcHR5CisJCSMgdGhpcyBkaXIgc2hvdWxkIG9ubHkgY29udGFpbiBsb2NhbGUgZGlyCisJ
CSMgd2hpY2ggaGFzIGJlZW4gZGVsZXRlZCBpbiB0aGUgcHJldmlvdXMgc3RlcAorCQlybWRpciAk
e0R9JHtleGVjX3ByZWZpeH0vbGliCiAJZmkKIH0KIGFkZHRhc2sgZG9fcG9zdHN0YXNoX2luc3Rh
bGxfY2xlYW51cCBhZnRlciBkb19zdGFzaF9sb2NhbGUgZG9faW5zdGFsbCBiZWZvcmUgZG9fcG9w
dWxhdGVfc3lzcm9vdCBkb19wYWNrYWdlCi0tIAoyLjcuNAoK

--_002_153753670636096813mentorcom_--
