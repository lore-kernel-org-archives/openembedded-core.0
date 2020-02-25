Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 73F0E616E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 23:12:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2020 15:12:41 -0800
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
	d="scan'208,217";a="231188500"
Received: from unknown (HELO [10.241.225.146]) ([10.241.225.146])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2020 15:12:40 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <530098E8-9036-4FCC-AA97-34324C8ACA84@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Date: Tue, 25 Feb 2020 15:12:40 -0800
In-Reply-To: <CANNYZj-xQ8Vxj3bh5YGEUU=RMTJ2n1NDYNh6_2YcHTaGXgRgwQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200225212233.30114-1-timothy.t.orling@linux.intel.com>
	<CANNYZj8AP-OdK9-gNTgYbcO4LwshN5ox1iHBnQKGfFc0kuKwsQ@mail.gmail.com>
	<CANNYZj-xQ8Vxj3bh5YGEUU=RMTJ2n1NDYNh6_2YcHTaGXgRgwQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Tue, 25 Feb 2020 23:12:40 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DC2C6D09-7FE3-4242-97B2-9C73624E0489"

--Apple-Mail=_DC2C6D09-7FE3-4242-97B2-9C73624E0489
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Somehow I totally missed this when sending the patch (obviously). Sigh.

I=E2=80=99m on the fence about patch versus sed. I=E2=80=99m inclined to =
stop mucking about=E2=80=A6

Thank you for the catch!

> On Feb 25, 2020, at 2:00 PM, Alexander Kanavin =
<alex.kanavin@gmail.com> wrote:
>=20
> But probably a better solution would be to keep the patch, and drop =
the custom sed hack!
>=20
> Alex
>=20
> On Tue, 25 Feb 2020 at 22:58, Alexander Kanavin =
<alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
> On Tue, 25 Feb 2020 at 22:30, Tim Orling =
<timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>> wrote:
> +           file://ptest-perl/run-ptest \
> +           file://0001-Committing-changes-from-do_patch.patch \
>=20
> These two are 'devtool upgrade' noise, and should be removed. The =
recipe does weird things which triggers devtool to add items =
unnecessarily.
>=20
> Alex


--Apple-Mail=_DC2C6D09-7FE3-4242-97B2-9C73624E0489
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Somehow I totally missed this when sending the patch =
(obviously). Sigh.<div class=3D""><br class=3D""></div><div =
class=3D"">I=E2=80=99m on the fence about patch versus sed. I=E2=80=99m =
inclined to stop mucking about=E2=80=A6</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thank you for the catch!<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 25, 2020, at 2:00 PM, Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"">But probably a better solution would be to =
keep the patch, and drop the custom sed hack!</div><div class=3D""><br =
class=3D""></div><div class=3D"">Alex<br class=3D""></div></div><br =
class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 25 Feb 2020 at 22:58, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 =
Feb 2020 at 22:30, Tim Orling &lt;<a =
href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank" =
class=3D"">timothy.t.orling@linux.intel.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;<a href=3D"file://ptest-perl/run-ptest" =
class=3D"">file://ptest-perl/run-ptest</a> \<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
href=3D"file:///0001-Committing-changes-from-do_patch.patch" =
class=3D"">file://0001-Committing-changes-from-do_patch.patch</a> =
\</blockquote><div class=3D""><br class=3D""></div><div class=3D"">These =
two are 'devtool upgrade' noise, and should be removed. The recipe does =
weird things which triggers devtool to add items unnecessarily.<br =
class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">Alex<br class=3D""></div></div></div>
</blockquote></div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_DC2C6D09-7FE3-4242-97B2-9C73624E0489--
