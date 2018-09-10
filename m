Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39A82793ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 21:06:00 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f21-v6so22939521wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=G2Eh7DmRsFU5tW37i6fqaxIlzO240BPAeA9/RY2oKGo=;
	b=ouM7nBZQKEvHsWqathWQsOspBrjXZEyHE3EQkqXwCB3kpPTssav14xcakUzbQDLnQ6
	QCcOWKLFPbFJYT+ffsGdpTu8+Kh5CTaEwIRF/TnYdqy5ppME44656ggW4kE+O771jkWM
	+Xw+9WGfoMXfKGqB1e5kPlOe6k4L2bO5bCoHzTygABKJgpVPBkQLFLZQoFndLJrOwKbe
	WYONYSQQazv1LODle+CsQ11DSRhk8tSb3sZOi9rqTxjYzZQOguOGWcfwAY1IuBf179oY
	mgd7nnhU5O0ZU1sXCDK2/WinwpbgSzpJfYvNm+Fba/ala4XwGMAz8aTTIy/QPtruZFRN
	Z1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=G2Eh7DmRsFU5tW37i6fqaxIlzO240BPAeA9/RY2oKGo=;
	b=t2p/tZWHgQolb2NPV8D8gB/PJ4QaZc3skGZsVw7QCLLqk1LYZwZ9+g7EcVBzs9u/4p
	DqBM9MOoi0PpzZGats11V2piwVGykgAGn+4cr26rzbyiwVp4C0SGbDfpQhzRK5vRosTV
	DKTy46jhiq44aX4oYRpcaXbzvjHAmRUqFPwZM+OW2l/iTRWWiGLTV6T9eB13kL9oxm2Y
	sniIBmyf9P9RiuQ6GgF3CDxvCqLkruwnxw4/gNH/o4eMAXYew9HjdrxKqfDpMnZ45jg0
	A1uy7KfapUDGrdLXcSgHgOkPrm04MSmrVpBkK/fX2QrO4KIdE0DaVoBRuY1SQOoyO+M9
	pXlw==
X-Gm-Message-State: APzg51C8M7e8U7Aq1zhEvUgCxsPfUTe7L6V49TFeNLiqgv2N2eZT4gSo
	PaiFWVvScDRsxNtwkHY2wKHOSJFa
X-Google-Smtp-Source: ANB0VdbOG2Y1Fhkn5TcpK5GJehHgkkBCr2ffbATx5c2sDPqYON3+iqAdPCOdiXnCqD7U2WThe/rUIg==
X-Received: by 2002:a1c:9e89:: with SMTP id
	h131-v6mr1908838wme.13.1536613560785; 
	Mon, 10 Sep 2018 14:06:00 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	q135-v6sm28601344wmd.4.2018.09.10.14.05.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 14:05:59 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 10 Sep 2018 23:05:57 +0200
In-Reply-To: <27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
	<27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 21:06:00 -0000
X-Groupsio-MsgNum: 116117
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0383A4C8-B517-4A71-971A-A668ABB5ED0B";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_0383A4C8-B517-4A71-971A-A668ABB5ED0B
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_441DE776-B02A-4604-B5AD-6649E4CFFBB3"

--Apple-Mail=_441DE776-B02A-4604-B5AD-6649E4CFFBB3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hey Alejandro,

I fixed that for cross-compile only, since I would need add a patch and =
a dependency python3-native for one thing: calculate uuids.
When you can explain to me why the python-native needs that, I'll change =
that from -target & nativesdk to all.

=46rom my point of view it's not a question of having every (unneeded) =
python module being built for the native python, which is used for =
cross-compiling python and some modules only.

Cheers,
Jens

> Am 10.09.2018 um 22:17 schrieb Alejandro Enedino Hernandez Samaniego =
<alejandro.enedino.hernandez-samaniego@xilinx.com>:
>=20
> Hey Jens,
>=20
> The compilation log for python3-native still shows that it didn't =
build the uuid module
>=20
>=20
> Python build finished successfully!
> The necessary bits to build these optional modules were not found:
> _uuid
>=20
> Please look at my previous reply to find how this can be solved (its =
likely a missing DEPENDS).
>=20
>=20
> Also, this patch is missing the new python3 manifest for this release, =
there appears to be a few new modules that we need to decide which =
package they belong to, this is the output of bitbake python3 -c =
create_manifest:
>=20
>=20
> | ERROR:
> | The following files are repeated (contained in more than one =
package),
> | this is likely to happen when new files are introduced after an =
upgrade,
> | please check which package should get it,
> |  modify the manifest accordingly and re-run the create_manifest =
task:
> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so
> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so
> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so
> | ${libdir}/python${PYTHON_MAJMIN}/contextvars.py
> | ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc
> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so
>=20
>=20
> Cheers,
>=20
>=20
> Alejandro
>=20
>=20
> On 09/10/2018 09:38 AM, Burton, Ross wrote:
>> One thing to be aware of is that I've been fixing up Python's PGO
>> support and there's a slew of patches in master-next and more just
>> posted that this needs to be rebased on top of.  Good news is that my
>> patches remove two of the patches we've been carrying!
>>=20
>> Ross
>>=20
>> On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org> wrote:
>>>=20
>>> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com>:
>>>=20
>>> Large parts of dnf and friends have been rewritten in c++. I have =
not
>>> yet updated and reviewed that, that will happen in the next cycle.
>>>=20
>>>=20
>>> If I can prepare something for you - drop me a note.
>>> Otherwise - the perl-5.28 update ("." in @INC, regex buffer =
overflow, ...)
>>> is also
>>> awaiting some progress (I can keep "myself" busy).
>>>=20
>>> There's already enough disruption to deal with (postinsts errors,
>>> openssl 1.1, both caused by me :)
>>>=20
>>>=20
>>> You know, corner, ash, ... things happen. But there is progress! =
Great!
>>>=20
>>> Good that we got all the way to do_rootfs though with 3.7.
>>>=20
>>>=20
>>> Yeah, but than came postinst (coreutils :P) :D
>>>=20
>>> Cheers
>>>=20
>>> Alex
>>>=20
>>> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
>>>=20
>>> I did not review the patches closely, but I did try to build
>>> core-image-full-cmdline with the tip of poky and these patches =
applied.
>>> Everything was fine until do_rootfs... I've attached the log.
>>>=20
>>> Essentially, there are some bits of dnf and so on which are not =
ready for
>>> Python 3.7. We have dnf version 2.7.5, but the latest upstream =
release is
>>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would =
have
>>> helped.
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>>>=20
>>> --
>>> Jens Rehsack - rehsack@gmail.com
>>>=20
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_441DE776-B02A-4604-B5AD-6649E4CFFBB3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hey =
Alejandro,<div class=3D""><br class=3D""></div><div class=3D"">I fixed =
that for cross-compile only, since I would need add a patch and a =
dependency python3-native for one thing: calculate uuids.</div><div =
class=3D"">When you can explain to me why the python-native needs that, =
I'll change that from -target &amp; nativesdk to all.</div><div =
class=3D""><br class=3D""></div><div class=3D"">=46rom my point of view =
it's not a question of having every (unneeded) python module being built =
for the native python, which is used for cross-compiling python and some =
modules only.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Cheers,</div><div class=3D"">Jens<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Am =
10.09.2018 um 22:17 schrieb Alejandro Enedino Hernandez Samaniego &lt;<a =
href=3D"mailto:alejandro.enedino.hernandez-samaniego@xilinx.com" =
class=3D"">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>=
<br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">Hey Jens,<br class=3D""><br class=3D"">The compilation log =
for python3-native still shows that it didn't build the uuid module<br =
class=3D""><br class=3D""><br class=3D"">Python build finished =
successfully!<br class=3D"">The necessary bits to build these optional =
modules were not found:<br class=3D"">_uuid<br class=3D""><br =
class=3D"">Please look at my previous reply to find how this can be =
solved (its likely a missing DEPENDS).<br class=3D""><br class=3D""><br =
class=3D"">Also, this patch is missing the new python3 manifest for this =
release, there appears to be a few new modules that we need to decide =
which package they belong to, this is the output of bitbake python3 -c =
create_manifest:<br class=3D""><br class=3D""><br class=3D"">| ERROR:<br =
class=3D"">| The following files are repeated (contained in more than =
one package),<br class=3D"">| this is likely to happen when new files =
are introduced after an upgrade,<br class=3D"">| please check which =
package should get it,<br class=3D"">| &nbsp;modify the manifest =
accordingly and re-run the create_manifest task:<br class=3D"">| =
${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so<br class=3D"">| =
${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so<br class=3D"">| =
${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so<br =
class=3D"">| ${libdir}/python${PYTHON_MAJMIN}/contextvars.py<br =
class=3D"">| =
${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc<br =
class=3D"">| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so<br =
class=3D""><br class=3D""><br class=3D"">Cheers,<br class=3D""><br =
class=3D""><br class=3D"">Alejandro<br class=3D""><br class=3D""><br =
class=3D"">On 09/10/2018 09:38 AM, Burton, Ross wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">One thing to be aware of =
is that I've been fixing up Python's PGO<br class=3D"">support and =
there's a slew of patches in master-next and more just<br =
class=3D"">posted that this needs to be rebased on top of. &nbsp;Good =
news is that my<br class=3D"">patches remove two of the patches we've =
been carrying!<br class=3D""><br class=3D"">Ross<br class=3D""><br =
class=3D"">On 10 September 2018 at 17:36, Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt; =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"">Am 10.09.2018 um 11:35 schrieb Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;:<br class=3D""><br =
class=3D"">Large parts of dnf and friends have been rewritten in c++. I =
have not<br class=3D"">yet updated and reviewed that, that will happen =
in the next cycle.<br class=3D""><br class=3D""><br class=3D"">If I can =
prepare something for you - drop me a note.<br class=3D"">Otherwise - =
the perl-5.28 update ("." in @INC, regex buffer overflow, ...)<br =
class=3D"">is also<br class=3D"">awaiting some progress (I can keep =
"myself" busy).<br class=3D""><br class=3D"">There's already enough =
disruption to deal with (postinsts errors,<br class=3D"">openssl 1.1, =
both caused by me :)<br class=3D""><br class=3D""><br class=3D"">You =
know, corner, ash, ... things happen. But there is progress! Great!<br =
class=3D""><br class=3D"">Good that we got all the way to do_rootfs =
though with 3.7.<br class=3D""><br class=3D""><br class=3D"">Yeah, but =
than came postinst (coreutils :P) :D<br class=3D""><br =
class=3D"">Cheers<br class=3D""><br class=3D"">Alex<br class=3D""><br =
class=3D"">2018-09-10 0:38 GMT+02:00 Tim Orling &lt;<a =
href=3D"mailto:ticotimo@gmail.com" =
class=3D"">ticotimo@gmail.com</a>&gt;:<br class=3D""><br class=3D"">I =
did not review the patches closely, but I did try to build<br =
class=3D"">core-image-full-cmdline with the tip of poky and these =
patches applied.<br class=3D"">Everything was fine until do_rootfs... =
I've attached the log.<br class=3D""><br class=3D"">Essentially, there =
are some bits of dnf and so on which are not ready for<br =
class=3D"">Python 3.7. We have dnf version 2.7.5, but the latest =
upstream release is<br class=3D"">3.4.0 (with a 3.5.0 just 3 days ago). =
Not sure yet if that would have<br class=3D"">helped.<br class=3D""><br =
class=3D"">--<br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""><br class=3D""><br class=3D"">--<br class=3D"">Jens =
Rehsack - rehsack@gmail.com<br class=3D""><br class=3D""><br =
class=3D"">--<br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br =
class=3D"">Openembedded-core@lists.openembedded.org<br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""><br class=3D""></blockquote></blockquote><br class=3D"">--=
 <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></div></blockquote></div><br class=3D""><div =
class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_441DE776-B02A-4604-B5AD-6649E4CFFBB3--

--Apple-Mail=_0383A4C8-B517-4A71-971A-A668ABB5ED0B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluW3LUACgkQRJmWrtzl
Cp3+sQ//cCbfd1wtsD7XwgdTFzlcZn3UKEd9A2omDC5ryWwvyzaNMB5VdFXwF/PY
f2GIe/8FP2hHo/qcFejKPwj1NTmuRFVnzyQsS6JYqmpPFC5ODbzKgagizDlsTz2e
LGwdPkV2rFHRz3u1kbS/90lPHWJykkjnMaxplRO6EubeVvYiADJO+Niuvs8MyYe2
+rTfL9zNpGy49Cvx1XOwHBDvbwYvXtpOAiRpiMdgMStOuhMDGtogGZ4d2d0ao6AP
HEnR+Qq9WNkR1wm5vwBph6S0PHHiSk3khzWR1T54rlj5TLIEYdkZftS0BSH/gnxI
vrRzee/zTKj8AmiJjssgVFjN02Nv0/RxjgbuS6FCUHWbYx+62mSYp8KJ3OLubGuL
6gL6kmPQW1ELZpMGUHok3PrKVydnjxKTr0xw+yXH61biYGrSWU8xF7KM6oVtIqS/
6ADTmUaIZNyV3gMmTf/6pTiQbMkmlIJimHEL9MQ+abi8u5ehy/XN2gfHATijc6Ub
aU1KVn9wTAqu5oFprG8iR5HnEUQirnB47Upn+WwVf2AqSAaR0a5u+Oz3mA+WZNjK
TlpB8ZaVLxq0IiR1cV36BlFvSjbEagcN0p7Q5G1zJDKK1UUzwNOj6+kVrkmTQ2Ob
8u6iX97HKJaVsMjNK3ABLPB1QMD7Kpbc1aR0iXRbrJeYa0wCNTg=
=teqx
-----END PGP SIGNATURE-----

--Apple-Mail=_0383A4C8-B517-4A71-971A-A668ABB5ED0B--
