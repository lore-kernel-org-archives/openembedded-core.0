Return-Path: <jc@vtkloud.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id EA77E60F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:36:56 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id k4so1802850qaq.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 03:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=gyVrkleLe9av2YytzqZ/jkC1yxkfVYubXlc2cLCCsPE=;
	b=iVuJ3a97XTAGCyyMYeOqBzE7R1Oy5PYGHWskKc4ZNDfbicxMr8mGr4kiGoHD5Ji+6N
	KOnFFPNvTJyetrFpVkUW44dvDAnT/qFi1BZPrX0UqIWkNQ0qM+Dz9rzR61pP86svPlY9
	vC+VJqaQIowNkWPS0WjNaAsE/jn0kYPmJkaHadDQzpAHD6EgP79kNV+DcvqWlan+KPHZ
	4Z63i0h1GGg+JvvO19OOBS/d8ESFHdzvaozu5cm1rV3v+o9naRSK5bnGOyhHuNHaJvja
	JsZ+ccGxJB2/Yg795FKH9zMI8OVgxuNTiGc0c0aAnRhwVzCVVhCW7BD03UbTUc7SzZj3
	0WSw==
X-Gm-Message-State: ALoCoQnpuad1z5maroJlG07AxkrB9c2pZ7SfLsIxBFUN6ZsgIg8EPuljUJ7mnPKjA/OQkQD56Pd1
X-Received: by 10.224.69.69 with SMTP id y5mr5130124qai.53.1379414218377;
	Tue, 17 Sep 2013 03:36:58 -0700 (PDT)
Received: from [172.20.6.243] ([12.96.84.3])
	by mx.google.com with ESMTPSA id g2sm30250044qaf.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 03:36:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: =?iso-8859-1?Q?Jean-Charles_JC_Verdi=E9?= <jc@vtkloud.com>
In-Reply-To: <1379345967717.a9ba8559@Nodemailer>
Date: Tue, 17 Sep 2013 06:36:54 -0400
Message-Id: <07DD0C1F-96B0-4C4C-BC26-23EF171060F0@vtkloud.com>
References: <3047549.YMT2qeacCQ@helios> <1379345967717.a9ba8559@Nodemailer>
To: "Paul Eggleton" <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: lib ao ?
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
X-List-Received-Date: Tue, 17 Sep 2013 10:36:57 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_34559D92-0BB9-4CE7-B795-B29531AEEB55"

--Apple-Mail=_34559D92-0BB9-4CE7-B795-B29531AEEB55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Paul et al;
>=20
> There isn't currently a libao recipe in common OE-Core based layers =
indexed by=20
> the layer index. FYI though there is a recipe in the unofficial (and =
apparently=20
> unmaintained) meta-jlime layer here:=20
>=20
> https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime=20
>=20
> It would be great to have this added to meta-multimedia - please test =
it and=20
> if it works for you please feel free to send a patch adding it to =
meta-=20
> multimedia.=20
>=20
>=20


I got a mix from theirs and mine working.=20

Any recommendation on the patch process? I think I saw something on a =
wiki someday about how to send patches, but I can't find it again :(

Jay


> > The UI for that site has changed, you have to set:=20
> > Branch: OE-Classic=20
> > to search meta-openembedded.=20
> >=20
> > Painful, I know, but I assume there was confusion about what's in=20
> > oe-core and what's in OE-Classic.=20
>=20
> This is *not* correct. OE-Classic as shown in the layer index is =
OE-Classic,=20
> the old monolithic OpenEmbedded; it is not the same thing as meta-oe =
or any of=20
> the layers in the meta-openembedded repository.=20
>=20
> Cheers,=20
> Paul=20
>=20
> --=20
>=20
> Paul Eggleton=20
> Intel Open Source Technology Centre=20
>=20
>=20


--Apple-Mail=_34559D92-0BB9-4CE7-B795-B29531AEEB55
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><div><blockquote type="cite"><div class="gmail_quote"></div></blockquote>Hi Paul et al;<br><blockquote type="cite"><div class="gmail_quote"><blockquote class="gmail_quote" style="margin: 0px 0px 0px 0.8ex; border-left-width: 1px; border-left-color: rgb(204, 204, 204); border-left-style: solid; padding-left: 1ex; position: static; z-index: auto; "><p><br>There isn't currently a libao recipe in common OE-Core based layers indexed by 
<br>the layer index. FYI though there is a recipe in the unofficial (and apparently 
<br>unmaintained) meta-jlime layer here:
<br><br><a href="https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime">https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime</a>
<br><br>It would be great to have this added to meta-multimedia - please test it and 
<br>if it works for you please feel free to send a patch adding it to meta-
<br>multimedia.
<br><br></p></blockquote></div></blockquote><div><br></div><div><br></div></div><div>I got a mix from theirs and mine working.&nbsp;</div><div><br></div><div>Any recommendation on the patch process? I think I saw something on a wiki someday about how to send patches, but I can't find it again :(</div><div><br></div><div>Jay<br><br><br><blockquote type="cite"><div class="gmail_quote"><blockquote class="gmail_quote" style="margin: 0px 0px 0px 0.8ex; border-left-width: 1px; border-left-color: rgb(204, 204, 204); border-left-style: solid; padding-left: 1ex; position: static; z-index: auto; "><p>&gt; The UI for that site has changed, you have to set:
<br>&gt; Branch: OE-Classic
<br>&gt; to search meta-openembedded.
<br>&gt; 
<br>&gt; Painful, I know, but I assume there was confusion about what's in
<br>&gt; oe-core and what's in OE-Classic.
<br><br>This is *not* correct. OE-Classic as shown in the layer index is OE-Classic, 
<br>the old monolithic OpenEmbedded; it is not the same thing as meta-oe or any of 
<br>the layers in the meta-openembedded repository.
<br><br>Cheers,
<br>Paul
<br><br>-- 
<br><br>Paul Eggleton
<br>Intel Open Source Technology Centre
<br></p></blockquote></div><br></blockquote></div><br></body></html>

--Apple-Mail=_34559D92-0BB9-4CE7-B795-B29531AEEB55--
