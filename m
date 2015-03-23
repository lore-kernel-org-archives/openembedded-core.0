Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id EA33F6AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:48:55 +0000 (UTC)
Received: by qgep97 with SMTP id p97so20057502qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 08:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=V93j08MWr669BnLUDT5KeFlFco8hwA3WvrFbmAejpTE=;
	b=RXZz5jRLQdXlTmOfbD/91B0Pk93IiI7ORsE13Wjnb/7MTSRgeXpwfwKa+CwRkLatLW
	sf5UMBl+M4TH05YkeZ01s/JNKyyBsy6KBVCtzpm6V+LYykA7AbcOrWmgVtJm3LWUV05w
	lfHPMwnWmTPVVQY8JDvZM4OmahVKuQRhjynur3ZUxB9brxF0uDcdjJziR0MPpIrTnqeN
	spKlHC+msn4hlberhgpm0nKJAAXP0HCzFdGrqdJ6KWiN5IQ5ui8h3DpM71ZPQ20BUSUo
	L6vIZ6AitwIOD0+CFPCU0PKyOzMUOf544vto3tcmsLZqwcbvV+/goyh+MrUIL7+DuXON
	DugQ==
X-Gm-Message-State: ALoCoQmVjSLkN3OueHz9S1o/5f9Lvm25gpZcrNtuTNX6edHlIZHyF1RT+OFXTw07DMEQcAHeUfZ1
X-Received: by 10.140.149.150 with SMTP id 144mr25292993qhv.16.1427125719697; 
	Mon, 23 Mar 2015 08:48:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Mar 2015 08:48:19 -0700 (PDT)
In-Reply-To: <1427125293-27123-1-git-send-email-obi@opendreambox.org>
References: <1427125293-27123-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Mar 2015 17:48:19 +0200
Message-ID: <CAJTo0LaG2kM=Q0ewEq+S7W3XMjRV=cvEc41jrsOSqHfkpee9uw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libav: fix floating dependency on libasound
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
X-List-Received-Date: Mon, 23 Mar 2015 15:48:58 -0000
Content-Type: multipart/alternative; boundary=001a113577e2929e3e0511f69957

--001a113577e2929e3e0511f69957
Content-Type: text/plain; charset=UTF-8

On 23 March 2015 at 17:41, Andreas Oberritter <obi@opendreambox.org> wrote:

> -DEPENDS = "zlib libogg yasm-native"
> +DEPENDS = "alsa-lib zlib libogg yasm-native"
>

Wouldn't this be better as a PACKAGECONFIG?

Ross

--001a113577e2929e3e0511f69957
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2015 at 17:41, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6na" class=
=3D"a3s" style=3D"overflow:hidden">-DEPENDS =3D &quot;zlib libogg yasm-nati=
ve&quot;<br>
+DEPENDS =3D &quot;alsa-lib zlib libogg yasm-native&quot;<br></div></blockq=
uote></div><br>Wouldn&#39;t this be better as a PACKAGECONFIG?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113577e2929e3e0511f69957--
