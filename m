Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5749E7EEC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 20:32:03 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z15so653610lfh.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Rm5qnpJSR5G9alFa44PAyPc13dxIJAnyD3SI+c7SXMo=;
	b=pd1mgI8FRn1BEQTtQqkQUSgLfw002KktmEmyzwEu+fX9SC3wRdhAZQPlyd/az3WIYO
	BrhVek3KSrCc5Av+qZXhZQiIenVUZBpjyOqridO3PsF4fP84DLNhASlx5Owl4op5G1i4
	dyhtaCFOIqclYwvOV/iaUC9MDu3hArHIIiNOftXGizAdwWCht7cJFNRgmEZgFP2U2Pqx
	YqWIR+OlXpbZdEBVBorJZ6QqnuSc3zfarNP4J+/xRR+vurLHStTfIQC3ozE9caEy09IJ
	/Ufd3K3mCNyMkd7/mpcjN37KUxlNPmfzW0hS/gT9E2Qm3jkAogCdRF822SOJuERzacrN
	USqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Rm5qnpJSR5G9alFa44PAyPc13dxIJAnyD3SI+c7SXMo=;
	b=c23M11Gik0sOEiYi9EuCVFuFHyOchcC4PhBtTiQib+dtNUhq7N1DZTSeIThy2L55Ke
	QkOLuhPaRrUXHKugUbFYD8tX736pb7yM5NfKXAcKLdVQ2xx6nzBAjJlOFm8BUDHfkz46
	ytDTK+EZIkE1XJOEeSYKDGh+vw/fMH9Wo2OrH0ZNaqciIdvfKCYxlkqjilXQMMdkWDBq
	E+mTMVxqzpqp2jlJ11BilwWY28KVPpb6QnAT2Y80N77Yy1oWsjTpsjqLJ49lBf0dbV8d
	AxNRQQc/m3s30RCsevJ2TmQwok4WSUN1clbFrNT/7ESpqHE2Ef0blj2f2PDDJN/VE4Te
	VBwg==
X-Gm-Message-State: APjAAAU/4nBDs6Bnvsry6ZGEA4LwcPJobgKnr2bxee05jyfkBeGBJH9n
	wHpKR7FPrj8ap4oF5TvYUABP1XLbPzA/M686QgPbySka
X-Google-Smtp-Source: APXvYqwrWdYs1d7p7BAz+NboScceC4cRdiyCEguuYbiWLhszbhsUE+E8jjv99Exxb0PIN9qpezPlAfwube4O3EFiVBE=
X-Received: by 2002:a19:641a:: with SMTP id y26mr2723734lfb.29.1562877123297; 
	Thu, 11 Jul 2019 13:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0Emqv2BGzzfGETMAbC=URDR6O5yerU0bfzzLpFQrXuGRw@mail.gmail.com>
In-Reply-To: <CADySD0Emqv2BGzzfGETMAbC=URDR6O5yerU0bfzzLpFQrXuGRw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 12 Jul 2019 08:31:51 +1200
Message-ID: <CADySD0EYA4pMjcHyXa4ZYF3yFYteXockqThV9W8-vif-UMEckg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RDEPENDS libstdc++ error
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
X-List-Received-Date: Thu, 11 Jul 2019 20:32:03 -0000
Content-Type: multipart/alternative; boundary="000000000000c30415058d6daf26"

--000000000000c30415058d6daf26
Content-Type: text/plain; charset="UTF-8"

And this tool is provided to us as a pre-compiled binary.

On Thu, 11 Jul 2019, 7:54 p.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:

> Hi,
>
> I have a third party tool which I was packaging in my image based upon
> Yocto 1.6
>
> Now I am upgrading to Yocto 2.7 and the recipe which packages third
> party tool is generating following error:
>
> requires libstdc++.so.6(CXXABI_1.3), but no providers found in
> RDEPENDS_test-util? [file-rdeps]
> requires libstdc++.so.6(GLIBCXX_3.4), but no providers found in
> RDEPENDS_test-util? [file-rdeps]
>
> Is there a way to fix this without asking vendor to provide a new
> version of tool?
>
> Thanks
> Ankur
>

--000000000000c30415058d6daf26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>And this tool is provided to us as a pre-compiled bi=
nary.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, 11 Jul 2019, 7:54 p.m. Ankur Tyagi, &lt;<a href=3D"mailto:ankur.=
tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Hi,<br>
<br>
I have a third party tool which I was packaging in my image based upon Yoct=
o 1.6<br>
<br>
Now I am upgrading to Yocto 2.7 and the recipe which packages third<br>
party tool is generating following error:<br>
<br>
requires libstdc++.so.6(CXXABI_1.3), but no providers found in<br>
RDEPENDS_test-util? [file-rdeps]<br>
requires libstdc++.so.6(GLIBCXX_3.4), but no providers found in<br>
RDEPENDS_test-util? [file-rdeps]<br>
<br>
Is there a way to fix this without asking vendor to provide a new<br>
version of tool?<br>
<br>
Thanks<br>
Ankur<br>
</blockquote></div></div></div>

--000000000000c30415058d6daf26--
