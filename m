Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2C96E717
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:43:40 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id n12so4547007wgh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 04:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jZeNBXmbNGiXhurK+2I5LvOzR2zTdA4muSnFciPyXgg=;
	b=WajG3HdLc5br1kKdXRZNKv0FxdDy+RDByUIAVLIbXRob2uB7SWdSuuik7E89s8oGGv
	sKKQPObJ8WP37VLwv2i2m7i1CzhcDXYM0SXtF91kXa+OC7rwZAS4/Yx81pYTjewmyaJm
	0acKWOZl4tUV6UzXbpbmcmtGeajc35qjcsoWq9dFosTPa32tq9KEAl7INHCBLw9lz6sL
	IH6eVCK/cNc0bChD/qQWiK9yY1nzkNiF8Zte+2yhC2nQGcu1sOtSCa5PNlJg980btMaf
	EqUKe0NZNlqLU8RW1T8lRJV4XFNhnytucHCy/k1O6R3tmzEuJctO4jASAqKBJfbEgdo5
	hrfQ==
MIME-Version: 1.0
X-Received: by 10.194.109.68 with SMTP id hq4mr18987616wjb.12.1393245820957;
	Mon, 24 Feb 2014 04:43:40 -0800 (PST)
Received: by 10.194.8.35 with HTTP; Mon, 24 Feb 2014 04:43:40 -0800 (PST)
In-Reply-To: <CAJTo0LYxZpiSyyQoa_Q=dY8=ShTOc2=aq5Gn4nkqLn-jmbX_BA@mail.gmail.com>
References: <CABuzA3Odaup7ZC1EZPMLEULzjpDxrhRq6Oq97Ben9uLjCOKNEA@mail.gmail.com>
	<CAJTo0LYxZpiSyyQoa_Q=dY8=ShTOc2=aq5Gn4nkqLn-jmbX_BA@mail.gmail.com>
Date: Mon, 24 Feb 2014 12:43:40 +0000
Message-ID: <CABuzA3O+hVfd0gqgGJYSuGhe40F8teU_Ts+qrhGcSJbir=Ss7A@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4-embedded - jpeg, gif, tiff support
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
X-List-Received-Date: Mon, 24 Feb 2014 12:43:41 -0000
Content-Type: multipart/alternative; boundary=089e0102e6da3e3b2004f32652f9

--089e0102e6da3e3b2004f32652f9
Content-Type: text/plain; charset=ISO-8859-1

Thanks. That works now (tested jpeg, gif, tif).

Presume I probably don't need the change to qt4.inc I mentioned earlier ?
(rebuild takes a while)






On 24 February 2014 11:54, Burton, Ross <ross.burton@intel.com> wrote:

> On 24 February 2014 11:39, John Stirling <ap.john.stirling@gmail.com>
> wrote:
> > I've just noticed jpeg, gif, tiff are not working for me.
>
> I suspect you're not pulling in the image decoder packages into your
> images: to reduce dependency creep these are split into separate
> packages:
>
> $ ls qt4-embedded-plugin-imageformat*
> qt4-embedded-plugin-imageformat-gif_4.8.5-r0_i586.ipk
> qt4-embedded-plugin-imageformat-ico_4.8.5-r0_i586.ipk
> qt4-embedded-plugin-imageformat-jpeg_4.8.5-r0_i586.ipk
> qt4-embedded-plugin-imageformat-mng_4.8.5-r0_i586.ipk
> qt4-embedded-plugin-imageformat-svg_4.8.5-r0_i586.ipk
> qt4-embedded-plugin-imageformat-tga_4.8.5-r0_i586.ipk
> qt4-embedded-plugin-imageformat-tiff_4.8.5-r0_i586.ipk
>
> Ross
>

--089e0102e6da3e3b2004f32652f9
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">Thanks. That works now (tested jpeg, gif, tif).<div><br></div><div>Presume I probably don&#39;t need the change to qt4.inc I mentioned earlier ? (rebuild takes a while)<br><div><br></div><div><br><div><br></div>
<div><br></div></div></div></div><div class="gmail_extra"><br><br><div class="gmail_quote">On 24 February 2014 11:54, Burton, Ross <span dir="ltr">&lt;<a href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="">On 24 February 2014 11:39, John Stirling &lt;<a href="mailto:ap.john.stirling@gmail.com">ap.john.stirling@gmail.com</a>&gt; wrote:<br>

&gt; I&#39;ve just noticed jpeg, gif, tiff are not working for me.<br>
<br>
</div>I suspect you&#39;re not pulling in the image decoder packages into your<br>
images: to reduce dependency creep these are split into separate<br>
packages:<br>
<br>
$ ls qt4-embedded-plugin-imageformat*<br>
qt4-embedded-plugin-imageformat-gif_4.8.5-r0_i586.ipk<br>
qt4-embedded-plugin-imageformat-ico_4.8.5-r0_i586.ipk<br>
qt4-embedded-plugin-imageformat-jpeg_4.8.5-r0_i586.ipk<br>
qt4-embedded-plugin-imageformat-mng_4.8.5-r0_i586.ipk<br>
qt4-embedded-plugin-imageformat-svg_4.8.5-r0_i586.ipk<br>
qt4-embedded-plugin-imageformat-tga_4.8.5-r0_i586.ipk<br>
qt4-embedded-plugin-imageformat-tiff_4.8.5-r0_i586.ipk<br>
<span class="HOEnZb"><font color="#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--089e0102e6da3e3b2004f32652f9--
