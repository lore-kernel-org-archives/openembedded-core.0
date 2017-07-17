Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id F1B3B71974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 12:27:58 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 188so13021017itx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XDnzjOzNChcxK61dBNeLUZClHi2sxrc1K3yXo8fXWb4=;
	b=kHjMHTEGAFwg5RKVv6NrhIQD2QHZlV3d+3R14laLtNh2WaJKYfyR//tzWu/3F3IuD8
	aAo+HGsl2utCAcVrHy5aUm2KlH0gNuJQEn4pnHkkVfSImXLOXC7+kMjunSCOZmA3tCOt
	tLSH3WiT7VkcbPEP2QpeaLOZNWkVtygoID4CShGWq+p7nX6Ivl1njTfgjeYPsbcFD2Xq
	zvE45I3XAEQkYDXWbdJYtVt2/DQ2i9L3TbRHOtQpjDmu/YvNzWIV+Hfzo+wdm0fhXoC9
	jAusciYWE/emIc1ecC0UOwjbFWuS1r0bUksme2ojLvmJev3TBJbGMaiWOZqrtcFM0bcs
	uHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XDnzjOzNChcxK61dBNeLUZClHi2sxrc1K3yXo8fXWb4=;
	b=OG7w/Ur69RFkVRGYyrM3h5ziT0SJnX0B2NRvOVvvd0yjCWp7Q7mJv4UaK1KCVmyNAl
	YHVud2UwwrdVNj1VNFACcNjgTDLjJTDzp3ln5bBdPgalAZAmNJCj6apoKnJXpIE/W79G
	YQ14Jb7C4uTM4VPdtcP0/CryS2oEyfwfZwSgQ1u2KjcozTOF435a46wNvqwSj/B3YsQH
	GqYNUgdeWgQ38gnNqqmd3XKXXM1JvA/beN9N27Z3vAGnWVzWIhqwrCQS2cJ/hkn4QJUb
	+qPAU8EVAnJ8cBXPXOGzRVfe1vPeGfbYBvXjOJ4+8Mrocu5kGPLzYXVdSzEnu4sduk3w
	DDHQ==
X-Gm-Message-State: AIVw110e4DIMFvDxlviNdaJASGUonxAxl/Dx2HlWs6WYTYuJRhnRr/xU
	oRfrSyGI5vEGmSnkS9uXA6jsx7gEBuxB
X-Received: by 10.36.120.67 with SMTP id p64mr5075759itc.23.1500294479915;
	Mon, 17 Jul 2017 05:27:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Mon, 17 Jul 2017 05:27:39 -0700 (PDT)
In-Reply-To: <1499718149-29243-1-git-send-email-libertad.cruz@intel.com>
References: <1499718149-29243-1-git-send-email-libertad.cruz@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jul 2017 13:27:39 +0100
Message-ID: <CAJTo0LZA-NLiDzEO55_RZw+R_Hy4_RHdTje=4o5QWvXHZWQz6g@mail.gmail.com>
To: libertad.cruz@intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] opkg.py Adds tests for ipk/opkg
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
X-List-Received-Date: Mon, 17 Jul 2017 12:27:59 -0000
Content-Type: multipart/alternative; boundary="001a114a9ebe88c85d05548287f3"

--001a114a9ebe88c85d05548287f3
Content-Type: text/plain; charset="UTF-8"

On 10 July 2017 at 21:22, <libertad.cruz@intel.com> wrote:

> +class opkgBasicTest(opkgTest):
> +    @skipIfNotFeature('package-management', 'Test requires
> package-management to be in IMAGE_FEATURES')
> +    @skipIfNotDataVar('IMAGE_PKGTYPE','ipk', 'IPK is not the primary
> package manager')
> +    @OEHasPackage(['opkg'])
> +
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    @OETestID(1841)
> +    def test_opkg_list(self):
> +       self.opkg('list')
> +
> +    @OETestID(1842)
> +    def test_opkg_list_installed(self):
> +       self.opkg('list-installed')
> +
> +    @OETestID(1843)
> +    def test_opkg_depends(self):
> +       self.opkg('depends opkg')
> +
> +    @OETestID(1837)
> +    def test_opkg_whatdepends(self):
> +      self.opkg('whatdepends opkg')
> +
> +    @OETestID(1838)
> +    def test_opkg_status(self):
> +      self.opkg('status')
> +
> +    @OETestID(1839)
> +    def test_opkg_info(self):
> +        self.opkg('info opkg')
> +
> +    @OETestID(1840)
> +    def test_opkg_print_architecture(self):
> +        self.opkg('print-architecture')
>

I'd feel a lot happier that this was a selftest if it was exercising more
than "opkg doesn't crash".  If opkg is replaced by a script that does "echo
haha; exit 0" this test case would pass, so can it verify the output too.

Ross

--001a114a9ebe88c85d05548287f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2017 at 21:22,  <span dir=3D"ltr">&lt;<a href=3D"mailto:libertad=
.cruz@intel.com" target=3D"_blank">libertad.cruz@intel.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div class=3D"">+class opkgBasicTes=
t(opkgTest):<br>
+=C2=A0 =C2=A0 @skipIfNotFeature(&#39;package-<wbr>management&#39;, &#39;Te=
st requires package-management to be in IMAGE_FEATURES&#39;)<br>
+=C2=A0 =C2=A0 @skipIfNotDataVar(&#39;IMAGE_<wbr>PKGTYPE&#39;,&#39;ipk&#39;=
, &#39;IPK is not the primary package manager&#39;)<br>
+=C2=A0 =C2=A0 @OEHasPackage([&#39;opkg&#39;])<br>
+<br>
+=C2=A0 =C2=A0 @OETestDepends([&#39;ssh.SSHTest.<wbr>test_ssh&#39;])<br>
+=C2=A0 =C2=A0 @OETestID(1841)<br>
+=C2=A0 =C2=A0 def test_opkg_list(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self.opkg(&#39;list&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @OETestID(1842)<br>
+=C2=A0 =C2=A0 def test_opkg_list_installed(self)<wbr>:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self.opkg(&#39;list-installed&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @OETestID(1843)<br>
+=C2=A0 =C2=A0 def test_opkg_depends(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self.opkg(&#39;depends opkg&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @OETestID(1837)<br>
+=C2=A0 =C2=A0 def test_opkg_whatdepends(self):<br>
+=C2=A0 =C2=A0 =C2=A0 self.opkg(&#39;whatdepends opkg&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @OETestID(1838)<br>
+=C2=A0 =C2=A0 def test_opkg_status(self):<br>
+=C2=A0 =C2=A0 =C2=A0 self.opkg(&#39;status&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @OETestID(1839)<br>
+=C2=A0 =C2=A0 def test_opkg_info(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.opkg(&#39;info opkg&#39;)<br>
+<br>
+=C2=A0 =C2=A0 @OETestID(1840)<br>
+=C2=A0 =C2=A0 def test_opkg_print_architecture(<wbr>self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.opkg(&#39;print-architecture&#39;<wbr>)</=
div></blockquote></div><br>I&#39;d feel a lot happier that this was a selft=
est if it was exercising more than &quot;opkg doesn&#39;t crash&quot;.=C2=
=A0 If opkg is replaced by a script that does &quot;echo haha; exit 0&quot;=
 this test case would pass, so can it verify the output too.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a9ebe88c85d05548287f3--
