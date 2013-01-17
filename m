Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvrcW-0002J0-4f
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:43:12 +0100
Received: by mail-la0-f47.google.com with SMTP id fh20so2736915lab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=XmaOmThwzZJl8MOzzTAPAcp+p8KGUoT3mqurhVFdXyI=;
	b=fqXn2qQhfBI+mt7n4RrTuPPg8mSKQF++co8GUUYyL4HIhqKxPSlyqKE7L3fabRVAsD
	7b1Msx2xr0ycGWCEe0h1rKBF1YFHJcFukMXPa7yYbnqAmmhmTsvmVbFf6wj6Cw8lagf9
	BXTG8XNNlvVsP2duAGEkq81+uud+FYiktTjITjdR8xQquSY9V30QFj0EUVJbWBGLBXUu
	cyCXKRsFFmgp8srwOT8FTFRa5AScL9d+KCFLDG191xNc/GiW0QLQdSrJb/y+zulQjiDs
	zd6ojZChyimqB8SwJ49/4nwxP+XSqyHc2lfsn0kpfR+GoyGovyGjg3kR56yg30teJH18
	pm9w==
X-Received: by 10.112.28.65 with SMTP id z1mr2372369lbg.119.1358436468913;
	Thu, 17 Jan 2013 07:27:48 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 17 Jan 2013 07:27:28 -0800 (PST)
In-Reply-To: <50F7D75F.5020207@linaro.org>
References: <50F7D75F.5020207@linaro.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 17 Jan 2013 08:27:28 -0700
X-Google-Sender-Auth: eFYoZ20VQ-tdSIcm4BksPQbQYM8
Message-ID: <CABcZANm5S05y0sSBkWCQVOsWO5S=8ZFTgtbBycO05bc12T2YFQ@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Automatic generation of circular deps sucks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 15:43:18 -0000
Content-Type: multipart/alternative; boundary=bcaec554d9d62df55b04d37da3f9

--bcaec554d9d62df55b04d37da3f9
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 17, 2013 at 3:50 AM, Marcin Juszkiewicz <
marcin.juszkiewicz@linaro.org> wrote:

> Libdwarf (recipe) DEPENDS on elfutils and gives static library in
> libdwarf-staticdev package, headers in libdwarf-dev package. OK, it
> works. So I looked at dependencies of resulting packages.
>
> Why libdwarf-dev recommends elfutils-dev is beyond my knowledge...
>

This has always been the case. -dev/-dbg use depchains to pull in their
corresponding packages of the DEPENDS of the main package, to ensure that
all the necessary development or debugging files are available, as far as I
know. Grep around for depchains, you'll see the code, but it's mostly
handled at line 1716 (package_depchains) of package.bbclass.
-- 
Christopher Larson

--bcaec554d9d62df55b04d37da3f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 17, 2013 at 3:50 AM, Marcin Juszkiewicz <span dir=3D"ltr">&lt;<=
a href=3D"mailto:marcin.juszkiewicz@linaro.org" target=3D"_blank">marcin.ju=
szkiewicz@linaro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":186">Libdwarf (recipe) DEPENDS o=
n elfutils and gives static library in<br>
libdwarf-staticdev package, headers in libdwarf-dev package. OK, it<br>
works. So I looked at dependencies of resulting packages.<br>
<br>
Why libdwarf-dev recommends elfutils-dev is beyond my knowledge...</div></b=
lockquote></div><br>This has always been the case. -dev/-dbg use depchains =
to pull in their corresponding packages of the DEPENDS of the main package,=
 to ensure that all the necessary development or debugging files are availa=
ble, as far as I know. Grep around for depchains, you&#39;ll see the code, =
but it&#39;s mostly handled at line 1716 (package_depchains) of package.bbc=
lass.<br>

-- <br>Christopher Larson</div></div>

--bcaec554d9d62df55b04d37da3f9--
