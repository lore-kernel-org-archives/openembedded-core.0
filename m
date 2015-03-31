Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 17DEA736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:29:34 +0000 (UTC)
Received: by qgep97 with SMTP id p97so28211894qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TjahwCMyDlEhzrDxGug9J/kerf3LLlL5082uCISLomw=;
	b=I0X79tnJp2/AJJ2FbU0ILDbgs9XahN9UoczigU+/7mgJGY89iwmaxyPnOTEefMuuDr
	H47zu8YaL9Vq8cNHAxNkk0RYflCtAc2HCbEhLWEeV6lfZatqbM7r1/fG2TYdFLD16Y7a
	bqCzoTEqmGQVOoJ0jh5izw2YgmI0LJA8j/JvjbtPWhchcSsW4fhlM+ca0naJpKcRCqE5
	ghu0XQ7r9RV1WhvZeUmoUdEl7j7HAgB8YKvdswXJBBSb7SCgloz6HkMyxeCz79ovY7zp
	bnEPrvogcLGpn9V3YVTCE1Upp4mrRHEOeF8v8BXUO1/eHntmbvd8Mewrl+x/Q7gDMtDZ
	jCGA==
X-Gm-Message-State: ALoCoQk+uRI57hR2iR2fMq1EUeN0VWDuOWUew5RvjxLbUw919munvE3Jec/tkCgjQPgPP4qSU27F
X-Received: by 10.141.23.205 with SMTP id z196mr51988561qhd.66.1427840975431; 
	Tue, 31 Mar 2015 15:29:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 15:29:15 -0700 (PDT)
In-Reply-To: <CAJTo0LaiuNTsn6h0pZWeOtpX8Ph4XMz3WoCRG1w2WYqK-ronOA@mail.gmail.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
	<17800ae49667ee311ccc15a539dae026674efc35.1427832505.git.elizabeth.flanagan@intel.com>
	<CAJTo0LaiuNTsn6h0pZWeOtpX8Ph4XMz3WoCRG1w2WYqK-ronOA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 23:29:15 +0100
Message-ID: <CAJTo0LZJnhYZZ17tziHKCPaR5uHG+hpwpuzvs+sSQQKWDXwc_g@mail.gmail.com>
To: Beth Flanagan <elizabeth.flanagan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distrodata.bbclass/distro_check.py: Fix splits
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
X-List-Received-Date: Tue, 31 Mar 2015 22:29:38 -0000
Content-Type: multipart/alternative; boundary=001a11423c9c22fc9a05129d222e

--001a11423c9c22fc9a05129d222e
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 23:03, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 31 March 2015 at 21:11, Beth Flanagan <elizabeth.flanagan@intel.com>
> wrote:
>
>> +        if pnstripped.find("-native") != -1:
>>
>
> Shouldn't this be .endswith() or .startswith() to prevent false-positives?
>

Also this all clearly says "put me in a function".  But what you need is
*almost* the BPN variable but with some prefix stripping that the BPN-logic
doesn't do (BPN only has suffix stripped, oddly).

I'd argue that the BPN logic should also strip nativesdk- prefixes, so by
fixing that the distrotools class could just get PN and BPN from the data
store and be done with it.

Ross

--001a11423c9c22fc9a05129d222e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
1 March 2015 at 23:03, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 31 March 2=
015 at 21:11, Beth Flanagan <span dir=3D"ltr">&lt;<a href=3D"mailto:elizabe=
th.flanagan@intel.com" target=3D"_blank">elizabeth.flanagan@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:h=
idden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pnstripped.find(&quot;-native&quot;)=
 !=3D -1:<br></div></blockquote></div><br></span>Shouldn&#39;t this be .end=
swith() or .startswith() to prevent false-positives?</div></div></blockquot=
e><div><br></div><div>Also this all clearly says &quot;put me in a function=
&quot;.=C2=A0 But what you need is *almost* the BPN variable but with some =
prefix stripping that the BPN-logic doesn&#39;t do (BPN only has suffix str=
ipped, oddly).</div><div><br></div><div>I&#39;d argue that the BPN logic sh=
ould also strip nativesdk- prefixes, so by fixing that the distrotools clas=
s could just get PN and BPN from the data store and be done with it.</div><=
div><br></div><div>Ross</div></div></div></div>

--001a11423c9c22fc9a05129d222e--
