Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 17B176E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:13:00 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so58830566igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=V64md3xEBCsv1Vw6lndiusvyL0zEGj56u3ArwlP7yg4=;
	b=SFuqlgr4Bd4ehgN4Ev5mU7fV0MZNVAvJQJl2ouxXS/DFNg9eFgjTqM02garWYx5sop
	NghMOOwPQINKjpd7S6VubADPVKVguWt22zYf5dfiIqKMoSL5wwmgIVltbcuCyhummsB3
	dzAXtDuWwvRIbDcW1VMtvT2E7tvuqBIrsqKQux88Dsk+9KAwzSrt7QQPqkBosDgBEd1h
	cODlR7r08JbJoanPEWb1loOKX9oJWDMaIRgRL4QC5Gzyoqg2pGriTp/AXBRlICXA6ABX
	5cbScFYaJu0bUaljO/78gw8kvHcHQKqxsUG5uZEkSlUtbQ9Y6PIOmBRQmQ7slKc6ZCZD
	TwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=V64md3xEBCsv1Vw6lndiusvyL0zEGj56u3ArwlP7yg4=;
	b=TpDYy58+3t0j6PThBZNXSk1iOqlAqNIzixbElpBzWkNfTIGmWr1HWdnTJVqf96bWH0
	AXSTKL9I/bVKBQFXtGy6kH2UUwfiB1Uhbq/F7he81nKiPoml2ROyEN9cZzkjYSS9B+qN
	LhU3c2xmPnSspC9Vd+THur9kwKfzf3rU5BP35JReHMYL2kEaZ0TgDA7BGNoq0JZ40PgP
	RVDpgftcREuWXwjiyoC4K5vEnehWYC75+YVh+IWzIYWLoqmojz3aNXnBD+su3mutSQp2
	vzGMZ/PHhZhm+CSMW4PemDcEc4f2XnmONxyZ1PyRnOEDm++4b8pZ6hreDUbq6Ql1NH69
	r2ug==
X-Gm-Message-State: ALoCoQl3C2wcu7hV6qucdiB85arDzADoYYceOP1QtltIXOwfqRSPedV7P5JWqsUxBq2x8h2URjhK
X-Received: by 10.50.64.147 with SMTP id o19mr15821018igs.52.1447686780896;
	Mon, 16 Nov 2015 07:13:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 07:12:41 -0800 (PST)
In-Reply-To: <a2976f346a9ddf2822929c54c9e81b7b24f0e1d6.1447455202.git.chris_larson@mentor.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<a2976f346a9ddf2822929c54c9e81b7b24f0e1d6.1447455202.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 15:12:41 +0000
Message-ID: <CAJTo0LZdW1+V8Sg1u05bEW8GYe8HjeWK=af4dReF9jer5GJ3YQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/6] sysprof: add missing gdk-pixbuf/pango deps
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
X-List-Received-Date: Mon, 16 Nov 2015 15:13:01 -0000
Content-Type: multipart/alternative; boundary=047d7bea2f9852638c0524a9d87a

--047d7bea2f9852638c0524a9d87a
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 23:10, Christopher Larson <kergoth@gmail.com> wrote:

> -PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ libglade"
> +PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,gtk+ gdk-pixbuf pango
> libglade"
>

As you're patching something you just introduced, I squashed these.

Ross

--047d7bea2f9852638c0524a9d87a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 23:10, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":34a" class=3D=
"a3s" style=3D"overflow:hidden">-PACKAGECONFIG[gui] =3D &quot;--enable-gui,=
--disable-gui,gtk+ libglade&quot;<br>
+PACKAGECONFIG[gui] =3D &quot;--enable-gui,--disable-gui,gtk+ gdk-pixbuf pa=
ngo libglade&quot;<br></div></blockquote></div><br>As you&#39;re patching s=
omething you just introduced, I squashed these.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bea2f9852638c0524a9d87a--
