Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 02D9C73D66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:48:54 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so133302431pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lzc7N5WQnvhdvQQol9vMP8wBUJKKuSqDM8RT9d8LvR0=;
	b=KIvVnAZKzlj8D9cQr5dJD2OHolvosOBAWwfTrxzkRN9dxZcYy0HiZ6qk6pgi71WS2c
	bjz3fR9t/4BidGxNaOpNjGaxtt04TDhEgpRfWLr+maThMWk1oFn+MZWZjYsgnh9bLYdS
	zTPop2DK04CGt+1q3J7h5j9JfM1RbjqzQnZQzwnSwXiDWScPXSPWF9vtzhXIvftesi6e
	kG3eOz34qTTKiNLaKzUjBffH37YlR8nVHHMClILEmVX6O+/s8Emb5u7gQqJHax+5c3Y5
	ANOaZs3rzg4xmS3ldLzHKpfyLO7OsRkdKn62+MyD05rhYzTdy0a6rucjSKGFx5tU/xSd
	3WpA==
X-Received: by 10.70.93.69 with SMTP id cs5mr23137311pdb.165.1430149735946;
	Mon, 27 Apr 2015 08:48:55 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:b1a4:3fdf:dcf8:7b1c?
	([2601:9:3580:84c:b1a4:3fdf:dcf8:7b1c])
	by mx.google.com with ESMTPSA id
	ei17sm19922376pac.20.2015.04.27.08.48.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 08:48:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LamJfd_=oqKfiAvoRueB=7EQu5GCYfaQO1r3ADnNdjQzA@mail.gmail.com>
Date: Mon, 27 Apr 2015 08:48:54 -0700
Message-Id: <5F36DEAE-E6AB-4E52-A105-B48B0B1CCD9B@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<278c32ff3aaa351237215ff41060a0bc8aa7fd36.1429846255.git.raj.khem@gmail.com>
	<CAJTo0LamJfd_=oqKfiAvoRueB=7EQu5GCYfaQO1r3ADnNdjQzA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/14] subversion: Add -P to CPPFLAGS
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
X-List-Received-Date: Mon, 27 Apr 2015 15:48:55 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_55EFE272-0167-444A-BF0E-1244384F6941"

--Apple-Mail=_55EFE272-0167-444A-BF0E-1244384F6941
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 27, 2015, at 8:03 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> -inherit gettext
> +inherit gettext pythonnative
>=20
> Why are you doing this?

Don=E2=80=99t have the error handy right now something swig related, =
however
because its needing python2 for its bindings and some systems have =
switched to using python3 as default.

>=20
> Ross


--Apple-Mail=_55EFE272-0167-444A-BF0E-1244384F6941
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Apr 27, 2015, at 8:03 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 24 April 2015 at 04:35, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":24x" =
class=3D"a3s" style=3D"overflow:hidden">-inherit gettext<br class=3D"">
+inherit gettext pythonnative</div></blockquote></div><br class=3D"">Why =
are you doing this?</div></div></div></blockquote><div><br =
class=3D""></div><div>Don=E2=80=99t have the error handy right now =
something swig related, however</div><div>because its needing python2 =
for its bindings and some systems have switched to using python3 as =
default.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D"">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_55EFE272-0167-444A-BF0E-1244384F6941--
